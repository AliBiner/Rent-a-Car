package com.alibiner.repositoryDto.response.user;

import com.alibiner.enums.CustomerType;
import com.alibiner.enums.Role;

public record UserResponsePersistenceDto(
        int id,
        String firstName,
        String lastName,
        String email,
        String password,
        int age,
        Role role,
        CustomerType customerType
) {
}
