package com.util;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by root on 17-4-27.
 */
public class Interceptor implements HandlerInterceptor{
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
       Object o2;
        System.out.println("我是拦截器1");
       o=httpServletRequest.getSession().getAttribute("confirecode");
        o2=httpServletRequest.getSession().getAttribute("CCUT");
       if(o!=null||o2!=null){
           return true;
       }
       httpServletRequest.setAttribute("token","请先登录您的帐号密码！！！");
       httpServletRequest.getRequestDispatcher("login.do").forward(httpServletRequest,httpServletResponse);

        return false;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
