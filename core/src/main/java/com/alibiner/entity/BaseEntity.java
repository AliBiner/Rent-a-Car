package com.alibiner.entity;

import java.time.LocalDateTime;

public class BaseEntity {
    private final int id;
    private final LocalDateTime createdDate;
    private final LocalDateTime updatedDate;

    public BaseEntity(int id, LocalDateTime createdDate, LocalDateTime updatedDate) {
        this.id = id;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
    }

    public int getId() {
        return id;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public LocalDateTime getUpdatedDate() {
        return updatedDate;
    }
}
