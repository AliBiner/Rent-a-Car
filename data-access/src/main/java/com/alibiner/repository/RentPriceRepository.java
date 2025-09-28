package com.alibiner.repository;

import com.alibiner.interfaces.repository.IRentPriceRepository;
import com.alibiner.repositoryDto.request.rentPrice.RentPriceCreatePersistenceDto;
import com.alibiner.repositoryDto.request.rentPrice.RentPriceUpdatePersistenceDto;
import com.alibiner.repositoryDto.response.rentPrice.RentPricePersistenceResponseDto;
import com.alibiner.util.MyDbConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RentPriceRepository implements IRentPriceRepository {
    private final Connection connection;

    public RentPriceRepository() {
        this.connection = MyDbConnection.getInstance().getConnection();
    }

    @Override
    public int create(RentPriceCreatePersistenceDto dto) throws SQLException {
        String sql = """
                INSERT INTO rent_price(
                   vehicle_id,
                   hourly_price,
                   daily_price,
                   weekly_price,
                   monthly_price) VALUES (?,?,?,?,?)
                """;

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,dto.vehicleId());
        ps.setFloat(2,dto.hourlyPrice());
        ps.setFloat(3,dto.dailyPrice());
        ps.setFloat(4,dto.weeklyPrice());
        ps.setFloat(5,dto.monthPrice());
        return ps.executeUpdate();
    }

    @Override
    public int updateByVehicleId(int vehicleId, RentPriceUpdatePersistenceDto dto) throws SQLException {
        String sql = """
                UPDATE rent_price
                SET hourly_price = ?
                ,daily_price = ?
                ,weekly_price = ?
                ,monthly_price = ?
                WHERE vehicle_id = ?
                """;
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setFloat(1,dto.hourlyPrice());
        ps.setFloat(2,dto.dailyPrice());
        ps.setFloat(3,dto.weeklyPrice());
        ps.setFloat(4,dto.monthPrice());
        ps.setInt(5,vehicleId);
        return ps.executeUpdate();
    }

    @Override
    public RentPricePersistenceResponseDto getByVehicleId(int vehicleId) throws SQLException {
        String sql = """
                SELECT * FROM rent_price
                WHERE vehicle_id = ?
                """;
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,vehicleId);
        ResultSet resultSet = ps.executeQuery();
        while (resultSet.next()){
            return new RentPricePersistenceResponseDto(
                    resultSet.getInt("id"),
                    resultSet.getInt("vehicle_id"),
                    resultSet.getFloat("hourly_price"),
                    resultSet.getFloat("daily_price"),
                    resultSet.getFloat("weekly_price"),
                    resultSet.getFloat("monthly_price")
            );
        }
        return null;
    }


}
