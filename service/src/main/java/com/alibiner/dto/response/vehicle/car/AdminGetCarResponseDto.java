package com.alibiner.dto.response.vehicle.car;

import com.alibiner.dto.response.vehicle.IVehicleResponseDto;
import com.alibiner.entity.User;
import com.alibiner.enums.car.MachineType;

import java.time.LocalDateTime;
import java.util.Objects;

public class AdminGetCarResponseDto implements IVehicleResponseDto {
    private final int id;
    private final String brand;
    private final String model;
    private final boolean isRent;
    private final int doorCount;
    private final MachineType machineType;
    private final String productionYear;
    private final LocalDateTime createdDate;
    private final LocalDateTime updatedDate;
    private final int atCreatedId;
    private final int atUpdatedId;


    public AdminGetCarResponseDto(int id, String brand, String model, boolean isRent, int doorCount, MachineType machineType, String productionYear, LocalDateTime createdDate, LocalDateTime updatedDate, int atCreatedId, int atUpdatedId) {
        this.id = id;
        this.brand = brand;
        this.model = model;
        this.isRent = isRent;
        this.doorCount = doorCount;
        this.machineType = machineType;
        this.productionYear = productionYear;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
        this.atCreatedId = atCreatedId;
        this.atUpdatedId = atUpdatedId;
    }

    public int getId() {
        return id;
    }

    public String getBrand() {
        return brand;
    }

    public String getModel() {
        return model;
    }

    public boolean isRent() {
        return isRent;
    }

    public int getDoorCount() {
        return doorCount;
    }

    public MachineType getMachineType() {
        return machineType;
    }

    public String getProductionYear() {
        return productionYear;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public LocalDateTime getUpdatedDate() {
        return updatedDate;
    }

    public int getAtCreatedId() {
        return atCreatedId;
    }


    public int getAtUpdatedId() {
        return atUpdatedId;
    }


    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        AdminGetCarResponseDto that = (AdminGetCarResponseDto) o;
        return id == that.id && isRent == that.isRent && doorCount == that.doorCount && atCreatedId == that.atCreatedId && atUpdatedId == that.atUpdatedId && Objects.equals(brand, that.brand) && Objects.equals(model, that.model) && machineType == that.machineType && Objects.equals(productionYear, that.productionYear) && Objects.equals(createdDate, that.createdDate) && Objects.equals(updatedDate, that.updatedDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, brand, model, isRent, doorCount, machineType, productionYear, createdDate, updatedDate, atCreatedId, atUpdatedId);
    }

    @Override
    public String toString() {
        return "AdminGetCarResponseDto{" +
                "id=" + id +
                ", brand='" + brand + '\'' +
                ", model='" + model + '\'' +
                ", isRent=" + isRent +
                ", doorCount=" + doorCount +
                ", machineType=" + machineType +
                ", productionYear='" + productionYear + '\'' +
                ", createdDate=" + createdDate +
                ", updatedDate=" + updatedDate +
                ", atCreatedId=" + atCreatedId +
                ", atUpdatedId=" + atUpdatedId +
                '}';
    }
}
