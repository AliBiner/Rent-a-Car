package com.alibiner.dto.response.user;

import com.alibiner.enums.CustomerType;
import com.alibiner.enums.Role;

public class UserLoginResponseDto {
    private final int id;
    private final String firstName;
    private final String lastName;
    private final Role role;
    private final CustomerType customerType;

    public UserLoginResponseDto(int id, String firstName, String lastName, Role role, CustomerType customerType) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.role = role;
        this.customerType = customerType;
    }

    public int getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public Role getRole() {
        return role;
    }

    public CustomerType getCustomerType() {
        return customerType;
    }
}
