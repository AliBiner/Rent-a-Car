package com.alibiner.services.reservation;

import java.util.*;
import com.alibiner.enums.CustomerType;
import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.enums.reservation.PaymentStatus;
import com.alibiner.enums.reservation.ReservationStatus;
import com.alibiner.exceptions.general.DataNotInsertException;
import com.alibiner.exceptions.general.NotFoundException;
import com.alibiner.exceptions.user.UserNotFoundException;
import com.alibiner.interfaces.repository.IPaymentRepository;
import com.alibiner.interfaces.repository.IReservationRepository;
import com.alibiner.interfaces.service.IRentPriceService;
import com.alibiner.interfaces.service.IReservationService;
import com.alibiner.interfaces.service.IUserService;
import com.alibiner.interfaces.service.IVehicleService;
import com.alibiner.interfaces.unitOfWork.IUnitOfWork;
import com.alibiner.repositoryDto.request.payment.PaymentCreatePersistenceDto;
import com.alibiner.repositoryDto.request.reservation.GetAllReservationPaginationDto;
import com.alibiner.repositoryDto.request.reservation.ReservationCreatePersistenceDto;
import com.alibiner.repositoryDto.request.reservation.ReservationPersistenceDto;
import com.alibiner.serviceDto.request.reservation.ReservationCreateServiceDto;
import com.alibiner.serviceDto.response.user.UserServiceDto;
import com.alibiner.serviceDto.response.vehicle.VehicleResponseServiceDto;

import java.sql.SQLException;
import java.time.Duration;
import java.time.LocalDateTime;

public class ReservationService implements IReservationService {
    private final IUserService userService;
    private final IRentPriceService rentPriceService;
    private final IVehicleService vehicleService;
    private final IReservationRepository reservationRepository;
    private final IPaymentRepository paymentRepository;
    private final IUnitOfWork unitOfWork;
    private final int MIN_DEPOSIT_REQUIRED_VEHICLE_PRICE = 2_000_000;
    private final int MIN_DEPOSIT_REQUIRED_AGE = 30;
    private final int MAX_PAGINATION_LIMIT = 10;

    public ReservationService(IUserService userService, IRentPriceService rentPriceService, IVehicleService vehicleService, IReservationRepository reservationRepository, IPaymentRepository paymentRepository, IUnitOfWork unitOfWork) {
        this.userService = userService;
        this.rentPriceService = rentPriceService;
        this.vehicleService = vehicleService;
        this.reservationRepository = reservationRepository;
        this.paymentRepository = paymentRepository;
        this.unitOfWork = unitOfWork;
    }


    @Override
    public boolean create(ReservationCreateServiceDto reservationRequest) throws SQLException, UserNotFoundException, NotFoundException, DataNotInsertException {

        validateReservationRequest(reservationRequest);

        UserServiceDto userInfo = findUserById(reservationRequest.userId());

        VehicleResponseServiceDto vehicleInfo = findVehicleById(reservationRequest.vehicleId());

        validateReservationDate(reservationRequest.vehicleId(),reservationRequest.startDate(),reservationRequest.finishDate());

        if (userInfo.customerType().equals(CustomerType.INSTITUTIONAL)){
            handleInstitutionalReservation(vehicleInfo,reservationRequest);
            unitOfWork.commit();
            return true;
        } else if (userInfo.customerType().equals(CustomerType.INDIVIDUAL)) {
            handleIndividualReservation(userInfo,vehicleInfo,reservationRequest);
            unitOfWork.commit();
            return true;
        }

        return false;
    }

    @Override
    public GetAllReservationPaginationDto getAllActive(int offset, int limit, int userId) throws SQLException {
        if (limit>MAX_PAGINATION_LIMIT)
            limit = MAX_PAGINATION_LIMIT;
        int totalCount = reservationRepository.getActiveCount(userId);
        List<ReservationPersistenceDto> allActive = reservationRepository.getAllActive(offset,limit,userId);
        return new GetAllReservationPaginationDto(totalCount,allActive);
    }

