package com.alibiner.controller;

import com.alibiner.dto.request.UserSignInRequestDto;

import com.alibiner.dto.response.ResponseDto;
import com.alibiner.exceptionHandler.ExceptionHandler;
import com.alibiner.services.UserService;
import com.alibiner.util.MyDbConnection;
import com.alibiner.validations.UserValidation;

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
