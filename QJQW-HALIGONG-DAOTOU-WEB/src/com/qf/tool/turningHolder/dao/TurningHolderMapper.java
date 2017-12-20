package com.qf.tool.turningHolder.dao;

import java.util.List;
import java.util.Map;

import com.qf.util.PageData;
import com.qf.util.page.Page;

public interface TurningHolderMapper {
	
	//查询车刀数据-刀柄列表
	public List<Map> queryTurningHolderList(PageData pd);
	
	//查询刀柄图片列表 PictureTurningHolder
	public List<Map> queryPictureTurningHolderList(Map para);
	
	//查询详细图片列表 PictureDetailTurningHolder
	public List<Map> queryPictureDetailTurningHolderList(Map para);
	
	//查询详细信息列表 InformDetailTurningHolder
	public List<Map> queryInformDetailTurningHolderList(Map para);
	
	//查询车刀数据-刀柄数据
	public Map queryTurningHolderById(Map para);
	
	//修改
	public void updateTurningHolder(Map para);
	
	//新增
	public void saveTurningHolder(Map para);
	
	//保存刀柄图片
	public void savePictureTurningHolder(Map para);
	
	//清空刀柄图片路径
	public void clearPictureTurningHolderByIdTurningHolder(Map para);
	
	//保存详细图片
	public void savePictureDetailTurningHolder(Map para);
	
	//清空详细图片路径
	public void clearPictureDetailTurningHolderByIdTurningHolder(Map para);
	
	//保存详细信息
	public void saveInformDetailTurningHolder(Map para);
	
	//清空详细信息路径
	public void clearInformDetailTurningHolderByIdTurningHolder(Map para);
	
	//删除车刀数据-刀柄数据
	public void deleteTurningHolder(Map para);
	
	//查询ISO基准刀片 json
	public List<String> queryISOList();
	
	
}