package com.alibiner.entity;

import java.time.LocalDateTime;

public class Vehicle extends BaseEntity {
    private final String brand;
    private final String model;
    private final String productionYear;
    private final boolean isRent;
    private final LocalDateTime createdDate;
    private final LocalDateTime updatedDate;
    private final int atCreatedId;
    private final User atCreated;
    private final int atUpdatedId;
    private final User atUpdated;

    public Vehicle(int id, String brand, String model, String productionYear, boolean isRent, LocalDateTime createdDate, LocalDateTime updatedDate, int atCreatedId, User atCreated, int atUpdatedId, User atUpdated) {
        super(id);
        this.brand = brand;
        this.model = model;
        this.productionYear = productionYear;
        this.isRent = isRent;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
        this.atCreatedId = atCreatedId;
        this.atCreated = atCreated;
        this.atUpdatedId = atUpdatedId;
        this.atUpdated = atUpdated;
    }



    public String getBrand() {
        return brand;
    }

    public String getModel() {
        return model;
    }

    public String getProductionYear() {
        return productionYear;
    }

    public boolean isRent() {
        return isRent;
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

    public User getAtCreated() {
        return atCreated;
    }

    public int getAtUpdatedId() {
        return atUpdatedId;
    }

    public User getAtUpdated() {
        return atUpdated;
    }


}
