package com.alibiner.controller;

import com.alibiner.exceptionHandler.MyExceptionHandler;
import com.alibiner.interfaces.mapper.IUserMapper;
import com.alibiner.interfaces.repository.IUserRepository;
import com.alibiner.interfaces.service.IUserService;
import com.alibiner.interfaces.unitOfWork.IUnitOfWork;
import com.alibiner.mappers.UserMapper;
import com.alibiner.repository.UserRepository;
import com.alibiner.serviceDto.request.user.UserAddServiceDto;
import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.exceptions.ValidationException;
import com.alibiner.serviceDto.response.user.UserServiceDto;
import com.alibiner.services.UserService;
import com.alibiner.util.Regex;
import com.alibiner.util.ResponseEntity;
import com.alibiner.util.UnitOfWork;
import com.alibiner.validations.UserValidation;
import java.util.*;

public class UserController {

    private final IUserService userService;

    public UserController() {
        IUserRepository userRepository = new UserRepository();
        IUnitOfWork unitOfWork = new UnitOfWork();
        IUserMapper userMapper = new UserMapper();
        this.userService = new UserService(userRepository, unitOfWork,userMapper);
    }

    public ResponseEntity<Boolean> signIn(UserAddServiceDto dto){
        try {
            final List<String> errorMessages = UserValidation.UserAddServiceDtoValidation.validate(dto);
            if (!errorMessages.isEmpty()){
                throw new ValidationException(ErrorCode.VALIDATION,errorMessages);
            }

            return new ResponseEntity<Boolean>().ok(userService.create(dto));
        }
        catch (Exception e){
            return new MyExceptionHandler<Boolean>(e).handle();
        }
    }

    public ResponseEntity<UserServiceDto> login(String email, String password){
        try {
            if (email==null)
                throw new ValidationException(ErrorCode.VALIDATION,"Email null olamaz!");
            else if (!email.matches(Regex.EMAIL))
                throw new ValidationException(ErrorCode.VALIDATION,"Geçersiz Email Formatı!");

            if (password == null){
                throw new ValidationException(ErrorCode.VALIDATION,"Şifre null olamaz!");
            }
            else if (password.isBlank())
                throw new ValidationException(ErrorCode.VALIDATION,"Şifre bilgisi boş olamaz");

            return new ResponseEntity<UserServiceDto>().ok(userService.login(email, password));

        } catch (Exception e) {
            return new MyExceptionHandler<UserServiceDto>(e).handle();
        }
    }
}
