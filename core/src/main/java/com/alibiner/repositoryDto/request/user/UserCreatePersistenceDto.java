package com.alibiner.repositoryDto.request.user;

import com.alibiner.enums.CustomerType;
import com.alibiner.enums.Role;

import java.time.LocalDateTime;

public record UserCreatePersistenceDto(
        String firstName,
        String lastName,
        String email,
        String password,
        int age,
        Role role,
        CustomerType customerType,
        LocalDateTime createdDate,
        LocalDateTime updatedDate
) {
}
