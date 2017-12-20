package com.qf.document.document.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.qf.util.PageData;

@Repository
public interface documentMapping {

	public List<Map> queryDocumentList(PageData pd);
	
	public Map queryDocumentListById(Map para);
	
	public void deleteDocumentList(Map para);
	
	public void updateDocument(Map para);
				
	public void saveDocument(Map para);
	
	
}
