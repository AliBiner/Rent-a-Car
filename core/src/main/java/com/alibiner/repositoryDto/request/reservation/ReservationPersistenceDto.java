package com.alibiner.repositoryDto.request.reservation;

import com.alibiner.enums.reservation.ReservationStatus;

import java.time.LocalDateTime;

public record ReservationPersistenceDto(
        int id,
        int userId,
        String fullName,
        int vehicleId,
        LocalDateTime startDate,
        LocalDateTime finishDate,
        ReservationStatus status
) {
}
