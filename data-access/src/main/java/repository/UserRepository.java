package repository;

import entity.User;

import java.sql.*;

public class UserRepository {
    public int save(User user) throws SQLException {
        String db_url = "jdbc:postgresql://localhost:5432/postgres";
        String db_user = "postgres";
        String db_password = "123456";


        String sql = """
                INSERT INTO users(first_name,last_name,email,passwd,created_date)\s
                VALUES (?,?,?,?,?)
                """;

        Connection connection = DriverManager.getConnection(db_url,db_user,db_password);

        PreparedStatement ps = connection.prepareStatement(sql);

        ps.setString(1,user.getFirstName());
        ps.setString(2,user.getLastName());
        ps.setString(3,user.getEmail());
        ps.setString(4,user.getPassword());
        ps.setTimestamp(5, Timestamp.valueOf(user.getCreatedDate()));

        int result = ps.executeUpdate(); // insert, delete, update

        return result;

    }
}
