package com.alibiner.mappers.vehicle;

import com.alibiner.interfaces.mapper.IVehicleMapper;
import com.alibiner.repositoryDto.request.rentPrice.RentPriceCreatePersistenceDto;
import com.alibiner.repositoryDto.request.vehicle.VehicleAndDetailUpdatePersistenceDto;
import com.alibiner.repositoryDto.request.vehicle.VehicleCreatePersistenceDto;
import com.alibiner.repositoryDto.request.vehicle.VehicleDetailCreatePersistenceDto;
import com.alibiner.repositoryDto.response.vehicle.VehiclePersistenceDto;
import com.alibiner.serviceDto.request.vehicle.create.VehicleCreateServiceDto;
import com.alibiner.serviceDto.request.vehicle.create.VehicleAndDetailAddServiceDto;
import com.alibiner.serviceDto.request.vehicle.create.VehicleDetailAddServiceDto;
import com.alibiner.serviceDto.request.vehicle.update.VehicleUpdateServiceDto;
import com.alibiner.serviceDto.response.vehicle.VehicleDetailServiceDto;
import com.alibiner.serviceDto.response.vehicle.VehicleResponseServiceDto;

import java.time.LocalDateTime;


public class VehicleMapper implements IVehicleMapper {
    @Override
    public VehicleCreatePersistenceDto toVehicleCreateDto(VehicleCreateServiceDto dto) {
        return new VehicleCreatePersistenceDto(
                dto.modelId(),
                dto.atCreated(),
                dto.price(),
                dto.vehicleType()
        );
    }

    @Override
    public VehicleCreatePersistenceDto toVehicleCreateDto(VehicleAndDetailAddServiceDto dto) {
        return new VehicleCreatePersistenceDto(
                dto.modelId(),
                dto.atCreated(),
                dto.price(),
                dto.vehicleType()
        );
    }

    @Override
    public VehicleDetailCreatePersistenceDto toVehicleDetailCreateDto(VehicleDetailAddServiceDto dto) {
        return new VehicleDetailCreatePersistenceDto(
                dto.doorCount(),
                dto.cc(),
                dto.maxRange(),
                dto.wingCount(),
                dto.pilotCount()
        );
    }

    @Override
    public VehicleDetailCreatePersistenceDto toVehicleDetailCreateDto(VehicleAndDetailAddServiceDto dto) {
        return new VehicleDetailCreatePersistenceDto(
                dto.doorCount(),
                dto.cc(),
                dto.maxRange(),
                dto.wingCount(),
                dto.pilotCount()
        );
    }

    @Override
    public VehicleDetailCreatePersistenceDto toVehicleDetailCreateDto(VehicleUpdateServiceDto dto) {
        return new VehicleDetailCreatePersistenceDto(
                dto.doorCount(),
                dto.cc(),
                dto.maxRange(),
                dto.wingCount(),
                dto.pilotCount()
        );
    }

    @Override
    public VehicleAndDetailUpdatePersistenceDto toVehicleAndDetailUpdatePersistenceDto(VehicleUpdateServiceDto dto) {
        return new VehicleAndDetailUpdatePersistenceDto(
                dto.atUpdated(),
                dto.price(),
                dto.vehicleType(),
                dto.doorCount(),
                dto.cc(),
                dto.maxRange(),
                dto.wingCount(),
                dto.pilotCount(),
                LocalDateTime.now()
        );
    }

    @Override
    public VehicleResponseServiceDto toVehicleResponseServiceDto(VehiclePersistenceDto persistenceDto) {
        return new VehicleResponseServiceDto(
                persistenceDto.id(),
                persistenceDto.brand(),
                persistenceDto.model(),
                persistenceDto.vehicleType(),
                persistenceDto.price()
        );
    }

    @Override
    public VehicleDetailServiceDto toVehicleDetailServiceDto(VehiclePersistenceDto persistenceDto) {
        return new VehicleDetailServiceDto(
                persistenceDto.id(),
                persistenceDto.brand(),
                persistenceDto.model(),
                persistenceDto.vehicleType(),
                persistenceDto.price(),
                persistenceDto.isRent(),
                persistenceDto.machineType(),
                persistenceDto.doorCount(),
                persistenceDto.cc(),
                persistenceDto.maxRange(),
                persistenceDto.wingCount(),
                persistenceDto.pilotCount(),
                persistenceDto.hourlyPrice(),
                persistenceDto.dailyPrice(),
                persistenceDto.weeklyPrice(),
                persistenceDto.monthlyPrice()
        );
    }




}
