package com.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pojo.Invoice;
import com.pojo.Notice;
import com.service.NoticeService;
import org.omg.CORBA.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import javax.xml.ws.Response;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by songyexiang on 2017/5/23.
 */
@Controller
public class NoticeController {
    @Resource
    NoticeService noticeService;

    @RequestMapping(value = "/addNotice1.do")
    public String addNotice(HttpServletRequest request, HttpServletResponse response){

        Notice notice = new Notice();

        notice.setTitle( request.getParameter("title"));

        notice.setContent(request.getParameter("content"));

        notice.setNoticePerson(request.getParameter("noticePerson"));

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        Date date = new Date();

        String noticeDate = format.format(date);

        notice.setNoticeDatetime(noticeDate);

        if(notice.getTitle()!= null && notice.getTitle()!="" &&
                notice.getContent()!= null && notice.getContent()!="") {

            noticeService.addNotice(notice);

            return "forward:/showNotice.do";

        }
        else{
            return "addNotice";
        }

    }

    @RequestMapping(value="/previewNotice.do")
    public String previewNotice(
            Integer id,Model model){

        Notice notice = new Notice();
        notice.setNoticeId(id);
        Notice notice1 = noticeService.selectNoticeById(notice);
        model.addAttribute("notice", notice1);
        // 返回
        return "previewNotice";
    }

    @RequestMapping(value = "/deleteNotice.do")
    public ModelAndView deleteNotice(@RequestParam Integer noticeId,
                                     ModelAndView mv)throws Exception {

        noticeService.deleteNoticeById(noticeId);
      	mv.setViewName("forward:/showNotice.do");
        return mv;
    }

    @RequestMapping("/deleteSelectNotice.do")
    public void deleteSelectNotice(HttpServletRequest request,HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        List<Notice>lists=noticeService.selectAllNotice();
        JSONObject jsonObject=new JSONObject();
        String arrayss[]=request.getParameterValues("arrays[]");
        ArrayList<Integer> list=new ArrayList<Integer>();
        for(int i=0;i<arrayss.length;i++){
            list.add(Integer.parseInt(arrayss[i]));
            Notice notice=new Notice();
            notice.setNoticeId(list.get(i));
            noticeService.deleteSelectNotice(notice);
        }
        jsonObject.put("len",lists.size());
        out.print(jsonObject);
    }

    @RequestMapping(value = "/showNotice.do")
    public ModelAndView showNotice(ModelAndView mv,
                                     @RequestParam(required = true, defaultValue = "1") Integer page,
                                     @RequestParam(required = false, defaultValue = "6") Integer pageSize) {

        PageHelper.startPage(page, pageSize);

        List<Notice> list = noticeService.selectAllNotice();

        PageInfo<Notice> noticePageInfo = new PageInfo<Notice>(list);

        mv.addObject("notice_list", list);

        mv.addObject("page", noticePageInfo);

        mv.setViewName("showNotice1");

        return mv;
    }
    @RequestMapping(value = "/showNotice1.do")
    public ModelAndView showNotice1(ModelAndView mv,HttpServletRequest request, HttpServletResponse response) {

        int page = Integer.parseInt(request.getParameter("page"));

        int pageSize = 6;

        PageHelper.startPage(page,pageSize);

        List<Notice> list = noticeService.selectAllNotice();

        PageInfo<Notice> noticePageInfo = new PageInfo<Notice>(list);

        //System.out.println(noticePageInfo.getList());

        mv.addObject("notice_list", list);

        mv.addObject("page", noticePageInfo);

        mv.setViewName("showNotice1");

        return mv;
    }

    @RequestMapping(value = "/turnToNotice.do")
    public ModelAndView turnToNotice(ModelAndView mv,HttpServletRequest request, HttpServletResponse response) {

        int page = Integer.parseInt(request.getParameter("page"));

        int pages = Integer.parseInt(request.getParameter("pages"));

        //System.out.print(page);

        int pageSize = 6;

        if (page == 0) {
            PageHelper.startPage(1, pageSize);
        } else if (page == pages + 1) {
            PageHelper.startPage(pages, pageSize);
        } else {
            PageHelper.startPage(page, pageSize);
        }

        List<Notice> list = noticeService.selectAllNotice();

        PageInfo<Notice> noticePageInfo = new PageInfo<Notice>(list);

        //System.out.println(noticePageInfo.getList());

        mv.addObject("notice_list", list);

        mv.addObject("page", noticePageInfo);

        mv.setViewName("showNotice1");

        return mv;
    }
    @RequestMapping("/loadnotices")//遍历公告
    public void loadnotices(HttpServletResponse response) throws IOException {
                response.setCharacterEncoding("utf-8");
                PrintWriter out=response.getWriter();
                JSONObject jsonObject=new JSONObject();
        List<Notice> noticelist=noticeService.selectAllNotice();
        List<String>titlelist=new ArrayList<String>();
        List<String>personlist=new ArrayList<String>();
        List<String>contentlist=new ArrayList<String>();
        List<String>datelist=new ArrayList<String>();
        List<Integer>noticeidlist=new ArrayList<Integer>();
        for(int i=0;i<noticelist.size();i++){
            titlelist.add(noticelist.get(i).getTitle());
            personlist.add(noticelist.get(i).getNoticePerson());
            contentlist.add(noticelist.get(i).getContent());
            datelist.add(noticelist.get(i).getNoticeDatetime());
            noticeidlist.add(noticelist.get(i).getNoticeId());
        }
        jsonObject.put("titlelist",titlelist.toArray());
        jsonObject.put("personlist",personlist.toArray());
        jsonObject.put("contentlist",contentlist.toArray());
        jsonObject.put("datelist",datelist.toArray());
        jsonObject.put("nid",noticeidlist.toArray());
        out.print(jsonObject);

    }
}
