package com.qf.productionManage.ProcessStep.service;

import java.util.List;
import java.util.Map;

import com.qf.util.page.Page;

public interface ProcessStepService {

	//查询工序信息
	public Map queryWorkingProcedureList(String NoProcedureProcessFlow);
		
	//查询工艺流程
	public Map queryProcessFlowList(String id_WorkingProcedure);
	
	//查询工步列表
	public Map queryProcessStepList(Page page);
	
	//查询零件图片列表
	public List<Map> queryPictureProcessStepList(Map para);
	
	//删除信息
	public void deleteProcessStepList(Map para);
			
	//删除图片
	public void clearPictureProcessStep(Map para);
		
	//查询工步（用于去添加）
	public Map queryProcessStepListById(Map para);
	
	//修改工步信息
	public void updateProcessStep(Map para);
		
	//添加工步信息
	public void saveProcessStep(Map para);
		
	//添加工步图片url
	public void savePictureProcessStep(Map para);

	
	
	
	
		
		
}











