package com.alibiner.mappers.rentPrice;

import com.alibiner.interfaces.mapper.IRentMapper;
import com.alibiner.repositoryDto.request.rentPrice.RentPriceCreatePersistenceDto;
import com.alibiner.serviceDto.request.vehicle.update.VehicleUpdateServiceDto;

public class RentMapper implements IRentMapper {
    @Override
    public RentPriceCreatePersistenceDto toRentPriceCreatePersistenceDto(VehicleUpdateServiceDto dto) {
        return new RentPriceCreatePersistenceDto(
                dto.id(),
                dto.hourlyPrice(),
                dto.dailyPrice(),
                dto.weeklyPrice(),
                dto.monthlyPrice()
        );
    }
}
