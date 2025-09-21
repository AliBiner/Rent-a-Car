package com.alibiner.services;

import com.alibiner.dto.request.car.CarAddRequestDTO;
import com.alibiner.dto.response.car.CarAddResponseDTO;
import com.alibiner.entity.Car;
import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.exceptions.DataNotInsertException;
import com.alibiner.exceptions.user.UserForbiddenException;
import com.alibiner.exceptions.user.UserNotFoundException;
import com.alibiner.mappers.DtoToCar;
import com.alibiner.repository.CarRepository;
import com.alibiner.util.MyDbConnection;

import java.sql.Connection;
import java.sql.SQLException;

public class CarService {
    private Connection connection;
    private UserService userService;
    private CarRepository carRepository;

    public CarService() {
        this.connection = MyDbConnection.getInstance().getConnection();
        userService = new UserService();
        carRepository = new CarRepository(this.connection);
    }

    public CarAddResponseDTO save(CarAddRequestDTO dto) throws UserNotFoundException, SQLException, UserForbiddenException, DataNotInsertException {

        if (!userService.isAdmin(dto.getAtCreated())) {
            throw new UserForbiddenException(ErrorCode.FORBIDDEN);
        }

        Car car = DtoToCar.carAddRequestDtoTo(dto);

        connection.commit();

        return new CarAddResponseDTO(dto.getBrand());

        //Todo - Kayıt işlemi

        //Todo - return işlemi yapılacak.

//        return null;
    }

}
