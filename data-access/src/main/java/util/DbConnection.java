package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
    private static final String db_url = "jdbc:postgresql://localhost:5432/postgres";
    private static final String db_user = "postgres";
    private static final String db_password = "123456";

    private DbConnection() {
    }

    public static Connection getInstance(){
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(db_url,db_user,db_password);
            connection.setAutoCommit(false);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return connection;
    }
}
