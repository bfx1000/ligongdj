package com.qf.document.document.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qf.document.document.dao.documentMapping;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("documentService")
public class documentServiceImpl implements documentService{

	@Resource
	private documentMapping mapper;

	@Override
	public Map queryDocumentList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryDocumentList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	@Override
	public Map queryDocumentListById(Map para) {
		return mapper.queryDocumentListById(para);
	}

	@Override
	public void deleteDocumentList(Map para) {
		mapper.deleteDocumentList(para);
	}

	@Override
	public void updateDocument(Map para) {
		mapper.updateDocument(para);
	}

	@Override
	public void saveDocument(Map para) {
		mapper.saveDocument(para);
	}
	
	
	
	
	
}
