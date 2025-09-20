package com.alibiner.UI;

public class UserSession {
    private static int id=0;
    private static String firstName="";
    private static String lastName="";


    public static int getId() {
        return id;
    }

    public static String getFirstName() {
        return firstName;
    }

    public static String getLastName() {
        return lastName;
    }


    public static void setSession(int id, String firstName, String lastName){
        UserSession.id = id;
        UserSession.firstName = firstName;
        UserSession.lastName = lastName;
    }


    public static boolean isEmpty(){
        if (id >0 && !firstName.isBlank() && !lastName.isBlank())
            return false;
        return true;
    }

    public static void clear(){
        UserSession.id = 0;
        UserSession.lastName = "";
        UserSession.firstName = "";
    }
}
