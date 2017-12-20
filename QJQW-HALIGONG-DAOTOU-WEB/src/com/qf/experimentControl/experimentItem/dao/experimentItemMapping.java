package com.qf.experimentControl.experimentItem.dao;

import java.util.List;
import java.util.Map;

import com.qf.util.PageData;
import com.qf.util.page.Page;

public interface experimentItemMapping {

	
	//查询零件信息
	public List<Map> queryExperimentItemList(PageData pd);
		
	//查询零件图片列表
	public List<Map> queryPictureExperimentItemList(Map para);
				
	//查询零件详细信息
	public List<Map> queryInformDetailExperimentItemList(Map para);
		
	//查询part文件
	public List<Map> queryPartExperimentPartList(Map para);
	
	//查询类别列表
	public List<Map> queryCategoryExperimentPartList();
			
	//删除信息
	public void deleteExperimentItemList(Map para);

	//删除图片
	public void clearPictureExperimentItemByIdMaterial(Map para);
	
	//删除详细信息
	public void clearInformDetailExperimentItemById(Map para);
	
	//删除part
	public void clearPartExperimentPartByIdMaterial(Map para);
	
	//通过ID查询信息（用于去添加）
	public Map queryExperimentItemListById(Map para);
	
	//修改
	public void updateExperimentPart(Map para);
				
	//新增
	public void saveExperimentPart(Map para);
			
	//保存详细信息
	public void savePictureExperimentItem(Map para);
		
	//保存详细信息
	public void saveInformDetailExperimentItem(Map para);
	
	//保存详细信息
	public void savePartExperimentPart(Map para);
	
	//根据名称查询类别
	public Map queryCategoryTypeExperimentPartByName(Map temp);
			
	//保存新的类别
	public void saveCategoryTypeExperimentPart(Map temp);
	
	//查询类别列表2
	public List<Map> queryCategoryMaterialExperimentPartList();
				
	//根据名称查询类别2
	public Map queryCategoryMaterialExperimentPartListByName(Map temp);
				
	//保存新的类别2
	public void saveCategoryMaterialExperimentPartList(Map temp);
	
}









