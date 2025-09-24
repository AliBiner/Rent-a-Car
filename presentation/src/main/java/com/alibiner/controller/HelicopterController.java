package com.alibiner.controller;

import com.alibiner.dto.request.vehicle.helicopter.HelicopterAddRequestDto;
import com.alibiner.dto.request.vehicle.helicopter.HelicopterUpdateRequestDto;
import com.alibiner.dto.response.ResponseDto;
import com.alibiner.dto.response.vehicle.IVehicleResponseDto;
import com.alibiner.entity.Helicopter;
import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.exceptionHandler.ExceptionHandler;
import com.alibiner.exceptions.ValidationException;
import com.alibiner.services.vehicle.HelicopterService;
import com.alibiner.validations.HelicopterValidation;

import java.util.*;

public class HelicopterController {
    private HelicopterService helicopterService;

    public HelicopterController() {
        this.helicopterService = new HelicopterService();
    }

    public ResponseDto addHelicopter(HelicopterAddRequestDto dto) {
        try{
            List<String> errorMessages = HelicopterValidation.AddRequestDto.validate(dto);
            if (!errorMessages.isEmpty()){
                throw new ValidationException(ErrorCode.VALIDATION,errorMessages);
            }

            boolean result = helicopterService.save(dto);

            if (!result){
                return new ResponseDto(ErrorCode.DATA_NOT_INSERT.getCode(), ErrorCode.DATA_NOT_INSERT.getMessage(), false);
            }
            return new ResponseDto(ErrorCode.OK.getCode(), ErrorCode.OK.getMessage(), true);
        }catch (Exception e){
            return new ExceptionHandler(e,e.getMessage()).handle();
        }
    }

    public ResponseDto getAll(int userId) {
        try {
            if (userId<=0)
                throw new ValidationException(ErrorCode.VALIDATION,"User id bilgisi geçersiz!");

            List<IVehicleResponseDto> helicopterList = helicopterService.getAll(userId);

            return new ResponseDto(ErrorCode.OK.getCode(), ErrorCode.OK.getMessage(), true,helicopterList);

        }catch (Exception e){
            return new ExceptionHandler(e,e.getMessage()).handle();
        }

    }

    public ResponseDto getById(int id) {
        try {
            IVehicleResponseDto helicopter = helicopterService.getById(id);
            return new ResponseDto(ErrorCode.OK.getCode(), ErrorCode.OK.getMessage(), true,helicopter);
        }catch (Exception e){
            return new ExceptionHandler(e,e.getMessage()).handle();
        }
    }

    public ResponseDto update(HelicopterUpdateRequestDto requestDto) {
        try {
            //Todo - burada kaldık.
            List<String> errorMessages = HelicopterValidation.AddRequestDto.validate(requestDto);
            if (!errorMessages.isEmpty())
                throw new ValidationException(ErrorCode.VALIDATION,errorMessages);

            if (!helicopterService.update(requestDto))
                return new ResponseDto(ErrorCode.DATA_NOT_UPDATE.getCode(), ErrorCode.DATA_NOT_UPDATE.getMessage(),
                        false);
            else
                return new ResponseDto(ErrorCode.OK.getCode(), ErrorCode.OK.getMessage(), true);

        }catch (Exception e){
            return new ExceptionHandler(e,e.getMessage()).handle();
        }
    }

    public ResponseDto delete(int id, int userId) {
        try {
            if (id <= 0 || userId <= 0)
                throw new ValidationException(ErrorCode.VALIDATION,"Id bilgisi 0'dan küçük olamaz!");

            if (!helicopterService.delete(id, userId)) {
                return new ResponseDto(ErrorCode.DATA_NOT_DELETE.getCode(), ErrorCode.DATA_NOT_DELETE.getMessage(),
                        false);
            }else
                return new ResponseDto(ErrorCode.OK.getCode(), ErrorCode.OK.getMessage(), true);
        } catch (Exception e) {
            return new ExceptionHandler(e,e.getMessage()).handle();
        }
    }

}
