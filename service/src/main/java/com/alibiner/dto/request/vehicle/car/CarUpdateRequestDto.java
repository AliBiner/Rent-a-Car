package com.alibiner.dto.request.vehicle.car;

import com.alibiner.dto.request.vehicle.IVehicleRequestDto;
import com.alibiner.enums.car.MachineType;

public record CarUpdateRequestDto(
        int id,
        String brand,
        String model,
        int doorCount,
        MachineType machineType,
        String productionYear,
        int atUpdated) implements IVehicleRequestDto {
}
