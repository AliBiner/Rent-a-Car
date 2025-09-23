package com.alibiner.entity;

import com.alibiner.enums.CustomerType;
import com.alibiner.enums.Role;

import java.time.LocalDateTime;

public class User extends BaseEntity {
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private LocalDateTime createdDate;
    private LocalDateTime updatedDate;
    private Role role;
    private CustomerType customerType;

    public User(int id, String firstName, String lastName, String email, String password, LocalDateTime createdDate, LocalDateTime updatedDate, Role role, CustomerType customerType) {
        super(id);
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
        this.role = role;
        this.customerType = customerType;
    }

    //For customer
    public User(String firstName, String lastName, String email, String password, LocalDateTime createdDate, LocalDateTime updatedDate, Role role, CustomerType customerType) {
        this(0, firstName, lastName, email, password, createdDate, updatedDate, role, customerType);
    }

    //For Admin
    public User(String firstName, String lastName, String email, String password, LocalDateTime createdDate, LocalDateTime updatedDate, Role role) {
        this(0, firstName, lastName, email, password, createdDate, updatedDate, role, CustomerType.NULL);
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


    public LocalDateTime getCreatedDate() {
        return createdDate;
    }


    public LocalDateTime getUpdatedDate() {
        return updatedDate;
    }


    public String getFullName(){
        return firstName + " " + lastName;
    }

    public Role getRole() {
        return role;
    }

    public CustomerType getCustomerType() {
        return customerType;
    }

}
