package com.alibiner.UI.customer;

import com.alibiner.UI.util.CustomPrint;

import java.util.Scanner;

public class CustomerHomeUI {
    public static void view(Scanner scanner){
        while (true){
            System.out.println();
            System.out.println("===========Araç Kiralama Uygulamasına Hoş Geldiniz===========");
            System.out.println();

            System.out.println("1 - Araç Listeleme");
            System.out.println("0 - Bir Üst Menü");
            System.out.print("Seçiminiz: ");
            String choice = scanner.nextLine();
            switch (choice){
                case "1":
                    VehicleListUI.view(scanner);
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
