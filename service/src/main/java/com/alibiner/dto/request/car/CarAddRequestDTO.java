package com.alibiner.dto.request.car;

import com.alibiner.enums.car.MachineType;

public class CarAddRequestDTO {
    private final String brand;
    private final String model;
    private final int doorCount;
    private final MachineType machineType;
    private final String productionYear;
    private final int atCreated;

    public CarAddRequestDTO(
            String brand,
            String model,
            int doorCount,
            MachineType machineType,
            String productionYear,
            int atCreated) {
        this.brand = brand;
        this.model = model;
        this.doorCount = doorCount;
        this.machineType = machineType;
        this.productionYear = productionYear;
        this.atCreated = atCreated;
    }

    public String getBrand() {
        return brand;
    }

    public String getModel() {
        return model;
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

    public int getAtCreated() {
        return atCreated;
    }
}
