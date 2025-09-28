package com.alibiner.serviceDto.request.vehicle.create;

import com.alibiner.enums.car.MachineType;
import com.alibiner.enums.vehicle.VehicleType;

import java.util.Objects;

public class VehicleAndDetailAddServiceDto {
    private final int modelId;
    private final int atCreated;
    private final float price;
    private final VehicleType vehicleType;
    private final MachineType machineType;
    private final int doorCount;
    private final int cc;
    private final int maxRange;
    private final int wingCount;
    private final int pilotCount;

    public VehicleAndDetailAddServiceDto(
            int modelId,
            int atCreated,
            float price,
            VehicleType vehicleType, MachineType machineType,
            int doorCount,
            int cc,
            int maxRange,
            int wingCount,
            int pilotCount
    ) {
        this.modelId = modelId;
        this.atCreated = atCreated;
        this.price = price;
        this.vehicleType = vehicleType;
        this.machineType = machineType;
        this.doorCount = doorCount;
        this.cc = cc;
        this.maxRange = maxRange;
        this.wingCount = wingCount;
        this.pilotCount = pilotCount;
    }

    /**
    * For Car
    * */
    public VehicleAndDetailAddServiceDto(int modelId, int atCreated, VehicleType vehicleType, int doorCount, MachineType machineType, float price) {
        this(modelId,atCreated,price,vehicleType,machineType,doorCount,0,0,0,0);
    }

    /**
     * For Motorcycle
     * */
    public VehicleAndDetailAddServiceDto(int modelId, int atCreated, float price, VehicleType vehicleType, int cc) {
        this(modelId,atCreated,price,vehicleType,null, 0,cc,0,0,0);
    }

    /**
     * For Helicopter
     * */
    public VehicleAndDetailAddServiceDto(int modelId, int atCreated, float price, VehicleType vehicleType, int maxRange, int wingCount, int pilotCount) {
        this(modelId,atCreated,price,vehicleType,null,0,0,maxRange,wingCount,pilotCount);
    }

    public int modelId() {
        return modelId;
    }

    public int atCreated() {
        return atCreated;
    }

    public float price() {
        return price;
    }

    public VehicleType vehicleType() {
        return vehicleType;
    }

    public int doorCount() {
        return doorCount;
    }

    public int cc() {
        return cc;
    }

    public int maxRange() {
        return maxRange;
    }

    public int wingCount() {
        return wingCount;
    }

    public int pilotCount() {
        return pilotCount;
    }

    public MachineType machineType() {
        return machineType;
    }


    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        VehicleAndDetailAddServiceDto that = (VehicleAndDetailAddServiceDto) o;
        return modelId == that.modelId && atCreated == that.atCreated && Float.compare(price, that.price) == 0 && doorCount == that.doorCount && cc == that.cc && maxRange == that.maxRange && wingCount == that.wingCount && pilotCount == that.pilotCount && vehicleType == that.vehicleType && machineType == that.machineType;
    }

    @Override
    public int hashCode() {
        return Objects.hash(modelId, atCreated, price, vehicleType, machineType, doorCount, cc, maxRange, wingCount, pilotCount);
    }

    @Override
    public String toString() {
        return "VehicleAndDetailAddServiceDto{" +
                "modelId=" + modelId +
                ", atCreated=" + atCreated +
                ", price=" + price +
                ", vehicleType=" + vehicleType +
                ", machineType=" + machineType +
                ", doorCount=" + doorCount +
                ", cc=" + cc +
                ", maxRange=" + maxRange +
                ", wingCount=" + wingCount +
                ", pilotCount=" + pilotCount +
                '}';
    }
}
