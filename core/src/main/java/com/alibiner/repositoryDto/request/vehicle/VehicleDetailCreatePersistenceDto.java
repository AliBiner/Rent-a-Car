package com.alibiner.repositoryDto.request.vehicle;

public record VehicleDetailCreatePersistenceDto(
        int doorCount,
        int cc,
        int maxRange,
        int wingCount,
        int pilotCount) {
}
