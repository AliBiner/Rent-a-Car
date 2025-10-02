package com.alibiner.controller;

import java.util.*;
import com.alibiner.exceptionHandler.MyExceptionHandler;
import com.alibiner.interfaces.mapper.IRentMapper;
import com.alibiner.interfaces.mapper.IUserMapper;
import com.alibiner.interfaces.mapper.IVehicleMapper;
import com.alibiner.interfaces.repository.*;
import com.alibiner.interfaces.service.IRentPriceService;
import com.alibiner.interfaces.service.IReservationService;
import com.alibiner.interfaces.service.IUserService;
import com.alibiner.interfaces.service.IVehicleService;
import com.alibiner.interfaces.unitOfWork.IUnitOfWork;
import com.alibiner.mappers.UserMapper;
import com.alibiner.mappers.rentPrice.RentMapper;
import com.alibiner.mappers.vehicle.VehicleMapper;
import com.alibiner.repository.RentPriceRepository;
import com.alibiner.repository.ReservationRepository;
import com.alibiner.repository.UserRepository;
import com.alibiner.repository.VehicleRepository;
import com.alibiner.repositoryDto.request.reservation.ReservationPersistenceDto;
import com.alibiner.serviceDto.request.reservation.ReservationCreateServiceDto;
import com.alibiner.services.UserService;
import com.alibiner.services.rentPrice.RentPriceService;
import com.alibiner.services.reservation.ReservationService;
import com.alibiner.services.vehicle.VehicleService;
import com.alibiner.util.ResponseEntity;
import com.alibiner.util.UnitOfWork;

public class ReservationController {
    private final IReservationService reservationService;

    public ReservationController() {
        //Unit of work
        IUnitOfWork unitOfWork = new UnitOfWork();

        //User
        IUserRepository userRepository = new UserRepository();
        IUserMapper userMapper = new UserMapper();
        IUserService userService = new UserService(userRepository,unitOfWork,userMapper);

        //Rent Price
        IRentPriceRepository rentPriceRepository = new RentPriceRepository();
        IRentMapper rentMapper = new RentMapper();
        IRentPriceService rentPriceService = new RentPriceService(rentPriceRepository,unitOfWork);

        //Vehicle
        IVehicleRepository vehicleRepository = new VehicleRepository();
        IVehicleMapper vehicleMapper = new VehicleMapper();
        IVehicleService vehicleService = new VehicleService(vehicleRepository,vehicleMapper,unitOfWork,userService,rentPriceService,rentMapper);

        //Payment
        IPaymentRepository paymentRepository = new ReservationRepository();

        //Reservation
        IReservationRepository reservationRepository = new ReservationRepository();
        this.reservationService = new ReservationService(
                userService,
                rentPriceService,
                vehicleService,
                reservationRepository,
                paymentRepository,
                unitOfWork);
    }

    public ResponseEntity<Boolean> postReservation(ReservationCreateServiceDto reservationRequest){
        try {
            boolean result = reservationService.create(reservationRequest);
            return new ResponseEntity<Boolean>().ok(result);
        } catch (Exception e) {
            return new MyExceptionHandler<Boolean>(e).handle();
        }
    }


    public ResponseEntity<List<ReservationPersistenceDto>> getAllActiveById(int userId) {
        try {
            List<ReservationPersistenceDto> allActive = reservationService.getAllActive(userId);
            return new ResponseEntity<List<ReservationPersistenceDto>>().ok(allActive);
        } catch (Exception e) {
            return new MyExceptionHandler<List<ReservationPersistenceDto>>(e).handle();
        }
    }

    public ResponseEntity<List<ReservationPersistenceDto>> getAllPastReservation(int userId) {
        try {
            List<ReservationPersistenceDto> pastReservations = reservationService.getAllPast(userId);
            return new ResponseEntity<List<ReservationPersistenceDto>>().ok(pastReservations);
        } catch (Exception e) {
            return new MyExceptionHandler<List<ReservationPersistenceDto>>(e).handle();
        }
    }
}
