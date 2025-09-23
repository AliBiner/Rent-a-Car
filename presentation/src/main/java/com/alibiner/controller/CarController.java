package com.alibiner.controller;

import com.alibiner.dto.request.vehicle.car.CarAddRequestDTO;
import com.alibiner.dto.response.ResponseDto;
import com.alibiner.dto.response.vehicle.car.CarAddResponseDTO;
import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.exceptionHandler.ExceptionHandler;
import com.alibiner.exceptions.ValidationException;
import com.alibiner.services.vehicle.CarService;
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
            if (!carService.save(dto)) {
                return new ResponseDto(ErrorCode.GENERAL_EXCEPTION.getCode(),ErrorCode.GENERAL_EXCEPTION.getMessage(), false);
            }
            return new ResponseDto("200","Kayıt Başarılı!",true);
        } catch (Exception e) {
            return new ExceptionHandler(e,"").handle();
        }
    }
}
