package com.alibiner.repositoryDto.request.payment;

import com.alibiner.enums.reservation.PaymentStatus;
import com.alibiner.enums.reservation.PaymentType;

public record PaymentCreatePersistenceDto(
        int reservationId,
        float deposit,
        float amount,
        float totalAmount,
        PaymentType paymentType,
        PaymentStatus paymentStatus
) {
}
