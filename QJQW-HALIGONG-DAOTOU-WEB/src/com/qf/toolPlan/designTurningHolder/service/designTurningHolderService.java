package com.qf.toolPlan.designTurningHolder.service;

import java.util.List;
import java.util.Map;

import com.qf.util.PageData;
import com.qf.util.page.Page;

public interface designTurningHolderService {

	//查询查询刀柄设计
	public Map queryDesignTurningHolderList(Page page);
			
	//查询刀柄设计图片列表 
	public List<Map> queryPictureDesignTurningHolderList(Map para);
			
	//查询详细信息列表 
	public List<Map> queryInformDetailDesignTurningHolderList(Map para);
			
	//part 
	public List<Map> queryPartDesignTurningHolderList(Map para);
	
	//查询类别列表
	public List<Map> queryCategoryDesignTurningHolderList();
				
	//根据名称查询类别
	public Map queryCategoryDesignTurningHolderByName(Map temp);
				
	//保存新的类别
	public void saveCategoryDesignTurningHolder(Map temp);
	
	//查询车刀数据-刀柄数据
	public Map queryDesignTurningHolderById(Map para);
			
	//修改
	public void updateDesignTurningHolder(Map para);
			
	//新增
	public void saveDesignTurningHolder(Map para);
			
	//保存刀柄图片
	public void savePictureDesignTurningHolder(Map para);
		
	//清空刀柄图片路径
	public void clearPictureDesignTurningHolderById(Map para);
			
	//保存详细图片
	public void savePartDesignTurningHolder(Map para);
			
	//清空详细图片路径
	public void clearPartDesignTurningHolderById(Map para);
			
	//保存详细信息
	public void saveInformDetailDesignTurningHolder(Map para);
			
	//清空详细信息路径
	public void clearInformDetailDesignTurningHolderById(Map para);
			
	//删除车刀数据-刀柄数据
	public void deleteDesignTurningHolder(Map para);
	
	//查询ISO基准刀片 json
	public List<String> queryISOList();
}
