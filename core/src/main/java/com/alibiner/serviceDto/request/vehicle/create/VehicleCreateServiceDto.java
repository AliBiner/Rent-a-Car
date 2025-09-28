package com.alibiner.serviceDto.request.vehicle.create;

import com.alibiner.enums.vehicle.VehicleType;

public record VehicleCreateServiceDto(int modelId, int atCreated, float price, VehicleType vehicleType) {
}
