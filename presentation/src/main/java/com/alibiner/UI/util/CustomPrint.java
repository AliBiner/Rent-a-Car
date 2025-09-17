package com.alibiner.UI.util;

public class CustomPrint {
    private static final String RED = "\u001B[31m";
    private static final String GREEN = "\u001B[32m";
    private static final String BLUE = "\u001B[34m";
    private static final String RESET = "\u001B[0m";

    private CustomPrint() {
    }

    public static void printRed(String message){
        System.out.println(RED + message + RESET);
    }

    public static void printGreen(String message){
        System.out.println(GREEN + message + RESET);
    }

    public static void printBlue(String message){
        System.out.println(BLUE + message + RESET);
    }
}
