package repository;

import entity.User;
import util.DbConnection;

import java.sql.*;

public class UserRepository {
    public int save(User user) throws SQLException {
        Connection connection = DbConnection.getInstance();

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
        connection.commit();
        connection.close();
        return result;

    }

    public boolean isAlreadyExist(String email) throws SQLException {
        Connection connection = DbConnection.getInstance();

        String sql = """
                SELECT * FROM users
                WHERE email = ?
                """;

        PreparedStatement ps = connection.prepareStatement(sql);

        ps.setString(1,email);
        ResultSet rs = ps.executeQuery();
        connection.close();
        return rs.next();
    }


}
