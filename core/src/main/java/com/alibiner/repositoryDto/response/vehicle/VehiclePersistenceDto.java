package com.alibiner.repositoryDto.response.vehicle;

import com.alibiner.enums.car.MachineType;
import com.alibiner.enums.vehicle.VehicleType;

public record VehiclePersistenceDto(
        int id,
        String brand,
        String model,
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
        float monthlyPrice
) {

}
