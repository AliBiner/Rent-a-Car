package com.alibiner.mappers;

import com.alibiner.interfaces.mapper.IUserMapper;
import com.alibiner.repositoryDto.request.user.UserCreatePersistenceDto;
import com.alibiner.repositoryDto.response.user.UserResponsePersistenceDto;
import com.alibiner.serviceDto.request.user.UserAddServiceDto;
import com.alibiner.serviceDto.response.user.UserServiceDto;
import com.alibiner.util.PasswordHashing;

import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;

public class UserMapper implements IUserMapper {
    @Override
    public UserCreatePersistenceDto toUserCreateDto(UserAddServiceDto dto) throws NoSuchAlgorithmException {
        return new UserCreatePersistenceDto(
                dto.firstName(),
                dto.lastName(),
                dto.email(),
                PasswordHashing.hash(dto.password()),
                dto.age(),
                dto.role(),
                dto.customerType(),
                LocalDateTime.now(),
                LocalDateTime.now()
        );
    }

    @Override
    public UserServiceDto toUserDto(UserResponsePersistenceDto dto) {
        return new UserServiceDto(
                dto.id(),
                dto.firstName(),
                dto.lastName(),
                dto.age(),
                dto.role(),
                dto.customerType()
        );
    }


}
