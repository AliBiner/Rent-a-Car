package com.alibiner.repository;

import com.alibiner.enums.car.MachineType;
import com.alibiner.enums.vehicle.VehicleType;
import com.alibiner.repositoryDto.request.vehicle.VehicleAndDetailUpdatePersistenceDto;
import com.alibiner.repositoryDto.request.vehicle.VehicleCreatePersistenceDto;
import com.alibiner.repositoryDto.request.vehicle.VehicleDetailCreatePersistenceDto;
import com.alibiner.repositoryDto.response.vehicle.VehiclePersistenceDto;
import com.alibiner.interfaces.repository.IVehicleRepository;
import com.alibiner.util.MyDbConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VehicleRepository implements IVehicleRepository {
    private final Connection connection;

    public VehicleRepository() {
        this.connection = MyDbConnection.getInstance().getConnection();
    }


    @Override
    public int create(VehicleCreatePersistenceDto dto) throws SQLException {

        String sql = """
                INSERT INTO vehicle(
                    model_id,
                    vehicle_type,
                    price,
                    at_created,
                    at_updated)
                VALUES(?,?,?,?,?);
                """;
        PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        ps.setInt(1,dto.modelId());
        ps.setInt(2,dto.vehicleType().ordinal());
        ps.setFloat(3,dto.price());
        ps.setInt(4,dto.atCreated());
        ps.setInt(5,dto.atCreated());
        int affectedRows = ps.executeUpdate();
        if (affectedRows>0){
            try(ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next())
                    return rs.getInt(1);
            }
        }
        return affectedRows;
    }

    @Override
    public int createDetails(int vehicleId, VehicleDetailCreatePersistenceDto dto) throws SQLException {
        String sql = """
                INSERT INTO vehicle_details(
                	vehicle_id,
                	door_count,
                	cc,
                	max_range,
                	wing_count,
                	pilot_count) VALUES (?,?,?,?,?,?)
                """;
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,vehicleId);
        ps.setInt(2,dto.doorCount());
        ps.setInt(3,dto.cc());
        ps.setInt(4,dto.maxRange());
        ps.setInt(5,dto.wingCount());
        ps.setInt(6,dto.pilotCount());
        return ps.executeUpdate();
    }

    @Override
    public int update(int id, VehicleAndDetailUpdatePersistenceDto dto) throws SQLException {
        String sql = """
                UPDATE vehicle
                SET vehicle_type = ?
                ,price=?
                ,at_updated = ?
                ,updated_date = ?
                WHERE id = ?
                """;
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,dto.vehicleType().ordinal());
        ps.setFloat(2,dto.price());
        ps.setInt(3,dto.atUpdated());
        ps.setTimestamp(4,Timestamp.valueOf(dto.updatedDate()));
        ps.setInt(5,id);

        return ps.executeUpdate();
    }

    @Override
    public int updateDetails(int id, VehicleAndDetailUpdatePersistenceDto dto) throws SQLException {
        String detailSql = """
                UPDATE vehicle_details
                SET cc = ?
                ,door_count = ?
                ,max_range = ?
                ,pilot_count = ?
                ,wing_count = ?
                WHERE vehicle_id = ?
                """;

        PreparedStatement ps = connection.prepareStatement(detailSql);
        ps.setInt(1,dto.cc());
        ps.setInt(2,dto.doorCount());
        ps.setInt(3,dto.maxRange());
        ps.setInt(4,dto.pilotCount());
        ps.setInt(5,dto.wingCount());
        ps.setInt(6,id);

        return ps.executeUpdate();
    }

    @Override
    public boolean delete(int id) throws SQLException {

//        String reservationSql = """
//                DELETE FROM reservation
//                WHERE vehicle_id = ?
//                """;
//
//        PreparedStatement reservation = connection.prepareStatement(reservationSql);
//        reservation.setInt(1,id);
//        int reservationResult = reservation.executeUpdate();
//        if (reservationResult<=0){
//            return false;
//        }
//
//
//
//
//        String rentPriceSql = """
//                DELETE FROM rent_price
//                WHERE vehicle_id = ?
//                """;
//
//        PreparedStatement rentPrice = connection.prepareStatement(rentPriceSql);
//        rentPrice.setInt(1,id);
//        int rentPriceResult = rentPrice.executeUpdate();
//        if (rentPriceResult<=0)
//            return false;
//
//        String detailSql = """
//                DELETE FROM vehicle_details
//                WHERE vehicle_id = ?
//                """;
//
//        PreparedStatement detail = connection.prepareStatement(detailSql);
//        detail.setInt(1,id);
//        int detailResult = detail.executeUpdate();
//        if (detailResult<=0)
//            return false;

        String vehicleSql = """
                UPDATE vehicle 
                SET is_delete = true
                WHERE id = ?
                """;

        PreparedStatement vehicle = connection.prepareStatement(vehicleSql);
        vehicle.setInt(1,id);
        int vehicleResult = vehicle.executeUpdate();
        return vehicleResult > 0;
    }

    @Override
    public List<VehiclePersistenceDto> getAll(int offset, int limit) throws SQLException {
        String sql = """
                SELECT v.id,
                v.vehicle_type,                
                (SELECT b.brand FROM model m JOIN brand b ON b.id = m.brand_id WHERE v.model_id = m.id) brand,
                (SELECT m.model FROM model m WHERE v.model_id = m.id) model,
                v.price,
                v.is_rent,
                vd.machine_type,
                vd.door_count,
                vd.cc,
                vd.max_range,
                vd.wing_count,
                vd.pilot_count,
                rp.hourly_price,
                rp.daily_price,
                rp.weekly_price,
                rp.monthly_price
                FROM vehicle v
                LEFT JOIN vehicle_details vd ON vd.vehicle_id = v.id
                LEFT JOIN rent_price rp ON rp.vehicle_id = v.id
                WHERE v.is_delete = false
                ORDER BY v.id
                OFFSET ?
                LIMIT ?
                """;

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,offset);
        ps.setInt(2,limit);
        ResultSet resultSet = ps.executeQuery();

        return setVehicles(resultSet);
    }

    @Override
    public List<VehiclePersistenceDto> getAll(int offset, int limit, int modelID) throws SQLException {
        String sql = """
                SELECT v.id,
                v.vehicle_type,                
                (SELECT b.brand FROM model m JOIN brand b ON b.id = m.brand_id WHERE v.model_id = m.id) brand,
                (SELECT m.model FROM model m WHERE v.model_id = m.id) model,
                v.price,
                v.is_rent,
                vd.machine_type,
                vd.door_count,
                vd.cc,
                vd.max_range,
                vd.wing_count,
                vd.pilot_count,
                rp.hourly_price,
                rp.daily_price,
                rp.weekly_price,
                rp.monthly_price
                FROM vehicle v
                LEFT JOIN vehicle_details vd ON vd.vehicle_id = v.id
                LEFT JOIN rent_price rp ON rp.vehicle_id = v.id
                WHERE v.is_delete = false
                AND v.model_id = ?
                ORDER BY v.id
                OFFSET ?
                LIMIT ?
                """;

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,modelID);
        ps.setInt(2,offset);
        ps.setInt(3,limit);
        ResultSet resultSet = ps.executeQuery();

        return setVehicles(resultSet);
    }

    @Override
    public List<VehiclePersistenceDto> getAll(int offset, int limit, VehicleType vehicleType) throws SQLException {
        String sql = """
                SELECT v.id,
                v.vehicle_type,                
                (SELECT b.brand FROM model m JOIN brand b ON b.id = m.brand_id WHERE v.model_id = m.id) brand,
                (SELECT m.model FROM model m WHERE v.model_id = m.id) model,
                v.price,
                v.is_rent,
                vd.machine_type,
                vd.door_count,
                vd.cc,
                vd.max_range,
                vd.wing_count,
                vd.pilot_count,
                rp.hourly_price,
                rp.daily_price,
                rp.weekly_price,
                rp.monthly_price
                FROM vehicle v
                LEFT JOIN vehicle_details vd ON vd.vehicle_id = v.id
                LEFT JOIN rent_price rp ON rp.vehicle_id = v.id
                WHERE v.is_delete = false
                AND v.vehicle_type = ?
                ORDER BY v.id
                OFFSET ?
                LIMIT ?
                """;

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,vehicleType.ordinal());
        ps.setInt(2,offset);
        ps.setInt(3,limit);
        ResultSet resultSet = ps.executeQuery();

        return setVehicles(resultSet);
    }

    @Override
    public List<VehiclePersistenceDto> getAll(int offset, int limit, float minPrice, float maxPrice) throws SQLException {
        String sql = """
                SELECT v.id,
                v.vehicle_type,                
                (SELECT b.brand FROM model m JOIN brand b ON b.id = m.brand_id WHERE v.model_id = m.id) brand,
                (SELECT m.model FROM model m WHERE v.model_id = m.id) model,
                v.price,
                v.is_rent,
                vd.machine_type,
                vd.door_count,
                vd.cc,
                vd.max_range,
                vd.wing_count,
                vd.pilot_count,
                rp.hourly_price,
                rp.daily_price,
                rp.weekly_price,
                rp.monthly_price
                FROM vehicle v
                LEFT JOIN vehicle_details vd ON vd.vehicle_id = v.id
                LEFT JOIN rent_price rp ON rp.vehicle_id = v.id
                WHERE v.is_delete = false
                AND v.price between ? and ?
                ORDER BY v.id
                OFFSET ?
                LIMIT ?
                """;

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setFloat(1,minPrice);
        ps.setFloat(2,maxPrice);
        ps.setInt(3,offset);
        ps.setInt(4,limit);
        ResultSet resultSet = ps.executeQuery();

        return setVehicles(resultSet);
    }

    @Override
    public VehiclePersistenceDto getById(int id) throws SQLException {
        String sql = """
                SELECT v.id,
                v.vehicle_type,                
                (SELECT b.brand FROM model m JOIN brand b ON b.id = m.brand_id WHERE v.model_id = m.id) brand,
                (SELECT m.model FROM model m WHERE v.model_id = m.id) model,
                v.price,
                v.is_rent,
                vd.machine_type,
                vd.door_count,
                vd.cc,
                vd.max_range,
                vd.wing_count,
                vd.pilot_count,
                rp.hourly_price,
                rp.daily_price,
                rp.weekly_price,
                rp.monthly_price
                FROM vehicle v
                LEFT JOIN vehicle_details vd ON vd.vehicle_id = v.id
                LEFT JOIN rent_price rp ON rp.vehicle_id = v.id
                WHERE v.id = ?
                AND v.is_delete = false
                """;

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,id);
        ResultSet resultSet = ps.executeQuery();

        return setVehicle(resultSet);
    }

    @Override
    public int getAllCount() throws SQLException {
        String sql = """
                SELECT count(v.id)
                FROM vehicle v
                LEFT JOIN vehicle_details vd ON vd.vehicle_id = v.id
                LEFT JOIN rent_price rp ON rp.vehicle_id = v.id
                WHERE v.is_delete = false
                """;
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet resultSet = ps.executeQuery();
        while (resultSet.next()){
            return resultSet.getInt("count");
        }
        return 0;
    }

    @Override
    public int getAllCount(int modelID) throws SQLException {
        String sql = """
                SELECT count(v.id)
                FROM vehicle v
                LEFT JOIN vehicle_details vd ON vd.vehicle_id = v.id
                LEFT JOIN rent_price rp ON rp.vehicle_id = v.id
                WHERE v.is_delete = false
                AND v.model_id = ?
                """;
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,modelID);
        ResultSet resultSet = ps.executeQuery();
        while (resultSet.next()){
            return resultSet.getInt("count");
        }
        return 0;
    }

    @Override
    public int getAllCount(VehicleType vehicleType) throws SQLException {
        String sql = """
                SELECT count(v.id)
                FROM vehicle v
                LEFT JOIN vehicle_details vd ON vd.vehicle_id = v.id
                LEFT JOIN rent_price rp ON rp.vehicle_id = v.id
                WHERE v.is_delete = false
                AND v.vehicle_type = ?
                """;
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,vehicleType.ordinal());
        ResultSet resultSet = ps.executeQuery();
        while (resultSet.next()){
            return resultSet.getInt("count");
        }
        return 0;
    }

    @Override
    public int getAllCount(float minPrice, float maxPrice) throws SQLException {
        String sql = """
                SELECT count(v.id)
                FROM vehicle v
                LEFT JOIN vehicle_details vd ON vd.vehicle_id = v.id
                LEFT JOIN rent_price rp ON rp.vehicle_id = v.id
                WHERE v.is_delete = false
                AND v.price between ? and ?
                """;
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setFloat(1,minPrice);
        ps.setFloat(2,maxPrice);
        ResultSet resultSet = ps.executeQuery();
        while (resultSet.next()){
            return resultSet.getInt("count");
        }
        return 0;
    }

    @Override
    public boolean isAllReadyExistDetailByVehicleId(int vehicleId) throws SQLException {
        String sql = """
                SELECT * FROM vehicle_details
                WHERE vehicle_id = ?
                """;
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,vehicleId);
        ResultSet resultSet = ps.executeQuery();
        if (!resultSet.next()){
            return false;
        }
        return true;
    }

    private List<VehiclePersistenceDto> setVehicles(ResultSet resultSet) throws SQLException {
        List<VehiclePersistenceDto> vehicles = new ArrayList<>();
        while (resultSet.next()){
            vehicles.add(
                    new VehiclePersistenceDto(
                        resultSet.getInt("id"),
                            resultSet.getString("brand"),
                            resultSet.getString("model"),
                            VehicleType.values()[resultSet.getInt("vehicle_type")],
                            resultSet.getFloat("price"),
                            resultSet.getBoolean("is_rent"),
                            MachineType.values()[resultSet.getInt("machine_type")],
                            resultSet.getInt("door_count"),
                            resultSet.getInt("cc"),
                            resultSet.getInt("max_range"),
                            resultSet.getInt("wing_count"),
                            resultSet.getInt("pilot_count"),
                            resultSet.getFloat("hourly_price"),
                            resultSet.getFloat("daily_price"),
                            resultSet.getFloat("weekly_price"),
                            resultSet.getFloat("monthly_price")

                    )
            );
        }
        return vehicles;
    }

    private VehiclePersistenceDto setVehicle(ResultSet resultSet) throws SQLException {
        while (resultSet.next()){
            return new VehiclePersistenceDto(
                    resultSet.getInt("id"),
                    resultSet.getString("brand"),
                    resultSet.getString("model"),
                    VehicleType.values()[resultSet.getInt("vehicle_type")],
                    resultSet.getFloat("price"),
                    resultSet.getBoolean("is_rent"),
                    MachineType.values()[resultSet.getInt("machine_type")],
                    resultSet.getInt("door_count"),
                    resultSet.getInt("cc"),
                    resultSet.getInt("max_range"),
                    resultSet.getInt("wing_count"),
                    resultSet.getInt("pilot_count"),
                    resultSet.getFloat("hourly_price"),
                    resultSet.getFloat("daily_price"),
                    resultSet.getFloat("weekly_price"),
                    resultSet.getFloat("monthly_price")

            );
        }
        return null;
    }


}
