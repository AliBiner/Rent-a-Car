package com.alibiner.services.vehicle.interfaces;

import com.alibiner.dto.request.vehicle.IVehicleRequestDto;
import com.alibiner.dto.response.vehicle.IVehicleResponseDto;
import com.alibiner.exceptions.DataNotInsertException;
import com.alibiner.exceptions.car.NotFoundException;
import com.alibiner.exceptions.user.UserForbiddenException;
import com.alibiner.exceptions.user.UserNotFoundException;

import java.sql.SQLException;
import java.util.*;

public interface IVehicleCRUDService {
    boolean save(IVehicleRequestDto dto) throws UserForbiddenException, UserNotFoundException, SQLException, DataNotInsertException;
    IVehicleResponseDto getById(int id) throws SQLException;
    List<IVehicleResponseDto> getAll(int adminId) throws UserForbiddenException, UserNotFoundException, SQLException;
    boolean update(IVehicleRequestDto vehicle) throws SQLException, NotFoundException, UserForbiddenException, UserNotFoundException;
    boolean delete(int id, int userId) throws UserForbiddenException, UserNotFoundException, SQLException;
}
