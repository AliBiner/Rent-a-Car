package UI;

import controller.UserController;
import dto.request.UserSignInRequestDto;

import java.util.Scanner;

public class SignInUI {
    public void view(Scanner scanner){
        while (true){
            System.out.println("=========Kullanıcı Kayıt Ekranı========");

            //Todo hatalı işlem yapıldıysa üst menüye gönder.


            //Todo trim ile hatalı veri girişini engelle
            System.out.print("Adınız*: "); // required
            String name= scanner.nextLine();
            while (name.isEmpty()){
                System.out.println("Adınız boş olamaz!");
                System.out.print("Adınız*: "); // required
                name = scanner.nextLine();
            }
            //Todo trim ile hatalı veri girişini engelle
            System.out.print("Soyadınız*: "); //required
            String lastname = scanner.nextLine();
            while (lastname.isEmpty()){
                System.out.println("Soyadınız boş olamaz!");
                System.out.print("Soyadınız*: "); //required
                lastname = scanner.nextLine();
            }
            //Todo trim ile hatalı veri girişini engelle
            //Todo email formatını kontrol et
            System.out.print("Email*: "); //required
            String email = scanner.nextLine();
            while (email.isEmpty()){
                System.out.println("Email boş olamaz!");
                System.out.print("Email*: "); //required
                email = scanner.nextLine();
            }

            //Todo trim ile hatalı veri girişini engelle
            System.out.print("Password*:"); // required
            String password = scanner.nextLine();
            while (password.isEmpty()){
                System.out.println("Password boş olamaz!");
                System.out.print("Password*:"); // required
                password = scanner.nextLine();
            }

            UserSignInRequestDto dto = new UserSignInRequestDto();
            dto.setFirstName(name);
            dto.setLastName(lastname);
            dto.setEmail(email);
            dto.setPassword(password);

            UserController controller = new UserController();
            controller.signIn(dto);

            //Todo return veya yönlendirme işlemleri yapılacak
        }
    }
}
