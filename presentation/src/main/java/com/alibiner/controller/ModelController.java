package com.alibiner.controller;

import com.alibiner.exceptionHandler.MyExceptionHandler;
import com.alibiner.interfaces.repository.IModelRepository;
import com.alibiner.interfaces.service.IModelService;
import com.alibiner.repository.ModelRepository;
import com.alibiner.repositoryDto.response.model.ModelResponsePersistenceDto;
import com.alibiner.services.model.ModelService;
import com.alibiner.util.ResponseEntity;

import java.util.*;

public class ModelController {
    IModelService modelService;

    public ModelController() {
        IModelRepository modelRepository = new ModelRepository();
        this.modelService = new ModelService(modelRepository);
    }

    public ResponseEntity<List<ModelResponsePersistenceDto>> getAllByBrandId(int brandId){
        try {
            List<ModelResponsePersistenceDto> allModels = modelService.getAllByBrandId(brandId);
            return new ResponseEntity<List<ModelResponsePersistenceDto>>().ok(allModels);
        }catch (Exception e){
            return new MyExceptionHandler<List<ModelResponsePersistenceDto>>(e).handle();
        }
    }
}
