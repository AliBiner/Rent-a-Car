package com.alibiner.UI.vehicle.admin;

import com.alibiner.UI.UserSession;
import com.alibiner.UI.util.CustomPrint;
import com.alibiner.enums.Role;

import java.util.Scanner;

public class AdminVehicleUI {
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
            System.out.println("1 - Araç Ekleme");
            System.out.println("2 - Araç Listeleme");
            System.out.println("0 - Bir Üst Menü");
            System.out.print("Seçiminiz: ");
            String choice = scanner.nextLine();

            switch (choice){
                case "1":
                    AdminVehicleAddUI.view(scanner);
                    break;
                case "2":
                    AdminVehicleListUI.view(scanner);
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
