package com.alibiner.serviceDto.response.user;

import com.alibiner.enums.CustomerType;
import com.alibiner.enums.Role;

public record UserServiceDto(
        int id,
        String firstName,
        String lastName,
        int age,
        Role role,
        CustomerType customerType
) {

}
