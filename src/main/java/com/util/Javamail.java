package com.util;

/**
 * Created by mtl on 17-4-14.
 */
import java.util.Properties;
import java.util.Random;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class Javamail {

    public static String send(String email) {
        Properties p = new Properties();
        p.put("mail.smtp.host", "smtp.163.com");  //
        p.put("mail.smtp.auth", "true");
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("15948772791@163.com","qj13789924774ing");
            }
        };

        Session sendMailSession = Session.getDefaultInstance(p,authenticator);
        Message mailMessage = new MimeMessage(sendMailSession);


        Random r = new Random();
        StringBuffer captcha1 = new StringBuffer();
        for (int i = 0; i < 4; i++) {
            captcha1.append(r.nextInt(9)+"");
        }
        String captcha = new String(captcha1);

        try {
            System.out.println("I'm sending...");
            Address from = new InternetAddress("15948772791@163.com");

            mailMessage.setFrom(from);
            Address to = new InternetAddress(email);
            mailMessage.setRecipient(Message.RecipientType.TO, to);
            mailMessage.setSubject("来自管理系统修改密码的请求：");
            mailMessage.setText("您的验证码： "+captcha+"。如不是本人操作可以忽视。");
            Transport.send(mailMessage);
            return captcha;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

}