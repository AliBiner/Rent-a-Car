package com.alibiner.repositoryDto.request.rentPrice;

public record RentPriceCreatePersistenceDto(
        int vehicleId,
        Float hourlyPrice,
        Float dailyPrice,
        Float weeklyPrice,
        Float monthPrice
) {
}
