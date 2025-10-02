package com.alibiner.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyDbConnection {
    private static MyDbConnection instance;
    private Connection connection;
    private static String db_url;
    private static String db_user ;
    private static String db_password;

    private MyDbConnection() {
        try {
            this.connection = DriverManager.getConnection(db_url,db_user,db_password);
            this.connection.setAutoCommit(false);
            System.out.println( "\u001B[32m" +  "Db bağlantısı kuruldu!" + "\u001B[0m");
        } catch (SQLException e) {
            System.out.println( "\u001B[31m" +  "Db bağlantısı kurulamadı! " + e.getMessage() + "\u001B[0m" );
        }

    }

    public Connection getConnection(){
        return this.connection;
    }

    public static MyDbConnection getInstance(){
        try{
            if (instance == null || instance.connection==null){
                instance = new MyDbConnection();
            }
            if (instance.connection!=null){
                if (instance.connection.isClosed())
                    instance = new MyDbConnection();
            }
            return instance;
        } catch (SQLException e) {
            System.out.println( "\u001B[31m" +  "Db bağlantısı kurulamadı! " + e.getMessage() + "\u001B[0m" );
        }
        return instance;
    }

    public static void commit() throws SQLException {
        if (MyDbConnection.getInstance().getConnection()!=null){
            MyDbConnection.getInstance().getConnection().commit();
        }
    }

    public static void rollback() throws SQLException {
        if (MyDbConnection.getInstance().getConnection()!=null){
            MyDbConnection.getInstance().getConnection().rollback();
        }
    }

    public static void config(String db_url, String db_user, String db_password){
        MyDbConnection.db_url = db_url;
        MyDbConnection.db_user = db_user;
        MyDbConnection.db_password = db_password;
        System.out.println( "\u001B[32m" +  "Db ayarlamaları yapıldı!" + "\u001B[0m");
    }
}
