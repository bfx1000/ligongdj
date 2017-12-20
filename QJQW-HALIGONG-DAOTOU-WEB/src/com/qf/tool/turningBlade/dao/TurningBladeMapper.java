package com.qf.tool.turningBlade.dao;

import java.util.List;
import java.util.Map;

import com.qf.util.PageData;
import com.qf.util.page.Page;

public interface TurningBladeMapper {
	
	//查询刀片列表
	public List<Map> queryTurningBladeList(PageData pd);
	
	//查询刀具图片列表 PictureBladeTurningList
	public List<Map> queryPictureBladeTurningList(Map para);
	
	//查询详细图片列表 PictureDetailBladeTurningList
	public List<Map> queryPictureDetailBladeTurningList(Map para);
	
	//查询详细信息列表 InformDetailBladeTurningList
	public List<Map> queryInformDetailBladeTurningList(Map para);
	
	//查询应用实例列表 ApplicationBladeTurningList
	public List<Map> queryApplicationBladeTurningList(Map para);
	
	//查询刀片详细信息
	public Map queryTurningBladeById(Map para);
	
	//修改
	public void updateTurningBlade(Map para);
	
	//新增
	public void saveTurningBlade(Map para);
	
	//保存刀具图片
	public void savePictureBladeTurning(Map para);
	
	//清空刀具图片路径
	public void clearPictureBladeTurningByIdTurningBlade(Map para);
	
	//保存详细图片
	public void savePictureDetailBladeTurning(Map para);
	
	//清空详细图片路径
	public void clearPictureDetailBladeTurningByIdTurningBlade(Map para);
	
	//保存应用实例
	public void saveApplicationBladeTurning(Map para);
	
	//清空应用实例路径
	public void clearApplicationBladeTurningByIdTurningBlade(Map para);
	
	//保存详细信息
	public void saveInformDetailBladeTurning(Map para);
	
	//清空详细信息路径
	public void clearInformDetailBladeTurningByIdTurningBlade(Map para);
	
	//删除刀片数据
	public void deleteTurningBlade(Map para);
}