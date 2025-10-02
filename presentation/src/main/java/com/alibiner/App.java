package com.alibiner;

import com.alibiner.UI.HomeUI;
import com.alibiner.util.MyDbConnection;

public class App {
    public static void main(String[] args) {

        MyDbConnection.config(args[0], args[1], args[2]);
        MyDbConnection.getInstance();

        boolean isTest = false;
        if (!args[3].isEmpty())
            isTest = true;

        System.out.println();
        System.out.println();

        System.out.println("=======Araç Kiralama Uygulamasına Hoşgeldiniz==========");

        HomeUI homeUI = new HomeUI();
        homeUI.view(isTest);
    }
}
