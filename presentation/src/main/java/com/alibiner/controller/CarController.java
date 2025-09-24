package com.alibiner.controller;

import com.alibiner.dto.request.vehicle.car.CarAddRequestDTO;
import com.alibiner.dto.request.vehicle.car.CarUpdateRequestDto;
import com.alibiner.dto.response.ResponseDto;
import com.alibiner.dto.response.vehicle.IVehicleResponseDto;
import com.alibiner.dto.response.vehicle.car.AdminGetCarResponseDto;
import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.exceptionHandler.ExceptionHandler;
import com.alibiner.exceptions.ValidationException;
import com.alibiner.exceptions.user.UserForbiddenException;
import com.alibiner.exceptions.user.UserNotFoundException;
import com.alibiner.services.vehicle.CarService;
import com.alibiner.validations.CarValidation;

import java.sql.SQLException;
import java.util.*;
import java.util.ArrayList;

public class CarController {

    private final CarService carService;

    public CarController() {
        this.carService = new CarService();
    }

    public ResponseDto addCar(CarAddRequestDTO dto){

        try {
            ArrayList<String> errorMessages = CarValidation.CarAddValidation.validate(dto);
            if (!errorMessages.isEmpty()){
                throw new ValidationException(ErrorCode.VALIDATION,errorMessages);
            }

            if (!carService.save(dto)) {
                return new ResponseDto(ErrorCode.GENERAL_EXCEPTION.getCode(),ErrorCode.GENERAL_EXCEPTION.getMessage(), false);
            }
            return new ResponseDto("200","Kayıt Başarılı!",true);
        } catch (Exception e) {
            return new ExceptionHandler(e,"").handle();
        }
    }

    public ResponseDto getAll(int adminId){

        try {
            List<IVehicleResponseDto> result = carService.getAll(adminId);
            return new ResponseDto("200","İşlem Başarılı!",true,result);
        }catch (Exception e){
            return new ExceptionHandler(e,"").handle();
        }
    }

    public ResponseDto getById(int id) {
        try {
            AdminGetCarResponseDto result = (AdminGetCarResponseDto) carService.getById(id);
            return new ResponseDto("200","İşlem Başarılı!",true,result);

        } catch (Exception e) {
            return new ExceptionHandler(e,"").handle();
        }
    }

    public ResponseDto updateCar(CarUpdateRequestDto requestDto) {
        try {
            boolean result = carService.update(requestDto);
            if (result==false){
                return new ResponseDto(ErrorCode.DATA_NOT_UPDATE.getCode(), ErrorCode.DATA_NOT_UPDATE.getMessage(), false);
            }else
                return new ResponseDto(ErrorCode.OK.getCode(), ErrorCode.OK.getMessage(), true);
        }catch (Exception e){
            return new ExceptionHandler(e,"").handle();
        }
    }

    public ResponseDto delete(int id, int userId) {
        try {
            if (id <= 0 || userId <= 0)
                throw new ValidationException(ErrorCode.VALIDATION,"Id bilgisi geçersiz");

            boolean result = carService.delete(id,userId);
            if (result == false){
                return new ResponseDto(ErrorCode.DATA_NOT_DELETE.getCode(), ErrorCode.DATA_NOT_DELETE.getMessage(), false);
            }else {
                return new ResponseDto(ErrorCode.OK.getCode(), ErrorCode.OK.getMessage(), true);
            }

        }
        catch (Exception e){
            return new ExceptionHandler(e,"").handle();
        }
    }
}
