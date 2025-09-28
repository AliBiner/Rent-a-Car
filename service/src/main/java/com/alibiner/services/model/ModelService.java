package com.alibiner.services.model;

import com.alibiner.interfaces.repository.IModelRepository;
import com.alibiner.interfaces.service.IModelService;
import com.alibiner.repositoryDto.response.model.ModelResponsePersistenceDto;

import java.util.*;
import java.sql.SQLException;

public class ModelService implements IModelService {

    IModelRepository modelRepository;

    public ModelService(IModelRepository modelRepository) {
        this.modelRepository = modelRepository;
    }

    @Override
    public List<ModelResponsePersistenceDto> getAllByBrandId(int brandId) throws SQLException {
        return modelRepository.getAllByBrandId(brandId);
    }
}
