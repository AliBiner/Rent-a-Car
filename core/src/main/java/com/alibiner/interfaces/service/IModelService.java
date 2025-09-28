package com.alibiner.interfaces.service;

import com.alibiner.repositoryDto.response.model.ModelResponsePersistenceDto;

import java.util.*;
import java.sql.SQLException;

public interface IModelService {
    List<ModelResponsePersistenceDto> getAllByBrandId(int brandId) throws SQLException;
}
