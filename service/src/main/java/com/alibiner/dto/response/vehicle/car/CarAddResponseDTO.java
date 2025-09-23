package com.alibiner.dto.response.vehicle.car;

import com.alibiner.dto.response.vehicle.IVehicleResponseDto;

public class CarAddResponseDTO implements IVehicleResponseDto {
    private String brand;

    public CarAddResponseDTO(String brand) {
        this.brand = brand;
    }

    public String getBrand() {
        return brand;
    }
}
