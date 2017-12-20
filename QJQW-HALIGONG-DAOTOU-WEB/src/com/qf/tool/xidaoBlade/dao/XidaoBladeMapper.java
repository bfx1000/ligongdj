package com.qf.tool.xidaoBlade.dao;

import java.util.List;
import java.util.Map;

import com.qf.util.PageData;
import com.qf.util.page.Page;

public interface XidaoBladeMapper {
	
	//查询刀片列表
	public List<Map> queryXidaoBladeList(PageData pd);
	
	//查询刀具图片列表 PictureBladeXidaoList
	public List<Map> queryPictureBladeXidaoList(Map para);
	
	//查询详细图片列表 PictureDetailBladeXidaoList
	public List<Map> queryPictureDetailBladeXidaoList(Map para);
	
	//查询详细信息列表 InformDetailBladeXidaoList
	public List<Map> queryInformDetailBladeXidaoList(Map para);
	
	//查询应用实例列表 ApplicationBladeXidaoList
	public List<Map> queryApplicationBladeXidaoList(Map para);
	
	//查询刀片详细信息
	public Map queryXidaoBladeById(Map para);
	
	//修改
	public void updateXidaoBlade(Map para);
	
	//新增
	public void saveXidaoBlade(Map para);
	
	//保存刀具图片
	public void savePictureBladeXidao(Map para);
	
	//清空刀具图片路径
	public void clearPictureBladeXidaoByIdXidaoBlade(Map para);
	
	//保存详细图片
	public void savePictureDetailBladeXidao(Map para);
	
	//清空详细图片路径
	public void clearPictureDetailBladeXidaoByIdXidaoBlade(Map para);
	
	//保存应用实例
	public void saveApplicationBladeXidao(Map para);
	
	//清空应用实例路径
	public void clearApplicationBladeXidaoByIdXidaoBlade(Map para);
	
	//保存详细信息
	public void saveInformDetailBladeXidao(Map para);
	
	//清空详细信息路径
	public void clearInformDetailBladeXidaoByIdXidaoBlade(Map para);
	
	//删除刀片数据
	public void deleteXidaoBlade(Map para);
}