package com.alibiner.interfaces.repository;

import com.alibiner.repositoryDto.request.vehicle.VehicleAndDetailUpdatePersistenceDto;
import com.alibiner.repositoryDto.request.vehicle.VehicleCreatePersistenceDto;
import com.alibiner.repositoryDto.request.vehicle.VehicleDetailCreatePersistenceDto;
import com.alibiner.repositoryDto.response.vehicle.VehiclePersistenceDto;

import java.sql.SQLException;
import java.util.*;

public interface IVehicleRepository {
    int create(VehicleCreatePersistenceDto dto) throws SQLException;
    int createDetails(int vehicleId, VehicleDetailCreatePersistenceDto dto) throws SQLException;
    int update(int id, VehicleAndDetailUpdatePersistenceDto dto) throws SQLException;
    int updateDetails(int id, VehicleAndDetailUpdatePersistenceDto dto) throws SQLException;
    boolean delete(int id) throws SQLException;
    List<VehiclePersistenceDto> getAll(int offset, int limit) throws SQLException;
    VehiclePersistenceDto getById(int id) throws SQLException;
    int getAllCount() throws SQLException;
    boolean isAllReadyExistDetailByVehicleId(int vehicleId) throws SQLException;
}
