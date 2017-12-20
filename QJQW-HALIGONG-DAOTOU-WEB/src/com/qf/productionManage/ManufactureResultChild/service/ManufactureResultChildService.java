package com.qf.productionManage.ManufactureResultChild.service;

import java.util.List;
import java.util.Map;

import com.qf.util.page.Page;

public interface ManufactureResultChildService {

		//查询列表
		public Map queryManufactureResultChildList(Page page);

		public List<Map> queryFileList(Map para);
		
		public void cleanFileManufactureResultChildById(Map para);
		
		public void deleteManufactureResultChildList(Map para);
		
		public Map queryManufactureResultChildById(Map para);
		
		public void updateManufactureResultChild(Map para);
			
		public void saveManufactureResultChild(Map para);
			
		public void saveFileManufactureResultChild(Map file);
		
		public Map queryCustomizationList(Page page);
		
		public void deleteCustomization(Map para);
		
		public void saveCustomization(Map para);
		
		public Map queryCustomizationById(Map para);
		
}
