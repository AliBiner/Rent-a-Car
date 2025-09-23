package com.alibiner.services.vehicle.interfaces;

import com.alibiner.dto.request.vehicle.IVehicleRequestDto;
import com.alibiner.dto.response.vehicle.IVehicleResponseDto;
import com.alibiner.exceptions.DataNotInsertException;
import com.alibiner.exceptions.user.UserForbiddenException;
import com.alibiner.exceptions.user.UserNotFoundException;

import java.sql.SQLException;
import java.util.*;

public interface IVehicleCRUDService {
    boolean save(IVehicleRequestDto dto) throws UserForbiddenException, UserNotFoundException, SQLException, DataNotInsertException;
    IVehicleResponseDto getById(int id);
    List<IVehicleResponseDto> getAll();
    boolean update(IVehicleRequestDto car);
    boolean delete(int id);
}
