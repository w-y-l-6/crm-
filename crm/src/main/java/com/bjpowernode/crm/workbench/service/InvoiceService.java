package com.bjpowernode.crm.workbench.service;

import com.bjpowernode.crm.workbench.domain.Activity;
import com.bjpowernode.crm.workbench.domain.Clue;
import com.bjpowernode.crm.workbench.domain.Invoice;

import java.util.List;
import java.util.Map;

public interface InvoiceService {
    int saveCreateinvoice(Invoice invoice);
    long queryCountOfInvoiceByCondition(Map<String,Object> map);
    List<Invoice> queryInvoiceForPageByCondition(Map<String,Object> map);
    List<Invoice> queryAllInvoiceForDetail();

}
