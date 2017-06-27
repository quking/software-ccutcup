package com.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.util.Calculate;
import com.util.DateValue;
import com.util.JsonUtil;
import com.pojo.Invoice;
import com.service.InvoiceService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.*;

/**
 * Created by songyexiang on 2017/5/2.
 */
@Controller
public class InvoiceController {
    @Resource
    InvoiceService invoiceService;

    @RequestMapping(value = "/invoice.do")
    public String invoice(Model model,
                          @RequestParam(required = true, defaultValue = "1") Integer page,
                          @RequestParam(required = true, defaultValue = "6") Integer pageSize) {

        PageHelper.startPage(page, pageSize);

        List<Invoice> invoice = invoiceService.getAll();

        PageInfo<Invoice> invoicePageInfo = new PageInfo<Invoice>(invoice);

        model.addAttribute("invoice_list", invoice);

        model.addAttribute("page", invoicePageInfo);

        return "invoice";
    }

    @RequestMapping("/add.do")
    public void add(HttpServletRequest request, HttpServletResponse response) {

        int amount=Integer.parseInt((request.getParameter("amount")));
        Double singprice=Double.parseDouble(request.getParameter("unitPrice"));
        Double rate=Double.parseDouble((request.getParameter("rate")));


        Invoice invoice = new Invoice();

        invoice.setInvoiceCode(request.getParameter("invoiceCode"));

        invoice.setInvoiceId(request.getParameter("invoiceId"));

        String companyName = request.getParameter("companyName");

        invoice.setCompanyName(companyName);

        invoice.setTel(Long.parseLong(request.getParameter("tel")));

        invoice.setDatetime(Date.valueOf(request.getParameter("datetime")));

        invoice.setTotalPrice(Double.parseDouble(request.getParameter("totalPrice")));

        invoice.setTax(amount*singprice*rate);

        invoice.setCategory(Integer.parseInt(request.getParameter("category")));

        String goodName = request.getParameter("goodName");

        invoice.setGoodName(goodName);

        invoice.setUnitPrice(singprice);

        invoice.setAmount(amount);

        invoice.setRate(rate);

        System.out.print(request.getParameter("companyName"));

        invoiceService.addInvoice(invoice);

    }

    @RequestMapping("/updateInvoice.do")
    public ModelAndView updateInvoice(HttpServletResponse response, HttpServletRequest request, ModelAndView mv, HttpSession session) throws IOException {
        String invoiceCode = request.getParameter("invoiceCode");
        String invoiceId = request.getParameter("invoiceId");
        Invoice invoice=new Invoice();
        invoice.setInvoiceCode(invoiceCode);
        invoice.setInvoiceId(invoiceId);
        Invoice invoice1=invoiceService.selectAllInvoice(invoice);
        session.setAttribute("inid",invoice1.getInid());
        mv.addObject("companyname",invoice1.getCompanyName());
        mv.addObject("allmoney",invoice1.getTotalPrice());
        mv.addObject("invoicecode",invoice1.getInvoiceCode());
        mv.addObject("category",invoice1.getCategory());
        mv.addObject("datetime",invoice1.getDatetime());
        mv.addObject("tax",invoice1.getTax());
        mv.addObject("invoiceid",invoice1.getInvoiceId());
        mv.addObject("price",invoice1.getUnitPrice());
        mv.addObject("number",invoice1.getAmount());
        mv.addObject("tel",invoice1.getTel());
        mv.addObject("goodsName",invoice1.getGoodName());
        mv.setViewName("updateInvoice");
        return mv;

    }

