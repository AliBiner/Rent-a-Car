package com.alibiner.entity;

import com.alibiner.enums.vehicle.VehicleType;

import java.time.LocalDateTime;

public class Vehicle extends BaseEntity {
    private final String brand;
    private final String model;
    private final VehicleType vehicleType;
    private final boolean isRent;
    private final int atCreatedId;
    private final int atUpdatedId;
    private final float price;

    public Vehicle(int id, String brand, String model, boolean isRent, LocalDateTime createdDate, LocalDateTime updatedDate, VehicleType vehicleType, int atCreatedId, int atUpdatedId, float price) {
        super(id,createdDate,updatedDate);
        this.brand = brand;
        this.model = model;
        this.isRent = isRent;
        this.vehicleType = vehicleType;
        this.atCreatedId = atCreatedId;
        this.atUpdatedId = atUpdatedId;
        this.price = price;
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

    public int getAtCreatedId() {
        return atCreatedId;
    }

    public int getAtUpdatedId() {
        return atUpdatedId;
    }

    public float getPrice() {
        return price;
    }

    public VehicleType getVehicleType() {
        return vehicleType;
    }
}
