package com.alibiner.services;

import com.alibiner.dto.request.UserLoginRequestDto;
import com.alibiner.dto.request.UserSignInRequestDto;
import com.alibiner.dto.response.user.UserLoginResponseDto;
import com.alibiner.dto.response.user.UserSignInResponseDto;
import com.alibiner.entity.User;
import com.alibiner.enums.Role;
import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.exceptions.DataNotInsertException;
import com.alibiner.exceptions.user.UserAlreadyExistException;
import com.alibiner.exceptions.user.UserNotFoundException;
import com.alibiner.exceptions.user.UserNotMatchesException;
import com.alibiner.mappers.DtoToUser;
import com.alibiner.repository.UserRepository;
import com.alibiner.util.MyDbConnection;
import com.alibiner.util.PasswordHashing;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.SQLException;

public class UserService {

    UserRepository userRepository;
    Connection connection;

    public UserService() {
        this.connection = MyDbConnection.getInstance().getConnection();
        this.userRepository = new UserRepository(this.connection);
    }

    public UserSignInResponseDto save(UserSignInRequestDto dto) throws SQLException, NoSuchAlgorithmException, UserAlreadyExistException, DataNotInsertException {

        if (isAlreadyExist(dto.getEmail())) {
            throw new UserAlreadyExistException(ErrorCode.USER_ALREADY_EXIST);
        }

        //Dto Mapping
        User user =  DtoToUser.userSignInRequestDtoTo(dto);

        // throw exception while doesnt insert statement
        userRepository.save(user);


        //Kayıt işlemi başarılı durumu
        User result = userRepository.getByEmail(dto.getEmail());

        connection.commit();

        //Response Body
        return new UserSignInResponseDto(result.getId(), result.getEmail(), result.getFullName());
    }

    public boolean isAlreadyExist(String email) throws SQLException {
        return userRepository.isAlreadyExist(email);
    }

    public UserLoginResponseDto login(UserLoginRequestDto dto) throws SQLException, NoSuchAlgorithmException, UserNotFoundException, UserNotMatchesException {

        User user = getByEmail(dto.getEmail());

        if (user == null){
            throw new UserNotFoundException(ErrorCode.USER_NOT_FOUND);
        }

        String passwordHash = PasswordHashing.hash(dto.getPassword());

        if (!passwordHash.equals(user.getPassword())){
            throw new UserNotMatchesException(ErrorCode.USER_NOT_MATCHES);
        }

        return new UserLoginResponseDto(user.getId(), user.getFirstName(), user.getLastName(),user.getRole(),user.getCustomerType());
    }

    public User getByEmail(String email) throws SQLException {
        return userRepository.getByEmail(email);
    }

    public boolean isAdmin(int id) throws SQLException, UserNotFoundException {
        User user = userRepository.getById(id);
        if (user == null){
            throw new UserNotFoundException(ErrorCode.USER_NOT_FOUND);
        }

        if (user.getRole().equals(Role.ADMIN)){
            return true;
        }
        return false;
    }
}