    @RequestMapping("/updateInvoice2.do")
    public void updateInvoice2(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
        PrintWriter out=response.getWriter();
        JSONObject jsonObject=new JSONObject();
        Invoice invoice=new Invoice();
        int inid= (Integer) session.getAttribute("inid");

        invoice.setInvoiceCode(request.getParameter("invoiceCode"));

        invoice.setInvoiceId(request.getParameter("invoiceId"));

        Invoice invoice1=invoiceService.selectAllInvoice(invoice);
        if(invoice1==null||invoice1.getInid()==inid){
            invoice.setInid(inid);
            invoice.setCompanyName(request.getParameter("companyName"));

            invoice.setTel(Long.parseLong(request.getParameter("tel")));

            invoice.setDatetime(Date.valueOf(request.getParameter("datetime")));

            invoice.setUnitPrice(Double.parseDouble(request.getParameter("price")));

            invoice.setGoodName(request.getParameter("goodName"));

            invoice.setRate(Double.parseDouble(request.getParameter("rate")));

            invoice.setTax(Double.parseDouble(request.getParameter("rate"))*Integer.parseInt(request.getParameter("number"))*Double.parseDouble(request.getParameter("price")));

            invoice.setCategory(Integer.parseInt(request.getParameter("category")));

            invoice.setTotalPrice(Double.parseDouble(request.getParameter("allmoney")));

            invoice.setAmount(Integer.parseInt(request.getParameter("number")));

            invoiceService.updateInvoice(invoice);
            jsonObject.put("result","success");

        }else{
            jsonObject.put("result","fail");
        }
        out.print(jsonObject);
    }


    @RequestMapping("/remove.do")
    public ModelAndView delete(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

        String invoiceCode = request.getParameter("invoiceCode");

        String  invoiceId = request.getParameter("invoiceId");

        String str = request.getParameter("str");

        System.out.print(str);

        invoiceService.removeInvoiceByCodeAndId(invoiceCode, invoiceId);

        System.out.print(invoiceCode);

        mv.setViewName("forward:/invoice.do");

        return mv;

    }

    @RequestMapping("/deleteall.do")
    public void deleteall(HttpServletRequest request,HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        JSONObject jsonObject=new JSONObject();
        String arrayss[]=request.getParameterValues("arrays[]");
        ArrayList<Integer> list=new ArrayList<Integer>();
        for(int i=0;i<arrayss.length;i++){
            list.add(Integer.parseInt(arrayss[i]));
            Invoice invoice=new Invoice();
            invoice.setInid(list.get(i));
            invoiceService.deleteselectall(invoice);
        }
        out.print(jsonObject);
    }
    @RequestMapping("/search.do")
    public ModelAndView search(HttpServletRequest request,ModelAndView mv,
                               @RequestParam(required = true, defaultValue = "1") Integer page,
                               @RequestParam(required = true, defaultValue = "6") Integer pageSize) throws IOException {

        String p1 = null;

        String p2 = null;

        String p3 = null;

        Date p4 = null;

        Date p5 = null;

        int p6;

        String invoiceCode = request.getParameter("invoiceCode");

        if (invoiceCode != "")

            p1 = invoiceCode;

        String invoiceId = request.getParameter("invoiceId");

        if (invoiceId != "")

            p2 = invoiceId;

        String companyName = request.getParameter("companyName");

        if (companyName != "")

            p3 = companyName;

        String startDate = request.getParameter("startDate");


        if (startDate != "")

            p4 = Date.valueOf(startDate);

        String endDate = request.getParameter("endDate");

        if (endDate != "")

            p5 = Date.valueOf(endDate);

        String category1 = request.getParameter("category");


        if (category1 == ""||category1 == null ) {

           // JOptionPane.showMessageDialog(null, "请务必选择发票类型！");

             mv.setViewName("forward:/invoice.do");
            return mv;
        } else {

            int category = Integer.parseInt(request.getParameter("category"));
            p6 = category;
            if(page == 0) {
                PageHelper.startPage(1, pageSize);

            }else{
                PageHelper.startPage(page, pageSize);
            }

            List<Invoice> invoice1 = invoiceService.searchInvoice(p1, p2, p4, p5, p3, p6);

            PageInfo<Invoice> invoicePageInfo1 = new PageInfo<Invoice>(invoice1);

            mv.addObject("invoice_list", invoice1);

            mv.addObject("invoice_list", invoice1);

            mv.addObject("page", invoicePageInfo1);

            mv.addObject("invoiceCode",invoiceCode);
            mv.addObject("invoiceId",invoiceId);
            mv.addObject("companyName",companyName);
            mv.addObject("startDate",startDate);
            mv.addObject("endDate",endDate);
            mv.addObject("category",category);

            mv.setViewName("searchInvoice");
            return mv;
        }
    }

