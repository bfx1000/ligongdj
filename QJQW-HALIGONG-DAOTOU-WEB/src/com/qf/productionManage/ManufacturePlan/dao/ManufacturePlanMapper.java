package com.qf.productionManage.ManufacturePlan.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.qf.util.PageData;

@Repository
public interface ManufacturePlanMapper {

	
	//查询零件信息
	public List<Map> queryManufacturePlanList(PageData pd);
	
	//查询零件信息（用于去添加）
	public Map queryManufacturePlanById(Map para);
	
	//删除信息
	public void deleteManufacturePlanList(Map para);
	
	//修改
	public void updateManufacturePlan(Map para);
					
	//新增
	public void saveManufacturePlan(Map para);
	
	//查询工序
	public List<Map> queryWorkingProcedureList(PageData pd);
	
	//查询工步
	public List<Map> queryProcessStepList(PageData pd);
	
	//修改记录
	public void updateMachineUseRecord(Map para1);
	
	//新增记录
	public void saveMachineUseRecord(Map para1);
	
	//删除记录
	public void deleteMachineUseRecord(Map para);
	
	
	
	
}











