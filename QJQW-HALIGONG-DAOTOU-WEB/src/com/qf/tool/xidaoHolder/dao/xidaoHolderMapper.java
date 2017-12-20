package com.qf.tool.xidaoHolder.dao;

import java.util.List;
import java.util.Map;

import com.qf.util.PageData;
import com.qf.util.page.Page;

/**
 * 
 * @ClassName:  XidaoHolderMapper   
 * @Description:dao层
 * @author: 	yinxf
 * @date:   	2017年10月26日 下午3:14:05   
 *
 */

public interface xidaoHolderMapper {
	
	/**
	 * 查询车刀数据-刀柄列表
	 * @param pd 数据
	 */
	public List<Map> queryXidaoHolderList(PageData pd);
	
	/**
	 * 查询刀柄图片列表 PictureXidaoHolder
	 * @param para 图片-参数
	 */
	public List<Map> queryPictureXidaoHolderList(Map para);
	
	/**
	 * 查询详细图片列表 PictureDetailXidaoHolder
	 * @param para 详细图片-参数
	 */
	public List<Map> queryPictureDetailXidaoHolderList(Map para);
	
	/**
	 * 查询详细信息列表 InformDetailXidaoHolder
	 * @param para 详细信息-参数
	 */
	public List<Map> queryInformDetailXidaoHolderList(Map para);
	
	/**
	 * 查询-通过ID 
	 * @param para 查询-参数
	 */
	public Map queryXidaoHolderById(Map para);
	
	/**
	 * 修改
	 * @param para 修改-参数
	 */
	public void updateXidaoHolder(Map para);
	
	/**
	 * 新增
	 * @param para 新增-参数
	 */
	public void saveXidaoHolder(Map para);
	
	/**
	 * 保存图片
	 * @param para 保存 -参数
	 */
	public void savePictureXidaoHolder(Map para);
	
	/**
	 * 删除图片
	 * @param para 删除-参数
	 */
	public void clearPictureXidaoHolderByIdXidaoHolder(Map para);
	
	/**
	 * 保存详细图片
	 * @param para 保存-参数
	 */
	public void savePictureDetailXidaoHolder(Map para);
	
	/**
	 * 删除详细图片
	 * @param para 删除-参数
	 */
	public void clearPictureDetailXidaoHolderByIdXidaoHolder(Map para);
	
	/**
	 * 保存详细信息
	 * @param para 保存-参数
	 */
	public void saveInformDetailXidaoHolder(Map para);
	
	/**
	 * 删除详细信息
	 * @param para 删除-参数
	 */
	public void clearInformDetailXidaoHolderByIdXidaoHolder(Map para);
	
	/**
	 * 删除数据 
	 * @param para 删除-参数
	 */
	public void deleteXidaoHolder(Map para);
	
	/**
	 * 查询ISO 
	 */
	public List<String> queryIsoList();
}
