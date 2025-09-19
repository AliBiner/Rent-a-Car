package com.alibiner.UI;

import com.alibiner.UI.util.CustomPrint;
import com.alibiner.controller.UserController;
import com.alibiner.dto.request.UserSignInRequestDto;
import com.alibiner.dto.response.ResponseDto;
import com.alibiner.dto.response.UserSignInResponseDto;
import com.alibiner.util.Regex;

import java.util.Scanner;

public class SignInUI {

    public void view(Scanner scanner){

        here : while (true){
            System.out.println("=========Kullanıcı Kayıt Ekranı========");

            System.out.println();
            System.out.println("1 - Kayıt İşlemi");
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

            System.out.print("Adınız*: "); // required
            String name= scanner.nextLine().trim();
            while (name.isEmpty()){
                CustomPrint.printRed("Adınız boş olamaz!");
                System.out.print("Adınız*: "); // required
                name = scanner.nextLine().trim();
            }

            System.out.print("Soyadınız*: "); //required
            String lastname = scanner.nextLine().trim();
            while (lastname.isEmpty()){
                CustomPrint.printRed("Soyadınız boş olamaz!");
                System.out.print("Soyadınız*: "); //required
                lastname = scanner.nextLine().trim();
            }

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

            UserSignInRequestDto dto
                    = new UserSignInRequestDto(name,lastname,email,password);


            UserController controller = new UserController();
            ResponseDto responseDto = controller.signIn(dto);

            if (!responseDto.isSuccess()){
                CustomPrint.printRed(responseDto.getMessage());
            }else{
                UserSignInResponseDto body = (UserSignInResponseDto) responseDto.getBody();
                CustomPrint.printGreen(responseDto.getMessage());
                System.out.println();
                CustomPrint.printBlue("Kayıt işleminiz başarılı şekilde tamamlanmıştır. Sayın " + body.getFullName() + ". Lütfen giriş işlemi yapınız!");
                System.out.println();
                return;
            }

        }
    }
}
