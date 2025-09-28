package com.alibiner.interfaces.service;


import com.alibiner.exceptions.user.UserAlreadyExistException;
import com.alibiner.exceptions.user.UserNotFoundException;
import com.alibiner.exceptions.user.UserNotMatchesException;
import com.alibiner.serviceDto.request.user.UserAddServiceDto;
import com.alibiner.serviceDto.response.user.UserServiceDto;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;


public interface IUserService {
    boolean create(UserAddServiceDto dto) throws SQLException, UserAlreadyExistException, NoSuchAlgorithmException;
    UserServiceDto login(String email, String password) throws SQLException, UserNotFoundException, NoSuchAlgorithmException, UserNotMatchesException;
    UserServiceDto getByEmail(String email) throws SQLException, UserNotFoundException;
    UserServiceDto getById(int id) throws SQLException, UserNotFoundException;
}
