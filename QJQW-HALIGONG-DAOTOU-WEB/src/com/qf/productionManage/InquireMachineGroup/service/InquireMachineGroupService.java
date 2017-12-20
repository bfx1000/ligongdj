package com.qf.productionManage.InquireMachineGroup.service;

import java.util.List;
import java.util.Map;

import com.qf.util.page.Page;

public interface InquireMachineGroupService {

	
	public Map queryInquireMachineGroupList(Page page);
	
	public Map queryManufacturePlanListByNum(Page page);
	
	public Map queryInquireMachineGroupById(Map para);
	
	public void deleteInquireMachineGroupList(Map para);
	
	public void updateInquireMachineGroup(Map para);
				
	public void saveInquireMachineGroup(Map para);
	
	public List<Map> querySuperiorMachineGroupList(String NameMachineGroup);
	
	public List<Map> queryInquireMachineGroupAllList();
	
	public void updataStatus(Map para);
}
