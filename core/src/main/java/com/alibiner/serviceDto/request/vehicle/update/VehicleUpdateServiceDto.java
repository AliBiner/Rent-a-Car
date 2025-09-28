package com.alibiner.serviceDto.request.vehicle.update;

import com.alibiner.enums.car.MachineType;
import com.alibiner.enums.vehicle.VehicleType;

public record VehicleUpdateServiceDto(
        int id,
        VehicleType vehicleType,
        float price,
        boolean isRent,
        MachineType machineType,
        int doorCount,
        int cc,
        int maxRange,
        int wingCount,
        int pilotCount,
        float hourlyPrice,
        float dailyPrice,
        float weeklyPrice,
        float monthlyPrice,
        int atUpdated
) {

}
