package com.alibiner.UI;

import com.alibiner.UI.util.CustomPrint;
import com.alibiner.controller.UserController;
import com.alibiner.dto.request.UserLoginRequestDto;
import com.alibiner.dto.response.ResponseDto;
import com.alibiner.dto.response.UserLoginResponseDto;
import com.alibiner.util.Regex;

import java.util.*;
import java.util.Scanner;

public class LoginUI {

    public void view(Scanner scanner){
        here : while (true){
            System.out.println("=========Kullanıcı Giriş Ekranı========");

            System.out.println();
            System.out.println("1 - Giriş İşlemi");
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
                    break here;
            }

            System.out.println();

            //Todo - UI'da validation işlemleri

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

            UserLoginRequestDto requestDto = new UserLoginRequestDto(email,password);

            UserController userController = new UserController();

            ResponseDto responseDto = userController.login(requestDto);
            if (!responseDto.isSuccess() && responseDto.getStatusCode()==400){
                ArrayList<String> errorMessages = (ArrayList<String>) responseDto.getBody();
                for (String message : errorMessages){
                    CustomPrint.printRed(message);
                }
            } else if (!responseDto.isSuccess() ) {
               CustomPrint.printRed(responseDto.getMessage());
            } else {
                UserLoginResponseDto user = (UserLoginResponseDto) responseDto.getBody();
                CustomPrint.printBlue("Hoş geldiniz. Sayın "+ user.getFirstName() + user.getLastName());
                UserSession.setId(user.getId());
                UserSession.setFirstName(user.getFirstName());
                UserSession.setLastName(user.getLastName());
                //Todo başarılı işlemleri yapılacak.
            }

        }

    }
}
