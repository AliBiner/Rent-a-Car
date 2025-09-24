package com.alibiner.repository;

import com.alibiner.entity.Car;
import com.alibiner.entity.Vehicle;
import com.alibiner.enums.car.MachineType;
import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.exceptions.DataNotInsertException;
import com.alibiner.repository.interfaces.ICRUDRepository;

import java.sql.*;
import java.util.ArrayList;
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
    public int update(Car entity) throws SQLException {
        String sql = """
                UPDATE car
                SET brand = ?
                ,model = ?
                ,door_count = ?
                ,machine_type = ?
                ,production_year = ?
                ,is_rent = ?
                ,created_date =?
                ,updated_date = ?
                ,at_created=?
                ,at_updated = ?
                WHERE id = ?
                """;

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, entity.getBrand());
        ps.setString(2, entity.getModel());
        ps.setInt(3,entity.getDoorCount());
        ps.setString(4,entity.getMachineType().name());
        ps.setString(5,entity.getProductionYear());
        ps.setBoolean(6, entity.isRent());
        ps.setTimestamp(7,Timestamp.valueOf(entity.getCreatedDate()));
        ps.setTimestamp(8,Timestamp.valueOf(entity.getUpdatedDate()));
        ps.setInt(9,entity.getAtCreatedId());
        ps.setInt(10,entity.getAtUpdatedId());
        ps.setInt(11,entity.getId());

        return ps.executeUpdate();
    }

    @Override
    public boolean delete(int id) throws SQLException {
        String sql = """
                DELETE FROM car
                WHERE id = ?
                """;

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,id);
        int result = ps.executeUpdate();
        if (result <= 0)
            return false;
        return true;
    }

    @Override
    public List<Car> getAll() throws SQLException {
        String sql = """
                SELECT * FROM car
                """;
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        return setCars(resultSet);
    }

    @Override
    public Car getById(int id) throws SQLException {
        String sql = """
                SELECT * FROM car
                WHERE id = ?
                """;

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,id);
        ResultSet resultSet = ps.executeQuery();
        return setCar(resultSet);
    }

    private List<Car> setCars(ResultSet rs) throws SQLException {
        ArrayList<Car> cars = new ArrayList<>();
        while (rs.next()){
            cars.add(
                    new Car(
                            rs.getInt("id"),
                            rs.getString("brand"),
                            rs.getString("model"),
                            rs.getBoolean("is_rent"),
                            rs.getTimestamp("created_date").toLocalDateTime(),
                            rs.getTimestamp("updated_date").toLocalDateTime(),
                            rs.getInt("at_created"),
                            null,
                            rs.getInt("at_updated"),
                            null,
                            rs.getInt("door_count"),
                            MachineType.valueOf(rs.getString("machine_type")),
                            rs.getString("production_year")
                    )
            ) ;
        }
        return cars;
    }

    private Car setCar(ResultSet rs) throws SQLException {
        while (rs.next()){
                 return  new Car(
                            rs.getInt("id"),
                            rs.getString("brand"),
                            rs.getString("model"),
                            rs.getBoolean("is_rent"),
                            rs.getTimestamp("created_date").toLocalDateTime(),
                            rs.getTimestamp("updated_date").toLocalDateTime(),
                            rs.getInt("at_created"),
                            null,
                            rs.getInt("at_updated"),
                            null,
                            rs.getInt("door_count"),
                            MachineType.valueOf(rs.getString("machine_type")),
                            rs.getString("production_year")
                    );
        }
        return null;
    }

}
