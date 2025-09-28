package com.alibiner.interfaces.repository;

import com.alibiner.repositoryDto.response.brand.BrandPersistenceDto;

import java.sql.SQLException;
import java.util.*;

public interface IBrandRepository {
    List<BrandPersistenceDto> getAll() throws SQLException;
}
