package com.qf.productionManage.ProcessFlow.service;

import java.util.List;
import java.util.Map;

import com.qf.util.page.Page;

public interface ProcessFlowService {

	
	//查询零件信息
	public Map queryProcessFlowList(Page page);
	
	//查询图片列表
	public List<Map> queryPicturePartProcessFlowList(Map para);
		
	//查询工序列表
	public List<Map> queryWorkingProcedureList(Map para);
		
	//查询工序图片
	public List<Map> queryProcessFlowServiceList(Map para1);
	
	//删除信息
	public void deleteProcessFlowList(Map para);
			
	//删除图片
	public void cleanPicturePartProcessFlow(Map para);
		
	//删除图片
	public void cleanPictureProcessFlow(Map para1);
				
	//删除信息
	public void deleteWorkingProcedure(Map para);
	
	//查询工艺信息（用于去添加）
	public Map queryProcessFlowListById(Map para);
	
	//保存工艺基本信息
	public void saveProcessFlow(Map form);
		
	//修改工艺基本信息
	public void updataProcessFlow(Map form);
		
	//通过ID删除工序
	public void cleanWorkingProcedure(int id_ProcessFlow);
		
	//保存工序
	public void saveWorkingProcedure(List<Map> WorkingProcedure, int id_ProcessFlow);
	
	//删除工艺图片
	public void clearPicturePartProcessFlow(Map form);
		
	//保存工艺图片
	public void savePicturePartProcessFlow(Map form);
	
	
	
}
