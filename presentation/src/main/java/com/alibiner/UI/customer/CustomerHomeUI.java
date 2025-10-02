package com.alibiner.UI.customer;

import com.alibiner.UI.UserSession;
import com.alibiner.UI.util.CustomPrint;
import com.alibiner.controller.ReservationController;
import com.alibiner.repositoryDto.request.reservation.GetAllReservationPaginationDto;
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
        int offset = 0;
        final int limit = 2;
        int currentPage = 1;
        while (true) {
            ReservationController reservationController = new ReservationController();
            ResponseEntity<GetAllReservationPaginationDto> allPastReservation = reservationController.getAllPastReservation(offset, limit, UserSession.getId());
            if (allPastReservation.getData() == null || allPastReservation.getData().reservations() == null) {
                CustomPrint.printRed(allPastReservation.getMessage());
                return;
            }
            if (allPastReservation.getData().reservations().isEmpty()) {
                CustomPrint.printGreen("Eşleşen Veri Bulunamadı!");
                return;
            }

            for (ReservationPersistenceDto reservation : allPastReservation.getData().reservations()) {
                System.out.println("ID: " + reservation.id() + " - Başlangıç Tarihi: " + reservation.startDate() + " - Bitiş Tarihi: " + reservation.finishDate() + " - Durumu: " + reservation.status());
            }

            if (allPastReservation.getData().totalCount() == 0) {
                return;
            } else {
                int countPage = (int) Math.ceil((double) allPastReservation.getData().totalCount() / limit);
                System.out.println();


                CustomPrint.printBlue("Sayfa: " + currentPage + " / " + countPage + " - Toplam Rezervasyon: " + allPastReservation.getData().totalCount());

                System.out.println();
                System.out.println("1 - Önceki Sayfa");
                System.out.println("2 - Sonraki Sayfa");
                System.out.println("0 - Bir Üst Menü");
                System.out.print("Seçiminiz: ");
                String choice = scanner.nextLine();
                switch (choice) {
                    case "1":
                        if (currentPage != 1) {
                            currentPage--;
                            offset -= limit;
                        }
                        break;
                    case "2":
                        if (currentPage != countPage) {
                            currentPage++;
                            offset += limit;
                        }
                        break;
                    case "0":
                        return;
                    default:
                        CustomPrint.printRed("Hatalı veri girişi yaptınız!");
                        break;
                }
            }
        }
    }

    private static void activeReservationList(Scanner scanner) {
        int offset = 0;
        final int limit = 2;
        int currentPage = 1;
        while (true){
            ReservationController reservationController = new ReservationController();
            ResponseEntity<GetAllReservationPaginationDto> allActiveById =
                    reservationController.getAllActiveById(offset, limit, UserSession.getId());

            if (allActiveById.getData()==null || allActiveById.getData().reservations()==null){
                CustomPrint.printRed(allActiveById.getMessage());
                return;
            }
            if (allActiveById.getData().reservations().isEmpty()){
                CustomPrint.printGreen("Eşleşen Veri Bulunamadı!");
                return;
            }

            for (ReservationPersistenceDto reservation : allActiveById.getData().reservations()){
                System.out.println("ID: " + reservation.id() + " - Başlangıç Tarihi: " + reservation.startDate() + " - Bitiş Tarihi: " + reservation.finishDate() + " - Durumu: " + reservation.status());
            }
            if (allActiveById.getData().totalCount() == 0) {
                return;
            } else {
                int countPage = (int) Math.ceil((double) allActiveById.getData().totalCount() / limit);
                System.out.println();


                CustomPrint.printBlue("Sayfa: " + currentPage + " / " + countPage + " - Toplam Rezervasyon: " + allActiveById.getData().totalCount());

                System.out.println();
                System.out.println("1 - Önceki Sayfa");
                System.out.println("2 - Sonraki Sayfa");
                System.out.println("0 - Bir Üst Menü");
                System.out.print("Seçiminiz: ");
                String choice = scanner.nextLine();
                switch (choice) {
                    case "1":
                        if (currentPage != 1) {
                            currentPage--;
                            offset -= limit;
                        }
                        break;
                    case "2":
                        if (currentPage != countPage) {
                            currentPage++;
                            offset += limit;
                        }
                        break;
                    case "0":
                        return;
                    default:
                        CustomPrint.printRed("Hatalı veri girişi yaptınız!");
                        break;
                }
            }

        }




    }
}
