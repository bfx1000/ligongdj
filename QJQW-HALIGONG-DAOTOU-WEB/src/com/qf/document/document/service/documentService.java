package com.qf.document.document.service;

import java.util.Map;

import com.qf.util.page.Page;

public interface documentService {

	public Map queryDocumentList(Page page);
	
	public Map queryDocumentListById(Map para);
	
	public void deleteDocumentList(Map para);
	
	public void updateDocument(Map para);
				
	public void saveDocument(Map para);
	
}
