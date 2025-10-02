package com.alibiner.UI.vehicle.admin;

import com.alibiner.UI.UserSession;
import com.alibiner.UI.util.CustomPrint;
import com.alibiner.controller.BrandController;
import com.alibiner.controller.ModelController;
import com.alibiner.controller.VehicleController;
import com.alibiner.enums.Role;
import com.alibiner.enums.vehicle.VehicleType;
import com.alibiner.repositoryDto.response.brand.BrandPersistenceDto;
import com.alibiner.repositoryDto.response.model.ModelResponsePersistenceDto;
import com.alibiner.serviceDto.request.vehicle.create.VehicleAndDetailAddServiceDto;
import com.alibiner.enums.car.MachineType;
import com.alibiner.util.ResponseEntity;

import java.util.List;
import java.util.Scanner;

public class AdminVehicleAddUI {

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
            System.out.println("============Araç Ekleme Ekranı=============");
            System.out.println();

            System.out.println("1 - Araç Ekleme");
            System.out.println("0 - Bir Üst Menü");
            System.out.print("Seçiminiz: ");
            String choice = scanner.nextLine();
            switch (choice){
                case "1":
                    addVehicleView(scanner);
                    break;
                case "0":
                    return;
                default:
                    CustomPrint.printRed("Hatalı veri girişi yaptınız!");
                    break;
            }
        }
    }

    private static void addVehicleView(Scanner scanner){
        System.out.println();
        System.out.println("============Araç Ekleme Ekranı=============");
        System.out.println();

        System.out.println("1 - Otomobil Ekleme");
        System.out.println("2 - Helicopter Ekleme");
        System.out.println("3 - Motosiklet Ekleme");
        System.out.println("0 - Bir Üst Menü");
        System.out.print("Seçiminiz: ");
        String choice = scanner.nextLine();
        switch (choice){
            case "1":
                addCarView(scanner,VehicleType.CAR);
                break;
            case "2":
                addHelicopterView(scanner,VehicleType.HELICOPTER);
                break;
            case "3":
                addMotorcycleView(scanner,VehicleType.MOTORCYCLE);
            case "0":
                return;
            default:
                CustomPrint.printRed("Hatalı veri girişi yaptınız!");
                break;
        }
    }

    private static void addMotorcycleView(Scanner scanner, VehicleType motorcycle) {

        BrandController brandController = new BrandController();
        ResponseEntity<List<BrandPersistenceDto>> brands = brandController.getAll();
        for (BrandPersistenceDto brand : brands.getData()){
            CustomPrint.printBlue(brand.toString());
        }

        System.out.print("Marka Id'si Giriniz*:");
        int brandId = 0;
        while (brandId == 0){
            try {
                brandId = scanner.nextInt();
                scanner.nextLine(); // clear scanner
            } catch (Exception e) {
                scanner.nextLine(); // clear scanner
                CustomPrint.printRed("Hatalı Veri Girişi");
            }
        }

        ModelController modelController = new ModelController();
        ResponseEntity<List<ModelResponsePersistenceDto>> allByBrandId = modelController.getAllByBrandId(brandId);

        for (ModelResponsePersistenceDto models : allByBrandId.getData()){
            CustomPrint.printBlue(models.toString());
        }

        System.out.print("Model Id'si Giriniz*:");
        int modelId = 0;
        while (modelId == 0){
            try {
                modelId = scanner.nextInt();
                scanner.nextLine(); // clear scanner
            } catch (Exception e) {
                scanner.nextLine(); // clear scanner
                CustomPrint.printRed("Hatalı Veri Girişi");
            }
        }

        float price = 0.00f;
        while (price == 0.00f){
            try{
                System.out.print("Aracın Değeri*:");
                price = scanner.nextFloat();
                scanner.nextLine(); //clear scanner
            }catch (Exception e){
                CustomPrint.printRed("Hatalı veri girişi yaptınız!");
            }
        }

        int cc = 0;
        while (cc == 0){
            try{
                System.out.print("CC*:");
                cc = scanner.nextInt();
                scanner.nextLine(); //clear scanner
            }catch (Exception e){
                CustomPrint.printRed("Hatalı veri girişi yaptınız!");
            }
        }


        VehicleAndDetailAddServiceDto dto = new VehicleAndDetailAddServiceDto(
                modelId,
                UserSession.getId(),
                price,
                motorcycle,
                cc
        );

        VehicleController vehicleController = new VehicleController();
        ResponseEntity<Integer> response = vehicleController.postVehicleAndDetail(dto);
        if (response.getData()==null || response.getData()==0)
            CustomPrint.printRed(response.getMessage());
        else {
            CustomPrint.printGreen(response.getMessage());
            CustomPrint.printGreen("Kaydedilen Araç Id="+ response.getData());
        }
    }

    private static void addHelicopterView(Scanner scanner, VehicleType helicopter) {

        BrandController brandController = new BrandController();
        ResponseEntity<List<BrandPersistenceDto>> brands = brandController.getAll();
        for (BrandPersistenceDto brand : brands.getData()){
            CustomPrint.printBlue(brand.toString());
        }

        System.out.print("Marka Id'si Giriniz*:");
        int brandId = 0;
        while (brandId == 0){
            try {
                brandId = scanner.nextInt();
                scanner.nextLine(); // clear scanner
            } catch (Exception e) {
                scanner.nextLine(); // clear scanner
                CustomPrint.printRed("Hatalı Veri Girişi");
            }
        }

        ModelController modelController = new ModelController();
        ResponseEntity<List<ModelResponsePersistenceDto>> allByBrandId = modelController.getAllByBrandId(brandId);

        for (ModelResponsePersistenceDto models : allByBrandId.getData()){
            CustomPrint.printBlue(models.toString());
        }

        System.out.print("Model Id'si Giriniz*:");
        int modelId = 0;
        while (modelId == 0){
            try {
                modelId = scanner.nextInt();
                scanner.nextLine(); // clear scanner
            } catch (Exception e) {
                scanner.nextLine(); // clear scanner
                CustomPrint.printRed("Hatalı Veri Girişi");
            }
        }

        float price = 0.00f;
        while (price == 0.00f){
            try{
                System.out.print("Aracın Değeri*:");
                price = scanner.nextFloat();
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

        int maxRange = 0;
        while (maxRange == 0){
            try{
                System.out.print("Max. Mesafe*:");
                maxRange = scanner.nextInt();
                scanner.nextLine(); //clear scanner
            }catch (Exception e){
                CustomPrint.printRed("Hatalı veri girişi yaptınız!");
            }
        }


        VehicleAndDetailAddServiceDto dto = new VehicleAndDetailAddServiceDto(
                modelId,
                UserSession.getId(),
                price,
                helicopter,
                maxRange,
                wingCount,
                pilotCount
        );

        VehicleController vehicleController = new VehicleController();
        ResponseEntity<Integer> response = vehicleController.postVehicleAndDetail(dto);
        if (response.getData()==null || response.getData()==0)
            CustomPrint.printRed(response.getMessage());
        else {
            CustomPrint.printGreen(response.getMessage());
            CustomPrint.printGreen("Kaydedilen Araç Id="+ response.getData());
        }
    }

    private static void addCarView(Scanner scanner, VehicleType car) {

        BrandController brandController = new BrandController();
        ResponseEntity<List<BrandPersistenceDto>> brands = brandController.getAll();
        for (BrandPersistenceDto brand : brands.getData()){
            CustomPrint.printBlue(brand.toString());
        }

        System.out.print("Marka Id'si Giriniz*:");
        int brandId = 0;
        while (brandId == 0){
            try {
                brandId = scanner.nextInt();
                scanner.nextLine(); // clear scanner
            } catch (Exception e) {
                scanner.nextLine(); // clear scanner
                CustomPrint.printRed("Hatalı Veri Girişi");
            }
        }

        ModelController modelController = new ModelController();
        ResponseEntity<List<ModelResponsePersistenceDto>> allByBrandId = modelController.getAllByBrandId(brandId);

        for (ModelResponsePersistenceDto models : allByBrandId.getData()){
            CustomPrint.printBlue(models.toString());
        }

        System.out.print("Model Id'si Giriniz*:");
        int modelId = 0;
        while (modelId == 0){
            try {
                modelId = scanner.nextInt();
                scanner.nextLine(); // clear scanner
            } catch (Exception e) {
                scanner.nextLine(); // clear scanner
                CustomPrint.printRed("Hatalı Veri Girişi");
            }
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

        float price = 0.00f;
        while (price == 0.00f){
            try{
                System.out.print("Aracın Değeri*:");
                price = scanner.nextFloat();
                scanner.nextLine(); //clear scanner
            }catch (Exception e){
                CustomPrint.printRed("Hatalı veri girişi yaptınız!");
            }
        }

        VehicleAndDetailAddServiceDto dto = new VehicleAndDetailAddServiceDto(
                modelId,
                UserSession.getId(),
                car,
                doorCount,
                machineType,
                price
        );

        VehicleController vehicleController = new VehicleController();
        ResponseEntity<Integer> response = vehicleController.postVehicleAndDetail(dto);
        if (response.getData()==null || response.getData()==0)
            CustomPrint.printRed(response.getMessage());
        else {
            CustomPrint.printGreen(response.getMessage());
            CustomPrint.printGreen("Kaydedilen Araç Id="+ response.getData());
        }

    }
}
