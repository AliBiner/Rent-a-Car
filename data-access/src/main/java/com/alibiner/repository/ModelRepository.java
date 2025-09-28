package com.alibiner.repository;

import com.alibiner.interfaces.repository.IModelRepository;
import com.alibiner.repositoryDto.response.model.ModelResponsePersistenceDto;
import com.alibiner.util.MyDbConnection;

import java.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ModelRepository implements IModelRepository {
    private final Connection connection;

    public ModelRepository() {
        this.connection = MyDbConnection.getInstance().getConnection();
    }

    @Override
    public List<ModelResponsePersistenceDto> getAllByBrandId(int brandId) throws SQLException {
        String sql = """
                SELECT * FROM model
                WHERE brand_id = ?
                """;

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,brandId);
        ResultSet resultSet = ps.executeQuery();
        return setModels(resultSet);
    }

    private List<ModelResponsePersistenceDto> setModels(ResultSet resultSet) throws SQLException {
        List<ModelResponsePersistenceDto> models = new ArrayList<>();
        while (resultSet.next()){
            models.add(
                    new ModelResponsePersistenceDto(
                            resultSet.getInt("id"),
                            resultSet.getString("model")
                    )
            );
        }
        return models;
    }
}
