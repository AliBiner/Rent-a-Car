package com.alibiner.mappers;

import com.alibiner.dto.request.UserSignInRequestDto;
import com.alibiner.entity.User;
import com.alibiner.util.PasswordHashing;

import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;

public class DtoToUser {

    public static User userSignInRequestDtoTo(UserSignInRequestDto dto) throws NoSuchAlgorithmException {
        User user = new User();

        user.setFirstName(dto.getFirstName());
        user.setLastName(dto.getLastName());
        user.setEmail(dto.getEmail());
        user.setCreatedDate(LocalDateTime.now());

        //hash
        user.setPassword(PasswordHashing.hash(dto.getPassword()));

        return user;
    }
}
