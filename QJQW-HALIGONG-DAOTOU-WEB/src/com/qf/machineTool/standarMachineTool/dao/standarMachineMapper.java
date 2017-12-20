package com.qf.machineTool.standarMachineTool.dao;

import java.util.List;
import java.util.Map;

import com.qf.util.PageData;

public interface standarMachineMapper {
	//查询标准机床信息
	public List<Map> queryStandarMachineList(PageData pd);
		
	//查询标准机床图片列表 PictureMachineInform
	public List<Map> queryPictureMachineInformList(Map para);
	
	//查询标准机床详细信息 InformDetailMachineInform
	public List<Map> queryInformDetailMachineInformList(Map para);
	
	//查询标准机床信息（通过ID、用于去新增页面）
	public Map queryMachineInformById(Map para);
	
	//修改
	public void updateMachineInform(Map para);
		
	//新增
	public void saveMachineInform(Map para);
		
	//保存机床图片
	public void savePictureMachineInform(Map para);
	
	//保存详细信息
	public void saveInformDetailMachineInform(Map para);
	
	//删除标准机床的图片
	public void clearPictureMachineInformByIdMachineInform(Map para);
	
	//删除标准机床的详细信息
	public void clearInformDetailMachineInformByIdMachineInform(Map para);
	
	//删除标准机床
	public void deleteMachineInform(Map para);
	
	//查询类别列表
	public List<Map> queryCategoryMachineInformList();
	
	//根据名称查询类别
	public Map queryCategoryMachineInformByName(Map temp);
		
	//保存新的类别
	public void saveCategoryMachineInform(Map temp);
	
}
