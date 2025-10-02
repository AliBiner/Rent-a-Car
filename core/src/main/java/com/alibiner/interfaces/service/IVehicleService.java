package com.alibiner.interfaces.service;


import com.alibiner.enums.vehicle.VehicleType;
import com.alibiner.exceptions.general.NotFoundException;
import com.alibiner.exceptions.user.UserForbiddenException;
import com.alibiner.exceptions.user.UserNotFoundException;
import com.alibiner.repositoryDto.response.vehicle.VehiclePersistenceDto;
import com.alibiner.serviceDto.request.vehicle.create.VehicleCreateServiceDto;
import com.alibiner.serviceDto.request.vehicle.create.VehicleAndDetailAddServiceDto;
import com.alibiner.serviceDto.request.vehicle.create.VehicleDetailAddServiceDto;
import com.alibiner.serviceDto.request.vehicle.update.VehicleUpdateServiceDto;
import com.alibiner.serviceDto.response.vehicle.GetAllVehicleResponseServiceDto;
import com.alibiner.serviceDto.response.vehicle.VehicleDetailServiceDto;
import com.alibiner.serviceDto.response.vehicle.VehicleResponseServiceDto;

import java.util.*;
import java.sql.SQLException;


public interface IVehicleService {
    int createVehicle(VehicleCreateServiceDto dto) throws SQLException, UserForbiddenException, UserNotFoundException;
    int createVehicleDetail(int vehicleId, VehicleDetailAddServiceDto dto) throws SQLException, UserForbiddenException, UserNotFoundException;
    int createVehicleAndDetail(VehicleAndDetailAddServiceDto dto) throws SQLException, UserForbiddenException, UserNotFoundException;

    boolean update(int id, VehicleUpdateServiceDto dto ) throws UserForbiddenException, SQLException, NotFoundException, UserNotFoundException;

    VehicleResponseServiceDto getById(int id) throws SQLException, UserNotFoundException, NotFoundException;

    boolean delete(int id, int userId) throws SQLException, UserForbiddenException, UserNotFoundException;

    GetAllVehicleResponseServiceDto getAll(int offset, int limit) throws SQLException;

    GetAllVehicleResponseServiceDto getAll(int offset, int limit, int modelID) throws SQLException;
    GetAllVehicleResponseServiceDto getAll(int offset, int limit, VehicleType vehicleType) throws SQLException;
    GetAllVehicleResponseServiceDto getAll(int offset, int limit, float minPrice, float maxPrice) throws SQLException;

    VehicleDetailServiceDto getDetailById(int id) throws SQLException;

}
