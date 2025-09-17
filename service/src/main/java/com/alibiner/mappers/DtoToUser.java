package com.alibiner.mappers;

import com.alibiner.dto.request.UserSignInRequestDto;
import com.alibiner.entity.User;

public class DtoToUser {

    public static User userSignInRequestDtoTo(UserSignInRequestDto dto){
        User user = new User();

        user.setFirstName(dto.getFirstName());
        user.setLastName(dto.getLastName());
        user.setEmail(dto.getEmail());
        user.setPassword(dto.getPassword());

        return user;
    }
}
