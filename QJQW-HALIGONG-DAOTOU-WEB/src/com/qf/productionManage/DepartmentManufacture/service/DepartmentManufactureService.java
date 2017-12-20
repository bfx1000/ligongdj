package com.qf.productionManage.DepartmentManufacture.service;

import java.util.List;
import java.util.Map;

import com.qf.util.page.Page;

public interface DepartmentManufactureService {
	
	public Map queryDepartmentManufactureList(Page page);
	
	public Map queryDepartmentManufactureListById(Map para);
	
	public void deleteDepartmentManufactureList(Map para);
	
	public void updateDepartmentManufacture(Map para);
				
	public void saveDepartmentManufacture(Map para);
	
	public List<Map> loadingDepartmentManufacture();
	
	public List<Map> loadingChildDepartmentManufacture(Map para);
}







