package util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordHashing {
    private PasswordHashing() {
    }

    public static String hash(String password) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");

        byte[] encodedPass = digest.digest(password.getBytes());

        StringBuilder newPassword = new StringBuilder();

        for (byte b : encodedPass){
            String hex = Integer.toHexString(0xff & b);
            if (hex.length()==1){
                newPassword.append('0');
            }
            newPassword.append(hex);
        }
        return newPassword.toString();
    }
}
