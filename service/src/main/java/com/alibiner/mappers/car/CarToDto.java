package com.alibiner.mappers.car;

import com.alibiner.dto.response.vehicle.car.AdminGetCarResponseDto;
import com.alibiner.entity.Car;

public class CarToDto {
    public static AdminGetCarResponseDto toAdminGetCarResponseDto(Car car){
        return new AdminGetCarResponseDto(
                car.getId(),
                car.getBrand(),
                car.getModel(),
                car.isRent(),
                car.getDoorCount(),
                car.getMachineType(),
                car.getProductionYear(),
                car.getCreatedDate(),
                car.getUpdatedDate(),
                car.getAtCreatedId(),
                car.getAtCreatedId()
        );
    }
}
