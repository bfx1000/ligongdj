package com.qf.productionManage.ManufacturePlan.service;

import java.util.Map;

import com.qf.util.page.Page;

public interface ManufacturePlanService {

	//查询零件信息
	public Map queryManufacturePlanList(Page page);
	
	//查询零件信息（用于去添加）
	public Map queryManufacturePlanById(Map para);
		
	//删除信息
	public void deleteManufacturePlanList(Map para);
	
	//修改
	public void updateManufacturePlan(Map para);
					
	//新增
	public void saveManufacturePlan(Map para);
	
	//查询工序
	public Map queryWorkingProcedureList(Page page);
	
	//查询工步
	public Map queryProcessStepList(Page page);
	
	//修改记录
	public void updateMachineUseRecord(Map para1);
		
	//新增记录
	public void saveMachineUseRecord(Map para1);
	
	//删除记录
	public void deleteMachineUseRecord(Map para);
	
	
	
	
}







