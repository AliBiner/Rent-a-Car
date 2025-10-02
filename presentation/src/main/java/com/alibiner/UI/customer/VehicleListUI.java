package com.alibiner.UI.customer;

import com.alibiner.UI.UserSession;
import com.alibiner.UI.util.CustomPrint;
import com.alibiner.controller.BrandController;
import com.alibiner.controller.ModelController;
import com.alibiner.controller.ReservationController;
import com.alibiner.controller.VehicleController;
import com.alibiner.enums.reservation.PaymentType;
import com.alibiner.enums.vehicle.VehicleType;
import com.alibiner.repositoryDto.response.brand.BrandPersistenceDto;
import com.alibiner.repositoryDto.response.model.ModelResponsePersistenceDto;
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

            CustomPrint.printBlue("Sayfa: " + currentPage + " / " + countPage + " - Toplam Araç: " + result.getData().totalCount());

            System.out.println();
            System.out.println("1 - Önceki Sayfa");
            System.out.println("2 - Sonraki Sayfa");
            System.out.println("3 - Araç Kiralama");
            System.out.println("4 - Markaya göre listeleme");
            System.out.println("5 - Değere göre listeleme");
            System.out.println("6 - Araç Tipine göre listeleme");
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
                    break;
                case "4":
                    brandList(scanner);
                    break;
                case "5":
                    priceList(scanner);
                    break;
                case "6":
                    vehicleTypeList(scanner);
                    break;
                case "0":
                    return;
                default:
                    CustomPrint.printRed("Hatalı veri girişi yaptınız!");
                    break;
            }
        }

    }

    private static void vehicleTypeList(Scanner scanner) {

         while (true){
            System.out.println();
            System.out.println("===========Araç Tipine Göre Filtreleme =============");
            System.out.println();

             System.out.println("1 - Otomobil");
             System.out.println("2 - Helikopter");
             System.out.println("3 - Motosiklet");
             System.out.print("Araç Tipi Seçiniz*:");
             String vehicleTypeInput = scanner.nextLine();
             VehicleType vehicleType = null;
             switch (vehicleTypeInput){
                 case "1":
                     vehicleType = VehicleType.CAR;
                     break;
                 case "2":
                     vehicleType = VehicleType.HELICOPTER;
                     break;
                 case "3":
                     vehicleType = VehicleType.MOTORCYCLE;
                     break;
                 default:
                     CustomPrint.printRed("Hatalı Veri Girişi!");
                     continue;
             }


             int offset = 0;
             final int limit = 1;
             int currentPage = 1;
             here:while (true){

                VehicleController vehicleController = new VehicleController();

                ResponseEntity<GetAllVehicleResponseServiceDto> vehiclesByBrand = vehicleController.getAll(offset, limit, vehicleType);


                if (vehiclesByBrand.getData()==null){
                    CustomPrint.printRed(vehiclesByBrand.getMessage());
                    return;
                }
                else {

                    while (true){

                        for (VehicleResponseServiceDto vehicle : vehiclesByBrand.getData().dto()){
                            CustomPrint.printBlue(vehicle.toString());
                        }

                        if (vehiclesByBrand.getData().totalCount()==0){
                            CustomPrint.printRed("Eşleşen veri bulunamadı!");
                            return;
                        }else {
                            int countPage = (int) Math.ceil((double) vehiclesByBrand.getData().totalCount() / limit);
                            System.out.println();


                            CustomPrint.printBlue("Sayfa: " + currentPage + " / " + countPage + " - Toplam Araç: " + vehiclesByBrand.getData().totalCount());

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
                                    continue here;
                                case "2":
                                    if (currentPage!=countPage){
                                        currentPage++;
                                        offset += limit;
                                    }
                                    continue here;
                                case "3":
                                    rentVehicle(scanner);
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
                return;
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
            float amount = 0.00f;
            while (true){
                ReservationCreateServiceDto reservationRequest = new ReservationCreateServiceDto(
                        UserSession.getId(),
                        id,
                        startDate,
                        finishDate,
                        amount,
                        PaymentType.CREDIT_CART
                );

                ReservationController reservationController = new ReservationController();
                ResponseEntity<Boolean> response = reservationController.postReservation(reservationRequest);
                if (response.getData()==null || response.getData() == false){

                    if (response.getMessage().contains("Bu araç için deposit ödenmesi gerekmektedir!")
                            || response.getMessage().contains("Ödenen tutar deposit tutarından az olamaz!")
                            || response.getMessage().contains("Ödenen miktar toplam tutardan fazla olamaz!")){
                        CustomPrint.printRed(response.getMessage());
                        float tmp = 0;
                        while (amount==0.00f || tmp == 0){
                            try{
                                System.out.print("Deposit*: ");
                                amount = scanner.nextFloat();
                                scanner.nextLine(); //clear scanner
                                tmp = 1;
                            }catch (Exception e){
                                CustomPrint.printRed("Hatalı veri girişi!");
                            }
                        }
                        continue;
                    }

                    CustomPrint.printRed(response.getMessage());
                    return;
                }
                else {
                    CustomPrint.printGreen(response.getMessage());
                    return;
                }
            }

        }
    }



    private static void brandList(Scanner scanner){

         while (true){
            System.out.println();
            System.out.println("===========Markalara Göre Filtreleme =============");
            System.out.println();

            BrandController brandController = new BrandController();
            ResponseEntity<List<BrandPersistenceDto>> brands = brandController.getAll();

            if (brands.getData()== null){
                CustomPrint.printRed(brands.getMessage());
                return;
            }else if (brands.getData().isEmpty()) {
                CustomPrint.printGreen("Eşleşen Veri Bulunamadı!");
                return;
            }

            for (BrandPersistenceDto brand : brands.getData()){
                CustomPrint.printBlue(brand.toString());
            }

            int brandId = 0;
            while (brandId == 0){
                try{
                    System.out.print("Aramak istediğiniz markanın id'sini giriniz: ");
                    brandId = scanner.nextInt();
                    scanner.nextLine(); //clear scanner
                }catch (Exception e){
                    CustomPrint.printRed("Hatalı veri girişi yaptınız!");
                }
            }

            ModelController modelController = new ModelController();
            ResponseEntity<List<ModelResponsePersistenceDto>> allModelByBrandId = modelController.getAllByBrandId(brandId);

            if (allModelByBrandId.getData() == null){
                CustomPrint.printRed(allModelByBrandId.getMessage());
                return;
            } else if (allModelByBrandId.getData().isEmpty()) {
                CustomPrint.printGreen("Eşleşen Veri Bulunamadı!");
                return;
            }

            for (ModelResponsePersistenceDto model : allModelByBrandId.getData()){
                CustomPrint.printBlue(model.toString());
            }

            int modelId = 0;
            while (modelId == 0){
                try{
                    System.out.print("Aramak istediğiniz modelin id'sini giriniz: ");
                    modelId = scanner.nextInt();
                    scanner.nextLine(); //clear scanner
                }catch (Exception e){
                    CustomPrint.printRed("Hatalı veri girişi yaptınız!");
                }
            }

            int offset = 0;
            final int limit = 1;
            int currentPage = 1;
            here: while (true){
                VehicleController vehicleController = new VehicleController();

                ResponseEntity<GetAllVehicleResponseServiceDto> vehiclesByBrand = vehicleController.getAll(offset, limit, modelId);


                if (vehiclesByBrand.getData()==null){
                    CustomPrint.printRed(vehiclesByBrand.getMessage());
                    return;
                }
                else {

                    while (true){

                        for (VehicleResponseServiceDto vehicle : vehiclesByBrand.getData().dto()){
                            CustomPrint.printBlue(vehicle.toString());
                        }

                        if (vehiclesByBrand.getData().totalCount()==0){
                            CustomPrint.printRed("Eşleşen veri bulunamadı!");
                            return;
                        }else {
                            int countPage = (int) Math.ceil((double) vehiclesByBrand.getData().totalCount() / limit);
                            System.out.println();


                            CustomPrint.printBlue("Sayfa: " + currentPage + " / " + countPage + " - Toplam Araç: " + vehiclesByBrand.getData().totalCount());

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
                                    continue here;
                                case "2":
                                    if (currentPage!=countPage){
                                        currentPage++;
                                        offset += limit;
                                    }
                                    continue here;
                                case "3":
                                    rentVehicle(scanner);
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



            }
        }

    private static void priceList(Scanner scanner){


        System.out.println();
        System.out.println("===========Fiyata Göre Filtreleme =============");
        System.out.println();

        System.out.print("Min Fiyat:");
        float minPrice = -1.00f;
        while (minPrice==-1.00f){
            try{
                minPrice = scanner.nextFloat();
                scanner.nextLine(); //clear scanner
            }catch (Exception e){
                CustomPrint.printRed("Hatalı veri girişi!");
            }
        }

        System.out.print("Max Fiyat:");
        float maxPrice = -1.00f;
        while (maxPrice==-1.00f){
            try{
                maxPrice = scanner.nextFloat();
                scanner.nextLine(); //clear scanner
            }catch (Exception e){
                CustomPrint.printRed("Hatalı veri girişi!");
            }
        }

        int offset = 0;
        final int limit = 2;
        int currentPage = 1;
        here : while (true){

            VehicleController vehicleController = new VehicleController();
            ResponseEntity<GetAllVehicleResponseServiceDto> vehiclesByPrice = vehicleController.getAll(offset, limit,
                    minPrice, maxPrice);

            if (vehiclesByPrice.getData() == null){
                CustomPrint.printRed(vehiclesByPrice.getMessage());
            }
            else {

                for (VehicleResponseServiceDto vehicle : vehiclesByPrice.getData().dto()){
                    CustomPrint.printBlue(vehicle.toString());
                }

                while (true){

                    if (vehiclesByPrice.getData().totalCount()==0){
                        CustomPrint.printRed("Eşleşen veri bulunamadı!");
                        return;
                    }else {
                        int countPage = (int) Math.ceil((double) vehiclesByPrice.getData().totalCount() / limit);
                        System.out.println();

                        CustomPrint.printBlue("Sayfa: " + currentPage + " / " + countPage + " - Toplam Araç: " + vehiclesByPrice.getData().totalCount());

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
                                continue here;
                            case "2":
                                if (currentPage!=countPage){
                                    currentPage++;
                                    offset += limit;
                                }
                                continue here;
                            case "3":
                                rentVehicle(scanner);
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
    }
}



