package com.alibiner.dto.response.user;

public class UserSignInResponseDto{
    private int id;
    private String email;
    private String fullName;

    public UserSignInResponseDto(int id, String email, String fullName) {
        this.id = id;
        this.email = email;
        this.fullName = fullName;
    }

    public int getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public String getFullName() {
        return fullName;
    }

    @Override
    public String toString() {
        return "UserSignInResponseDto{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", fullName='" + fullName + '\'' +
                '}';
    }
}
