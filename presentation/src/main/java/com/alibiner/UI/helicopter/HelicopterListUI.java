package com.alibiner.UI.helicopter;

import com.alibiner.UI.UserSession;
import com.alibiner.UI.components.UpdateFieldComponent;
import com.alibiner.UI.util.CustomPrint;
import com.alibiner.controller.CarController;
import com.alibiner.controller.HelicopterController;
import com.alibiner.dto.request.vehicle.car.CarUpdateRequestDto;
import com.alibiner.dto.request.vehicle.helicopter.HelicopterUpdateRequestDto;
import com.alibiner.dto.response.ResponseDto;
import com.alibiner.dto.response.vehicle.IVehicleResponseDto;
import com.alibiner.dto.response.vehicle.car.AdminGetCarResponseDto;
import com.alibiner.dto.response.vehicle.helicopter.AdminGetHelicopterResponseDto;
import com.alibiner.enums.Role;
import com.alibiner.enums.car.MachineType;

import java.util.List;
import java.util.Scanner;

public class HelicopterListUI {
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
            System.out.println("==============Helikopter İşlemleri===============");
            System.out.println();
            System.out.println("1 - Helikopter Listeleme");
            System.out.println("0 - Bir Üst Menü");
            System.out.print("Seçiminiz: ");
            String choice = scanner.nextLine();
            switch (choice){
                case "1":
                    list();
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

    private static void list(){
        HelicopterController controller = new HelicopterController();
        ResponseDto responseDto = controller.getAll(UserSession.getId());
        if (!responseDto.isSuccess())
            CustomPrint.printRed(responseDto.getMessage());
        else {
            List<IVehicleResponseDto> helicopterList = (List<IVehicleResponseDto>) responseDto.getBody();
            for (IVehicleResponseDto dto : helicopterList){
                AdminGetHelicopterResponseDto helicopter = (AdminGetHelicopterResponseDto) dto;
                CustomPrint.printBlue(helicopter.toString());
            }
        }
    }

    private static void detailOptions(Scanner scanner){
        System.out.println();
        System.out.println("1 - Helikopter Güncelleme");
        System.out.println("2 - Helikopter Silme");
        System.out.println("0 - Bir Üst Menü");
        System.out.print("Seçiminiz: ");
        String choice = scanner.nextLine();
        switch (choice){
            case "1":
                updateUI(scanner);
                break;
            case "2":
                deleteUI(scanner);
                break;
            case "0":
                return;
            default:
                CustomPrint.printRed("Hatalı veri girişi yaptınız!");
                break;
        }
    }

    private static void updateUI(Scanner scanner){
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

        HelicopterController controller = new HelicopterController();
        ResponseDto dto = controller.getById(id);
        if (!dto.isSuccess())
            CustomPrint.printRed(dto.getMessage());
        else {
            if (dto.getBody() instanceof AdminGetHelicopterResponseDto){
                AdminGetHelicopterResponseDto result = (AdminGetHelicopterResponseDto) dto.getBody();


                System.out.println("id (" + result.id() + ")");
                String brand = UpdateFieldComponent.updateString("Marka", result.brand());
                String model = UpdateFieldComponent.updateString("Model", result.model());
                String productionYear = UpdateFieldComponent.updateString("Üretim Yılı", result.productionYear());
                int maxRange = UpdateFieldComponent.updateInt("Maksimum Mesafe",result.maxRange());
                int wingCount = UpdateFieldComponent.updateInt("Kanat Sayısı",result.wingCount());
                int passengerCount = UpdateFieldComponent.updateInt("Yolcu Sayısı",result.passengerCount());
                int pilotCount = UpdateFieldComponent.updateInt("Pilot Sayısı",result.pilotCount());


                HelicopterUpdateRequestDto requestDto = new HelicopterUpdateRequestDto(
                        result.id(),
                        brand,
                        model,
                        maxRange,
                        wingCount,
                        passengerCount,
                        pilotCount,
                        productionYear,
                        UserSession.getId());

                ResponseDto responseDto = controller.update(requestDto);
                if (!responseDto.isSuccess())
                    CustomPrint.printRed(responseDto.getMessage());
                else
                    CustomPrint.printGreen(responseDto.getMessage());

            }
        }
    }

    private static void deleteUI(Scanner scanner){
        System.out.println();
        System.out.print("Silmek istediğiniz otombilin id'sini giriniz: ");
        String input = scanner.nextLine();
        if (input.isBlank()){
            CustomPrint.printRed("Id bilgisini boş geçemezsiniz!");

        }else {
            try {
                int id = Integer.parseInt(input);
                HelicopterController controller = new HelicopterController();
                ResponseDto result = controller.delete(id,UserSession.getId());
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
