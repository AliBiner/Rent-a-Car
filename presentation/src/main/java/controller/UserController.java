package controller;

import dto.request.UserSignInRequestDto;
import services.UserService;

public class UserController {

    public String signIn(UserSignInRequestDto dto){
        try {
            String EMAIL_REGEX = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";

            if (dto.getFirstName() == null ||
                    dto.getFirstName().isEmpty() ||
                    dto.getFirstName().isBlank() ||
                    dto.getFirstName().length() < 3 ){
                return  "Ad bilgisi geçersiz!";
                //Todo Validation class'ı ile kontrol et.
            }

            if (dto.getLastName() == null ||
                    dto.getLastName().isEmpty() ||
                    dto.getLastName().isBlank() ||
                    dto.getLastName().length() < 3 ){
                return  "Soyad bilgisi geçersiz!";
                //Todo Validation class'ı ile kontrol et.
            }

            if (dto.getEmail() == null || !dto.getEmail().matches(EMAIL_REGEX)){
                return  "Email bilgisi geçersiz!";
                //Todo Validation class'ı ile kontrol et.
            }

            if (dto.getPassword() == null ||
                    dto.getPassword().isEmpty() ||
                    dto.getPassword().isBlank() ||
                    dto.getPassword().length() < 6 ){
                return  "Şifre bilgisi geçersiz!";
                //Todo Validation class'ı ile kontrol et.
            }


            UserService userService = new UserService();
            int result = userService.signIn(dto);

            if(result<=0){
                return "Kayıt İşlemi Başarısız!";
            }
            else
                return "Kayıt İşlemi Başarılı!";
        }catch (Exception e){
            e.printStackTrace();
        }


        //Todo Geri dönüş tipinin belirlenmesi
        return null;
    }
}
