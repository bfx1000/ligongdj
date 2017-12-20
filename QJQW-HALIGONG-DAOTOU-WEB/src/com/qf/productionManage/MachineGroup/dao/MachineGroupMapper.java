package com.qf.productionManage.MachineGroup.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.qf.util.PageData;

@Repository
public interface MachineGroupMapper {

	public List<Map> queryMachineGroupList(PageData pd);
	
	public Map queryMachineGroupListById(Map para);
	
	public void deleteMachineGroupList(Map para);
	
	public void updateMachineGroup(Map para);
				
	public void saveMachineGroup(Map para);
			
	public List<Map> loadingMachineGroup();
	
	public List<Map> loadingChildDepartmentManufacture(Map para);
	
}
