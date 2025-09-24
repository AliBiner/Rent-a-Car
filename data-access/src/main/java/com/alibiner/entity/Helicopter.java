package com.alibiner.entity;

import java.time.LocalDateTime;

public class Helicopter extends Vehicle{
    private final int maxRange;
    private final int wingCount;
    private final int passengerCount;
    private final int pilotCount;

    public Helicopter(int id, String brand, String model, String productionYear, boolean isRent, LocalDateTime createdDate, LocalDateTime updatedDate, int atCreatedId, User atCreated, int atUpdatedId, User atUpdated, int maxRange, int wingCount, int passengerCount, int pilotCount) {
        super(id, brand, model, productionYear, isRent, createdDate, updatedDate, atCreatedId, atCreated, atUpdatedId, atUpdated);
        this.maxRange = maxRange;
        this.wingCount = wingCount;
        this.passengerCount = passengerCount;
        this.pilotCount = pilotCount;
    }



    public int getMaxRange() {
        return maxRange;
    }

    public int getWingCount() {
        return wingCount;
    }

    public int getPassengerCount() {
        return passengerCount;
    }

    public int getPilotCount() {
        return pilotCount;
    }
}