    //页面跳转
    @RequestMapping(value = "/turnTo.do")
    public ModelAndView turnTo(ModelAndView mv,HttpServletRequest request, HttpServletResponse response) {

        int page = Integer.parseInt(request.getParameter("page"));

        int pages = Integer.parseInt(request.getParameter("pages"));

        //System.out.print(page);

        int pageSize = 6;

        if(page==0) {
            PageHelper.startPage(1,pageSize);
        }

        else if(page==pages+1){
            PageHelper.startPage(pages,pageSize);
        }
        else {
            PageHelper.startPage(page,pageSize);
        }

        List<Invoice> invoice = invoiceService.getAll();

        PageInfo<Invoice> noticePageInfo = new PageInfo<Invoice>(invoice);

        //System.out.println(noticePageInfo.getList());

        mv.addObject("invoice_list", invoice);

        mv.addObject("page", noticePageInfo);

        mv.setViewName("invoice");

        return mv;
    }


    /*@RequestMapping(value = "/searchTurnTo.do")
    public ModelAndView searchTurnTo(ModelAndView mv,HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();

        String  = (String) session.getAttribute("condition");

        int page = Integer.parseInt(request.getParameter("page"));

        int pages = Integer.parseInt(request.getParameter("pages"));

        //System.out.print(page);

        int pageSize = 6;

        if(page==0) {
            PageHelper.startPage(1,pageSize);
        }

        else if(page==pages+1){
            PageHelper.startPage(pages,pageSize);
        }
        else {
            PageHelper.startPage(page,pageSize);
        }

        List<Invoice> invoice = invoiceService.getAll();

        PageInfo<Invoice> noticePageInfo = new PageInfo<Invoice>(invoice);

        //System.out.println(noticePageInfo.getList());

        mv.addObject("invoice_list", invoice);

        mv.addObject("page", noticePageInfo);

        mv.setViewName("invoice");

        return mv;
    }*/
    @RequestMapping("/TaxmonthImg.do")
    public void month(HttpServletResponse response, HttpServletRequest request) throws Exception {

        request.setCharacterEncoding("UTF-8");

        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        JsonUtil json = new JsonUtil();

        int year = Integer.parseInt(request.getParameter("year"));

        int month = Integer.parseInt(request.getParameter("month"));

        int day = DateValue.getDayOfMonth(year, month);

        Date startDate = Date.valueOf(year + "-" + month + "-" + "01");

        if (month != 12) {
            month++;
        } else {

            month = 1;

            year++;

        }
        Date endDate = Date.valueOf(year + "-" + (month) + "-" + "01");

        Object[] ininvoice = invoiceService.searchInvoice(null, null, startDate, endDate, null, 0).toArray();

        Object[] outinvoice = invoiceService.searchInvoice(null, null, startDate, endDate, null, 1).toArray();

        BigDecimal[] intax = new BigDecimal[day];

        BigDecimal[] outtax = new BigDecimal[day];

        BigDecimal[] subtax = new BigDecimal[day];

        for (int i = 0; i < day; i++) {

            intax[i] = new BigDecimal(0);

            outtax[i] = new BigDecimal(0);

            subtax[i] = new BigDecimal(0);

        }
        System.out.println(1);

        for (int i = 0; i < ininvoice.length; i++) {

            Class cls = ininvoice[i].getClass();

            int index = DateValue.getDayOfDate((Date) cls.getMethod("getDatetime").invoke(ininvoice[i])) - 1;

            intax[index] = Calculate.add(intax[index], new BigDecimal((Double) cls.getMethod("getTax").invoke(ininvoice[i])).setScale(1,BigDecimal.ROUND_HALF_UP));

        }
        System.out.println(2);
        for (int i = 0; i < outinvoice.length; i++) {

            Class cls = outinvoice[i].getClass();

            int index = DateValue.getDayOfDate((Date) cls.getMethod("getDatetime").invoke(outinvoice[i])) - 1;

            outtax[index] = Calculate.add(outtax[index], new BigDecimal((Double) cls.getMethod("getTax").invoke(outinvoice[i])).setScale(1,BigDecimal.ROUND_HALF_UP));


        }
        System.out.println(3);
        for (int i = 0; i < day; i++)

            System.out.println(i + ":" + intax[i] + "," + outtax[i]);

        System.out.println("2");

        String x[] = new String[day];

        for (int i = 0; i < day; i++) {

            x[i] = (i + 1) + "日";

            subtax[i] = Calculate.sub(intax[i], outtax[i]);

        }

        json.put("x", x);

        double[] in = new double[day];

        double[] ou = new double[day];

        double[] sub = new double[day];

        for (int i = 0; i < day; i++)
        {

            in[i] = Double.parseDouble(intax[i].toString());

            ou[i] = Double.parseDouble(outtax[i].toString());

            sub[i] = Double.parseDouble(subtax[i].toString());

        }



        json.put("intax", in);

        json.put("outtax", ou);

        json.put("subtax", sub);

        out.println(json);

    }

