package com.alibiner.repositoryDto.request.vehicle;

import com.alibiner.enums.vehicle.VehicleType;

public record VehicleCreatePersistenceDto(
        int modelId,
        int atCreated,
        float price,
        VehicleType vehicleType) {
}
