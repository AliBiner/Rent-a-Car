package com.alibiner.repository;

import com.alibiner.entity.User;
import com.alibiner.errorMessages.ErrorCode;
import com.alibiner.exceptions.DataNotInsertException;

import java.sql.*;

public class UserRepository {
    private Connection connection;
    public UserRepository(Connection connection) {
        this.connection = connection;
    }

    public int save(User user) throws SQLException, DataNotInsertException {

        String sql = """
                INSERT INTO users(first_name,last_name,email,passwd,created_date)\s
                VALUES (?,?,?,?,?)
                """;

        PreparedStatement ps = connection.prepareStatement(sql);

        ps.setString(1,user.getFirstName());
        ps.setString(2,user.getLastName());
        ps.setString(3,user.getEmail());
        ps.setString(4,user.getPassword());
        ps.setTimestamp(5, Timestamp.valueOf(user.getCreatedDate()));

        int result = ps.executeUpdate();

        if (result==0)
            throw new DataNotInsertException(ErrorCode.DATA_NOT_INSERT);

        return result;

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

        User user = null;
        while (rs.next()){
            user = new User();

            user.setId(rs.getInt("id"));
            user.setFirstName(rs.getString("first_name"));
            user.setLastName(rs.getString("last_name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("passwd"));
            user.setCreatedDate(rs.getTimestamp("created_date").toLocalDateTime());
            user.setUpdatedDate(rs.getTimestamp("updated_date").toLocalDateTime());
            break;
        }

        return user;
    }
}
