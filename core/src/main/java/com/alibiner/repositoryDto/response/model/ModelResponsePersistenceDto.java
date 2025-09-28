package com.alibiner.repositoryDto.response.model;

public record ModelResponsePersistenceDto(
        int id,
        String model
) {

    @Override
    public String toString() {
        return
                "id=" + id +
                ", model='" + model ;
    }
}
