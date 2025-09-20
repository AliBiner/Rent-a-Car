package com.alibiner.UI;

import com.alibiner.enums.CustomerType;
import com.alibiner.enums.Role;

public class UserSession {
    private static int id=0;
    private static String firstName="";
    private static String lastName="";
    private static Role role = null;
    private static CustomerType customerType = null;

    public static int getId() {
        return id;
    }

    public static String getFirstName() {
        return firstName;
    }

    public static String getLastName() {
        return lastName;
    }

    public static Role getRole(){
        return role;
    }

    public static CustomerType getCustomerType(){
        return customerType;
    }


    public static void setSession(int id, String firstName, String lastName, Role role, CustomerType customerType){
        UserSession.id = id;
        UserSession.firstName = firstName;
        UserSession.lastName = lastName;
        UserSession.role = role;
        UserSession.customerType = customerType;
    }


    public static boolean isEmpty(){
        return id <= 0 || firstName.isBlank() || lastName.isBlank() || role == null;
    }

    public static void clear(){
        UserSession.id = 0;
        UserSession.lastName = "";
        UserSession.firstName = "";
        UserSession.role = null;
        UserSession.customerType = null;
    }
}