    @RequestMapping("/TaxyearImg.do")
    public void year(HttpServletRequest request, HttpServletResponse response) throws Exception {

        request.setCharacterEncoding("UTF-8");

        response.setCharacterEncoding("UTF-8");

        String year = request.getParameter("year");

        Date startDate = Date.valueOf(year + "-01-01");

        Date endDate = Date.valueOf((Integer.parseInt(year) + 1) + "-01-01");

        JsonUtil json = new JsonUtil();

        Object[] ininvoice = invoiceService.searchInvoice(null, null, startDate, endDate, null, 1).toArray();

        Object[] outinvoice = invoiceService.searchInvoice(null, null, startDate, endDate, null, 0).toArray();

        PrintWriter out = response.getWriter();

        BigDecimal[] intax = new BigDecimal[12];

        BigDecimal[] outtax = new BigDecimal[12];

        BigDecimal[] subtax = new BigDecimal[12];

        for(int i=0;i<12;i++)
        {

            intax[i] = new BigDecimal(0);

            outtax[i] = new BigDecimal(0);

            subtax[i] = new BigDecimal(0);

        }

        for (int j = 0; j < ininvoice.length; j++) {

            Class cls = ininvoice[j].getClass();

            int index =DateValue.getMonthOfDate((Date) cls.getMethod("getDatetime").invoke(ininvoice[j])) - 1;

            intax[index] = Calculate.add(intax[index],new BigDecimal((Double) cls.getMethod("getTax").invoke(ininvoice[j])).setScale(1,BigDecimal.ROUND_HALF_UP));

        }

        for (int j = 0; j < outinvoice.length; j++) {

            Class cls = outinvoice[j].getClass();

            int index = DateValue.getMonthOfDate((Date) cls.getMethod("getDatetime").invoke(outinvoice[j])) - 1;

            outtax[index] = Calculate.add(outtax[index],new BigDecimal((Double)cls.getMethod("getTax").invoke(outinvoice[j])).setScale(1,BigDecimal.ROUND_HALF_UP));

        }

        String x[] = new String[12];

        for (int j = 0; j < 12; j++) {

            x[j] = (j + 1) + "月";

            subtax[j] = Calculate.sub(outtax[j], intax[j]);

        }



        json.put("x", x);

        double[] in = new double[12];

        double[] ou = new double[12];

        double[] sub = new double[12];

        for (int i = 0; i < 12; i++)
        {

            in[i] = Double.parseDouble(intax[i].toString());

            ou[i] = Double.parseDouble(outtax[i].toString());

            sub[i] = Double.parseDouble(subtax[i].toString());

        }

        json.put("intax", in);

        json.put("outtax", ou);

        json.put("subtax", sub);

        out.println(json);

    }

    @RequestMapping("getYear.do")
    public void getYear(HttpServletResponse response,HttpServletRequest request) throws Exception {

        request.setCharacterEncoding("UTF-8");

        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        JsonUtil json = new JsonUtil();

        List<String> list = invoiceService.searchYear();

        String [] a = new String[list.size()];

        for(int i=0;i<list.size();i++)

            a[i] = list.get(i);

        Arrays.sort(a);

        json.put("yearList", a);

        out.println(json);

    }

