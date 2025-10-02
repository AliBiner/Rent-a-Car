package com.alibiner.services.brand;

import com.alibiner.interfaces.repository.IBrandRepository;
import com.alibiner.interfaces.service.IBrandService;
import com.alibiner.repositoryDto.response.brand.BrandPersistenceDto;

import java.util.*;
import java.sql.SQLException;

public class BrandService implements IBrandService {

    private final IBrandRepository brandRepository;

    public BrandService(IBrandRepository brandRepository) {
        this.brandRepository = brandRepository;
    }

    @Override
    public List<BrandPersistenceDto> getAll() throws SQLException {
        return brandRepository.getAll();
    }
}
