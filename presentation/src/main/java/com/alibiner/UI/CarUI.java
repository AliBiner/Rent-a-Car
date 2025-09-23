package com.alibiner.UI;

import com.alibiner.UI.util.CustomPrint;
import com.alibiner.enums.Role;

import java.util.Scanner;

public class CarUI {
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
            System.out.println("1 - Otomobil Ekleme");
            System.out.println("2 - Otomobil Güncelleme");
            System.out.println("3 - Otomobil Silme");
            System.out.println("4 - Otomobil Listeleme");
            System.out.println("0 - Bir Üst Menü");
            System.out.print("Seçiminiz: ");
            String choice = scanner.nextLine();

            switch (choice){
                case "1":
                    CarAddUI.view(scanner);
                    break;
                case "2":

                    //Todo- diğer adımları yap
                case "0":
                    return;
                default:
                    CustomPrint.printRed("Hatalı veri girişi yaptınız!");
                    break;
            }
        }

    }
}
