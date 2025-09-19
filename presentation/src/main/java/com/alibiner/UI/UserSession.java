package com.alibiner.UI;

public class UserSession {
    private static int id;
    private static String firstName;
    private static String lastName;


    public static int getId() {
        return id;
    }

    public static void setId(int id) {
        UserSession.id = id;
    }

    public static String getFirstName() {
        return firstName;
    }

    public static void setFirstName(String firstName) {
        UserSession.firstName = firstName;
    }

    public static String getLastName() {
        return lastName;
    }

    public static void setLastName(String lastName) {
        UserSession.lastName = lastName;
    }
}
