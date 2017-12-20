package com.qf.productionManage.InquireMachineGroup.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.qf.util.PageData;

@Repository
public interface InquireMachineGroupMapper {

	
	public List<Map> queryInquireMachineGroupList(PageData pd);
	
	public List<Map> queryManufacturePlanListByNum(PageData pd);
	
	public Map queryInquireMachineGroupById(Map para);
	
	public void deleteInquireMachineGroupList(Map para);
	
	public void updateInquireMachineGroup(Map para);
				
	public void saveInquireMachineGroup(Map para);
	
	public List<Map> querySuperiorMachineGroupList(String NameMachineGroup);
	
	public List<Map> queryInquireMachineGroupAllList();
	
	public void updataStatus(Map para);
}
