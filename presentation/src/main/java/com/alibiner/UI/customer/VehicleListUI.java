package com.alibiner.UI.customer;

import com.alibiner.UI.UserSession;
import com.alibiner.UI.util.CustomPrint;
import com.alibiner.controller.ReservationController;
import com.alibiner.controller.VehicleController;
import com.alibiner.enums.reservation.PaymentType;
import com.alibiner.serviceDto.request.reservation.ReservationCreateServiceDto;
import com.alibiner.serviceDto.response.vehicle.GetAllVehicleResponseServiceDto;
import com.alibiner.serviceDto.response.vehicle.VehicleDetailServiceDto;
import com.alibiner.serviceDto.response.vehicle.VehicleResponseServiceDto;
import com.alibiner.util.ResponseEntity;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.Scanner;

public class VehicleListUI {

    public static void view(Scanner scanner){
        while (true){
            System.out.println();
            System.out.println("1 - Araç Listesi");
            System.out.println("0 - Bir Üst Menü");
            System.out.print("Seçiminiz: ");
            String choice = scanner.nextLine();
            switch (choice){
                case "1":
                    vehicleList(scanner);
                    break;
                case "0":
                    return;
                default:
                    CustomPrint.printRed("Hatalı veri girişi yaptınız!");
                    break;
            }
        }

    }


    private static void vehicleList(Scanner scanner){
        int offset = 0;
        final int limit = 2;
        int currentPage = 1;
        while (true){
            System.out.println();
            System.out.println("==============Tüm Otomobillerin Listesi============");
            System.out.println();

            VehicleController vehicleController = new VehicleController();
            ResponseEntity<GetAllVehicleResponseServiceDto> result = vehicleController.getAll(offset, limit);

            if (result.getData()==null || result.getData().dto().isEmpty()){
                CustomPrint.printRed("Eşleşen veri bulunamadı!");
                return;
            }

            List<VehicleResponseServiceDto> vehicles = result.getData().dto();
            for (VehicleResponseServiceDto vehicle : vehicles)
                CustomPrint.printBlue(vehicle.toString());

            int countPage = (int) Math.ceil((double) result.getData().totalCount() / limit);
            System.out.println();

            CustomPrint.printBlue("Sayfa: " + currentPage + " / " + countPage);

            System.out.println();
            System.out.println("1 - Önceki Sayfa");
            System.out.println("2 - Sonraki Sayfa");
            System.out.println("3 - Araç Kiralama");
            System.out.println("0 - Bir Üst Menü");
            System.out.print("Seçiminiz: ");
            String choice = scanner.nextLine();
            switch (choice){
                case "1":
                    if (currentPage!=1){
                        currentPage--;
                        offset -= limit;
                    }
                    break;
                case "2":
                    if (currentPage!=countPage){
                        currentPage++;
                        offset += limit;
                    }
                    break;
                case "3":
                    rentVehicle(scanner);
                case "0":
                    return;
                default:
                    CustomPrint.printRed("Hatalı veri girişi yaptınız!");
                    break;
            }
        }

    }

    private static void rentVehicle(Scanner scanner) {

            System.out.println();
            System.out.println("========Araç Kiralama Ekranı==========");
            System.out.println();

            System.out.println("Kiralamak istediğiniz aracın id'sini giriniz.");
            int id = 0;
            while (id == 0){
                try{
                    System.out.print("Id*:");
                    id = Integer.parseInt(scanner.nextLine());
                }catch (Exception e){
                    CustomPrint.printRed("Id boş ve ya 0 olamaz!");
                }
            }

            VehicleController vehicleController = new VehicleController();
            ResponseEntity<VehicleDetailServiceDto> detailById = vehicleController.getDetailById(id);

            if (detailById.getData()==null){
                CustomPrint.printRed( id + " ile eşleşen veri bulunamadı!");
            }else {
                CustomPrint.printBlue(detailById.getData().toString());

                System.out.println();
                System.out.println("1 - " + id + " nolu aracı kiralama");
                System.out.println("0 - Bir Üst Menü");
                String choice = scanner.nextLine();
                switch (choice){
                    case "1":
                        choiceDate(id,scanner);
                        break;
                    case "0":
                        return;
                    default:
                        CustomPrint.printRed("Hatalı Veri Girişi!");
                        break;
                }
            }
    }

