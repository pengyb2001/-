package com.yyf.lab2_spring.util;

import java.text.SimpleDateFormat;
import java.util.Date;


public class DateAndTerm {

    /**
     * 2022/4/25
     * a method to get current date and term
     * @author yyf
     * @return current term
     */
    public static String getCurrentTerm() {
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String date = dateFormat.format(currentDate);
        int currentYear = Integer.parseInt(date.substring(0, 4));
        int currentMonth = Integer.parseInt(date.substring(5, 7));
        if (currentMonth == 1 || currentMonth == 2) {
            return Integer.toString(currentYear - 1) + "-2";
        } else if (currentMonth >= 9 && currentMonth <= 12) {
            return Integer.toString(currentYear) + "-2";
        } else {
            return Integer.toString(currentYear) + "-1";
        }
    }
}
