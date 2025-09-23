package com.alibiner.validations;

import com.alibiner.dto.request.vehicle.car.CarAddRequestDTO;

import java.util.ArrayList;

public class CarValidation {
    public static class CarAddValidation{
        public static ArrayList<String> validate(CarAddRequestDTO dto){
            ArrayList<String> errorMessages = new ArrayList<>(6);

            if (dto.getBrand() == null)
                errorMessages.add("Otomobil marka bilgisi null olamaz!");
            else if(dto.getBrand().isBlank())
                errorMessages.add("Otomobil marka bilgisi boş olamaz!");

            if (dto.getModel()==null){
                errorMessages.add("Otomobil model bilgisi null olamaz!");
            } else if (dto.getModel().isBlank()) {
                errorMessages.add("Otomobil model bilgisi boş olamaz!");
            }

            if (dto.getDoorCount()<=0){
                errorMessages.add("Otomobil kapı bilgisi 0 ve 0'dan küçük olamaz!");
            }

            if (dto.getMachineType()==null){
                errorMessages.add("Otomobil Motor Tipi bilgisi null olamaz!");
            }

            if (dto.getProductionYear()== null){
                errorMessages.add("Otomobil üretim yılı bilgisi null olamaz!");
            } else if (dto.getProductionYear().isBlank()) {
                errorMessages.add("Otomobil üretim yılı bilgisi boş olamaz!");
            }

            if (dto.getAtCreated()<=0){
                errorMessages.add("Geçersiz Id bilgisi!");
            }

            return errorMessages;
        }
    }
}
