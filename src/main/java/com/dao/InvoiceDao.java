package com.dao;

import com.pojo.Invoice;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

/**
 * Created by songyexiang on 2017/5/2.
 */


@Repository
public interface InvoiceDao {

    public void insertInvoice(Invoice invoice);

    public void updateInvoice(Invoice invoice);

    public Invoice selectAllInvoice(Invoice invoice);

    public Invoice guanLian(Invoice invoice);

    public void deleteInvoiceByCodeAndId(@Param ("invoiceCode")String invoiceCode,@Param("invoiceId") String invoiceId);

    public List<Invoice> selectInvoice(@Param("invoiceCode") String invoiceCode, @Param("invoiceId") String invoiceId,
                                       @Param("startDate") Date startDate, @Param("endDate") Date endDate,
                                       @Param("companyName")String companyName, @Param("category")int category);

    //@Select(" select * from invoice ")
    public List<Invoice> findAll();

    public void deleteselectall(Invoice invoice);

    public List<String> selectYear();

    public List<Invoice> selectdate(Invoice invoice);

    public List<Invoice> selectGoodNameByDate(Invoice invoice);

    public List<Invoice> selectInvoiceByRate(@Param("category")int category,@Param("rate")double rate,@Param("year")int year);

}
