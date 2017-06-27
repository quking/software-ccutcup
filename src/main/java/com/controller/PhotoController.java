package com.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pojo.Invoice;
import com.pojo.Photo;
import com.service.InvoiceService;
import com.service.PhotoService;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by songyexiang on 2017/6/11.
 */

@Controller
public class PhotoController {
    @Resource
    PhotoService photoService;
    @Resource
    InvoiceService invoiceService;

    @RequestMapping(value="/addPhoto.do", method=RequestMethod.POST)
    public String addPhoto(@RequestParam MultipartFile myfile, HttpServletRequest request,ModelAndView mv) throws IOException{
        //如果只是上传一个文件，则只需要MultipartFile类型接收文件即可，而且无需显式指定@RequestParam注解
        //如果想上传多个文件，那么这里就要用MultipartFile[]类型来接收文件，并且还要指定@RequestParam注解
        //并且上传多个文件时，前台表单中的所有<input type="file"/>的name都应该是myfiles，否则参数里的myfiles无法获取到所有上传的文件
        String sep=System.getProperty("file.separator");
            if(myfile.isEmpty()){
                System.out.println("文件未上传");
            }else{
                String path = request.getSession().getServletContext().getRealPath("/WEB-INF/upload");
                //这里不必处理IO流关闭的问题，因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉，我是看它的源码才知道的
                System.out.println(path);
                byte[]bytes=myfile.getBytes();
                boolean flag=false;
                if(bytes.length!=0){
                    if(!flag){
                        File dirPath=new File(path);
                        if(!dirPath.exists()){
                            flag=dirPath.mkdirs();
                        }
                    }
                    String fileName=myfile.getOriginalFilename();
                    String photoInvoiceId = request.getParameter("photoInvoiceId");
                    String photoInvoiceCode = request.getParameter("photoInvoiceCode");
                    Photo photo = new Photo();
                    photo.setPhotoName(fileName);
                    photo.setPhotoInvoiceCode(photoInvoiceCode);
                    photo.setPhotoInvoiceId(photoInvoiceId);
                    photo.setPhotoPath( myfile.getOriginalFilename());
                    photoService.addPhoto(photo);
                    System.out.print(photoInvoiceCode);
                    File uploadFile =new File(path+sep+fileName);
                    FileCopyUtils.copy(bytes, uploadFile);
                    System.out.println("复制完成");
                    return "addPhoto1";
                }
            }
            return "addPhoto1";
    }
    @RequestMapping(value = "/guanLian.do")
    public ModelAndView guanLian(HttpServletRequest request,ModelAndView mv, HttpSession session){
        String invoiceCode = request.getParameter("invoiceCode");
        String invoiceId = request.getParameter("invoiceId");
        Invoice invoice1 = new Invoice();
        invoice1.setInvoiceCode(invoiceCode);
        invoice1.setInvoiceId(invoiceId);
        Invoice invoice = invoiceService.guanLian(invoice1);
        if(invoice == null){
            mv.setViewName("failGetPhoto");
        }else {
            session.setAttribute("inid", invoice.getInid());
            mv.addObject("companyname", invoice.getCompanyName());
            mv.addObject("allmoney", invoice.getTotalPrice());
            mv.addObject("invoicecode", invoice.getInvoiceCode());
            mv.addObject("category", invoice.getCategory());
            mv.addObject("datetime", invoice.getDatetime());
            mv.addObject("tax", invoice.getTax());
            mv.addObject("invoiceid", invoice.getInvoiceId());
            mv.addObject("price", invoice.getUnitPrice());
            mv.addObject("number", invoice.getAmount());
            mv.addObject("tel", invoice.getTel());
            mv.setViewName("showGuanLian");
        }
        return mv;
    }

    @RequestMapping(value = "/deletePhoto.do")
    public ModelAndView deletePhoto(
            ModelAndView mv,HttpServletRequest request){
        int photoId = Integer.parseInt(request.getParameter("photoId"));

        photoService.deletePhoto(photoId);

        mv.setViewName("forward:/showPhoto.do");

        return mv;
    }

    @RequestMapping("/deleteSelectPhoto.do")
    public void deleteSelectPhoto(HttpServletRequest request,HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        JSONObject jsonObject=new JSONObject();
        String arrayss[]=request.getParameterValues("arrays[]");
        ArrayList<Integer> list=new ArrayList<Integer>();
        for(int i=0;i<arrayss.length;i++){
            list.add(Integer.parseInt(arrayss[i]));
            Photo photo=new Photo();
            photo.setPhotoId(list.get(i));
            photoService.deleteSelectPhoto(photo);
        }
        out.print(jsonObject);
    }

    @RequestMapping(value = "/showPhoto.do")
    public ModelAndView showPhoto(ModelAndView mv,
                                   @RequestParam(required = true, defaultValue = "1") Integer page,
                                   @RequestParam(required = false, defaultValue = "6") Integer pageSize) {

        PageHelper.startPage(page, pageSize);

        List<Photo> list = photoService.selectPhoto();

        PageInfo<Photo> noticePageInfo = new PageInfo<Photo>(list);

        mv.addObject("photo_list", list);

        mv.addObject("page", noticePageInfo);

        mv.setViewName("showPhoto");

        return mv;
    }

    @RequestMapping(value = "/turnToPhoto.do")
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

        List<Photo> list = photoService.selectPhoto();

        PageInfo<Photo> noticePageInfo = new PageInfo<Photo>(list);

        //System.out.println(noticePageInfo.getList());

        mv.addObject("photo_list", list);

        mv.addObject("page", noticePageInfo);

        mv.setViewName("showPhoto");

        return mv;
    }

    @RequestMapping(value="/downLoad.do")
    public ResponseEntity<byte[]> downLoad(
            HttpServletRequest request,
            HttpSession session) throws Exception{
        // 根据id查询文档

        String photoId = request.getParameter("photoId");

        Photo photo =  (Photo)photoService.selectPhotoById(photoId);

        String fileName = photo.getPhotoName();
        // 上传文件路径

        String path = session.getServletContext().getRealPath(
                "/WEB-INF/upload/");
        // 获得要下载文件的File对象
        File file = new File(path+File.separator+ fileName);
        // 创建springframework的HttpHeaders对象
        HttpHeaders headers = new HttpHeaders();
        // 下载显示的文件名，解决中文名称乱码问题
        String downloadFielName = new String(fileName.getBytes("UTF-8"),"iso-8859-1");
        // 通知浏览器以attachment（下载方式）打开图片
        headers.setContentDispositionFormData("attachment", downloadFielName);
        // application/octet-stream ： 二进制流数据（最常见的文件下载）。
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        // 201 HttpStatus.CREATED
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }

    @RequestMapping("/showImage.do")
    public @ResponseBody
    void showImage(String path,HttpServletResponse response,HttpServletRequest request) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setContentType("image/jpeg");
        String fullFileName =  request.getSession().getServletContext().getRealPath("/WEB-INF/upload/"+path);
        System.out.print(fullFileName);
        FileInputStream fis = new FileInputStream(fullFileName);
        OutputStream os = response.getOutputStream();
        try {
            int count = 0;
            byte[] buffer = new byte[1024 * 1024];
            while ((count = fis.read(buffer)) != -1)
                os.write(buffer, 0, count);
            os.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (os != null)
                os.close();
            if (fis != null)
                fis.close();
        }
    }
}
