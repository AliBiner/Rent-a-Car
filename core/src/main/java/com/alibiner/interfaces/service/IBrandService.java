package com.alibiner.interfaces.service;

import com.alibiner.repositoryDto.response.brand.BrandPersistenceDto;

import java.util.*;
import java.sql.SQLException;

public interface IBrandService {
    List<BrandPersistenceDto> getAll() throws SQLException;
}
