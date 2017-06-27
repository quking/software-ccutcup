package com.util;

import java.sql.Date;

/**
 * Created by mtl on 17-5-2.
 */
public class DateValue {

    public static int a[] = {31,28,31,30,31,30,31,31,30,31,30,31};

    public static int getMonthOfDate(Date date) {

        return Integer.parseInt(date.toString().substring(5, 7));

    }

    public static int getYearOfDate(Date date) {

        return Integer.parseInt(date.toString().substring(0, 4));

    }

    public static int getDayOfDate(Date date) {

        return Integer.parseInt(date.toString().substring(8, 10));

    }

    public static int getDayOfMonth(int year,int month)
    {

        if(((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) && month == 2)

            return a[1] + 1;

        return a[month-1];

    }

    public static boolean isBigYear(int year)
    {

        if((year%4 == 0 && year %100 !=0) || year %400 == 0)

            return true;

        return false;

    }

    public static String getNextDate(String date) {

        int year = Integer.parseInt(date.substring(0, 4));

        int month = Integer.parseInt(date.substring(5, 7));

        int day = Integer.parseInt(date.substring(8, 10));

        int flag = 0;

        if(isBigYear(year))

            flag = 1;

        if (day == flag + a[month - 1]) {

            month++;

            day = 1;

            if (month == 13) {

                month = 1;

                year++;

            }
        } else

            day++;

        return year + "-" + month + "-" + day;

    }

}
