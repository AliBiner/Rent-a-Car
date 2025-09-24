package com.alibiner.UI.car;

import com.alibiner.UI.UserSession;
import com.alibiner.UI.components.UpdateFieldComponent;
import com.alibiner.UI.util.CustomPrint;
import com.alibiner.controller.CarController;
import com.alibiner.dto.request.vehicle.car.CarUpdateRequestDto;
import com.alibiner.dto.response.ResponseDto;
import com.alibiner.dto.response.vehicle.IVehicleResponseDto;
import com.alibiner.dto.response.vehicle.car.AdminGetCarResponseDto;
import com.alibiner.enums.Role;
import com.alibiner.enums.car.MachineType;

import java.util.*;
import java.util.Scanner;

public class CarListUI {
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
            System.out.println("==============Otomobil İşlemleri===============");
            System.out.println();
            System.out.println("1 - Otomobil Listeleme");
            System.out.println("0 - Bir Üst Menü");
            System.out.print("Seçiminiz: ");
            String choice = scanner.nextLine();
            switch (choice){
                case "1":
                    listCar();
                    break;
                case "0":
                    return;
                default:
                    CustomPrint.printRed("Hatalı veri girişi yaptınız!");
                    break;
            }

            detailOptions(scanner);
        }
    }

    private static void listCar(){
        CarController carController = new CarController();
        ResponseDto responseDto = carController.getAll(UserSession.getId());
        if (!responseDto.isSuccess())
            CustomPrint.printRed(responseDto.getMessage());
        else {
            List<IVehicleResponseDto> carList = (List<IVehicleResponseDto>) responseDto.getBody();
            for (IVehicleResponseDto dto : carList){
                AdminGetCarResponseDto car = (AdminGetCarResponseDto) dto;
                System.out.println(car);
            }
        }
    }

    private static void detailOptions(Scanner scanner){
        System.out.println();
        System.out.println("1 - Otomobil Güncelleme");
        System.out.println("2 - Otomobil Silme");
        System.out.println("0 - Bir Üst Menü");
        System.out.print("Seçiminiz: ");
        String choice = scanner.nextLine();
        switch (choice){
            case "1":
                updateCarUI(scanner);
                break;
            case "2":
                deleteCarUI(scanner);
                break;
            case "0":
                return;
            default:
                CustomPrint.printRed("Hatalı veri girişi yaptınız!");
                break;
        }
    }

    private static void updateCarUI(Scanner scanner){
        System.out.println();
        System.out.print("Güncellemek istediğiniz otomobilin id'sini giriniz: ");
        int id = 0;
        while (id == 0){
            try {
                id = scanner.nextInt();
                scanner.nextLine(); // scanner clear
            }catch (Exception e){
                CustomPrint.printRed("Hatalı veri girişi yaptınız!");
            }
        }

        CarController carController = new CarController();
        ResponseDto dto = carController.getById(id);
        if (!dto.isSuccess())
            CustomPrint.printRed(dto.getMessage());
        else {
            if (dto.getBody() instanceof AdminGetCarResponseDto){
                AdminGetCarResponseDto result = (AdminGetCarResponseDto) dto.getBody();
                System.out.println("id (" + result.getId() + ")");
                String brand = UpdateFieldComponent.updateString("Marka", result.getBrand());
                String model = UpdateFieldComponent.updateString("Model", result.getModel());
                int doorCount = UpdateFieldComponent.updateInt("Kapı sayısı",result.getDoorCount());
                String productionYear = UpdateFieldComponent.updateString("Üretim Yılı", result.getProductionYear());
                MachineType machineType = UpdateFieldComponent.updateMachineType("Motor Tipi",result.getMachineType());

                CarUpdateRequestDto requestDto = new CarUpdateRequestDto(result.getId(), brand,model,doorCount,machineType,productionYear,UserSession.getId());

                ResponseDto responseDto = carController.updateCar(requestDto);
                if (!responseDto.isSuccess())
                    CustomPrint.printRed(responseDto.getMessage());
                else
                    CustomPrint.printGreen(responseDto.getMessage());

            }
        }
    }

    private static void deleteCarUI(Scanner scanner){
        System.out.println();
        System.out.print("Silmek istediğiniz otombilin id'sini giriniz: ");
        String input = scanner.nextLine();
        if (input.isBlank()){
            CustomPrint.printRed("Id bilgisini boş geçemezsiniz!");

        }else {
            try {
                int id = Integer.parseInt(input);
                CarController carController = new CarController();
                ResponseDto result = carController.delete(id,UserSession.getId());
                if (!result.isSuccess())
                    CustomPrint.printRed(result.getMessage());
                else
                    CustomPrint.printGreen(result.getMessage());
            } catch (Exception e) {
                CustomPrint.printRed("Hatalı veri girişi!");
            }
        }

    }
}
