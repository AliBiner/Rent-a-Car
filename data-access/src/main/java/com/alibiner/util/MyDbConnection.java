package com.alibiner.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyDbConnection {
    private static MyDbConnection instance;
    private Connection connection;
    private static final String db_url = "jdbc:postgresql://localhost:5432/postgres";
    private static final String db_user = "postgres";
    private static final String db_password = "123456";

    private MyDbConnection() {
        try {
            this.connection = DriverManager.getConnection(db_url,db_user,db_password);
            this.connection.setAutoCommit(false);
        } catch (SQLException e) {
            System.out.println("Db bağlantısı kurulamadı!");
        }

    }

    public Connection getConnection(){
        return this.connection;
    }

    public static MyDbConnection getInstance(){
        try{
            if (instance == null){
                instance = new MyDbConnection();
            }
            if (instance.connection!=null){
                if (instance.connection.isClosed())
                    instance = new MyDbConnection();
            }
            return instance;
        } catch (SQLException e) {
            System.out.println("Db bağlantısı kurulamadı!");
        }
        return instance;
    }
}
