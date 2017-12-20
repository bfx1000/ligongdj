package com.qf.productionManage.ManufactureResult.service;

import java.util.List;
import java.util.Map;

import com.qf.util.page.Page;

public interface ManufactureResultService {
	
	//查询列表
	public Map queryManufactureResultList(Page page);

	public List<Map> queryFileList(Map para);
	
	public void cleanFileManufactureResultById(Map para);
	
	public void deleteManufactureResultList(Map para);
	
	public Map queryManufactureResultById(Map para);
	
	public void updateManufactureResult(Map para);
		
	public void saveManufactureResult(Map para);
		
	public void saveFileManufactureResult(Map file);
	
	
}
