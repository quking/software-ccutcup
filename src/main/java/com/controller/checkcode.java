package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

/**
 * Created by root on 17-4-16.生成图片验证码
 */
@Controller
public class checkcode {
    @RequestMapping("/checkcode")
    public void generate(HttpServletResponse response, HttpSession session){

        int width = 100;
        int height = 30;

        //创建一张内存中的缓存图片
        BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

        ///背景色
        //通过graphics绘制图像
        Graphics graphics = bufferedImage.getGraphics();
        //设置颜色
        graphics.setColor(Color.BLUE);
        //填充
        graphics.fillRect(0, 0, width, height);

        ///画边框
        graphics.setColor(Color.blue);
        graphics.drawRect(0, 0, width-1, height-1);

        //写字母
        String content = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcedfghijklmnopqrstuvwxyz1234567890";
        Random random = new Random();
        //设置字体颜色
        graphics.setColor(Color.green);
        //设置字体及大小
        graphics.setFont(new Font("宋体", Font.BOLD, 22));
        int x=20;
        int y=20;
        String code="";
        for(int i = 0; i < 4; i++)
        {

            int index = random.nextInt(content.length());
            char letter = content.charAt(index);
            graphics.drawString(letter+" ", x, y);
            x = x+20;
            code+=letter;
        }
        System.out.println("验证码："+code);
        session.setAttribute("charcode",code);
        //绘制干扰线
        int x1;
        int x2;
        int y1;
        int y2;
        graphics.setColor(Color.WHITE);
        for(int i = 0;i <5;i++)
        {
            x1=random.nextInt(width);
            x2=random.nextInt(width);
            y1=random.nextInt(height);
            y2=random.nextInt(height);
            graphics.drawLine(x1, y1, x2, y2);
        }

        //将图片输出到浏览器
        //将内存的图片通过浏览器输出流输出成jpg图片
        try {
            ImageIO.write(bufferedImage, "jpg", response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
