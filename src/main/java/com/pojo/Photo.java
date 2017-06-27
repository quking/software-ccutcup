package com.pojo;

import org.springframework.web.multipart.MultipartFile;

/**
 * Created by songyexiang on 2017/6/11.
 */
public class Photo {
    private String photoPath;//图片地址
    private int photoId;     //图片id,主键
    private String photoName;//图片名称
    private String photoInvoiceId; //图片对应的发票id
    private String photoInvoiceCode;//图片对应的发票编码
    private MultipartFile photo; //图片文件

    public void  setPhotoPath(String photoPath){this.photoPath = photoPath;}

    public String getPhotoPath(){return  photoPath;}

    public void setPhotoId(int photoId){this.photoId = photoId;}

    public int getPhotoId(){return  photoId;}

    public void setPhotoName(String photoName) {this.photoName = photoName;}

    public String getPhotoName() {
        return photoName;
    }

    public void setPhotoInvoiceId(String photoInvoiceId) {
        this.photoInvoiceId = photoInvoiceId;
    }

    public String getPhotoInvoiceId() {return photoInvoiceId;}

    public void setPhotoInvoiceCode(String photoInvoiceCode) {
        this.photoInvoiceCode = photoInvoiceCode;
    }

    public String getPhotoInvoiceCode() {return photoInvoiceCode;}

    public void setPhoto(MultipartFile photo) {this.photo = photo;}

    public MultipartFile getPhoto(){return photo;}

    @Override
    public String toString() {
        return "Photo [ photoName=" + photoName + ", photoInvoiceId" + photoInvoiceId + ", photoInvoiceCode="
                + photoInvoiceCode + ", photo" + photo +",photoId"+ photoId+ "]";
    }
}