    @RequestMapping("/TotalPricemonthImg.do")
    public void salemonth(HttpServletResponse response, HttpServletRequest request) throws Exception {

        request.setCharacterEncoding("UTF-8");

        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        JsonUtil json = new JsonUtil();

        int year = Integer.parseInt(request.getParameter("year"));

        int month = Integer.parseInt(request.getParameter("month"));

        int day = DateValue.getDayOfMonth(year, month);

        Date startDate = Date.valueOf(year + "-" + month + "-" + "01");

        if (month != 12) {
            month++;
        } else {

            month = 1;

            year++;

        }
        Date endDate = Date.valueOf(year + "-" + (month) + "-" + "01");


        Object[] ininvoice = invoiceService.searchInvoice(null, null, startDate, endDate, null, 0).toArray();

        Object[] outinvoice = invoiceService.searchInvoice(null, null, startDate, endDate, null, 1).toArray();

        BigDecimal[] intax = new BigDecimal[day];

        BigDecimal[] outtax = new BigDecimal[day];

        BigDecimal[] subtax = new BigDecimal[day];

        for(int i=0;i<day;i++)
        {

            intax[i] = new BigDecimal(0);

            outtax[i] = new BigDecimal(0);

            subtax[i] = new BigDecimal(0);

        }

        for (int i = 0; i < ininvoice.length; i++) {

            Class cls = ininvoice[i].getClass();

            int index = DateValue.getDayOfDate((Date) cls.getMethod("getDatetime").invoke(ininvoice[i])) - 1;

            intax[index] = Calculate.add(intax[index],new BigDecimal((Double) cls.getMethod("getTotalPrice").invoke(ininvoice[i])).setScale(1,BigDecimal.ROUND_HALF_UP));

        }

        for (int i = 0; i < outinvoice.length; i++) {

            Class cls = outinvoice[i].getClass();

            int index = DateValue.getDayOfDate((Date) cls.getMethod("getDatetime").invoke(outinvoice[i])) - 1;

            outtax[index] = Calculate.add(outtax[index],new BigDecimal((Double) cls.getMethod("getTotalPrice").invoke(outinvoice[i])).setScale(1,BigDecimal.ROUND_HALF_UP));

        }

        for (int i = 0; i < day; i++)

            System.out.println(i + ":" + intax[i] + "," + outtax[i]);

        System.out.println("2");

        String x[] = new String[day];

        for (int i = 0; i < day; i++) {

            x[i] = (i + 1) + "日";

            subtax[i] = Calculate.sub(intax[i], outtax[i]);

        }

        json.put("x", x);


        double[] in = new double[day];

        double[] ou = new double[day];

        double[] sub = new double[day];

        for (int i = 0; i < day; i++)
        {

            in[i] = Double.parseDouble(intax[i].toString());

            ou[i] = Double.parseDouble(outtax[i].toString());

            sub[i] = Double.parseDouble(subtax[i].toString());

        }

        json.put("inTotalPrice", in);

        json.put("outTotalPrice", ou);

        json.put("subTotalPrice", sub);

        out.println(json);

    }

