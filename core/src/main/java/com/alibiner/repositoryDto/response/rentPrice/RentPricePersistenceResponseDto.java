package com.alibiner.repositoryDto.response.rentPrice;

public record RentPricePersistenceResponseDto(
        int id,
        int vehicleId,
        Float hourlyPrice,
        Float dailyPrice,
        Float weeklyPrice,
        Float monthlyPrice
) {
}
