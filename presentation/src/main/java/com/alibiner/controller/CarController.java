package com.alibiner.controller;

import com.alibiner.dto.request.car.CarAddRequestDTO;
import com.alibiner.dto.response.ResponseDto;
import com.alibiner.dto.response.car.CarAddResponseDTO;
import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.exceptionHandler.ExceptionHandler;
import com.alibiner.exceptions.ValidationException;
import com.alibiner.services.CarService;
import com.alibiner.validations.CarValidation;

import java.util.ArrayList;

public class CarController {

    public ResponseDto addCar(CarAddRequestDTO dto){

        try {
            ArrayList<String> errorMessages = CarValidation.CarAddValidation.validate(dto);
            if (!errorMessages.isEmpty()){
                throw new ValidationException(ErrorCode.VALIDATION,errorMessages);
            }

            CarService carService = new CarService();
            CarAddResponseDTO responseDTO = carService.save(dto);
            if (responseDTO!=null){
                return new ResponseDto("200","Kayıt Başarılı!",true,responseDTO);
            }

            //Todo return et

            //Todo exception handle
        } catch (Exception e) {
            return new ExceptionHandler(e,"").handle();
        }


        return null;
    }
}
