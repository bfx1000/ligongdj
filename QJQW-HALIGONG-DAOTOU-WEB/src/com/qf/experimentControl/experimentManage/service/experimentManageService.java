package com.qf.experimentControl.experimentManage.service;

import java.util.List;
import java.util.Map;

public interface experimentManageService {

	//查看编号是否重复
	public int judgeExperimentNoRepeat(String ExperimentNo_userForm);
	
	//查询类别
	public List<Map> CategoryExperimentType();
	
	//查询加工形式（用于下拉辅助输入效果）
	public List<String> ExperimentContentList();
	
	//新增试验
	public void saveExperimentManage(Map para);
	
	//更新实验
	public void updateExperimentManage(Map para);
	
	//保存试验报告文件
	public void saveExperimentReport(Map para);
	
	//根据名称查询类别
	public Map queryCategoryExperimentTypeById(Map temp);
		
	//保存新的类别
	public void saveCategoryExperimentType(Map temp);
		
	//查询基本信息（用于去添加）
	public Map queryExperimentManageById(Map para);	
	
	//清空ExperimentReport文件
	public void cleanExperimentReport(Map para);
	
	//删除基本信息
	public void deleteExperimentManage(Map para);
}
