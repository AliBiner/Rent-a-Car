package controller;

import dto.request.UserSignInRequestDto;

import dto.response.ResponseDto;
import services.UserService;
import validations.UserValidation;

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
        }catch (Exception e){
            responseDto.setStatusCode(500);
            responseDto.setMessage(e.getMessage());
            responseDto.setSuccess(false);
            return responseDto;
        }

    }
}
