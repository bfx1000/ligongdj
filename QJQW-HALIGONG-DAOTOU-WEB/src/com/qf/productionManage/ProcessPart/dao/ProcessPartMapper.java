package com.qf.productionManage.ProcessPart.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.qf.util.PageData;

@Repository
public interface ProcessPartMapper {

	
	//查询零件信息
	public List<Map> queryProcessPartList(PageData pd);
			
	//查询零件图片列表
	public List<Map> queryPictureProcessPartList(Map para);
				
	//查询零件详细信息
	public List<Map> queryInformProcessPartList(Map para);
		
	//查询part文件
	public List<Map> queryPartProcessPartList(Map para);
	
	//查询类别列表
	public List<Map> queryCategoryTypeProcessPartList();
	
	//查询行业应用列表
	public List<Map> queryCategoryIndustryProcessPartList();
	
	//查询零件信息（用于去添加）
	public Map queryProcessPartListById(Map para);
	
	//删除信息
	public void deleteProcessPartList(Map para);
	
	//删除图片
	public void clearProcessPartFileById(Map para);
	
	//修改
	public void updateProcessPart(Map para);
				
	//新增
	public void saveProcessPart(Map para);
			
	//保存详细信息
	public void savePictureProcessPart(Map para);
		
	//保存详细信息
	public void saveInformProcessPart(Map para);
	
	//保存详细信息
	public void savePartProcessPart(Map para);
	
	//根据名称查询类别
	public Map queryCategoryTypeProcessPartByName(Map temp);
			
	//保存新的类别
	public void saveCategoryTypeProcessPart(Map temp);
	
	//根据名称查询类别2
	public Map queryCategoryIndustryProcessPartByName(Map temp);
			
	//保存新的类别2
	public void saveCategoryIndustryProcessPart(Map temp);
	
	
	
}
