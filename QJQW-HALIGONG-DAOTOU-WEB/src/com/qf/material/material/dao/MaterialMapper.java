package com.qf.material.material.dao;

import java.util.List;
import java.util.Map;

import com.qf.util.PageData;
import com.qf.util.page.Page;

public interface MaterialMapper {
	
	//查询刀片列表
	public List<Map> queryMaterialList(PageData pd);

	//查询材料图片列表 PictureMaterial
	List<Map> queryPictureMaterialList(Map para);
	
	//查询详细信息列表 InformDetailMaterial
	List<Map> queryInformDetailMaterialList(Map para);
	
	//查询应用实例列表 ApplicationMaterial
	List<Map> queryApplicationMaterialList(Map para);
	
	//查询仿真参数列表 SimulationMaterial
	List<Map> querySimulationMaterialList(Map para);
	
	//查询工件材料数据
	Map queryMaterialById(Map para);
	
	//修改
	void updateMaterial(Map para);
	
	//新增
	void saveMaterial(Map para);
	
	//清空材料图片路径 PictureMaterial
	void clearPictureMaterialByIdMaterial(Map para);
	
	//保存刀柄图片
	void savePictureMaterial(Map para);
	
	//清空详细信息路径
	void clearInformDetailMaterialByIdMaterial(Map para);
	
	//保存刀柄图片
	void saveInformDetailMaterial(Map para);
	
	//清空应用实例路径
	void clearApplicationMaterialByIdMaterial(Map para);
	
	//保存刀柄图片
	void saveApplicationMaterial(Map para);
	
	//清空仿真参数路径
	void clearSimulationMaterialByIdMaterial(Map para);
	
	//保存刀柄图片
	void saveSimulationMaterial(Map para);
	
	//删除工件材料
	void deleteMaterial(Map para);
	
	//查询材料类别列表
	List<Map> queryCategoryMaterialList();
	
	//根据名称查询材料类别
	Map queryCategoryMaterialById(Map temp);
	
	//保存新的材料类别
	void saveCategoryMaterial(Map temp);
}