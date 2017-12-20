package com.qf.productionManage.ManufactureResultChild.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.qf.util.PageData;

@Repository
public interface ManufactureResultChildMapper {

	public List<Map> queryManufactureResultChildList(PageData pd);
	
	public List<Map> queryFileList(Map para);
	
	public void cleanFileManufactureResultChildById(Map para);
	
	public void deleteManufactureResultChildList(Map para);
	
	public Map queryManufactureResultChildById(Map para);
	
	public void updateManufactureResultChild(Map para);
		
	public void saveManufactureResultChild(Map para);
		
	public void saveFileManufactureResultChild(Map file);
	
	public List<Map> queryCustomizationList(PageData pd);
	
	public void deleteCustomization(Map para);
	
	public void saveCustomization(Map para);
	
	public Map queryCustomizationById(Map para);
	
	
	
	
	
	
}




