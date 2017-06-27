package com.pojo;


import com.util.JsonUtil;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Date;

/**
 * Created by songyexiang on 2017/5/2.
 */



/**
 * Create by mtl on 17-4.
 */
public class Invoice {

    private int inid;       //主键，自增

    private int category;    //发票类型

    private String invoiceCode;//发票代码

    private String invoiceId;   //发票号码，只有号码和代码才能确定发票的唯一性

    private String goodName; //商品名称

    private String companyName;//公司名称

    private double unitPrice; //商品单价

    private int amount;       //商品数量

    private double totalPrice;       //金额

    private double tax;         //税额

    private double rate;        //税率

    private long tel;           //公司电话

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date datetime;      //创建日期

    private int year;

    private int month;

    public void setGoodName(String goodName) {
        this.goodName = goodName;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public void setInid(int inid){
        this.inid = inid;
    }

    public int getInid(){
        return inid;
    }

    public void  setRate(double rate){
        this.rate = rate;
    }

    public double getRate(){

        return rate;

    }

    public void setAmount(int amount){

        this.amount = amount;

    }

    public int getAmount(){

        return amount;

    }

    public void setUnitPrice(double unitPrice){

        this.unitPrice = unitPrice;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public String getInvoiceCode() {
        return invoiceCode;
    }

    public void setInvoiceCode(String invoiceCode) {
        this.invoiceCode = invoiceCode;
    }

    public String getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(String invoiceId) {
        this.invoiceId = invoiceId;
    }

    public void setCompanyName(String companyName){

        this.companyName = companyName;

    }

    public String getCompanyName(){

        return companyName;

    }

    public void setTel(long tel){

        this.tel = tel;

    }

    public long getTel(){

        return tel;

    }

    public void setDatetime(Date datetime){

        this.datetime = datetime;

    }

    public Date getDatetime(){

        return datetime;

    }

    public void setTotalPrice(double totalPrice){

        this.totalPrice = totalPrice;

    }

    public double getTotalPrice(){

        return totalPrice;

    }

    public String getGoodName(){

        return goodName;
    }

    public void setTax(double tax){

        this.tax = tax;

    }

    public double getTax(){

        return tax;

    }

    public void setCategory(int category){

        this.category = category;

    }

    public int getCategory(){

        return category;

    }
    public String toString()
    {

        String json = "{";

        json += JsonUtil.toJson("invoiceCode",String.valueOf(invoiceCode)) + ",";

        json += JsonUtil.toJson("invoiceId",String.valueOf(invoiceId)) + ",";

        json += JsonUtil.toJson("companyName",companyName) + ",";

        json += JsonUtil.toJson("datetime",String.valueOf(datetime)) + ",";

        json += JsonUtil.toJson("tel",String.valueOf(tel)) + ",";

        json += JsonUtil.toJson("totalPrice",String.valueOf(totalPrice)) + ",";

        json += JsonUtil.toJson("tax",String.valueOf(tax)) + ",";

        json += JsonUtil.toJson("category",String.valueOf(category)) + "}";

        json += JsonUtil.toJson("goodName",String .valueOf(goodName))+"}";

        json += JsonUtil.toJson("unitPrice",String.valueOf(unitPrice))+"}";

        json += JsonUtil.toJson("amount",String.valueOf(amount))+"}";

        json += JsonUtil.toJson("rate",String.valueOf(rate))+"}";

        json += JsonUtil.toJson("inid", String.valueOf(inid))+"}";

        return json;

    }

}