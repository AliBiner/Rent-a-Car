package com.alibiner.dto.response.vehicle.helicopter;

import com.alibiner.dto.response.vehicle.IVehicleResponseDto;

import java.time.LocalDateTime;

public record AdminGetHelicopterResponseDto(
        int id,
        String brand,
        String model,
        int maxRange,
        int wingCount,
        int passengerCount,
        int pilotCount,
        boolean isRent,
        String productionYear,
        LocalDateTime createdDate,
        LocalDateTime updatedDate,
        int atCreatedId,
        int atUpdatedId) implements IVehicleResponseDto {

    @Override
    public String toString() {
        return "AdminGetHelicopterResponseDto{" +
                "id=" + id +
                ", brand='" + brand + '\'' +
                ", model='" + model + '\'' +
                ", maxRange=" + maxRange +
                ", wingCount=" + wingCount +
                ", passengerCount=" + passengerCount +
                ", pilotCount=" + pilotCount +
                ", isRent=" + isRent +
                ", productionYear='" + productionYear + '\'' +
                ", createdDate=" + createdDate +
                ", updatedDate=" + updatedDate +
                ", atCreatedId=" + atCreatedId +
                ", atUpdatedId=" + atUpdatedId +
                '}';
    }
}
