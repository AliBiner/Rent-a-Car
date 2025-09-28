package com.alibiner.repositoryDto.request.reservation;

import com.alibiner.enums.reservation.ReservationStatus;

import java.time.LocalDateTime;

public record ReservationCreatePersistenceDto (
        int userId,
        int vehicleId,
        LocalDateTime startDate,
        LocalDateTime finishDate,
        ReservationStatus reservationStatus
){
}
