package com.alibiner.validations;


import com.alibiner.serviceDto.request.user.UserAddServiceDto;
import com.alibiner.util.Regex;

import java.util.*;

public class UserValidation {

    public static class UserAddServiceDtoValidation{

        public static List<String> validate(UserAddServiceDto dto){
            ArrayList<String> errorMessages = new ArrayList<>(4);

            if (dto.firstName() == null)
                errorMessages.add("Ad bilgisi null olamaz!");
            else if (dto.firstName().isBlank())
                errorMessages.add("Ad bilgisi boş olamaz!");
            else if (dto.firstName().length()<3) {
                errorMessages.add("Ad bilgisi 3 karakterden kısa olamaz!");
            }

            if (dto.lastName() == null){
                errorMessages.add("Soyad bilgisi null olamaz!");
            } else if (dto.lastName().isBlank()) {
                errorMessages.add("Soyad bigisi boş olamaz!");
            } else if (dto.lastName().length() < 3) {
                errorMessages.add("Soyad bilgisi 3 karakterden kısa olamaz!");
            }

            if (dto.email() == null ){
                errorMessages.add("Email bilgisi null olamaz!");
            } else if (!dto.email().matches(Regex.EMAIL)) {
                errorMessages.add("Geçersi email formatı!");
            }

            if (dto.password() == null){
                errorMessages.add("Şifre bilgisi null olamaz!");
            } else if (dto.password().isBlank()) {
                errorMessages.add("Şifre bilgisi boş olamaz!");
            } else if (dto.password().length() < 6) {
                errorMessages.add("Şifre bilgisi 6 karakterden kısa olamaz!");
            }

            return errorMessages;
        }
    }

//    public static class UserLoginRequestDtoValidation{
//        public static List<String> validate(UserLoginRequestDto dto){
//            List<String> errorMessages = new ArrayList<>(2);
//
//            if (dto.getEmail() == null){
//                errorMessages.add("Email null olamaz!");
//            } else if (!dto.getEmail().matches(Regex.EMAIL)){
//                errorMessages.add("Email formatı doğru değil!");
//            }
//
//            if (dto.getPassword() == null){
//                errorMessages.add("Şifre null olamaz!");
//            } else if (dto.getPassword().isBlank()) {
//                errorMessages.add("Şifre boş olamaz!");
//            }
//
//            return errorMessages;
//        }
//
//    }

}
