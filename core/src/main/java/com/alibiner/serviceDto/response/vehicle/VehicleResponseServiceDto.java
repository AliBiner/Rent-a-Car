package com.alibiner.serviceDto.response.vehicle;

import com.alibiner.enums.vehicle.VehicleType;

public record VehicleResponseServiceDto (
        int id,
        String brand,
        String model,
        VehicleType vehicleType,
        float price
){
    @Override
    public String toString() {
        return "id=" + id +
                ", brand='" + brand + '\'' +
                ", model='" + model + '\'' +
                ", vehicleType=" + vehicleType +
                ", price=" + price;
    }
}
