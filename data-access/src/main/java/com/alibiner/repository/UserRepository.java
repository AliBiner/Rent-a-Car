package com.alibiner.repository;

import com.alibiner.enums.CustomerType;
import com.alibiner.enums.Role;
import com.alibiner.interfaces.repository.IUserRepository;
import com.alibiner.repositoryDto.request.user.UserCreatePersistenceDto;
import com.alibiner.repositoryDto.response.user.UserResponsePersistenceDto;
import com.alibiner.util.MyDbConnection;

import java.sql.*;

public class UserRepository implements IUserRepository {

    private final Connection connection;

    public UserRepository() {
        this.connection = MyDbConnection.getInstance().getConnection();
    }

    @Override
    public int create(UserCreatePersistenceDto dto) throws SQLException {
        String sql = """
                INSERT INTO users(
                                  first_name,
                                  last_name,
                                  email,
                                  passwd,
                                  created_date,
                                  user_role,
                                  customer_type,
                                  age)\s
                VALUES (?,?,?,?,?,?,?,?)
                """;

        PreparedStatement ps = connection.prepareStatement(sql);

        ps.setString(1,dto.firstName());
        ps.setString(2,dto.lastName());
        ps.setString(3,dto.email());
        ps.setString(4,dto.password());
        ps.setTimestamp(5, Timestamp.valueOf(dto.createdDate()));
        ps.setInt(6,dto.role().ordinal());
        ps.setInt(7,dto.customerType().ordinal());
        ps.setInt(8,dto.age());

        return ps.executeUpdate();
    }


    @Override
    public UserResponsePersistenceDto getById(int id) throws SQLException {
        String sql = """
                SELECT * FROM users
                WHERE id = ?
                """;

        PreparedStatement ps = connection.prepareStatement(sql);

        ps.setInt(1,id);

        ResultSet resultSet = ps.executeQuery();

        return setUser(resultSet);
    }


    @Override
    public UserResponsePersistenceDto getByEmail(String email) throws SQLException {

        String sql = """
                SELECT * FROM users
                WHERE email = ?
                """;

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1,email);

        ResultSet rs = ps.executeQuery();

        return setUser(rs);
    }

    private UserResponsePersistenceDto setUser(ResultSet rs) throws SQLException {
        UserResponsePersistenceDto user = null;
        while (rs.next()){
            user = new UserResponsePersistenceDto(
                    rs.getInt("id"),
                    rs.getString("first_name"),
                    rs.getString("last_name"),
                    rs.getString("email"),
                    rs.getString("passwd"),
                    rs.getInt("age"),
                    Role.values()[rs.getInt("user_role")],
                    CustomerType.values()[rs.getInt("customer_type")]);
            break;
        }
        return user;
    }

}
