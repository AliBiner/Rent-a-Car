package com.alibiner.entity;

import com.alibiner.enums.car.MachineType;

import java.time.LocalDateTime;

public class Car extends Vehicle {
    private final int doorCount;
    private final MachineType machineType;
    private final String productionYear;

    public Car(int id, String brand, String model, boolean isRent, LocalDateTime createdDate, LocalDateTime updatedDate, int atCreatedId, User atCreated, int atUpdatedId, User atUpdated, int doorCount, MachineType machineType, String productionYear) {
        super(id, brand, model, isRent, createdDate, updatedDate, atCreatedId, atCreated, atUpdatedId, atUpdated);
        this.doorCount = doorCount;
        this.machineType = machineType;
        this.productionYear = productionYear;
    }

        public Car(String brand, String model, int doorCount, MachineType machineType, String productionYear, boolean isRent, LocalDateTime createdDate, LocalDateTime updatedDate, int atCreatedId, int atUpdatedId) {
            this(0, brand, model, isRent, createdDate,updatedDate,atCreatedId,null,atUpdatedId,null,doorCount,machineType,productionYear);
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
}
