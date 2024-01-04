package com.bjpowernode.crm.workbench.service.impl;

import com.bjpowernode.crm.workbench.domain.Activity;
import com.bjpowernode.crm.workbench.domain.Clue;
import com.bjpowernode.crm.workbench.domain.Invoice;
import com.bjpowernode.crm.workbench.mapper.ClueMapper;
import com.bjpowernode.crm.workbench.mapper.InvoiceMapper;
import com.bjpowernode.crm.workbench.service.InvoiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Service("invoiceService")
public class InvoiceServiceImpl implements InvoiceService {
    @Autowired
    private InvoiceMapper invoiceMapper;


    @Override
    public int saveCreateinvoice(Invoice invoice) {
        return invoiceMapper.insertInvoice(invoice);
    }

    @Override
    public long queryCountOfInvoiceByCondition(Map<String, Object> map) {
        return invoiceMapper.selectCountOfInvoiceByCondition(map);

    }


    @Override
    public List<Invoice> queryInvoiceForPageByCondition(Map<String, Object> map) {
        return invoiceMapper.selectInvoiceForPageByCondition(map);
    }
    @Override
    public List<Invoice> queryAllInvoiceForDetail() {
        return invoiceMapper.queryAllInvoiceForDetail();
    }
}
