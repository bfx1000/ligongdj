package com.qf.experimentControl.experimentParameterResult.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.qf.util.PageData;

@Repository
public interface ExperimentParameterResultMapping {
	
	//通过编号查询出实验基本数据的名字和类型值
	public Map ByExperimentNo(Map para);
	
	//保存参数
	public void saveExperimentParameterResult(Map map);
	
	//保存该基本信息所用到的参数，用于以后列出时，避免罗列出过多空字段。
	public void saveKey(Map map);
	
	//清空参数字段key
	public void cleanKey(Map map);
	
	//通过基本数据ID查询所对应的参数字段信息有哪些
	public String selectKeys(String id_ExperimentManage);
	
	//查询参数（只列出添加时添加的字段。通过key判断）
	public List<Map> ExperimentParameterResult( @Param(value="parameters")List<String> parameters , @Param(value="id_ExperimentManage") String id_ExperimentManage);
	
	//清空参数及结果
	public void cleansaveExperimentParameterResult(String id);
	
	//查看参数及结果（用于列出结果）
	public Map CheckExperimentResultById(String id_ExperimentParameterResult);
	
	//查看磨损度（寿命）
	public List<Map> CheckExperimentParameterToolWear(String id_ExperimentParameterResult);
	
	//查询试验结果的所有文件信息
	public List<Map> CheckExperimentResultFile(String id_ExperimentParameterResult);
	
	//查询磨损度图片（和寿命表一对多）
	public List<Map> CheckExperimentParameterToolWearPicture(String id_ExperimentParameterToolWear);
	
	//插入结果信息
	public void saveResultInfo(Map resultInfo);
	
	//清结果文件
	public void cleanResultFile(Map resultInfo);
	
	//保存结果文件
	public void saveFileAll(Map resultInfo);
	
	//清空磨损度
	public void cleanlifeInfoById(String id_ExperimentParameterResult);
	
	//保存磨损度
	public void saveListInfo(Map life);
	
	//保存磨损度图片
	public void saveLifePictureAll(Map life);
	
	//清空磨损度图片
	public void cleanLifePictureById(Map life);
	
	//查询试验基本信息
	public List<Map> queryResultList(PageData pd);
	
	//查询试验基本信息--》试验报告文件
	public List<Map> queryExperimentReportList(Map para);
	
}









