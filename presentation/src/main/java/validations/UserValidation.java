package validations;


import dto.request.UserSignInRequestDto;
import util.Regex;

public class UserValidation {

    public static class UserSignInRequestDtoValidation{
        public static String isValid(UserSignInRequestDto dto){

            if (dto.getFirstName() == null ||
                    dto.getFirstName().isEmpty() ||
                    dto.getFirstName().isBlank() ||
                    dto.getFirstName().length() < 3 ){
                return  "Ad bilgisi geçersiz!";
            }

            if (dto.getLastName() == null ||
                    dto.getLastName().isEmpty() ||
                    dto.getLastName().isBlank() ||
                    dto.getLastName().length() < 3 ){
                return  "Soyad bilgisi geçersiz!";
            }

            if (dto.getEmail() == null || !dto.getEmail().matches(Regex.EMAIL)){
                return  "Email bilgisi geçersiz!";
            }

            if (dto.getPassword() == null ||
                    dto.getPassword().isEmpty() ||
                    dto.getPassword().isBlank() ||
                    dto.getPassword().length() < 6 ){
                return  "Şifre bilgisi geçersiz!";
            }

            return "";
        }
    }

}
