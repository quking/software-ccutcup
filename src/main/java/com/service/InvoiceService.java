package com.service;

import com.pojo.Invoice;

import java.sql.Date;
import java.util.List;
/**
 * Created by songyexiang on 2017/5/2.
 */


/**
 * Created by mtl on 17-4-18.
 */
public interface InvoiceService {

    public List<Invoice> getAll();

    public Invoice guanLian(Invoice invoice);

    public void updateInvoice(Invoice invoice);

    public void addInvoice(Invoice invoice);

    public List<String> searchYear();

    public Invoice selectAllInvoice(Invoice invoice);

    public void deleteselectall(Invoice invoice);

    public void removeInvoiceByCodeAndId(String invoiceCode,String invoiceId);

    public List<Invoice> searchInvoice(String invoiceCode, String invoiceId, Date startDate, Date endDate,
                                       String companyName, int category);

    public List<Invoice> selectdate(Invoice invoice);

    public List<Invoice> selectGoodNameByDate(Invoice invoice);

    public List<Invoice> searchInvoiceByRate(int category,double rate,int year);

}

