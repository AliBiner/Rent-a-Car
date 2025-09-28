package com.alibiner.repositoryDto.response.brand;

public record BrandPersistenceDto (int id, String brand){
    @Override
    public String toString() {
        return
                "id=" + id +
                ", marka='" + brand ;
    }
}
