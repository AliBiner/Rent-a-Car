package com.alibiner.controller;

import com.alibiner.exceptionHandler.MyExceptionHandler;
import com.alibiner.interfaces.repository.IBrandRepository;
import com.alibiner.interfaces.service.IBrandService;
import com.alibiner.repository.BrandRepository;
import com.alibiner.repositoryDto.response.brand.BrandPersistenceDto;
import com.alibiner.services.brand.BrandService;
import com.alibiner.util.ResponseEntity;

import java.sql.SQLException;
import java.util.*;

public class BrandController {
    IBrandService brandService;

    public BrandController() {
        IBrandRepository brandRepository = new BrandRepository();
        this.brandService = new BrandService(brandRepository);
    }

    public ResponseEntity<List<BrandPersistenceDto>> getAll(){
        try {
            return new ResponseEntity<List<BrandPersistenceDto>>().ok(brandService.getAll());
        } catch (SQLException e) {
            return new MyExceptionHandler<List<BrandPersistenceDto>>(e).handle();
        }
    }
}
