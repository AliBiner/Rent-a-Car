package com.alibiner.UI.vehicle.admin;

import com.alibiner.UI.UserSession;
import com.alibiner.UI.components.UpdateFieldComponent;
import com.alibiner.UI.util.CustomPrint;
import com.alibiner.controller.VehicleController;
import com.alibiner.enums.Role;
import com.alibiner.enums.car.MachineType;
import com.alibiner.serviceDto.request.vehicle.update.VehicleUpdateServiceDto;
import com.alibiner.serviceDto.response.vehicle.GetAllVehicleResponseServiceDto;
import com.alibiner.serviceDto.response.vehicle.VehicleDetailServiceDto;
import com.alibiner.serviceDto.response.vehicle.VehicleResponseServiceDto;
import com.alibiner.util.ResponseEntity;

import java.util.Scanner;

public class AdminVehicleListUI {
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
            System.out.println("==============Araç İşlemleri===============");
            System.out.println();
            System.out.println("1 - Araç Listeleme");
            System.out.println("0 - Bir Üst Menü");
            System.out.print("Seçiminiz: ");
            String choice = scanner.nextLine();
            switch (choice){
                case "1":
                    listVehicle(scanner);
                    break;
                case "0":
                    return;
                default:
                    CustomPrint.printRed("Hatalı veri girişi yaptınız!");
                    break;
            }

//            detailOptions(scanner);
        }
    }

    private static void listVehicle(Scanner scanner){
        int offset = 0;
        final int limit = 2;
        int currentPage = 1;
        while (true){
            VehicleController vehicleController = new VehicleController();
            ResponseEntity<GetAllVehicleResponseServiceDto> vehicles = vehicleController.getAll(offset, limit);

            if (vehicles.getData()==null){
                CustomPrint.printRed(vehicles.getMessage());
                return;
            }else {
                for (VehicleResponseServiceDto vehicle : vehicles.getData().dto()){
                    CustomPrint.printBlue(vehicle.toString());
                }
                if (vehicles.getData().totalCount()==0){
                    CustomPrint.printRed("Eşleşen veri bulunamadı!");
                    return;
                }else {
                    int countPage = (int) Math.ceil((double) vehicles.getData().totalCount() / limit);
                    System.out.println();


                    CustomPrint.printBlue("Sayfa: " + currentPage + " / " + countPage + " - Toplam Araç: " + vehicles.getData().totalCount());

                    System.out.println();
                    System.out.println("1 - Önceki Sayfa");
                    System.out.println("2 - Sonraki Sayfa");
                    System.out.println("3 - Araç Detayı");
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
                            detailOptions(scanner);
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


    private static void detailOptions(Scanner scanner){
        System.out.println();
        System.out.println("===========Araç Detay Ekranı==========");

        System.out.println();
        System.out.println("1 - Araç Güncelleme");
        System.out.println("2 - Araç Silme");
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


        VehicleController vehicleController = new VehicleController();
        ResponseEntity<VehicleDetailServiceDto> vehicleDetail = vehicleController.getDetailById(id);

        if (vehicleDetail.getData()==null)
            CustomPrint.printRed(vehicleDetail.getMessage());
        else {

            switch (vehicleDetail.getData().vehicleType()){
                case CAR -> carDetailView(vehicleDetail.getData());
                case HELICOPTER -> helicopterDetailView(vehicleDetail.getData());
                case MOTORCYCLE -> motorcycleDetailView(vehicleDetail.getData());
            }

        }
    }

    private static void motorcycleDetailView(VehicleDetailServiceDto dto) {
        System.out.println("id (" + dto.id() + ")");
        int cc = UpdateFieldComponent.updateInt("CC*:",dto.cc());

        float hourlyPrice = UpdateFieldComponent.updateFloat("Saatlik ücret",dto.hourlyPrice());
        float dailyPrice = UpdateFieldComponent.updateFloat("Günlük ücret",dto.dailyPrice());
        float weeklyPrice = UpdateFieldComponent.updateFloat("Haftalık ücret",dto.weeklyPrice());
        float monthlyPrice = UpdateFieldComponent.updateFloat("Aylık ücret",dto.monthlyPrice());
        float price = UpdateFieldComponent.updateFloat("Aracın değeri",dto.price());
        MachineType machineType = UpdateFieldComponent.updateMachineType("Motor Tipi",dto.machineType());

        VehicleUpdateServiceDto updatedDto = new VehicleUpdateServiceDto(
                dto.id(),
                dto.vehicleType(),
                price,
                dto.isRent(),
                machineType,
                dto.doorCount(),
                cc,
                dto.maxRange(),
                dto.wingCount(),
                dto.pilotCount(),
                hourlyPrice,
                dailyPrice,
                weeklyPrice,
                monthlyPrice,
                UserSession.getId()
        );

        VehicleController controller = new VehicleController();
        ResponseEntity<Boolean> update = controller.update(updatedDto);
        if (update.getData()==null)
            CustomPrint.printRed(update.getMessage());
    }

    private static void helicopterDetailView(VehicleDetailServiceDto dto) {
        System.out.println("id (" + dto.id() + ")");
        int wingCount = UpdateFieldComponent.updateInt("Kanat Sayısı*:",dto.wingCount());
        int maxRange = UpdateFieldComponent.updateInt("Maximum Mesafe*:",dto.maxRange());
        int pilotCount = UpdateFieldComponent.updateInt("Pilot Sayısı*:",dto.pilotCount());

        float hourlyPrice = UpdateFieldComponent.updateFloat("Saatlik ücret",dto.hourlyPrice());
        float dailyPrice = UpdateFieldComponent.updateFloat("Günlük ücret",dto.dailyPrice());
        float weeklyPrice = UpdateFieldComponent.updateFloat("Haftalık ücret",dto.weeklyPrice());
        float monthlyPrice = UpdateFieldComponent.updateFloat("Aylık ücret",dto.monthlyPrice());
        float price = UpdateFieldComponent.updateFloat("Aracın değeri",dto.price());
        MachineType machineType = UpdateFieldComponent.updateMachineType("Motor Tipi",dto.machineType());

        VehicleUpdateServiceDto updatedDto = new VehicleUpdateServiceDto(
                dto.id(),
                dto.vehicleType(),
                price,
                dto.isRent(),
                machineType,
                dto.doorCount(),
                dto.cc(),
                maxRange,
                wingCount,
                pilotCount,
                hourlyPrice,
                dailyPrice,
                weeklyPrice,
                monthlyPrice,
                UserSession.getId()
        );

        VehicleController controller = new VehicleController();
        ResponseEntity<Boolean> update = controller.update(updatedDto);
        if (update.getData()==null)
            CustomPrint.printRed(update.getMessage());
    }

    private static void carDetailView( VehicleDetailServiceDto dto){

        System.out.println("id (" + dto.id() + ")");
        int doorCount = UpdateFieldComponent.updateInt("Kapı sayısı",dto.doorCount());
        float hourlyPrice = UpdateFieldComponent.updateFloat("Saatlik ücret",dto.hourlyPrice());
        float dailyPrice = UpdateFieldComponent.updateFloat("Günlük ücret",dto.dailyPrice());
        float weeklyPrice = UpdateFieldComponent.updateFloat("Haftalık ücret",dto.weeklyPrice());
        float monthlyPrice = UpdateFieldComponent.updateFloat("Aylık ücret",dto.monthlyPrice());
        float price = UpdateFieldComponent.updateFloat("Aracın değeri",dto.price());
        MachineType machineType = UpdateFieldComponent.updateMachineType("Motor Tipi",dto.machineType());

        VehicleUpdateServiceDto updatedDto = new VehicleUpdateServiceDto(
                dto.id(),
                dto.vehicleType(),
                price,
                dto.isRent(),
                machineType,
                doorCount,
                dto.cc(),
                dto.maxRange(),
                dto.wingCount(),
                dto.pilotCount(),
                hourlyPrice,
                dailyPrice,
                weeklyPrice,
                monthlyPrice,
                UserSession.getId()
        );

        VehicleController controller = new VehicleController();
        ResponseEntity<Boolean> update = controller.update(updatedDto);
        if (update.getData()==null)
            CustomPrint.printRed(update.getMessage());


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
                VehicleController vehicleController = new VehicleController();
                ResponseEntity<Boolean> result = vehicleController.delete(id,UserSession.getId());

                if (result.getData()==null || result.getData() == false)
                    CustomPrint.printRed(result.getMessage());
                else
                    CustomPrint.printGreen(result.getMessage());
            } catch (Exception e) {
                CustomPrint.printRed("Hatalı veri girişi!");
            }
        }

    }
}