    private static void choiceDate(int id, Scanner scanner){
        while (true){
            LocalDateTime startDate = null;
            while (startDate == null){
                try {
                    System.out.println();
                    System.out.print("Rezervasyon Başlama Tarihi (yyyy-MM-dd HH:mm): ");
                    String startDateString = scanner.nextLine();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
                    startDate = LocalDateTime.parse(startDateString, formatter);
                }catch (Exception e){
                    CustomPrint.printRed("Hatalı Veri Girişi!");
                }
            }

            LocalDateTime finishDate = null;
            while (finishDate == null){
                try {
                    System.out.println();
                    System.out.print("Rezervasyon Bitiş Tarihi (yyyy-MM-dd HH:mm): ");
                    String startDateString = scanner.nextLine();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
                    finishDate = LocalDateTime.parse(startDateString, formatter);
                }catch (Exception e){
                    CustomPrint.printRed("Hatalı Veri Girişi!");
                }
            }

            ReservationCreateServiceDto reservationRequest = new ReservationCreateServiceDto(
                    UserSession.getId(),
                    id,
                    startDate,
                    finishDate,
                    0,
                    PaymentType.CREDIT_CART
            );

            ReservationController reservationController = new ReservationController();
            ResponseEntity<Boolean> response = reservationController.postReservation(reservationRequest);
            if (response.getData()==null || response.getData() == false){
                CustomPrint.printRed(response.getMessage());
            }
            else {
                CustomPrint.printGreen(response.getMessage());
                return;
            }
        }
    }


//    private static void carDetail(Scanner scanner) {
//        System.out.println();
//        System.out.println("===============Otomobil Detay Sayfası=============");
//        System.out.println();
//        System.out.print("Detayını görmek istediğiniz aracın id'sini giriniz: ");
//        int id = 0;
//        while (id==0){
//            try {
//                id = scanner.nextInt();
//                scanner.nextLine(); // clear scanner
//            } catch (Exception e) {
//                System.out.println("Hatalı veri girişi!");
//            }
//        }
//
//        CarController controller = new CarController();
//        ResponseDto responseDto = controller.getByIdForCustomer(id);
//        if (!responseDto.isSuccess())
//            CustomPrint.printRed(responseDto.getMessage());
//        else {
//            CarDetailDto carDetailDto = (CarDetailDto) responseDto.getBody();
//            CustomPrint.printBlue(carDetailDto.toString());
//            System.out.println();
//            System.out.println("1 - Saatlik Kiralama");
//            System.out.println("2 - Günlük Kiralama");
//            System.out.println("3 - Haftalık Kiralama");
//            System.out.println("4 - Aylık Kiralama");
//            System.out.println("0 - Bir Üst Menü");
//            String choice = scanner.nextLine();
//            switch (choice){
//                case "1":
//                    carRentHourly(scanner);
//                    break;
//            }
//        }
//    }
//
//    private static void carRentHourly(Scanner scanner) {
//        System.out.println();
//        System.out.println("============Saatlik Kiralama İşlemleri===========");
//        System.out.println();
//        int hour = 0;
//        while (hour==0){
//            System.out.println("Kaç saat kiralamak istersiniz: ");
//            try {
//                hour = scanner.nextInt();
//            } catch (Exception e) {
//                CustomPrint.printRed("Hatalı Veri Girişi!");
//            }
//        }
//
//
//
//    }
//
//
//    private static void carBrandList(Scanner scanner){
//        int offset = 0;
//        final int limit = 1;
//        int currentPage = 0;
//        while (true){
//            System.out.println();
//            System.out.println("===========Markalara Göre Filtreleme =============");
//            System.out.println();
//
//            CarController controller = new CarController();
//            ResponseDto responseDto = controller.getDistinctBrand();
//            if (!responseDto.isSuccess()){
//                CustomPrint.printRed(responseDto.getMessage());
//            }
//            else {
//                List<String> brands = (List<String>) responseDto.getBody();
//                for (String brand : brands){
//                    CustomPrint.printBlue(brand);
//                }
//
//                System.out.println();
//                System.out.print("Arama yapmak istediğiniz markayı giriniz: ");
//                String brand = scanner.nextLine().trim();
//
//                ResponseDto getAllBrandDto = controller.getAllRentable(offset,limit,brand);
//                if (!getAllBrandDto.isSuccess()){
//                    CustomPrint.printRed(getAllBrandDto.getMessage());
//                }else {
//                    while (true){
//                        List<CarDto> carDtoList = (List<CarDto>) getAllBrandDto.getBody();
//                        for (CarDto carDto : carDtoList){
//                            CustomPrint.printBlue(carDto.toString());
//                        }
//
//                        ResponseDto pagination = controller.getCountRentable(brand);
//                        System.out.println();
//
//                        int countPage = (int) pagination.getBody() / limit -1;
//                        if (countPage==-1){
//                            CustomPrint.printRed("Eşleşen Veri Bulunamadı!");
//                            return;
//                        }
//                        else{
//                            CustomPrint.printBlue("Sayfa: " + currentPage + " / " + countPage);
//
//                            System.out.println();
//                            System.out.println("1 - Önceki Sayfa");
//                            System.out.println("2 - Sonraki Sayfa");
//                            System.out.println("0 - Bir Üst Menü");
//                            System.out.print("Seçiminiz: ");
//                            String choice = scanner.nextLine();
//                            switch (choice){
//                                case "1":
//                                    if (currentPage!=0){
//                                        currentPage--;
//                                        offset -= limit;
//                                    }
//                                    break;
//                                case "2":
//                                    if (currentPage!=countPage){
//                                        currentPage++;
//                                        offset += limit;
//                                    }
//                                    break;
//                                case "0":
//                                    return;
//                                default:
//                                    CustomPrint.printRed("Hatalı veri girişi yaptınız!");
//                                    break;
//                            }
//                        }
//
//                    }
//
//                }
//            }
//        }
//    }
//
//    private static void carPriceList(Scanner scanner){
//        int offset = 0;
//        final int limit = 1;
//        int currentPage = 0;
//
//        System.out.println();
//        System.out.println("===========Fiyata Göre Filtreleme =============");
//        System.out.println();
//
//        System.out.print("Min Fiyat:");
//        float minPrice = -1.00f;
//        while (minPrice==-1.00f){
//            try{
//                minPrice = scanner.nextFloat();
//                scanner.nextLine(); //clear scanner
//            }catch (Exception e){
//                CustomPrint.printRed("Hatalı veri girişi!");
//            }
//        }
//
//        System.out.print("Max Fiyat:");
//        float maxPrice = -1.00f;
//        while (maxPrice==-1.00f){
//            try{
//                maxPrice = scanner.nextFloat();
//                scanner.nextLine(); //clear scanner
//            }catch (Exception e){
//                CustomPrint.printRed("Hatalı veri girişi!");
//            }
//        }
//
//        here : while (true){
//
//            CarController controller = new CarController();
//            ResponseDto responseDto = controller.getAllRentable(offset,limit,minPrice,maxPrice);
//
//            if (!responseDto.isSuccess()){
//                CustomPrint.printRed(responseDto.getMessage());
//            }
//            else {
//                List<CarDto> carDtos = (List<CarDto>) responseDto.getBody();
//                for (CarDto carDto : carDtos){
//                    CustomPrint.printBlue(carDto.toString());
//                }
//
//                while (true){
//                    ResponseDto pagination = controller.getCountRentable(minPrice,maxPrice);
//                    System.out.println();
//
//                    int countPage = (int) pagination.getBody() / limit-1;
//                    if (countPage==-1){
//                        CustomPrint.printRed("Eşleşen Veri Bulunamadı!");
//                        return;
//                    }
//                    else {
//                        CustomPrint.printBlue("Sayfa: " + currentPage + " / " + countPage);
//
//                        System.out.println();
//                        System.out.println("1 - Önceki Sayfa");
//                        System.out.println("2 - Sonraki Sayfa");
//                        System.out.println("0 - Bir Üst Menü");
//                        System.out.print("Seçiminiz: ");
//                        String choice = scanner.nextLine();
//                        switch (choice){
//                            case "1":
//                                if (currentPage!=0){
//                                    currentPage--;
//                                    offset -= limit;
//                                }
//                                continue here;
//                            case "2":
//                                if (currentPage!=countPage){
//                                    currentPage++;
//                                    offset += limit;
//                                }
//                                continue here;
//                            case "0":
//                                return;
//                            default:
//                                CustomPrint.printRed("Hatalı veri girişi yaptınız!");
//                                break;
//                        }
//                    }
//
//                }
//
//            }
//        }
//    }

}
