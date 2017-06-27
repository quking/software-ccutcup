package com.service.serviceimpl;
import com.dao.InvoiceDao;
import com.pojo.Invoice;
import com.service.InvoiceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Date;
import java.util.List;
/**
 * Created by songyexiang on 2017/5/2.
 */

@Service("InvoiceService")
public class InvoiceServiceImpl implements InvoiceService{

    @Resource
    InvoiceDao invoiceDao;

    public List<Invoice> getAll() {

        return invoiceDao.findAll();
    }


    public void addInvoice(Invoice invoice)
    {

        invoiceDao.insertInvoice(invoice);

    }
    public Invoice guanLian(Invoice invoice){ return invoiceDao.guanLian(invoice);};

    public void updateInvoice(Invoice invoice)
    {
        invoiceDao.updateInvoice(invoice);
    }

    public void deleteselectall(Invoice invoice) {
        invoiceDao.deleteselectall(invoice);
    }

    public Invoice selectAllInvoice(Invoice invoice) {
        return invoiceDao.selectAllInvoice(invoice);
    }

    public void removeInvoiceByCodeAndId(String invoiceCode ,String invoiceId)
    {

        invoiceDao.deleteInvoiceByCodeAndId(invoiceCode,invoiceId);

    }

    public List<Invoice> searchInvoice(String invoiceCode, String invoiceId, Date startDate, Date endDate, String companyName, int category) {

        return invoiceDao.selectInvoice(invoiceCode, invoiceId, startDate, endDate, companyName, category);

    }

    public List<String> searchYear()
    {

        return invoiceDao.selectYear();

    }
    public List<Invoice> selectdate(Invoice invoice) {
        return invoiceDao.selectdate(invoice);
    }

    public List<Invoice> selectGoodNameByDate(Invoice invoice) {
        return invoiceDao.selectGoodNameByDate(invoice);
    }

    public List<Invoice> searchInvoiceByRate(int category,double rate,int year)
    {

        return invoiceDao.selectInvoiceByRate(category,rate,year);

    }
}
