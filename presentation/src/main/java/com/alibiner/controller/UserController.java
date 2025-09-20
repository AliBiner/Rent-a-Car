package com.alibiner.controller;

import com.alibiner.dto.request.UserLoginRequestDto;
import com.alibiner.dto.request.UserSignInRequestDto;
import com.alibiner.dto.response.ResponseDto;
import com.alibiner.dto.response.UserLoginResponseDto;
import com.alibiner.dto.response.UserSignInResponseDto;
import com.alibiner.errorMessages.ErrorCode;
import com.alibiner.exceptionHandler.ExceptionHandler;
import com.alibiner.exceptions.ValidationException;
import com.alibiner.services.UserService;
import com.alibiner.validations.UserValidation;
import java.util.*;

public class UserController {

    public ResponseDto signIn(UserSignInRequestDto dto){
        try {
            final List<String> errorMessages = UserValidation.UserSignInRequestDtoValidation.validate(dto);
            if (!errorMessages.isEmpty()){
                throw new ValidationException(ErrorCode.VALIDATION,errorMessages);
            }

            //Kayıt işlemleri başladı
            UserService userService = new UserService();
            UserSignInResponseDto responseDto = userService.save(dto);
            return new ResponseDto(ErrorCode.OK.getCode(), ErrorCode.OK.getMessage(), true, responseDto);
        }
        catch (Exception e){
            return new ExceptionHandler(e,"").handle();
        }
    }

    public ResponseDto login(UserLoginRequestDto dto){
        try {
            List<String> errorMessages = UserValidation.UserLoginRequestDtoValidation.validate(dto);

            if (!errorMessages.isEmpty()){
                throw new ValidationException(ErrorCode.VALIDATION,errorMessages);
            }

            UserService userService = new UserService();
            UserLoginResponseDto loginResponseDto = userService.login(dto);

            return new ResponseDto("200","Giriş işlemi başarılı!",true,loginResponseDto);
        } catch (Exception e) {
            return new ExceptionHandler(e,e.getMessage()).handle();
        }
    }
}
