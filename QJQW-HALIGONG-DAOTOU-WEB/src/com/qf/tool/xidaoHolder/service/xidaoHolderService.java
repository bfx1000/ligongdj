package com.qf.tool.xidaoHolder.service;

import java.util.List;
import java.util.Map;

import com.qf.util.PageData;
import com.qf.util.page.Page;

/**
 * 
 * @ClassName:  XidaoHolderService   
 * @Description:service 接口
 * @author: 	yinxf
 * @date:   	2017年10月26日 下午3:19:27   
 *
 */
public interface xidaoHolderService {
	
	/**
	 * 查询列表-分页
	 * @param page 分页
	 */
	public Map queryXidaoHolderList(Page page);

	/**
	 * 查询列表图片
	 */
	public List<Map> queryPictureXidaoHolderList(Map para);

	/**
	 * 查询列表详细图片
	 */
	public List<Map> queryPictureDetailXidaoHolderList(Map para);

	/**
	 * 查询列表详细信息
	 */
	public List<Map> queryInformDetailXidaoHolderList(Map para);

	/**
	 * 查询 通过ID
	 */
	public Map queryXidaoHolderById(Map para);

	/**
	 * 修改
	 */
	public void updateXidaoHolder(Map para);

	/**
	 * 新增
	 */
	public void saveXidaoHolder(Map para);

	/**
	 * 保存图片
	 */
	public void savePictureXidaoHolder(Map para);

	/**
	 * 删除图片 通过ID
	 */
	public void clearPictureXidaoHolderByIdXidaoHolder(Map para);

	/**
	 * 保存详细图片
	 */
	public void savePictureDetailXidaoHolder(Map para);

	/**
	 * 删除详细图片
	 */
	public void clearPictureDetailXidaoHolderByIdXidaoHolder(Map para);

	/**
	 * 保存详细信息
	 */
	public void saveInformDetailXidaoHolder(Map para);

	/**
	 * 清空详细信息路径
	 */
	public void clearInformDetailXidaoHolderByIdXidaoHolder(Map para);

	/**
	 * 删除数据
	 */
	public void deleteXidaoHolder(Map para);

	/**
	 * 查询ISO列表
	 */
	public List<String> queryIsoList();

	
}
