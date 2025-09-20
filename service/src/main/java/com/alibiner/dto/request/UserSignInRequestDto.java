package com.alibiner.dto.request;

import com.alibiner.enums.CustomerType;
import com.alibiner.enums.Role;

public class UserSignInRequestDto {
    private final String firstName;
    private final String lastName;
    private final String email;
    private final String password;
    private final Role role;
    private final CustomerType customerType;

    public UserSignInRequestDto(String firstName, String lastName, String email, String password, Role role, CustomerType customerType) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.role = role;
        this.customerType = customerType;
    }

    public UserSignInRequestDto(String firstName, String lastName, String email, String password, Role role) {
        this(firstName,lastName,email,password,role,null);
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public Role getRole() {
        return role;
    }
    public CustomerType getCustomerType() {
        return customerType;
    }
}
