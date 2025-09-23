package com.alibiner.services.vehicle;

import com.alibiner.dto.request.vehicle.IVehicleRequestDto;
import com.alibiner.dto.request.vehicle.car.CarAddRequestDTO;
import com.alibiner.dto.response.vehicle.IVehicleResponseDto;
import com.alibiner.dto.response.vehicle.car.CarAddResponseDTO;
import com.alibiner.entity.Car;
import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.exceptions.DataNotInsertException;
import com.alibiner.exceptions.user.UserForbiddenException;
import com.alibiner.exceptions.user.UserNotFoundException;
import com.alibiner.mappers.DtoToCar;
import com.alibiner.repository.CarRepository;
import com.alibiner.services.UserService;
import com.alibiner.services.vehicle.interfaces.IVehicleCRUDService;
import com.alibiner.util.MyDbConnection;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class CarService implements IVehicleCRUDService {
    private Connection connection;
    private UserService userService;
    private CarRepository carRepository;

    public CarService() {
        this.connection = MyDbConnection.getInstance().getConnection();
        userService = new UserService();
        carRepository = new CarRepository(this.connection);
    }


    @Override
    public boolean save(IVehicleRequestDto dto) throws UserForbiddenException, UserNotFoundException, SQLException, DataNotInsertException {
        CarAddRequestDTO castDto = (CarAddRequestDTO) dto;
        if (!userService.isAdmin(castDto.getAtCreated())) {
            throw new UserForbiddenException(ErrorCode.FORBIDDEN);
        }

        Car car = DtoToCar.carAddRequestDtoTo(castDto);

        int result = carRepository.save(car);

        connection.commit();

        return true;
    }

    @Override
    public IVehicleResponseDto getById(int id) {
        return null;
    }

    @Override
    public List<IVehicleResponseDto> getAll() {
        return List.of();
    }

    @Override
    public boolean update(IVehicleRequestDto car) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }
}
