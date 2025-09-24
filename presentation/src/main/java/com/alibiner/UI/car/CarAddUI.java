package com.alibiner.UI.car;

import com.alibiner.UI.UserSession;
import com.alibiner.UI.util.CustomPrint;
import com.alibiner.controller.CarController;
import com.alibiner.dto.request.vehicle.car.CarAddRequestDTO;
import com.alibiner.dto.response.ResponseDto;
import com.alibiner.enums.Role;
import com.alibiner.enums.car.MachineType;
import com.alibiner.enums.errorMessages.ErrorCode;

import java.util.ArrayList;
import java.util.Scanner;

public class CarAddUI {
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
            System.out.println("============Otomobil Ekleme Ekranı=============");
            System.out.println();

            System.out.println("1 - Otomobil Ekleme");
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

        int doorCount = 0;
        while (doorCount == 0){
           try{
               System.out.print("Kapı Sayısı*:");
               doorCount = scanner.nextInt();
               scanner.nextLine(); //clear scanner
           }catch (Exception e){
               CustomPrint.printRed("Hatalı veri girişi yaptınız!");
           }
        }

        MachineType machineType = null;
        while (machineType == null){
            System.out.println("1 - Dizel");
            System.out.println("2 - Elektrik");
            System.out.println("3 - Benzin");
            System.out.print("Seçiminiz*: ");
            String choice = scanner.nextLine();

            switch (choice){
                case "1":
                    machineType = MachineType.DIZEL;
                    break;
                case "2":
                    machineType = MachineType.ELECTRIC;
                    break;
                case "3":
                    machineType = MachineType.FUEL;
                    break;
                default:
                    CustomPrint.printRed("Hatalı veri girişi yaptınız!");
                    break;

            }
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

        CarAddRequestDTO dto = new CarAddRequestDTO(brand,model,doorCount,machineType,productionYear,UserSession.getId());
        CarController carController = new CarController();

        ResponseDto responseDto = carController.addCar(dto);

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
