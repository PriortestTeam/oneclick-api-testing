package com.oneclick.karate.util;



public class MyStepdefs {

  //  @And("^new step")
    public static String newStep() {
        And("here is printed out from own java method");
        return "comparekey";
    }

    private static void And(String s) {

       System.out.println(s);
    }



}
