package com.alibiner.mappers;

import com.alibiner.dto.request.car.CarAddRequestDTO;
import com.alibiner.entity.Car;
import com.alibiner.services.CarService;

import java.time.LocalDateTime;

public class DtoToCar {
    public static Car carAddRequestDtoTo(CarAddRequestDTO dto){

        return new Car(
                dto.getBrand(),
                dto.getModel(),
                dto.getDoorCount(),
                dto.getMachineType(),
                dto.getProductionYear(),
                false,
                LocalDateTime.now(),
                LocalDateTime.now(),
                dto.getAtCreated(),
                dto.getAtCreated());

    }
}
