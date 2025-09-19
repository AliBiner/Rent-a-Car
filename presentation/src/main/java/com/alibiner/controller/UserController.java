package com.alibiner.controller;

import com.alibiner.dto.request.UserLoginRequestDto;
import com.alibiner.dto.request.UserSignInRequestDto;

import com.alibiner.dto.response.ResponseDto;
import com.alibiner.dto.response.UserLoginResponseDto;
import com.alibiner.entity.User;
import com.alibiner.exceptionHandler.ExceptionHandler;
import com.alibiner.services.UserService;
import com.alibiner.validations.UserValidation;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.*;

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

    public ResponseDto login(UserLoginRequestDto dto){
        try {
            ResponseDto responseDto;
            List<String> errorMessages = UserValidation.UserLoginRequestDtoValidation.validate(dto);

            if (!errorMessages.isEmpty()){
                responseDto = new ResponseDto();
                responseDto.setStatusCode(400);
                responseDto.setMessage("Bilgiler geçersiz!");
                responseDto.setSuccess(false);
                responseDto.setBody(errorMessages);
                return responseDto; //Todo - responseDto'yu validate methodunda doldur.
            }

            //Todo - service katmanına gönder

            UserService userService = new UserService();
            ResponseDto loginResponseDto = userService.login(dto);


            responseDto = new ResponseDto();
            responseDto.setSuccess(true);
            responseDto.setMessage("Giriş işlemi başarılı!");
            responseDto.setStatusCode(200);
            responseDto.setBody(loginResponseDto);
            return responseDto;
        } catch (Exception e) {
            return new ExceptionHandler(e,e.getMessage()).handle();
        }
    }
}
