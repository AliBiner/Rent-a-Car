package com.alibiner.mappers;

import com.alibiner.dto.request.UserSignInRequestDto;
import com.alibiner.entity.User;
import com.alibiner.util.PasswordHashing;

import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;

public class DtoToUser {

    public static User userSignInRequestDtoTo(UserSignInRequestDto dto) throws NoSuchAlgorithmException {

        String hashPass = PasswordHashing.hash(dto.getPassword());

        User user = new User(dto.getFirstName(),
                dto.getLastName(),
                dto.getEmail(),
                hashPass,
                LocalDateTime.now(),
                LocalDateTime.now(),
                dto.getRole(),
                dto.getCustomerType()
                );

        return user;
    }
}