    @Override
    public GetAllReservationPaginationDto getAllPast(int offset, int limit, int userId) throws SQLException {
        if (limit>MAX_PAGINATION_LIMIT)
            limit = MAX_PAGINATION_LIMIT;
        int totalCount = reservationRepository.getPastCount(userId);
        List<ReservationPersistenceDto> allPast = reservationRepository.getAllPast(offset, limit, userId);
        return new GetAllReservationPaginationDto(totalCount,allPast);
    }

    private void validateReservationDate(int vehicleId, LocalDateTime startDate, LocalDateTime finishDate) throws SQLException {
        if (reservationRepository.isAlreadyReservation(vehicleId,startDate,finishDate)) {
            throw new IllegalArgumentException("İlgili araç bu tarihler arasında rezerve edilemez!");
        }
    }

    private void handleIndividualReservation(UserServiceDto userInfo, VehicleResponseServiceDto vehicleInfo, ReservationCreateServiceDto reservationRequest) throws SQLException, DataNotInsertException {
        Duration rentalDuration = Duration.between(reservationRequest.startDate(), reservationRequest.finishDate());
        float rentalCost = rentPriceService.calculateRentalCost(reservationRequest.vehicleId(), rentalDuration);

        validateDepositRequirement(vehicleInfo.price(),userInfo.age());

        float depositAmount = vehicleInfo.price() > MIN_DEPOSIT_REQUIRED_VEHICLE_PRICE
                ? rentPriceService.calculateDepositAmount(rentalCost)
                : 0;

        validatePaymentRequest(reservationRequest,depositAmount,rentalCost);


        processReservationAndPayment(depositAmount,rentalCost,reservationRequest);

    }

    private void processReservationAndPayment(float depositAmount, float rentalCost, ReservationCreateServiceDto reservationRequest) throws SQLException, DataNotInsertException {
        // --- Reservation & Payment Status ---
        ReservationStatus reservationStatus = ReservationStatus.RESERVED;
        PaymentStatus paymentStatus = PaymentStatus.PENDING;

        if (depositAmount == 0 && reservationRequest.amount() == 0) {
            paymentStatus = PaymentStatus.PENDING;
        }
        else if (depositAmount == 0 && reservationRequest.amount() > 0) {
            paymentStatus = PaymentStatus.PARTIALLY_REFUNDED;
        }  else if (depositAmount > 0 && reservationRequest.amount() < rentalCost) {
            paymentStatus = PaymentStatus.PARTIALLY_REFUNDED;
        } else if (depositAmount > 0 && reservationRequest.amount() == rentalCost) {
            reservationStatus = ReservationStatus.CONFIRMED;
            paymentStatus = PaymentStatus.PAID;
        }

        int reservationId = persistReservation(reservationStatus, reservationRequest);
        persistPayment(reservationId,depositAmount,rentalCost,paymentStatus,reservationRequest);
    }

    private void validateDepositRequirement(float price, int age) {
        if (price>= MIN_DEPOSIT_REQUIRED_VEHICLE_PRICE){
            if (age< MIN_DEPOSIT_REQUIRED_AGE){
                throw new IllegalArgumentException("Değeri " + MIN_DEPOSIT_REQUIRED_VEHICLE_PRICE + " TL üzeri olan araçlar için yaş sınırına takılmaktasınız! Minimum yaş sınırı = " + MIN_DEPOSIT_REQUIRED_AGE);
            }
        }
    }

