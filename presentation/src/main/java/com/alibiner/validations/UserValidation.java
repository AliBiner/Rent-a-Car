package com.alibiner.validations;


import com.alibiner.dto.request.UserLoginRequestDto;
import com.alibiner.dto.request.UserSignInRequestDto;
import com.alibiner.util.Regex;

import java.util.*;

public class UserValidation {

    public static class UserSignInRequestDtoValidation{
        public static String isValid(UserSignInRequestDto dto){

            //Todo - diğer method gibi çoklu yanıt için düzenle
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

    public static class UserLoginRequestDtoValidation{
        public static List<String> validate(UserLoginRequestDto dto){
            List<String> errorMessages = new ArrayList<>(2);

            if (dto.getEmail() == null){
                errorMessages.add("Email null olamaz!");
            } else if (!dto.getEmail().matches(Regex.EMAIL)){
                errorMessages.add("Email formatı doğru değil!");
            }

            if (dto.getPassword() == null){
                errorMessages.add("Şifre null olamaz!");
            } else if (dto.getPassword().isBlank()) {
                errorMessages.add("Şifre boş olamaz!");
            }

            return errorMessages;
        }

    }

}
