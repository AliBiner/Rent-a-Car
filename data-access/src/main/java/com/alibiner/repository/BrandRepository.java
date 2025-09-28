package com.alibiner.repository;

import com.alibiner.interfaces.repository.IBrandRepository;
import com.alibiner.repositoryDto.response.brand.BrandPersistenceDto;
import com.alibiner.util.MyDbConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BrandRepository implements IBrandRepository {
    private final Connection connection;

    public BrandRepository() {
        this.connection = MyDbConnection.getInstance().getConnection();
    }

    @Override
    public List<BrandPersistenceDto> getAll() throws SQLException {
        String sql = """
                SELECT * FROM brand
                """;
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet resultSet = ps.executeQuery();
        return setBrands(resultSet);
    }

    private List<BrandPersistenceDto> setBrands(ResultSet resultSet) throws SQLException {
        List<BrandPersistenceDto> brands = new ArrayList<>();
        while (resultSet.next()){
            brands.add(new BrandPersistenceDto(
                    resultSet.getInt("id"),
                    resultSet.getString("brand")
            ));
        }
        return brands;
    }
}
