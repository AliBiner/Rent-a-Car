package com.alibiner.UI;

import com.alibiner.UI.util.CustomPrint;
import com.alibiner.controller.UserController;
import com.alibiner.serviceDto.request.user.UserAddServiceDto;
import com.alibiner.enums.CustomerType;
import com.alibiner.enums.Role;
import com.alibiner.util.Regex;
import com.alibiner.util.ResponseEntity;

import java.util.Scanner;

public class SignInUI {

    public void view(Scanner scanner){

        while (true){
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
                    continue;
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

            int age = 0;
            while (age < 18){
                try{
                    System.out.print("Yaşınız*:");
                    age = Integer.parseInt(scanner.nextLine());
                    if (age<18)
                        CustomPrint.printRed("Yaşınız 18'den küçük olamaz!");
                }catch (Exception e){
                    CustomPrint.printRed("Yaşınız 18'den küçük olamaz!");
                }
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

            System.out.print("1 - Bireysel \n2 - Kurumsal*:"); // required
            String inputCustomerType = scanner.nextLine().trim();

            UserAddServiceDto dto = null;

            boolean loop = true;
            while (loop){
                switch (inputCustomerType){
                    case "1":
                        dto = new UserAddServiceDto(name,lastname,email,password, age, Role.CUSTOMER, CustomerType.INDIVIDUAL);
                        loop = false;
                        break;
                    case "2":
                        dto = new UserAddServiceDto(name,lastname,email,password, age, Role.CUSTOMER, CustomerType.INSTITUTIONAL);
                        loop = false;
                        break;
                    default:
                        CustomPrint.printRed("Hatalı veri girişi yaptınız!");
                        break;
                }
            }


            UserController controller = new UserController();
            ResponseEntity<Boolean> responseEntity = controller.signIn(dto);

            if (responseEntity.getData()==null){
                CustomPrint.printRed(responseEntity.getMessage());
            }else{
                CustomPrint.printGreen(responseEntity.getMessage());
                System.out.println();
                CustomPrint.printBlue("Kayıt işleminiz başarılı şekilde tamamlanmıştır. Lütfen giriş işlemi yapınız!");
                System.out.println();
                return;
            }

        }
    }
}
