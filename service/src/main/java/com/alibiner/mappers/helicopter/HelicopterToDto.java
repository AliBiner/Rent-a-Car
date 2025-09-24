package com.alibiner.mappers.helicopter;

import com.alibiner.dto.response.vehicle.helicopter.AdminGetHelicopterResponseDto;
import com.alibiner.entity.Helicopter;

public class HelicopterToDto {
    public static AdminGetHelicopterResponseDto ToAdminGetHelicopterResponseDto(Helicopter helicopter){
        return new AdminGetHelicopterResponseDto(
                helicopter.getId(),
                helicopter.getBrand(),
                helicopter.getModel(),
                helicopter.getMaxRange(),
                helicopter.getWingCount(),
                helicopter.getPassengerCount(),
                helicopter.getPilotCount(),
                helicopter.isRent(),
                helicopter.getProductionYear(),
                helicopter.getCreatedDate(),
                helicopter.getUpdatedDate(),
                helicopter.getAtCreatedId(),
                helicopter.getAtUpdatedId()
        );
    }
}
