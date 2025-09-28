package com.alibiner.interfaces.mapper;


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

public interface IVehicleMapper {
    VehicleCreatePersistenceDto toVehicleCreateDto(VehicleCreateServiceDto dto);
    VehicleCreatePersistenceDto toVehicleCreateDto(VehicleAndDetailAddServiceDto dto);
    VehicleDetailCreatePersistenceDto toVehicleDetailCreateDto(VehicleDetailAddServiceDto dto);
    VehicleDetailCreatePersistenceDto toVehicleDetailCreateDto(VehicleAndDetailAddServiceDto dto);
    VehicleDetailCreatePersistenceDto toVehicleDetailCreateDto(VehicleUpdateServiceDto dto);

    VehicleAndDetailUpdatePersistenceDto toVehicleAndDetailUpdatePersistenceDto(VehicleUpdateServiceDto dto);

    VehicleResponseServiceDto toVehicleResponseServiceDto(VehiclePersistenceDto dto);

    VehicleDetailServiceDto toVehicleDetailServiceDto(VehiclePersistenceDto persistenceDto);
}
