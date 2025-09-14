package UI;

import java.util.Scanner;

public class HomeUI {
    Scanner scanner = new Scanner(System.in);

    public void view(){
        while (true){
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
                    break;
                case "2":
                    //Todo kullanıcı girişi işlemleri
                    break;
                case "0":
                    return;
                default:
                    System.out.println("Hatalı veri girişi yaptınız!");
            }
        }
    }
}
