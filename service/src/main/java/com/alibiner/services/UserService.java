package com.alibiner.services;

import com.alibiner.interfaces.mapper.IUserMapper;
import com.alibiner.interfaces.repository.IUserRepository;
import com.alibiner.interfaces.service.IUserService;
import com.alibiner.interfaces.unitOfWork.IUnitOfWork;
import com.alibiner.repositoryDto.request.user.UserCreatePersistenceDto;
import com.alibiner.repositoryDto.response.user.UserResponsePersistenceDto;
import com.alibiner.serviceDto.request.user.UserAddServiceDto;
import com.alibiner.serviceDto.response.user.UserServiceDto;
import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.exceptions.user.UserAlreadyExistException;
import com.alibiner.exceptions.user.UserNotFoundException;
import com.alibiner.exceptions.user.UserNotMatchesException;
import com.alibiner.util.PasswordHashing;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

public class UserService implements IUserService {

    private final IUserRepository userRepository;
    private final IUnitOfWork unitOfWork;
    private final IUserMapper userMapper;

    public UserService(IUserRepository userRepository, IUnitOfWork unitOfWork, IUserMapper userMapper) {
        this.userRepository = userRepository;
        this.unitOfWork = unitOfWork;
        this.userMapper = userMapper;
    }

    @Override
    public boolean create(UserAddServiceDto dto) throws SQLException, UserAlreadyExistException, NoSuchAlgorithmException {
        if (isAlreadyExist(dto.email()))
            throw new UserAlreadyExistException(ErrorCode.USER_ALREADY_EXIST);

        UserCreatePersistenceDto createDto = userMapper.toUserCreateDto(dto);

        int result = userRepository.create(createDto);
        if (result<=0){
            unitOfWork.rollback();
            return false;
        }

        unitOfWork.commit();
        return true;
    }

    @Override
    public UserServiceDto login(String email, String password) throws SQLException, UserNotFoundException, NoSuchAlgorithmException, UserNotMatchesException {
        UserResponsePersistenceDto userResponsePersistenceDto = userRepository.getByEmail(email);
        if (userResponsePersistenceDto == null){
            throw new UserNotFoundException(ErrorCode.USER_NOT_FOUND);
        }

        String passwordHash = PasswordHashing.hash(password);

        if (!passwordHash.equals(userResponsePersistenceDto.password())){
            throw new UserNotMatchesException(ErrorCode.USER_NOT_MATCHES);
        }

        return userMapper.toUserDto(userResponsePersistenceDto);
    }

    @Override
    public UserServiceDto getByEmail(String email) throws SQLException, UserNotFoundException {
        UserResponsePersistenceDto dto = userRepository.getByEmail(email);

        if (dto==null)
            throw new UserNotFoundException(ErrorCode.USER_NOT_FOUND);

        return userMapper.toUserDto(dto);
    }

    @Override
    public UserServiceDto getById(int id) throws SQLException, UserNotFoundException {
        if (id<=0)
            throw new IllegalArgumentException("Id 0'dan küçük olamaz!");

        UserResponsePersistenceDto userResponsePersistenceDto = userRepository.getById(id);

        if (userResponsePersistenceDto==null)
            throw new UserNotFoundException(ErrorCode.USER_NOT_FOUND);

        return userMapper.toUserDto(userResponsePersistenceDto);
    }

    private boolean isAlreadyExist(String email) throws SQLException {
        UserResponsePersistenceDto responseDto = userRepository.getByEmail(email);
        return responseDto != null;
    }
}
