package com.alibiner.UI.customer;

import com.alibiner.UI.UserSession;
import com.alibiner.UI.util.CustomPrint;
import com.alibiner.controller.ReservationController;
import com.alibiner.repositoryDto.request.reservation.ReservationPersistenceDto;
import com.alibiner.util.ResponseEntity;

import java.util.*;

public class CustomerHomeUI {
    public static void view(Scanner scanner){
        while (true){
            System.out.println();
            System.out.println("===========Araç Kiralama Uygulamasına Hoş Geldiniz===========");
            System.out.println();

            System.out.println("1 - Araç Listeleme");
            System.out.println("2 - Rezervasyonlarım");
            System.out.println("3 - Geçmiş Rezervasyonlarım");
            System.out.println("0 - Bir Üst Menü");
            System.out.print("Seçiminiz: ");
            String choice = scanner.nextLine();
            switch (choice){
                case "1":
                    VehicleListUI.view(scanner);
                    break;
                case "2":
                    activeReservationList(scanner);
                    break;
                case "3":
                    pastReservationList(scanner);
                    break;
                case "0":
                    return;
                default:
                    CustomPrint.printRed("Hatalı veri girişi yaptınız!");
                    break;
            }
        }
    }

    private static void pastReservationList(Scanner scanner) {
        ReservationController reservationController = new ReservationController();
        ResponseEntity<List<ReservationPersistenceDto>> allPastReservation = reservationController.getAllPastReservation(UserSession.getId());
        if (allPastReservation.getData()==null){
            CustomPrint.printRed(allPastReservation.getMessage());
            return;
        }
        if (allPastReservation.getData().isEmpty()){
            CustomPrint.printGreen("Eşleşen Veri Bulunamadı!");
            return;
        }

        for (ReservationPersistenceDto reservation : allPastReservation.getData()){
            System.out.println("ID: " + reservation.id() + " - Başlangıç Tarihi: " + reservation.startDate() + " - Bitiş Tarihi: " + reservation.finishDate() + " - Durumu: " + reservation.status());
        }

    }

    private static void activeReservationList(Scanner scanner) {
        ReservationController reservationController = new ReservationController();
        ResponseEntity<List<ReservationPersistenceDto>> allActiveById = reservationController.getAllActiveById(UserSession.getId());

        if (allActiveById.getData()==null){
            CustomPrint.printRed(allActiveById.getMessage());
            return;
        }
        if (allActiveById.getData().isEmpty()){
            CustomPrint.printGreen("Eşleşen Veri Bulunamadı!");
            return;
        }

        for (ReservationPersistenceDto reservation : allActiveById.getData()){
            System.out.println("ID: " + reservation.id() + " - Başlangıç Tarihi: " + reservation.startDate() + " - Bitiş Tarihi: " + reservation.finishDate() + " - Durumu: " + reservation.status());
        }

    }
}
