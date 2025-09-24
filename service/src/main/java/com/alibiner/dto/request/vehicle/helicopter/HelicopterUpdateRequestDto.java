package com.alibiner.dto.request.vehicle.helicopter;

import com.alibiner.dto.request.vehicle.IVehicleRequestDto;
import com.alibiner.enums.car.MachineType;

public record HelicopterUpdateRequestDto(
        int id,
        String brand,
        String model,
        int maxRange,
        int wingCount,
        int passengerCount,
        int pilotCount,
        String productionYear,
        int atUpdated
) implements IVehicleRequestDto {

}
