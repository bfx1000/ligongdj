package com.qf.cuttingSimulation.cuttingSimulation.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.qf.util.PageData;

@Repository
public interface CuttingSimulationMapping {

	
	//查询仿真刀具列表
	public List<Map> queryCuttingSimulationList(PageData pd);
	
	//查询 queryModelPictureCutSimList
	public List<Map> queryModelPictureCutSimList(Map para);
		
	//查询 queryFileCutSimList
	public List<Map> queryFileCutSimList(Map pare);

	//查询涂层材料类别列表
	public List<Map> queryCategoryTypeCutSimList();
	
	//查询涂层材料类别列表
	public List<Map> queryCategorySoftwareCutSimList();
	
	//清空仿真刀具文件
	public void cleanCuttingSimulationFileById(Map para);
	
	//删除仿真刀具
	public void deleteCuttingSimulationById(Map para);
	
	//查询仿真刀具(用于去添加)
	public Map queryCuttingSimulationById(Map para);
	
	//查询是否存在改类型
	public Map queryCategoryTypeCutSimByName(Map temp);
	
	//查询是否存在改类型
	public Map queryCategorySoftwareCutSimByName(Map temp1);
	
	//保存新的材料类别
	public void saveCategoryTypeCutSim(Map temp);
	
	//保存新的材料类别
	public void saveCategorySoftwareCutSim(Map temp1);
	
	//修改
	public void updateCuttingSimulation(Map para);
		
	//新增
	public void saveCuttingSimulation(Map para);
		
	//保存图片
	public void saveModelPictureCutSim(Map pere);
	
	//保存详细信息
	public void saveFileCutSim(Map pare);
	
	
	
	
	
	
	
	
	
	
}















