package com.util;

/**
 * Created by mtl on 17-4-8.
 */
public class TableUtil {

    private String table;

    private int [] item;

    int itemNum;

    public TableUtil() {

        table = "[]";

        itemNum = 1;

        item [0] = 0;

    }

    public void put(String string) {

        item[itemNum] = string.length();

        itemNum++;

        if (table.length() < 3)

            table = table.substring(0, table.length() - 1) + string + "}";

        else

            table = table.substring(0, table.length() - 1) + "," + string + "}";
    }

    public String toString()
    {

        return table;

    }

    public String getItem(int i)
    {

        return table.substring(item[i-1] + 1,item[i]);

    }


}
