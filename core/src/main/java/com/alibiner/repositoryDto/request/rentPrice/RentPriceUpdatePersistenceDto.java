package com.alibiner.repositoryDto.request.rentPrice;

public record RentPriceUpdatePersistenceDto(
        float hourlyPrice,
        float dailyPrice,
        float weeklyPrice,
        float monthPrice
) {
}
