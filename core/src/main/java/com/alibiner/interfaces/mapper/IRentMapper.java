package com.alibiner.interfaces.mapper;

import com.alibiner.repositoryDto.request.rentPrice.RentPriceCreatePersistenceDto;
import com.alibiner.serviceDto.request.vehicle.update.VehicleUpdateServiceDto;

public interface IRentMapper {
    RentPriceCreatePersistenceDto toRentPriceCreatePersistenceDto(VehicleUpdateServiceDto dto);
}
