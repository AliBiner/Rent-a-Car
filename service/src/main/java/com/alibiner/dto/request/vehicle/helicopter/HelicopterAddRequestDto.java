package com.alibiner.dto.request.vehicle.helicopter;

import com.alibiner.dto.request.vehicle.IVehicleRequestDto;

public record HelicopterAddRequestDto(
        String brand,
        String model,
        String productionYear,
        int maxRange,
        int wingCount,
        int passengerCount,
        int pilotCount,
        int atCreated
) implements IVehicleRequestDto {
}
