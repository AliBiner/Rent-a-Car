package com.alibiner.enums.reservation;

public enum ReservationStatus {
    RESERVED,
    CONFIRMED, // After payment
    ACTIVE, //Take vehicle on reservation time
    COMPLETED, //Success rent and return vehicle
    CANCELED,
    NO_SHOW
}
