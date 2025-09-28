package com.alibiner.interfaces.repository;

import com.alibiner.repositoryDto.request.rentPrice.RentPriceCreatePersistenceDto;
import com.alibiner.repositoryDto.request.rentPrice.RentPriceUpdatePersistenceDto;
import com.alibiner.repositoryDto.response.rentPrice.RentPricePersistenceResponseDto;

import java.sql.SQLException;

public interface IRentPriceRepository {
    int create(RentPriceCreatePersistenceDto dto) throws SQLException;

    int updateByVehicleId(int vehicleId, RentPriceUpdatePersistenceDto dto) throws SQLException;

    RentPricePersistenceResponseDto getByVehicleId(int vehicleId) throws SQLException;
}
