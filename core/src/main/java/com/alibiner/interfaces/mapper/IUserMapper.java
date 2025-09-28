package com.alibiner.interfaces.mapper;

import com.alibiner.repositoryDto.request.user.UserCreatePersistenceDto;
import com.alibiner.repositoryDto.response.user.UserResponsePersistenceDto;
import com.alibiner.serviceDto.request.user.UserAddServiceDto;
import com.alibiner.serviceDto.response.user.UserServiceDto;

import java.security.NoSuchAlgorithmException;

public interface IUserMapper {
    UserCreatePersistenceDto toUserCreateDto(UserAddServiceDto dto) throws NoSuchAlgorithmException;
    UserServiceDto toUserDto(UserResponsePersistenceDto dto);
}
