package com.util;

import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by root on 17-4-15.
 */
public class Md5 {
    public static String EncoderByMd5(String str) throws NoSuchAlgorithmException, UnsupportedEncodingException {
     //确定计算方法
    MessageDigest md5= MessageDigest.getInstance("MD5");
    BASE64Encoder base64en = new BASE64Encoder();
    //加密后的字符串
    String newstr=base64en.encode(md5.digest(str.getBytes("utf-8")));
    return newstr;
}

    public static void main(String[] args) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        String str="123456";
        System.out.print(EncoderByMd5(str));
    }
}
