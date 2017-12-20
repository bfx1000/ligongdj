package com.qf.toolPlan.designTurningBlade.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.qf.util.PageData;

@Repository
public interface DesignTurningBladeMapper {

	//查询刀片设计
	public List<Map> queryDesignTurningBladeList(PageData pd);
		
	//查询刀片设计图片列表 
	public List<Map> queryPictureDesignTurningBladeList(Map para);
		
	//查询详细信息列表 
	public List<Map> queryInformDetailDesignTurningBladeList(Map para);
		
	//part 
	public List<Map> queryPartDesignTurningBladeList(Map para);
	
	//查询车刀数据-刀片数据
	public Map queryDesignTurningBladeById(Map para);
		
	//修改
	public void updateDesignTurningBlade(Map para);
		
	//新增
	public void saveDesignTurningBlade(Map para);
	
	//保存刀片图片
	public void savePictureDesignTurningBlade(Map para);
	
	//清空刀片图片路径
	public void clearPictureDesignTurningBladeById(Map para);
	
	//保存详细图片
	public void savePartDesignTurningBlade(Map para);
	
	//清空详细图片路径
	public void clearPartDesignTurningBladeById(Map para);
	
	//保存详细信息
	public void saveInformDetailDesignTurningBlade(Map para);
	
	//清空详细信息路径
	public void clearInformDetailDesignTurningBladeById(Map para);
	
	//删除车刀数据-刀片数据
	public void deleteDesignTurningBlade(Map para);
	
	//查询ISO基准刀片 json
	public List<String> queryISOList();
}