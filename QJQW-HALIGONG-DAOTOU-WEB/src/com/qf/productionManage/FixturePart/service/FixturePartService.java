package com.qf.productionManage.FixturePart.service;

import java.util.List;
import java.util.Map;

import com.qf.util.PageData;
import com.qf.util.page.Page;

public interface FixturePartService {

	//查询零件信息
	public Map queryFixturePartList(Page page);
			
	//查询零件图片列表
	public List<Map> queryPictureFixturePartList(Map para);
				
	//查询零件详细信息
	public List<Map> queryInformFixturePartList(Map para);
		
	//查询part文件
	public List<Map> queryPartFixturePartList(Map para);
	
	//查询类别列表
	public List<Map> queryCategoryTypeFixturePartList();
	
	//查询零件信息（用于去添加）
	public Map queryFixturePartListById(Map para);
	
	//删除信息
	public void deleteFixturePartList(Map para);
	
	//删除图片
	public void clearFixturePartFileById(Map para);
	
	//修改
	public void updateFixturePart(Map para);
				
	//新增
	public void saveFixturePart(Map para);
			
	//保存详细信息
	public void savePictureFixturePart(Map para);
		
	//保存详细信息
	public void saveInformFixturePart(Map para);
	
	//保存详细信息
	public void savePartFixturePart(Map para);
	
	//根据名称查询类别
	public Map queryCategoryTypeFixturePartByName(Map temp);
			
	//保存新的类别
	public void saveCategoryTypeFixturePart(Map temp);
		
		
}
