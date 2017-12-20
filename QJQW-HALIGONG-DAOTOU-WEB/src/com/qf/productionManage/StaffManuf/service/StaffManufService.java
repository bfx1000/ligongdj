package com.qf.productionManage.StaffManuf.service;

import java.util.List;
import java.util.Map;

import com.qf.util.page.Page;

public interface StaffManufService {

	public Map queryStaffManufList(Page page);
	
	public List<Map> queryCategoryTitlesStaffManufList();
	
	public Map queryStaffManufListById(Map para);
	
	public void deleteStaffManufList(Map para);
	
	public void updateStaffManuf(Map para);
				
	public void saveStaffManuf(Map para);
			
	public Map queryCategoryTitlesStaffManufByName(Map temp);
			
	public void saveCategoryTitlesStaffManuf(Map temp);
	
	
}
