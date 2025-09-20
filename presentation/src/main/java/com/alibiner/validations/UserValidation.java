package com.alibiner.validations;


import com.alibiner.dto.request.UserLoginRequestDto;
import com.alibiner.dto.request.UserSignInRequestDto;
import com.alibiner.util.Regex;

import java.util.*;

public class UserValidation {

    public static class UserSignInRequestDtoValidation{

        public static List<String> validate(UserSignInRequestDto dto){
            ArrayList<String> errorMessages = new ArrayList<>(4);

            if (dto.getFirstName() == null)
                errorMessages.add("Ad bilgisi null olamaz!");
            else if (dto.getFirstName().isBlank())
                errorMessages.add("Ad bilgisi boş olamaz!");
            else if (dto.getFirstName().length()<3) {
                errorMessages.add("Ad bilgisi 3 karakterden kısa olamaz!");
            }

            if (dto.getLastName() == null){
                errorMessages.add("Soyad bilgisi null olamaz!");
            } else if (dto.getLastName().isBlank()) {
                errorMessages.add("Soyad bigisi boş olamaz!");
            } else if (dto.getLastName().length() < 3) {
                errorMessages.add("Soyad bilgisi 3 karakterden kısa olamaz!");
            }

            if (dto.getEmail() == null ){
                errorMessages.add("Email bilgisi null olamaz!");
            } else if (!dto.getEmail().matches(Regex.EMAIL)) {
                errorMessages.add("Geçersi email formatı!");
            }

            if (dto.getPassword() == null){
                errorMessages.add("Şifre bilgisi null olamaz!");
            } else if (dto.getPassword().isBlank()) {
                errorMessages.add("Şifre bilgisi boş olamaz!");
            } else if (dto.getPassword().length() < 6) {
                errorMessages.add("Şifre bilgisi 6 karakterden kısa olamaz!");
            }

            return errorMessages;
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
