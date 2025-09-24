package com.alibiner.repository;

import com.alibiner.entity.User;
import com.alibiner.enums.CustomerType;
import com.alibiner.enums.Role;
import com.alibiner.enums.errorMessages.ErrorCode;
import com.alibiner.exceptions.DataNotInsertException;
import com.alibiner.repository.interfaces.ICRUDRepository;

import java.sql.*;
import java.util.List;

public class UserRepository {
    private final Connection connection;
    public UserRepository(Connection connection) {
        this.connection = connection;
    }


    public int save(User user) throws SQLException, DataNotInsertException {

        String sql = """
                INSERT INTO users(first_name,last_name,email,passwd,created_date,user_role,customer_type)\s
                VALUES (?,?,?,?,?,?,?)
                """;

        PreparedStatement ps = connection.prepareStatement(sql);

        ps.setString(1,user.getFirstName());
        ps.setString(2,user.getLastName());
        ps.setString(3,user.getEmail());
        ps.setString(4,user.getPassword());
        ps.setTimestamp(5, Timestamp.valueOf(user.getCreatedDate()));
        ps.setString(6,user.getRole().name());
        ps.setString(7,user.getCustomerType().name());

        int result = ps.executeUpdate();

        if (result==0)
            throw new DataNotInsertException(ErrorCode.DATA_NOT_INSERT);

        return result;

    }
    public User getById(int id) throws SQLException {
        String sql = """
                SELECT * FROM users
                WHERE id = ?
                """;

        PreparedStatement ps = connection.prepareStatement(sql);

        ps.setInt(1,id);

        ResultSet resultSet = ps.executeQuery();

        return setUser(resultSet);
    }

    public boolean isAlreadyExist(String email) throws SQLException {

        String sql = """
                SELECT * FROM users
                WHERE email = ?
                """;

        PreparedStatement ps = connection.prepareStatement(sql);

        ps.setString(1,email);
        ResultSet rs = ps.executeQuery();
        return rs.next();
    }

    public User getByEmail(String email) throws SQLException {

        String sql = """
                SELECT * FROM users
                WHERE email = ?
                """;

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1,email);

        ResultSet rs = ps.executeQuery();

        return setUser(rs);
    }

    private User setUser(ResultSet rs) throws SQLException {
        User user = null;
        while (rs.next()){
            user = new User(rs.getInt("id"),
                    rs.getString("first_name"),
                    rs.getString("last_name"),
                    rs.getString("email"),
                    rs.getString("passwd"),
                    rs.getTimestamp("created_date").toLocalDateTime(),
                    rs.getTimestamp("updated_date").toLocalDateTime(),
                    Role.valueOf(rs.getString("user_role")),
                    CustomerType.valueOf(rs.getString("customer_type")));
            break;
        }
        return user;
    }

}
