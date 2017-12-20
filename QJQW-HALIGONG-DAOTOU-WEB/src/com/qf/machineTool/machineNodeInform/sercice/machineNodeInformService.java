package com.qf.machineTool.machineNodeInform.sercice;

import java.util.List;
import java.util.Map;

import com.qf.util.PageData;
import com.qf.util.page.Page;

public interface machineNodeInformService {

	//查询机床节点信息
	public Map queryMachineNodeInformList(Page page);
				
	//查询机床节点详细信息 
	public List<Map> queryInformDetailMachineNodeInformList(Map para);
	
	//删除机床节点信息
	public void deleteMachineNodeInform(Map para);

	//删除机床结点详细信息
	public void clearInformDetailMachineNodeInformById(Map para);
	
	//通过ID查询机床节点信息（用于去新增）
	public Map queryMachineNodeInformById(Map para);
	
	//修改
	public void updateMachineNodeInform(Map para);
			
	//新增
	public void saveMachineNodeInform(Map para);
		
	//保存详细信息
	public void saveInformDetailMachineNodeInform(Map para);
	
	//查询类别列表
	public List<Map> queryCategoryMachineNodeInformList();
			
	//根据名称查询类别
	public Map queryCategoryMachineNodeInformByName(Map temp);
		
	//保存新的类别
	public void saveCategoryMachineNodeInform(Map temp);

	
	public List<String> queryDwList();

	
	public List<String> queryCjList();
	
	
	
}


