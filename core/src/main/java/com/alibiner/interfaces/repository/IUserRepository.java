package com.alibiner.interfaces.repository;

import com.alibiner.repositoryDto.request.user.UserCreatePersistenceDto;
import com.alibiner.repositoryDto.response.user.UserResponsePersistenceDto;

import java.sql.SQLException;

public interface IUserRepository {
    int create(UserCreatePersistenceDto dto) throws SQLException;
    UserResponsePersistenceDto getByEmail(String email) throws SQLException;
    UserResponsePersistenceDto getById(int id) throws SQLException;
}
