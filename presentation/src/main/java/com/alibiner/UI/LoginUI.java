package com.alibiner.UI;

import com.alibiner.UI.util.CustomPrint;
import com.alibiner.controller.UserController;
import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.serviceDto.response.user.UserServiceDto;
import com.alibiner.util.Regex;
import com.alibiner.util.ResponseEntity;

import java.util.*;
import java.util.Scanner;

public class LoginUI {

    public void view(Scanner scanner, boolean isTest){
        while (true){
            System.out.println("=========Kullanıcı Giriş Ekranı========");

            if (isTest){
                System.out.println();
                System.out.println("Test Kullanıcı Bilgileri");
                System.out.println("email: admin@admin.com - şifre: 123456 ");
                System.out.println("email: customer1@customer.com - şifre: 123456 ");
                System.out.println("email: customer2@customer.com - şifre: 123456 ");
                System.out.println("email: customer3@customer.com - şifre: 123456 ");
                System.out.println();
            }

            System.out.println();
            System.out.println("1 - Giriş İşlemi");
            System.out.println("0 - Bir Üst Menü Dön ve Oturumu Kapat");
            System.out.print("Seçiminiz: ");
            String choice = scanner.nextLine();
            switch (choice){
                case "1":
                    break;
                case "0":
                    UserSession.clear();
                    return;
                default:
                    CustomPrint.printRed("Hatalı veri girişi yaptınız!");
                    continue;
            }

            System.out.println();

            System.out.print("Email*: "); //required
            String email = scanner.nextLine().trim();
            while (!email.matches(Regex.EMAIL) ){
                CustomPrint.printRed("Email uygun formatta değil!");
                System.out.print("Email*: "); //required
                email = scanner.nextLine().trim();
            }

            System.out.print("Şifre*:"); // required
            String password = scanner.nextLine().trim();
            while (password.isEmpty()){
                CustomPrint.printRed("Şifre boş olamaz!");
                System.out.print("Şifre*:"); // required
                password = scanner.nextLine().trim();
            }


            UserController userController = new UserController();

            ResponseEntity<UserServiceDto> login = userController.login(email, password);


            if (login.getData() == null){
               CustomPrint.printRed(login.getMessage());
            }
            else {
                CustomPrint.printBlue("Hoş geldiniz. Sayın "+ login.getData().firstName() + " " + login.getData().lastName());

                if (UserSession.isEmpty()) {
                    UserSession.setSession(login.getData().id(),login.getData().firstName(),login.getData().lastName(),login.getData().role(),login.getData().customerType());
                }

                VehicleUI.view(scanner);
            }

        }

    }
}
