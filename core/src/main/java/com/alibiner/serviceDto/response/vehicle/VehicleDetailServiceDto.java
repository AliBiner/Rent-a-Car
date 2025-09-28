package com.alibiner.serviceDto.response.vehicle;

import com.alibiner.enums.car.MachineType;
import com.alibiner.enums.vehicle.VehicleType;

public record VehicleDetailServiceDto (
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
){
    @Override
    public String toString() {
        return
                "id=" + id +
                "\nmarka='" + brand + '\'' +
                "\nmodel='" + model + '\'' +
                "\naraç tipi=" + vehicleType +
                "\ndeğeri=" + price +
                "\nmotor tipi=" + machineType +
                "\nkapı sayısı=" + doorCount +
                "\nsaatlik ücret=" + hourlyPrice +
                "\ngünlük ücret=" + dailyPrice +
                "\nhaftalık ücret=" + weeklyPrice +
                "\naylık ücret=" + monthlyPrice ;
    }
}
