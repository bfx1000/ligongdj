package com.qf.material.cuttingToolMaterial.dao;

import java.util.List;
import java.util.Map;

import com.qf.util.PageData;
import com.qf.util.page.Page;

public interface CuttingToolMaterialMapper {
	
	public List<Map> queryCuttingToolMaterialList(PageData pd);
	
	public List<Map> queryPictureToolMaterialList(Map para);
	
	public List<Map> queryInformToolMaterialList(Map para);
	
	public List<Map> queryApplicationToolMaterialList(Map para);
	
	public Map queryCuttingToolMaterialById(Map para);
	
	public void updateCuttingToolMaterial(Map para);
	
	public void saveCuttingToolMaterial(Map para);
	
	public void clearPictureToolMaterialByIdCuttingToolMaterial(Map para);
	
	public void savePictureToolMaterial(Map para);
	
	public void clearInformToolMaterialByIdCuttingToolMaterial(Map para);
	
	public void saveInformToolMaterial(Map para);
	
	public void clearApplicationToolMaterialByIdCuttingToolMaterial(Map para);
	
	public void saveApplicationToolMaterial(Map para);
	
	public void deleteCuttingToolMaterial(Map para);
	
	//根据名称查询材料类别
	public Map queryCategoryToolMaterialByName(Map temp);
		
	//保存新的材料类别
	public void saveCategoryToolMaterial(Map temp);
	
	//查询涂层材料类别列表
	public List<Map> queryCategoryToolMaterialList();
	
	
	
}


