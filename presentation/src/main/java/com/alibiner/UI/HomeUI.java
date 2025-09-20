package com.alibiner.UI;

import com.alibiner.UI.util.CustomPrint;

import java.util.Scanner;

public class HomeUI {
    Scanner scanner = new Scanner(System.in);

    public void view(){
        while (true){
            System.out.println("===============Ana Sayfa===============");
            System.out.println();
            System.out.println("1 - Kullanıcı Kaydı");
            System.out.println("2 - Kullanıcı Girişi");
            System.out.println("0 - Çıkış");

            System.out.print("Seçiminiz: ");
            String choice = scanner.nextLine();

            System.out.println();
            switch (choice){
                case "1":
                    SignInUI signInUI = new SignInUI();
                    signInUI.view(scanner);
                    signInUI = null;
                    break;
                case "2":
                    LoginUI loginUI = new LoginUI();
                    loginUI.view(scanner);
                    loginUI = null;
                    break;
                case "0":
                    System.out.println("Çıkış yapılıyor...");
                    System.out.println("Uygulama Kapandı!");
                    return;
                default:
                    CustomPrint.printRed("Hatalı veri girişi yaptınız!");
                    break;
            }
        }
    }
}
