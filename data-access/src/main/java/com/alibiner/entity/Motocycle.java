package com.alibiner.entity;

import java.time.LocalDateTime;

public class Motocycle extends Vehicle{
    private int cc;

    public Motocycle(int id, String brand, String model, boolean isRent, LocalDateTime createdDate, LocalDateTime updatedDate, int atCreatedId, User atCreated, int atUpdatedId, User atUpdated, int cc) {
        super(id, brand, model, isRent, createdDate, updatedDate, atCreatedId, atCreated, atUpdatedId, atUpdated);
        this.cc = cc;
    }

    public int getCc() {
        return cc;
    }
}
