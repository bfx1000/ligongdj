package com.qf.productionManage.MachineGroup.service;

import java.util.List;
import java.util.Map;

import com.qf.util.page.Page;

public interface MachineGroupService {

	public Map queryMachineGroupList(Page page);
	
	public Map queryMachineGroupListById(Map para);
	
	public void deleteMachineGroupList(Map para);
	
	public void updateMachineGroup(Map para);
				
	public void saveMachineGroup(Map para);
			
	public List<Map> loadingMachineGroup();
	
	public List<Map> loadingChildDepartmentManufacture(Map para);
	
	
	
	
	
}
