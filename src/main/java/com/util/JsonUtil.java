package com.util;


public class JsonUtil
{

    private String json = "{";

    public static String toJson(String key,String value)
    {

        return "\"" + key + "\":\"" + value + "\"";

    }

    public static String toJson(String key,Object value)
    {

        return "\"" + key + "\":" + value;

    }

    public static String toJson(String key,int [] value)
    {

        String temp = "\"" + key + "\":[";

        for(int i=0;i<value.length-1;i++)

            temp += value[i] + ",";

        return temp + value[value.length-1] + "]";

    }

    public static String toJson(String key,double [] value)
    {

        String temp = "\"" + key + "\":[";

        for(int i=0;i<value.length-1;i++)

            temp += value[i] + ",";

        return temp + value[value.length-1] + "]";

    }

    public static String toJson(String key,boolean [] value)
    {

        String temp = "\"" + key + "\":[";

        for(int i=0;i<value.length-1;i++)

            temp += value[i] + ",";

        return temp + value[value.length-1] + "]";

    }

    public static String toJson(String key,String [] value)
    {

        String temp = "\"" + key + "\":[";

        for(int i=0;i<value.length-1;i++)

            temp += "\"" + value[i] + "\",";

        return temp + "\"" + value[value.length-1] + "\"]";

    }

    public static String toJson(String key,Object[] value)
    {

        String temp = "\"" + key + "\":[";

        for(int i=0;i<value.length-1;i++)

            temp += value[i] + ",";

        return temp + value[value.length-1] + "]";

    }


    public void put(String key,String value)
    {

        json += toJson(key,value) +",";

    }
    public void put(String key,Object value)
    {

        json += toJson(key,value)+",";

    }
    public void put(String key,int[] value)
    {

        json += toJson(key,value)+",";

    }
    public void put(String key,double[] value)
    {

        json += toJson(key,value)+",";

    }
    public void put(String key,boolean[] value)
    {

        json += toJson(key,value)+",";

    }
    public void put(String key,Object[] value)
    {

        json += toJson(key,value)+",";

    }
    public void put(String key,String[] value)
    {

        json += toJson(key,value)+",";

    }

    public String toString()
    {

        return "{" + json.substring(1,json.length()-1) + "}";

    }
/*    public static void main(String []args)
    {

        Test t = new Test();

        Student student = new Student();

        int a[] = {1,2,3,4};

        double b[] = {1.0,2,3,4};

        boolean c[] = {true,false};

        String d[] = {"av","ab"};

        Student []e = {new Student(),new Student()};

        t.put("String","461");

        t.put("int",64);

        t.put("double",1e+5);

        t.put("boolean",true);

        t.put("Student",student);

        t.put("int []",a);

        t.put("double []",b);

        t.put("boolean []",c);

        t.put("String []",d);

        t.put("Student[]",e);

        System.out.println(t);

    }
*/

}

/*
class Student
{

    private int id = 1;

    private String name = "sb";

    public String toString()
    {

        return "{" + Test.toJson("id",id) + "," + Test.toJson("name",name) + "}";

    }

}
*/