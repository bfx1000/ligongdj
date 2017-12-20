package com.qf.productionManage.ProcessFlow.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.qf.util.PageData;

@Repository
public interface ProcessFlowMapper {

	
	//查询列表
	public List<Map> queryProcessFlowList(PageData pd);
				
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
	public void saveWorkingProcedure(Map map);
	
	//保存工序并保持以前的ID
	public void saveIdAndWorkingProcedure(Map map);
	
	//删除工艺图片
	public void clearPicturePartProcessFlow(Map form);
	
	//保存工艺图片
	public void savePicturePartProcessFlow(Map form);
	
	//删除工序图片
	public void clearPictureProcessFlow(Map map);
	
	//保存工序图片
	public void savePictureProcessFlow(Map map);
	
	
	
}








