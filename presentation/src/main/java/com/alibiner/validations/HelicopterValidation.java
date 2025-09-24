package com.alibiner.validations;

import com.alibiner.dto.request.vehicle.helicopter.HelicopterAddRequestDto;
import com.alibiner.dto.request.vehicle.helicopter.HelicopterUpdateRequestDto;

import java.util.*;

public class HelicopterValidation {
    public static class AddRequestDto{
        public static List<String> validate(HelicopterAddRequestDto dto){
            List<String> errorMessages = new ArrayList<>();

            if (dto.brand() == null)
                errorMessages.add("Helicopter marka bilgisi null olamaz!");
            else if(dto.brand().isBlank())
                errorMessages.add("Helicopter marka bilgisi boş olamaz!");

            if (dto.model()==null){
                errorMessages.add("Helicopter model bilgisi null olamaz!");
            } else if (dto.model().isBlank()) {
                errorMessages.add("Helicopter model bilgisi boş olamaz!");
            }

            if (dto.productionYear()== null){
                errorMessages.add("Helicopter üretim yılı bilgisi null olamaz!");
            } else if (dto.productionYear().isBlank()) {
                errorMessages.add("Helicopter üretim yılı bilgisi boş olamaz!");
            }

            if (dto.maxRange()<=0){
                errorMessages.add("Helicopter maksimum mesafe bilgisi 0 ve 0'dan küçük olamaz!");
            }

            if (dto.wingCount()<=0){
                errorMessages.add("Helicopter kanat bilgisi 0 ve 0'dan küçük olamaz!");
            }

            if (dto.pilotCount()<=0){
                errorMessages.add("Helicopter pilot bilgisi 0 ve 0'dan küçük olamaz!");
            }

            if (dto.atCreated()<=0){
                errorMessages.add("Geçersiz Id bilgisi!");
            }

            return errorMessages;
        }

        public static List<String> validate(HelicopterUpdateRequestDto dto){
            List<String> errorMessages = new ArrayList<>();

            if (dto.brand() == null)
                errorMessages.add("Helicopter marka bilgisi null olamaz!");
            else if(dto.brand().isBlank())
                errorMessages.add("Helicopter marka bilgisi boş olamaz!");

            if (dto.model()==null){
                errorMessages.add("Helicopter model bilgisi null olamaz!");
            } else if (dto.model().isBlank()) {
                errorMessages.add("Helicopter model bilgisi boş olamaz!");
            }

            if (dto.productionYear()== null){
                errorMessages.add("Helicopter üretim yılı bilgisi null olamaz!");
            } else if (dto.productionYear().isBlank()) {
                errorMessages.add("Helicopter üretim yılı bilgisi boş olamaz!");
            }

            if (dto.maxRange()<=0){
                errorMessages.add("Helicopter maksimum mesafe bilgisi 0 ve 0'dan küçük olamaz!");
            }

            if (dto.wingCount()<=0){
                errorMessages.add("Helicopter kanat bilgisi 0 ve 0'dan küçük olamaz!");
            }

            if (dto.pilotCount()<=0){
                errorMessages.add("Helicopter pilot bilgisi 0 ve 0'dan küçük olamaz!");
            }

            if (dto.atUpdated()<=0){
                errorMessages.add("Geçersiz Id bilgisi!");
            }

            return errorMessages;
        }
    }
}
