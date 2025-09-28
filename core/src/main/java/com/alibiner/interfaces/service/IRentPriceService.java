package com.alibiner.interfaces.service;

import com.alibiner.repositoryDto.request.rentPrice.RentPriceCreatePersistenceDto;
import com.alibiner.repositoryDto.request.rentPrice.RentPriceUpdatePersistenceDto;

import java.sql.SQLException;
import java.time.Duration;

public interface IRentPriceService {

    boolean create(RentPriceCreatePersistenceDto dto) throws SQLException;

    boolean updateByVehicleId(int vehicleId, RentPriceUpdatePersistenceDto dto) throws SQLException;
//
//    float getPriceByDate(int vehicleId, LocalDateTime startDate, LocalDateTime finishDate) throws SQLException;
//
    float calculateRentalCost(int vehicleId, Duration duration) throws SQLException;

    float calculateDepositAmount(float totalAmount);
}
