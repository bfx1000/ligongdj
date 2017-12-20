package com.qf.CuttingFluid.CuttingFluidMaterial.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.qf.util.PageData;

@Repository
public interface CuttingFluidMaterialMapping {
	
	//查询涂层材料
	public List<Map> queryCuttingFluidMaterialList(PageData pd);
	
	//查询涂层材料图片列表 PictureCoatingMaterial
	public List<Map> queryPictureCuttingFluidMaterialList(Map para);
		
	//查询涂层详细信息列表 InformDetailCoatingMaterial
	public List<Map> queryInformDetailCuttingFluidMaterialList(Map para);
	
	//查询涂层应用实例列表 ApplicationCoatingMaterial
	public List<Map> queryApplicationCuttingFluidMaterialList(Map para);
	
	//查询切削液应用（1）
	public List<Map> queryUsingCuttingFluidList(Map para);
	
	//查询涂层材料类别列表
	public List<Map> queryCategoryCuttingFluidMaterialList();
	
	//查询涂层材料byId(用于去新增页面)
	public Map queryCuttingFluidMaterialById(Map para);
	
	//清空涂层材料图片路径
	public void clearPictureCuttingFluidMaterialById(Map para);
		
	//清空详细信息路径
	public void clearInformDetailCuttingFluidMaterialById(Map para);
			
	//清空应用实例路径
	public void clearApplicationCuttingFluidMaterialById(Map para);
	
	//清空切削液应用
	public void cleanUsingCuttingFluidById(Map para);
	
	//删除涂层材料
	public void deleteCuttingFluidMaterial(Map para);
	
	//根据名称查询材料类别
	public Map queryCategoryCuttingFluidMaterialByName(Map temp);
	
	//保存新的材料类别
	public void saveCategoryCuttingFluidMaterial(Map temp);
	
	//修改
	public void updateCuttingFluidMaterial(Map para);
		
	//新增
	public void saveCuttingFluidMaterial(Map para);
		
	//保存图片
	public void savePictureCuttingFluidMaterial(Map para);
	
	//保存详细信息
	public void saveInformDetailCuttingFluidMaterial(Map para);
	
	//保存应用实例
	public void saveApplicationCuttingFluidMaterial(Map para);

	//查询切削液应用（2）
	public List<Map> queryCuttingFluidApplyList(PageData pd);

	//保存切削液应用数据
	public void saveUsingCuttingFluid(Map p);
	
	
}
