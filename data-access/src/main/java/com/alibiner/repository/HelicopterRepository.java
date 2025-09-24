package com.alibiner.repository;

import com.alibiner.entity.Helicopter;
import com.alibiner.exceptions.DataNotInsertException;
import com.alibiner.repository.interfaces.ICRUDRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HelicopterRepository implements ICRUDRepository<Helicopter> {
    private Connection connection;
    public HelicopterRepository(Connection connection) {
        this.connection = connection;
    }

    @Override
    public int save(Helicopter entity) throws SQLException, DataNotInsertException {
        String sql = """
                INSERT INTO helicopter(
                                brand
                                ,model
                				,production_year
                				,is_rent
                				,max_range
                				,wing_count
                				,passenger_count
                				,pilot_count
                				,created_date
                				,updated_date
                				,at_created
                				,at_updated
                				) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)
                """;
        PreparedStatement ps = connection.prepareStatement(sql);

        ps.setString(1,entity.getBrand());
        ps.setString(2, entity.getModel());
        ps.setString(3, entity.getProductionYear());
        ps.setBoolean(4,entity.isRent());
        ps.setInt(5,entity.getMaxRange());
        ps.setInt(6,entity.getWingCount());
        ps.setInt(7,entity.getPassengerCount());
        ps.setInt(8,entity.getPilotCount());
        ps.setTimestamp(9, Timestamp.valueOf(entity.getCreatedDate()));
        ps.setTimestamp(10, Timestamp.valueOf(entity.getUpdatedDate()));
        ps.setInt(11,entity.getAtCreatedId());
        ps.setInt(12,entity.getAtUpdatedId());

        return ps.executeUpdate();
    }

    @Override
    public int update(Helicopter entity) throws SQLException {
        String sql = """
                UPDATE helicopter
                SET brand = ?
                ,model = ?
                ,max_range = ?
                ,wing_count = ?
                ,passenger_count = ?
                ,pilot_count = ?
                ,production_year = ?
                ,is_rent = ?
                ,updated_date = ?
                ,at_updated = ?
                WHERE id = ?
                """;
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, entity.getBrand());
        ps.setString(2, entity.getModel());
        ps.setInt(3,entity.getMaxRange());
        ps.setInt(4,entity.getWingCount());
        ps.setInt(5,entity.getPassengerCount());
        ps.setInt(6,entity.getPilotCount());
        ps.setString(7, entity.getProductionYear());
        ps.setBoolean(8,entity.isRent());
        ps.setTimestamp(9,Timestamp.valueOf(entity.getUpdatedDate()));
        ps.setInt(10,entity.getAtUpdatedId());
        ps.setInt(11,entity.getId());

        return ps.executeUpdate();
    }

    @Override
    public boolean delete(int id) throws SQLException {
        String sql = """
                DELETE FROM helicopter
                WHERE id = ?
                """;

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,id);
        int result = ps.executeUpdate();
        if (result<=0)
            return false;
        return true;
    }

    @Override
    public List<Helicopter> getAll() throws SQLException {
        String sql = """
                SELECT * FROM helicopter
                """;

        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet resultSet = ps.executeQuery();
        return setHelicopters(resultSet);
    }

    @Override
    public Helicopter getById(int id) throws SQLException {
        String sql = """
                SELECT * FROM helicopter
                WHERE id = ?
                """;

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,id);
        ResultSet resultSet = ps.executeQuery();

        return setHelicopter(resultSet);
    }

    private List<Helicopter> setHelicopters(ResultSet rs) throws SQLException {
        List<Helicopter> helicopters = new ArrayList<>();
        while (rs.next()){
            helicopters.add(
                    new Helicopter(
                            rs.getInt("id"),
                            rs.getString("brand"),
                            rs.getString("model"),
                            rs.getString("production_year"),
                            rs.getBoolean("is_rent"),
                            rs.getTimestamp("created_date").toLocalDateTime(),
                            rs.getTimestamp("updated_date").toLocalDateTime(),
                            rs.getInt("at_created"),
                            null,
                            rs.getInt("at_updated"),
                            null,
                            rs.getInt("max_range"),
                            rs.getInt("wing_count"),
                            rs.getInt("passenger_count"),
                            rs.getInt("pilot_count")
                    )
            );
        }
        return helicopters;
    }

    private Helicopter setHelicopter(ResultSet rs) throws SQLException {
        while (rs.next()){
            return new Helicopter(
                    rs.getInt("id"),
                    rs.getString("brand"),
                    rs.getString("model"),
                    rs.getString("production_year"),
                    rs.getBoolean("is_rent"),
                    rs.getTimestamp("created_date").toLocalDateTime(),
                    rs.getTimestamp("updated_date").toLocalDateTime(),
                    rs.getInt("at_created"),
                    null,
                    rs.getInt("at_updated"),
                    null,
                    rs.getInt("max_range"),
                    rs.getInt("wing_count"),
                    rs.getInt("passenger_count"),
                    rs.getInt("pilot_count")
            );
        }
        return null;
    }
}
