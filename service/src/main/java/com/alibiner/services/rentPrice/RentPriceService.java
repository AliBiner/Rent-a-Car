package com.alibiner.services.rentPrice;

import com.alibiner.interfaces.repository.IRentPriceRepository;
import com.alibiner.interfaces.service.IRentPriceService;
import com.alibiner.interfaces.unitOfWork.IUnitOfWork;
import com.alibiner.repositoryDto.request.rentPrice.RentPriceCreatePersistenceDto;
import com.alibiner.repositoryDto.request.rentPrice.RentPriceUpdatePersistenceDto;
import com.alibiner.repositoryDto.response.rentPrice.RentPricePersistenceResponseDto;

import java.sql.SQLException;
import java.time.Duration;

public class RentPriceService implements IRentPriceService {

    private final IRentPriceRepository rentPriceRepository;
    private final IUnitOfWork unitOfWork;

    public RentPriceService(IRentPriceRepository repository, IUnitOfWork unitOfWork) {
        this.rentPriceRepository = repository;
        this.unitOfWork = unitOfWork;
    }

    @Override
    public boolean create(RentPriceCreatePersistenceDto dto) throws SQLException {
        RentPricePersistenceResponseDto byVehicleId = rentPriceRepository.getByVehicleId(dto.vehicleId());
        if (byVehicleId != null){
            return updateByVehicleId(dto.vehicleId(),
                    new RentPriceUpdatePersistenceDto(
                            dto.hourlyPrice(),
                            dto.dailyPrice(),
                            dto.weeklyPrice(),
                            dto.monthPrice()
                    )
            );
        }
        int result = rentPriceRepository.create(dto);
        if (result<=0){
            unitOfWork.rollback();
            return false;
        }

        unitOfWork.commit();
        return true;
    }


    @Override
    public boolean updateByVehicleId(int vehicleId, RentPriceUpdatePersistenceDto dto) throws SQLException {

        int result = rentPriceRepository.updateByVehicleId(vehicleId, dto);
        if (result<=0){
            unitOfWork.rollback();
            return false;
        }
        unitOfWork.commit();
        return false;
    }


    private float getPriceByDate(int vehicleId, Duration duration) throws SQLException {
        RentPricePersistenceResponseDto prices = rentPriceRepository.getByVehicleId(vehicleId);
        if (prices == null)
            throw new IllegalArgumentException("İlgili araç için rezervasyon ücret tanımlamaları yapılmamıştır!");

        if (duration.toHours()<24){ // Not yet one day
            if (prices.hourlyPrice() == null)
                throw new IllegalArgumentException("Saatlik kiralama mevcut değildir!");
            return prices.hourlyPrice();
        }
        if (duration.toDays()<7){ // Not yet one week
            if (prices.dailyPrice() == null){
                throw new IllegalArgumentException("Günlük kiralama mevcut değildir!");
            }
            return prices.dailyPrice();
        }

        if (duration.toDays()<28){ // Not yet one month
            if (prices.weeklyPrice()==null){
                throw new IllegalArgumentException("Haftalık kiralama mevcut değildir!");
            }
            return prices.weeklyPrice();
        }

        if (prices.monthlyPrice() == null){
            throw new IllegalArgumentException("Aylık kiralama mevcut değildir!");
        }
        return prices.monthlyPrice();
    }

    @Override
    public float calculateRentalCost(int vehicleId, Duration duration) throws SQLException {
        float price = getPriceByDate(vehicleId, duration);

        if (duration.toHours()<24) // Not yet one day
            return price * duration.toHours();

        if (duration.toDays()<7) // Not yet one week
            return price * duration.toDays();

        if (duration.toDays()<28) // Not yet one month
            return price * ((float) duration.toDays() / 7); // Have 4 weeks (7 days) in a month

        return price * ( (float) duration.toDays() / 28); // Have 13 months (28 days) in a year
    }

    @Override
    public float calculateDepositAmount(float totalAmount) {
        return (float) (totalAmount * 0.1); // Default 10% deposit
    }
}
