package com.qf.productionManage.DepartmentManufacture.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.qf.util.PageData;

@Repository
public interface DepartmentManufactureMapper {

	
	public List<Map> queryDepartmentManufactureList(PageData pd);
	
	public Map queryDepartmentManufactureListById(Map para);
	
	public void deleteDepartmentManufactureList(Map para);
	
	public void updateDepartmentManufacture(Map para);
				
	public void saveDepartmentManufacture(Map para);
			
	public List<Map> loadingDepartmentManufacture();
	
	public List<Map> loadingChildDepartmentManufacture(Map para);
	
}





