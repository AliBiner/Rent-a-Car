package controller;

import dto.request.UserSignInRequestDto;
import services.UserService;
import validations.UserValidation;

public class UserController {

    public String signIn(UserSignInRequestDto dto){
        try {
            final String isValidResult = UserValidation.UserSignInRequestDtoValidation.isValid(dto);
            if (!isValidResult.equals("")){
                return isValidResult;
            }

            UserService userService = new UserService();
            int result = userService.save(dto);

            if (result == -1){
                return "Bu email adresi zaten kayıtlı!";            }
            if(result == 0){
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
