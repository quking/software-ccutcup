package com.controller;

import com.alibaba.fastjson.JSONObject;
import com.pojo.Users;
import com.service.UserService;
import com.util.Md5;
import com.util.mail;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by root on 17-4-23.
 */
@Controller
public class LoginControl {
    @Resource
    private UserService userService;

    @RequestMapping("/{name}")
    public String form(@PathVariable("name") String name){
        return name;
    }
    @RequestMapping("/loginchecks")
    public void logincheck(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        PrintWriter out=response.getWriter();
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String charcode=request.getParameter("charcode");
        String charcode2= (String) session.getAttribute("charcode");
       //检查图片验证码
        if(!charcode.equalsIgnoreCase(charcode2)){
            JSONObject jsonObject=new JSONObject();
            jsonObject.put("result","errorcode");
            out.print(jsonObject);
        }else{
            try {
                password= Md5.EncoderByMd5(password);
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            }

            //检查登录
            System.out.println("原密码："+userService.selpassword());
            System.out.println("我输入的密码："+password);
            Users users=userService.checklogin(username,password);
            JSONObject jsonObject=new JSONObject();
            if(users==null){
                jsonObject.put("result","error");
            }else{
                jsonObject.put("result","success");
                session.setAttribute("confirecode","ccut");
                //记录登录时间
                session.setAttribute("lastlogintime",users.getLastlogintime());
                Date logintime=new Date();
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String dateString=formatter.format(logintime);
                Users users1=new Users();
                users1.setLastlogintime(dateString);
                userService.updatetime(users1);



            }
            out.print(jsonObject);

        }

    }
    //发送邮件
    @RequestMapping("/sendmail")
    public void sendmail(mail mail,HttpSession session,HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
   String mailcode=mail.send("1848440821@qq.com");
        System.out.println("mail:"+mailcode);
   session.setAttribute("mailcode",mailcode);
   out.print(mailcode);

    }
    //检查发送给邮件的验证码
    @RequestMapping("/fcheck")
    public void fcheck(HttpServletResponse response,HttpSession session,HttpServletRequest request) throws IOException {
        PrintWriter out=response.getWriter();
        String mailcode= (String) session.getAttribute("mailcode");
        String mcode=request.getParameter("mcode");
        JSONObject jsonObject=new JSONObject();
        if(mcode.equals(mailcode)){
            jsonObject.put("result","success");
            session.setAttribute("CCUT","idea");
        }else{
            jsonObject.put("result","error");
        }
        out.print(jsonObject);
    }
    //注销操作
    @RequestMapping("/loginout")
    public String dologinout(HttpSession session){
        session.invalidate();
        return "login";
    }
    @RequestMapping("/loginout2")
    public void loginout(HttpServletResponse response,HttpSession session) throws IOException {
        PrintWriter out=response.getWriter();
        JSONObject jsonObject=new JSONObject();
        session.invalidate();
        out.print(jsonObject);
    }
}
