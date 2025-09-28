package com.alibiner.interfaces.repository;

import com.alibiner.repositoryDto.response.model.ModelResponsePersistenceDto;

import java.sql.SQLException;
import java.util.List;

public interface IModelRepository {
    List<ModelResponsePersistenceDto> getAllByBrandId(int brandId) throws SQLException;
}
