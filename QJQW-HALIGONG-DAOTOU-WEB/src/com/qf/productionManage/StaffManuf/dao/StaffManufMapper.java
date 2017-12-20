package com.qf.productionManage.StaffManuf.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.qf.util.PageData;

@Repository
public interface StaffManufMapper {

	public List<Map> queryStaffManufList(PageData pd);
			
	public List<Map> queryCategoryTitlesStaffManufList();
	
	public Map queryStaffManufListById(Map para);
	
	public void deleteStaffManufList(Map para);
	
	public void updateStaffManuf(Map para);
				
	public void saveStaffManuf(Map para);
			
	public Map queryCategoryTitlesStaffManufByName(Map temp);
			
	public void saveCategoryTitlesStaffManuf(Map temp);
	
	
	
	
	
}
