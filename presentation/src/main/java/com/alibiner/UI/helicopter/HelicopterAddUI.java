package com.alibiner.UI.helicopter;

import com.alibiner.UI.UserSession;
import com.alibiner.UI.util.CustomPrint;
import com.alibiner.controller.CarController;
import com.alibiner.controller.HelicopterController;
import com.alibiner.dto.request.vehicle.car.CarAddRequestDTO;
import com.alibiner.dto.request.vehicle.helicopter.HelicopterAddRequestDto;
import com.alibiner.dto.response.ResponseDto;
import com.alibiner.enums.Role;
import com.alibiner.enums.car.MachineType;
import com.alibiner.enums.errorMessages.ErrorCode;

import java.util.ArrayList;
import java.util.Scanner;

public class HelicopterAddUI {
    public static void view(Scanner scanner){
        while (true){
            if (UserSession.isEmpty()){
                CustomPrint.printRed("Lütfen giriş yapınız!");
                return;
            } else if (!UserSession.getRole().equals(Role.ADMIN)) {
                CustomPrint.printRed("Bu sayfaya erişim yetkiniz bulunmamaktadır!");
                return;
            }

            System.out.println();
            System.out.println("============Helikopter Ekleme Ekranı=============");
            System.out.println();

            System.out.println("1 - Helikopter Ekleme");
            System.out.println("0 - Bir Üst Menü");
            System.out.print("Seçiminiz: ");
            String choice = scanner.nextLine();
            switch (choice){
                case "1":
                    addCarView(scanner);
                    break;
                case "0":
                    return;
                default:
                    CustomPrint.printRed("Hatalı veri girişi yaptınız!");
                    break;
            }
        }
    }

    private static void addCarView(Scanner scanner){
        //Todo - Araç Ekleme işlemleri yapılacak.
        System.out.println();

        System.out.print("Marka*:");
        String brand = scanner.nextLine();
        while (brand.isBlank() ){
            CustomPrint.printRed("Marka bilgisi boş olamaz!");
            System.out.print("Marka*:");
            brand = scanner.nextLine();
        }


        System.out.print("Model*:");
        String model = scanner.nextLine();
        while (brand.isBlank() ){
            CustomPrint.printRed("Model bilgisi boş olamaz!");
            System.out.print("Model*:");
            brand = scanner.nextLine();
        }

        System.out.print("Üretim Yılı*: ");
        String productionYear = scanner.next();
        scanner.nextLine(); // clear scanner
        while (productionYear.isBlank()){
            CustomPrint.printRed("Üretim yılı bilgisi boş olamaz!");
            System.out.print("Üretim Yılı*: ");
            productionYear = scanner.next();
            scanner.nextLine(); // clear scanner
        }


        int maxRange = 0;
        while (maxRange == 0){
           try{
               System.out.print("Maksimum uçuş mesafesi*:");
               maxRange = scanner.nextInt();
               scanner.nextLine(); //clear scanner
           }catch (Exception e){
               CustomPrint.printRed("Hatalı veri girişi yaptınız!");
           }
        }

        int wingCount = 0;
        while (wingCount == 0){
            try{
                System.out.print("Kanat Sayısı*:");
                wingCount = scanner.nextInt();
                scanner.nextLine(); //clear scanner
            }catch (Exception e){
                CustomPrint.printRed("Hatalı veri girişi yaptınız!");
            }
        }


        int passengerCount = 0;
        while (passengerCount == 0){
            try{
                System.out.print("Yolcu Sayısı*:");
                passengerCount = scanner.nextInt();
                scanner.nextLine(); //clear scanner
            }catch (Exception e){
                CustomPrint.printRed("Hatalı veri girişi yaptınız!");
            }
        }

        int pilotCount = 0;
        while (pilotCount == 0){
            try{
                System.out.print("Pilot Sayısı*:");
                pilotCount = scanner.nextInt();
                scanner.nextLine(); //clear scanner
            }catch (Exception e){
                CustomPrint.printRed("Hatalı veri girişi yaptınız!");
            }
        }

        HelicopterAddRequestDto dto = new HelicopterAddRequestDto(brand,model,productionYear,maxRange,wingCount,passengerCount,pilotCount,UserSession.getId());


        HelicopterController controller = new HelicopterController();
        ResponseDto responseDto = controller.addHelicopter(dto);

        if (!responseDto.isSuccess() && responseDto.getStatusCode().equals(ErrorCode.VALIDATION.getCode())){
            if (responseDto.getBody() instanceof ArrayList<?>){
                ArrayList<String> errorMessages = (ArrayList<String>) responseDto.getBody();
                for (String message : errorMessages){
                    CustomPrint.printRed(message);
                }
            }
        } else if (!responseDto.isSuccess()) {
            CustomPrint.printRed(responseDto.getMessage());
        }else {
            CustomPrint.printGreen(responseDto.getMessage());
        }
    }
}
