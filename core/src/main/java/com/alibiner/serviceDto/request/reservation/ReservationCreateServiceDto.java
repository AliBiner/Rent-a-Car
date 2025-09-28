package com.alibiner.serviceDto.request.reservation;

import com.alibiner.enums.reservation.PaymentType;
import com.alibiner.enums.reservation.ReservationStatus;

import java.time.LocalDateTime;

public record ReservationCreateServiceDto (int userId,
                                           int vehicleId,
                                           LocalDateTime startDate,
                                           LocalDateTime finishDate,
                                           float amount,
                                           PaymentType paymentType) {
}
