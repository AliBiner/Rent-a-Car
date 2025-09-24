package com.alibiner.UI;

import com.alibiner.UI.car.CarUI;
import com.alibiner.UI.util.CustomPrint;
import com.alibiner.enums.Role;

import java.util.Scanner;

public class VehicleUI {
    public static void view(Scanner scanner){
        while (true){
            if (UserSession.isEmpty()){
                CustomPrint.printRed("Lütfen giriş yapınız!");
                return;
            }

            System.out.println();
            System.out.println("==============Araç İşlemleri===============");

            System.out.println();
            System.out.println("1 - Araç İşlemleri Ekranı");
            System.out.println("0 - Bir Üst Menü");
            System.out.print("Seçiminiz: ");
            String choice = scanner.nextLine();
            switch (choice){
                case "1":
                    break;
                case "0":
                    return;
                default:
                    CustomPrint.printRed("Hatalı veri girişi yaptınız!");
                    continue;

            }


            if (UserSession.getRole().equals(Role.ADMIN))
                adminVehicleUI(scanner);
            else
                customerUI(scanner);
        }
    }

    private static void adminVehicleUI(Scanner scanner){
        while (true){
            if (UserSession.isEmpty()){
                CustomPrint.printRed("Lütfen giriş yapınız!");
                return;
            }

            System.out.println();
            System.out.println("==============Araç İşlemleri===============");
            System.out.println();
            System.out.println("1 - Otomobil İşlemleri");
            System.out.println("2 - Helikopter İşlemleri");
            System.out.println("3 - Motosiklet İşlemleri");
            System.out.println("0 - Üst Menü");
            System.out.print("Seçiminiz: ");
            String choice = scanner.nextLine();

            switch (choice){
                case "1":
                    CarUI.view(scanner);
                    //Todo - Otomobil ekranı
                    break;
                case "2":
                    // Todo - Helikoper ekranı
                    break;
                case "3":
                    //Todo - motosiklet ekranı
                    break;
                case "0":
                    return;
                default:
                    CustomPrint.printRed("Hatalı veri girişi yaptınız!");
                    break;
            }
        }

    }


    private static void customerUI(Scanner scanner){

        //Todo - sonra yapılacak

    }
}
