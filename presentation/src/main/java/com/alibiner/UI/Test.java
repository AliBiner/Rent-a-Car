package com.alibiner.UI;

import com.alibiner.UI.util.CustomPrint;
import com.alibiner.controller.ReservationController;
import com.alibiner.enums.reservation.PaymentType;
import com.alibiner.serviceDto.request.reservation.ReservationCreateServiceDto;
import com.alibiner.util.ResponseEntity;

import javax.swing.text.DateFormatter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Test {
    public static void main(String[] args) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        LocalDateTime startDate = LocalDateTime.parse("2025-10-26 13:00", formatter);
        LocalDateTime finishDate = LocalDateTime.parse("2025-10-27 12:00", formatter);

        ReservationCreateServiceDto reservationRequest = new ReservationCreateServiceDto(
                6,
                4,
                startDate,
                finishDate,
                10000,
                PaymentType.CREDIT_CART
        );

        ReservationController reservationController = new ReservationController();
        ResponseEntity<Boolean> response = reservationController.postReservation(reservationRequest);
        if (response.getData()==null || response.getData() == false)
            CustomPrint.printRed(response.getMessage());
        else
            CustomPrint.printBlue(response.getMessage()  + response.getData());

    }
}