    @RequestMapping("TotalPriceyearImg.do")
    public void saleyear(HttpServletRequest request,HttpServletResponse response) throws Exception
    {
        request.setCharacterEncoding("UTF-8");

        response.setCharacterEncoding("UTF-8");

        String year = request.getParameter("year");

        Date startDate = Date.valueOf(year + "-01-01");

        Date endDate = Date.valueOf((Integer.parseInt(year) + 1) + "-01-01");

        JsonUtil json = new JsonUtil();

        Object[] ininvoice = invoiceService.searchInvoice(null, null, startDate, endDate, null, 1).toArray();

        Object[] outinvoice = invoiceService.searchInvoice(null, null, startDate, endDate, null, 0).toArray();

        PrintWriter out = response.getWriter();

        BigDecimal[] intax = new BigDecimal[12];

        BigDecimal[] outtax = new BigDecimal[12];

        BigDecimal[] subtax = new BigDecimal[12];

        for(int i=0;i<12;i++)
        {

            intax[i] = new BigDecimal(0);

            outtax[i] = new BigDecimal(0);

            subtax[i] = new BigDecimal(0);

        }

        for (int j = 0; j < ininvoice.length; j++) {

            Class cls = ininvoice[j].getClass();

            int index = DateValue.getMonthOfDate((Date) cls.getMethod("getDatetime").invoke(ininvoice[j])) - 1;

            intax[index] = Calculate.add(intax[index],new BigDecimal((Double) cls.getMethod("getTotalPrice").invoke(ininvoice[j])).setScale(1,BigDecimal.ROUND_HALF_UP));

        }

        for (int j = 0; j < outinvoice.length; j++) {

            Class cls = outinvoice[j].getClass();

            int index = DateValue.getMonthOfDate((Date) cls.getMethod("getDatetime").invoke(outinvoice[j])) - 1;

            outtax[index] = Calculate.add(outtax[index],new BigDecimal((Double) cls.getMethod("getTotalPrice").invoke(outinvoice[j])).setScale(1,BigDecimal.ROUND_HALF_UP));

        }

        String x[] = new String[12];

        for (int j = 0; j < 12; j++) {

            x[j] = (j + 1) + "月";

            subtax[j] = Calculate.sub(outtax[j], intax[j]);

        }

        json.put("x", x);


        double[] in = new double[12];

        double[] ou = new double[12];

        double[] sub = new double[12];

        for (int i = 0; i < 12; i++)
        {

            in[i] = Double.parseDouble(intax[i].toString());

            ou[i] = Double.parseDouble(outtax[i].toString());

            sub[i] = Double.parseDouble(subtax[i].toString());

        }

        json.put("inTotalPrice", in);

        json.put("outTotalPrice", ou);

        json.put("subTotalPrice", sub);

        out.println(json);

    }

    @RequestMapping("TaxPanImg.do")
    public void taxPanImg(HttpServletRequest request,HttpServletResponse response)throws Exception
    {

        double rate[] = {0.17,0.13,0.11,0.06,0};

        PrintWriter out = response.getWriter();

        JsonUtil json = new JsonUtil();

        int year = Integer.parseInt(request.getParameter("year"));

        BigDecimal intax = new BigDecimal(0);

        BigDecimal outtax = new BigDecimal(0);

        for(int i=0;i<rate.length;i++)
        {

            intax = new BigDecimal(0);

            outtax = new BigDecimal(0);

            List<Invoice> outinvoice = invoiceService.searchInvoiceByRate(0,rate[i],year);

            List<Invoice> ininvoice = invoiceService.searchInvoiceByRate(1,rate[i],year);

            for(int j=0;j<outinvoice.size();j++)

                outtax = Calculate.add(outtax,new BigDecimal(outinvoice.get(j).getTax()).setScale(1,BigDecimal.ROUND_HALF_UP));

            for(int j=0;j<ininvoice.size();j++)

                intax = Calculate.add(intax,new BigDecimal(ininvoice.get(j).getTax()).setScale(1,BigDecimal.ROUND_HALF_UP));

            double in = Double.parseDouble(intax.toString());

            double ou = Double.parseDouble(outtax.toString());

            json.put("intax"+i,in);

            json.put("outtax"+i,ou);;


        }

        out.println(json);

    }

    @RequestMapping("/selectdate")
    public void selectdate(HttpServletRequest request,HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("utf-8");
        JSONObject jsonObject=new JSONObject();
        PrintWriter out=response.getWriter();
        int year=Integer.parseInt(request.getParameter("year"));
        int category=Integer.parseInt(request.getParameter("category"));
        Invoice invoice=new Invoice();
        invoice.setYear(year);
        invoice.setCategory(category);
        List<Invoice> goods = invoiceService.selectGoodNameByDate(invoice);
        double Allmoney[][] = new double[12][goods.size()];
        for(int i=0;i<goods.size();i++)
            for(int k=1;k<13;k++){
                invoice.setMonth(k);
                List<Invoice> list2=invoiceService.selectdate(invoice);
                for(int j=0;j<list2.size();j++) {


                    if (list2.get(j).getGoodName().equals(goods.get(i).getGoodName()))
                        Allmoney[k - 1][i] += list2.get(j).getTotalPrice();
                }
            }
        List goodslist=new ArrayList();
        for(int m=0;m<goods.size();m++){
            goodslist.add(goods.get(m).getGoodName());
        }

        jsonObject.put("Allmoney",Allmoney);

        jsonObject.put("goods",goodslist);

        out.println(jsonObject);


    }
}
