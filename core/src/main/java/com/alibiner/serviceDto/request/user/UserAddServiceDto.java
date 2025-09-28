package com.alibiner.serviceDto.request.user;

import com.alibiner.enums.CustomerType;
import com.alibiner.enums.Role;

public record UserAddServiceDto(
        String firstName,
        String lastName,
        String email,
        String password,
        int age,
        Role role,
        CustomerType customerType) {
}
