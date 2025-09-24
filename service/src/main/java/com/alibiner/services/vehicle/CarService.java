package com.alibiner.services.vehicle;

import com.alibiner.dto.request.vehicle.IVehicleRequestDto;
import com.alibiner.dto.request.vehicle.car.CarAddRequestDTO;
import com.alibiner.dto.request.vehicle.car.CarUpdateRequestDto;
import com.alibiner.dto.response.vehicle.IVehicleResponseDto;
import com.alibiner.dto.response.vehicle.car.AdminGetCarResponseDto;
import com.alibiner.entity.Car;
import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.exceptions.DataNotInsertException;
import com.alibiner.exceptions.car.NotFoundException;
import com.alibiner.exceptions.user.UserForbiddenException;
import com.alibiner.exceptions.user.UserNotFoundException;
import com.alibiner.mappers.CarToDto;
import com.alibiner.mappers.DtoToCar;
import com.alibiner.repository.CarRepository;
import com.alibiner.services.UserService;
import com.alibiner.services.vehicle.interfaces.IVehicleCRUDService;
import com.alibiner.util.MyDbConnection;

import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class CarService implements IVehicleCRUDService {
    private Connection connection;
    private UserService userService;
    private CarRepository carRepository;

    public CarService()  {
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
    public IVehicleResponseDto getById(int id) throws SQLException {
        Car car =  carRepository.getById(id);
        return  CarToDto.toAdminGetCarResponseDto(car);
    }

    @Override
    public List<IVehicleResponseDto> getAll(int adminId) throws UserForbiddenException, UserNotFoundException, SQLException {
        if (!userService.isAdmin(adminId)) {
            throw new UserForbiddenException(ErrorCode.FORBIDDEN);
        }

        List<Car> carList = carRepository.getAll();
        ArrayList<IVehicleResponseDto> resultList = new ArrayList<>();

        for (Car car : carList){
            resultList.add(CarToDto.toAdminGetCarResponseDto(car));
        }

        return resultList;
    }

    @Override
    public boolean update(IVehicleRequestDto vehicle) throws SQLException, NotFoundException, UserForbiddenException, UserNotFoundException {

        // Yetki kontrolü
        CarUpdateRequestDto dto = (CarUpdateRequestDto) vehicle;
        if (!userService.isAdmin(dto.atUpdated())) {
            throw new UserForbiddenException(ErrorCode.FORBIDDEN);
        }

        Car car = carRepository.getById(dto.id());

        if (car==null){
            throw new NotFoundException(ErrorCode.NOT_FOUND);
        }

        Car newCar = new Car(
                car.getId(),
                dto.brand(),
                dto.model(),
                car.isRent(),
                car.getCreatedDate(),
                LocalDateTime.now(),
                car.getAtCreatedId(),
                null,
                dto.atUpdated(),
                null,
                dto.doorCount(),
                dto.machineType(),
                dto.productionYear());


        if (carRepository.update(newCar)<=0){
            return false;
        }
        connection.commit();
        return true;
    }

    @Override
    public boolean delete(int id, int userId) throws UserForbiddenException, UserNotFoundException, SQLException {
        if (!userService.isAdmin(userId)) {
            throw new UserForbiddenException(ErrorCode.FORBIDDEN);
        }
        boolean result = carRepository.delete(id);
        connection.commit();
        return result;
    }
}
