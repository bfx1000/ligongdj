package com.qf.productionManage.ProcessStep.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.qf.util.PageData;

@Repository
public interface ProcessStepMapper {

	//查询工序信息
	public Map queryWorkingProcedureList(String NoProcedureProcessFlow);
	
	//查询工艺流程
	public Map queryProcessFlowList(String id_WorkingProcedure);
	
	//查询工步列表
	public List<Map> queryProcessStepList(PageData pd);
	
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




