package com.alibiner.UI.components;

import com.alibiner.UI.util.CustomPrint;
import com.alibiner.enums.car.MachineType;

import javax.crypto.Mac;
import java.util.Scanner;

public class UpdateFieldComponent {

    private final static Scanner scanner = new Scanner(System.in);

    private UpdateFieldComponent() {
    }


    public static String updateString(String fieldName, String fieldValue){
        System.out.println("Güncellemek istemiyorsanız Enter tuşuna basınız!");
        System.out.print(fieldName + "(" + fieldValue + ") : ");
        String input = scanner.nextLine();
        if (input.isBlank() || input.equals(fieldValue))
            return fieldValue;
        else
            return input;
    }


    public static int updateInt(String fieldName, int fieldValue){
        System.out.println("Güncellemek istemiyorsanız Enter tuşuna basınız!");
        System.out.print(fieldName + "(" + fieldValue + ") : ");
        String input = scanner.nextLine();
        if (input.isBlank()){
            return fieldValue;
        }else {
            try{
                int newValue = Integer.parseInt(input);
                if (newValue == fieldValue || newValue == 0)
                    return fieldValue;
                else
                    return newValue;
            }catch (Exception e){
                CustomPrint.printRed("Hatalı veri girişi!");
                return fieldValue;
            }
        }
    }

    public static MachineType updateMachineType(String fieldName, MachineType machineType){
        System.out.println("Güncellemek istemiyorsanız Enter tuşuna basınız!");
        System.out.println(fieldName + "(" + machineType + ") : ");
        System.out.println("1 - Dizel");
        System.out.println("2 - Elektrik");
        System.out.println("3 - Benzin");
        String choice = scanner.nextLine();

        MachineType newMachineType = null;
        switch (choice){
            case "1":
                newMachineType = MachineType.DIZEL;
                break;
            case "2":
                newMachineType = MachineType.ELECTRIC;
                break;
            case "3":
                newMachineType = MachineType.FUEL;
                break;
            case "":
                break;
            default:
                CustomPrint.printRed("Hatalı veri girişi!");
                break;
        }
        if ( newMachineType == null || newMachineType.equals(machineType))
            return machineType;
        else
            return newMachineType;

    }


}
