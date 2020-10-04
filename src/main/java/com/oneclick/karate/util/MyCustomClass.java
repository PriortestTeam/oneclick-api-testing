package com.oneclick.karate.util;


import net.minidev.json.JSONObject;

import java.util.List;
import java.util.Map;
import java.util.Random;


public class MyCustomClass {
    // static method
    public static boolean verifyDataRecordNo(List result, int dataRecordNo) {
        return result.size() == dataRecordNo;
    }

    // none-static method
    public boolean verifyEmailId(List result) {
        String emailSuffixed = "@reqres.in";
        boolean flage = false;
        for (Object o : result) {
            JSONObject dataJson = new JSONObject((Map<String, ?>) o);
            String first_name = dataJson.getAsString("first_name");
            String last_name = dataJson.getAsString("last_name");
            String email_id = dataJson.getAsString("email");
            flage = email_id.contentEquals(first_name.toLowerCase() + "." + last_name.toLowerCase() + emailSuffixed);
            if (!flage) break;
        }
        return flage;
    }

    // static method
    public static String userNameGenerator() {
        String firstName = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String secondName = "abcdefghijklmnopqrstuvwxyz";
        return userNameGenerator(firstName,5) +"."+ userNameGenerator(secondName,5);
    }

    // static method
    public static String userNameGenerator(String selectionChar,int len) {
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < len) { // length of the random string.
            int index = (int) (rnd.nextFloat() * selectionChar.length());
            salt.append(selectionChar.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;
    }

}