    private void handleInstitutionalReservation(VehicleResponseServiceDto vehicleInfo, ReservationCreateServiceDto reservationRequest) throws SQLException, DataNotInsertException {
        final int minDayForReservation = 28; // default rentable time min 1 month(28 days) for Institutional
        Duration rentalDuration = Duration.between(reservationRequest.startDate(), reservationRequest.finishDate());

        if (rentalDuration.toDays()<minDayForReservation){
            throw new IllegalArgumentException("Kurumsal kullanıcılar + "+ minDayForReservation +" günden kısa süreli rezervasyon işlemi yapamaz!");
        }

        float rentalCost = rentPriceService.calculateRentalCost(reservationRequest.vehicleId(), rentalDuration);

        float depositAmount = vehicleInfo.price() > MIN_DEPOSIT_REQUIRED_VEHICLE_PRICE
                ? rentPriceService.calculateDepositAmount(rentalCost)
                : 0;

        validatePaymentRequest(reservationRequest, depositAmount, rentalCost);

        processReservationAndPayment(depositAmount,rentalCost,reservationRequest);
    }

    /**
     * @return Reservation id
     * */
    private int persistReservation(ReservationStatus status, ReservationCreateServiceDto reservationRequest) throws SQLException, DataNotInsertException {
        ReservationCreatePersistenceDto reservation = new ReservationCreatePersistenceDto(
                reservationRequest.userId(),
                reservationRequest.vehicleId(),
                reservationRequest.startDate(),
                reservationRequest.finishDate(),
                status
        );
        int reservationId = reservationRepository.create(reservation);
        if (reservationId<=0){
            throw new DataNotInsertException("Rezervayon İşlemi Başarısız!", ErrorCode.DATA_NOT_INSERT);
        }
        return reservationId;
    }

    private void persistPayment(int reservationId, float deposit, float totalAmount, PaymentStatus status, ReservationCreateServiceDto reservationRequest) throws SQLException, DataNotInsertException {
        int result = paymentRepository.create(new PaymentCreatePersistenceDto(
                reservationId,
                deposit,
                reservationRequest.amount(),
                totalAmount,
                reservationRequest.paymentType(),
                status
        ));
        if (result<=0){
            throw new DataNotInsertException("Ödeme İşlemi Başarısız!",ErrorCode.DATA_NOT_INSERT);
        }
    }

    private void validateReservationRequest(ReservationCreateServiceDto reservationRequest){
        if (reservationRequest == null)
            throw new IllegalArgumentException("Parametre null olamaz!");

        if (reservationRequest.startDate() == null || reservationRequest.finishDate() == null)
            throw new NullPointerException("Rezervasyon tarihleri null olamaz!");

        if (reservationRequest.startDate().isAfter(reservationRequest.finishDate()))
            throw new IllegalArgumentException("Rezervasyon başlangıç tarihi bitiş tarihinden büyük olamaz!");
        if (reservationRequest.startDate().isBefore(LocalDateTime.now()))
            throw new IllegalArgumentException("Rezervasyon başlangıç tarihi geçmiş tarih olamaz!");

    }

    private UserServiceDto findUserById(int userId) throws UserNotFoundException, SQLException {
        UserServiceDto user = userService.getById(userId);
        if (user == null)
            throw new UserNotFoundException("İlgili kullanıcı bulunamadı!", ErrorCode.USER_NOT_FOUND);
        return user;
    }

    private VehicleResponseServiceDto findVehicleById(int vehicleId) throws NotFoundException, SQLException, UserNotFoundException {
        VehicleResponseServiceDto vehicle = vehicleService.getById(vehicleId);
        return vehicle;
    }

    private void validatePaymentRequest(ReservationCreateServiceDto reservationRequest, float deposit, float totalAmount) {
        if (deposit > 0 && reservationRequest.amount() == 0)
            throw new IllegalArgumentException("Bu araç için deposit ödenmesi gerekmektedir! Deposit = " + deposit);

        if (deposit > 0 && reservationRequest.amount() < deposit)
            throw new IllegalArgumentException("Ödenen tutar deposit tutarından az olamaz! Deposit = " + deposit + ", Ödenen = " + reservationRequest.amount());

        if (reservationRequest.amount() > totalAmount)
            throw new IllegalArgumentException("Ödenen miktar toplam tutardan fazla olamaz! Topplam Tutar = " + totalAmount );
    }

}
