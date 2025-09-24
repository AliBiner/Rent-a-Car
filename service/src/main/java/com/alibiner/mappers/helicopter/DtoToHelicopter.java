package com.alibiner.mappers.helicopter;

import com.alibiner.dto.request.vehicle.helicopter.HelicopterAddRequestDto;
import com.alibiner.dto.request.vehicle.helicopter.HelicopterUpdateRequestDto;
import com.alibiner.entity.Helicopter;

import java.time.LocalDateTime;

public class DtoToHelicopter {
    public static Helicopter HelicopterAddRequestDtoTo(HelicopterAddRequestDto dto){
        return new Helicopter(
                0,
                dto.brand(),
                dto.model(),
                dto.productionYear(),
                false,
                LocalDateTime.now(),
                LocalDateTime.now(),
                dto.atCreated(),
                null,
                dto.atCreated(),
                null,
                dto.maxRange(),
                dto.wingCount(),
                dto.passengerCount(),
                dto.pilotCount()
        );
    }

}
