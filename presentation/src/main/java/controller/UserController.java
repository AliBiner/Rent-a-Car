package controller;

import dto.request.UserSignInRequestDto;

import dto.response.ResponseDto;
import exceptionHandler.ExceptionHandler;
import services.UserService;
import validations.UserValidation;

import java.sql.SQLException;

public class UserController {

    public ResponseDto signIn(UserSignInRequestDto dto){
        ResponseDto responseDto = new ResponseDto();
        try {

            final String isValidResult = UserValidation.UserSignInRequestDtoValidation.isValid(dto);
            if (!isValidResult.equals("")){
                responseDto.setStatusCode(400);
                responseDto.setMessage(isValidResult);
                responseDto.setSuccess(false);
                return responseDto;
            }


            //Kayıt işlemleri başladı
            UserService userService = new UserService();
            return userService.save(dto);
        }
        catch (Exception e){
            return new ExceptionHandler(e,"").handle();
        }


    }

}
