package com.controller;

import com.alibaba.fastjson.JSONObject;
import com.pojo.Users;
import com.service.UserService;
import com.util.Md5;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;

/**
 * Created by root on 17-4-26.
 */
@Controller
public class updelctrl {
    @Resource
    private UserService userService;
    @RequestMapping("/updatepsw")
    public void updatepsw(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        PrintWriter out=response.getWriter();
        String password=request.getParameter("password");
        Users users=new Users();
        try {
            password= Md5.EncoderByMd5(password);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        users.setPassword(password);
        userService.uppassword(users);
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("result","success");
        out.print(jsonObject);

    }
    @RequestMapping("/updatepd")
    public void updatepd(HttpServletRequest request,HttpServletResponse response) throws IOException {
        PrintWriter out=response.getWriter();
        JSONObject jsonObject=new JSONObject();
        String oldpassword=request.getParameter("oldpassword");
        try {
            oldpassword= Md5.EncoderByMd5(oldpassword);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        String oldpasswords=userService.selpassword();
        if(oldpassword.equals(oldpasswords)){
            jsonObject.put("result","successes");
        }else{
            jsonObject.put("result","fail");
        }
        out.print(jsonObject);
    }
}
