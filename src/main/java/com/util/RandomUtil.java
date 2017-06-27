package com.util;


/**
 * Created by mtl on 17-3-19.
 */
public class RandomUtil
{


    public static String makeRandom(String a)
    {

        char [] chars = a.toCharArray();

        Long b = new Long(0);

        for(int i=0;i<chars.length;i++)

            b = b*1000 + (int)chars[i];

        return b.toString() + new Long(System.currentTimeMillis()*999/123).toString();

    }

}
