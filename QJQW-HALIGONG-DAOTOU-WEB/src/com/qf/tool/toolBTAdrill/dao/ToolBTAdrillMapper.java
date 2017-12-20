package com.qf.tool.toolBTAdrill.dao;

import java.util.List;
import java.util.Map;

import com.qf.util.PageData;

public interface ToolBTAdrillMapper {

	// 查询深孔钻PageData
	public List<Map> queryToolBTAdrillList(PageData pd);

	// 查询刀具图片列表 PictureBTADrill
	public List<Map> queryPictureBTADrillList(Map para);

	// 查询详细图片列表 PictureDetailBTADrill
	public List<Map> queryPictureDetailBTADrillList(Map para);

	// 查询详细信息列表 InformDetailBTADrill
	public List<Map> queryInformDetailBTADrillList(Map para);

	// 查询应用实例列表 ApplicationBTADrill
	public List<Map> queryApplicationBTADrillList(Map para);

	// 查询深孔钻ById
	public Map queryToolBTAdrillById(Map para);

	// 修改深孔钻
	public void updateToolBTAdrill(Map para);

	// 新增深孔钻
	public void saveToolBTAdrill(Map para);

	// 删除深孔钻数据
	public void deleteToolBTAdrill(Map para);

	// 保存刀具图片
	public void savePictureBTADrill(Map PictureBTADrillMap);

	// 清空刀具图片路径
	public void clearPictureBTADrillByIdBTADrill(Map para);

	// 保存详细图片
	public void savePictureDetailBTADrill(Map PictureBTADrillMap);

	// 清空详细图片路径
	public void clearPictureDetailBTADrillByIdBTADrill(Map para);

	// 保存应用实例
	public void saveApplicationBTADrill(Map PictureBTADrillMap);

	// 清空应用实例路径
	public void clearApplicationBTADrillByIdBTADrill(Map para);

	// 保存详细信息
	public void saveInformDetailBTADrill(Map PictureBTADrillMap);

	// 清空详细信息路径
	public void clearInformDetailBTADrillByIdBTADrill(Map para);

	// 导出表
	public List<Map> queryToolBTAdrillListOfExport();

}