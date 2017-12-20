package com.qf.material.ToolCoatingMaterial.service;

import java.util.List;
import java.util.Map;

import com.qf.util.PageData;
import com.qf.util.page.Page;

public interface CoatingMaterialService {

	
	//查询涂层材料
	public Map queryCoatingMaterialList(Page page);
	
	//查询涂层材料图片列表 PictureCoatingMaterial
	public List<Map> queryPictureCoatingMaterialList(Map para);
			
	//查询涂层详细信息列表 InformDetailCoatingMaterial
	public List<Map> queryInformDetailCoatingMaterialList(Map para);
		
	//查询涂层应用实例列表 ApplicationCoatingMaterial
	public List<Map> queryApplicationCoatingMaterialList(Map para);
	
	//查询涂层材料类别列表
	public List<Map> queryCategoryToolCoatingList();
		
	//查询涂层材料byId(用于去新增页面)
	public Map queryCoatingMaterialById(Map para);
		
	//清空涂层材料图片路径
	public void clearPictureCoatingMaterialById(Map para);
			
	//清空详细信息路径
	public void clearInformDetailCoatingMaterialById(Map para);
				
	//清空应用实例路径
	public void clearApplicationCoatingMaterialById(Map para);
	
	//删除涂层材料
	public void deleteCoatingMaterial(Map para);	
	
	//根据名称查询材料类别
	public Map queryCategoryToolCoatingByName(Map temp);
	
	//保存新的材料类别
	public void saveCategoryToolCoating(Map temp);
	
	//修改
	public void updateCoatingMaterial(Map para);
			
	//新增
	public void saveCoatingMaterial(Map para);
	
	//保存图片
	public void savePictureCoatingMaterial(Map para);
		
	//保存详细信息
	public void saveInformDetailCoatingMaterial(Map para);
	
	//保存应用实例
	public void saveApplicationCoatingMaterial(Map para);

	
}







