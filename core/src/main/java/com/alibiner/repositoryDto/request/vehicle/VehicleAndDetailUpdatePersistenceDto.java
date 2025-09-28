package com.alibiner.repositoryDto.request.vehicle;

import com.alibiner.enums.vehicle.VehicleType;

import java.time.LocalDateTime;

public record VehicleAndDetailUpdatePersistenceDto(
//        int modelId,
        int atUpdated,
        float price,
        VehicleType vehicleType,
        int doorCount,
        int cc,
        int maxRange,
        int wingCount,
        int pilotCount,
        LocalDateTime updatedDate
){
}
