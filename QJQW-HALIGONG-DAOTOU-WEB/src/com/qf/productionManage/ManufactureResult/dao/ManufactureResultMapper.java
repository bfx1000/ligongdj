package com.qf.productionManage.ManufactureResult.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.qf.util.PageData;

@Repository
public interface ManufactureResultMapper {
	
	public List<Map> queryManufactureResultList(PageData pd);
	
	public List<Map> queryFileList(Map para);
	
	public void cleanFileManufactureResultById(Map para);
	
	public void deleteManufactureResultList(Map para);
	
	public Map queryManufactureResultById(Map para);
	
	public void updateManufactureResult(Map para);
		
	public void saveManufactureResult(Map para);
		
	public void saveFileManufactureResult(Map file);
	
}
