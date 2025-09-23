package com.alibiner.repository;

import com.alibiner.entity.Car;
import com.alibiner.entity.Vehicle;
import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.exceptions.DataNotInsertException;
import com.alibiner.repository.interfaces.ICRUDRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

public class CarRepository implements ICRUDRepository<Car> {
    private Connection connection;
    public CarRepository(Connection connection) {
        this.connection = connection;
    }

    @Override
    public int save(Car vehicle) throws SQLException, DataNotInsertException {
        String sql = """
                INSERT INTO car(
                brand,
                model,
                door_count,
                machine_type,
                production_year,
                is_rent,
                created_date,
                updated_date,
                at_created,
                at_updated) VALUES (?,?,?,?,?,?,?,?,?,?)
                """;

        PreparedStatement ps = connection.prepareStatement(sql);

        ps.setString(1,vehicle.getBrand());
        ps.setString(2, vehicle.getModel());
        ps.setInt(3,vehicle.getDoorCount());
        ps.setString(4,vehicle.getMachineType().name());
        ps.setString(5,vehicle.getProductionYear());
        ps.setBoolean(6,vehicle.isRent());
        ps.setTimestamp(7, Timestamp.valueOf(vehicle.getCreatedDate()));
        ps.setTimestamp(8,Timestamp.valueOf(vehicle.getUpdatedDate()));
        ps.setInt(9,vehicle.getAtCreatedId());
        ps.setInt(10,vehicle.getAtUpdatedId());


        int result = ps.executeUpdate();
        if (result==0)
            throw new DataNotInsertException(ErrorCode.DATA_NOT_INSERT);
        return result;
    }

    @Override
    public Car update(Car entity) {
        return null;
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public List<Car> getAll() {
        return List.of();
    }

    @Override
    public Car getById(int id) {
        return null;
    }


}
