package com.qf.tool.xidaoHolder.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qf.tool.xidaoHolder.dao.xidaoHolderMapper;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;
/**
 * 
 * @ClassName:  XidaoHolderServiceImpl   
 * @Description:Service Implement
 * @author: 	yinxf
 * @date:   	2017年10月26日 下午3:17:22   
 *
 */
@Service("xidaoHolderService")
public class xidaoHolderServiceImpl implements xidaoHolderService {
	
	private xidaoHolderMapper xidaoHolderMapper;

	public xidaoHolderMapper getMapper() {
		return xidaoHolderMapper;
	}
	@Autowired
	public void setMapper(xidaoHolderMapper mapper) {
		this.xidaoHolderMapper = mapper;
	}

	//查询车刀数据-刀柄列表
	@Override
	public Map queryXidaoHolderList(Page page){
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 起始位置，长度
	    PageHelper.startPage(page); 
	    List<Map> list =  xidaoHolderMapper.queryXidaoHolderList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}
	
	//查询刀柄图片列表 PictureXidaoHolder
	@Override
	public List<Map> queryPictureXidaoHolderList(Map para){
		return xidaoHolderMapper.queryPictureXidaoHolderList(para);
	}
	
	//查询详细图片列表 PictureDetailXidaoHolder
	@Override
	public List<Map> queryPictureDetailXidaoHolderList(Map para){
		return xidaoHolderMapper.queryPictureDetailXidaoHolderList(para);
	}
	
	//查询详细信息列表 InformDetailXidaoHolder
	@Override
	public List<Map> queryInformDetailXidaoHolderList(Map para){
		return xidaoHolderMapper.queryInformDetailXidaoHolderList(para);
	}
	
	//查询车刀数据-刀柄数据
	@Override
	public Map queryXidaoHolderById(Map para){
		return xidaoHolderMapper.queryXidaoHolderById(para);
	}
	
	//修改
	@Override
	public void updateXidaoHolder(Map para){
		xidaoHolderMapper.updateXidaoHolder(para);
	}
	
	//新增
	@Override
	public void saveXidaoHolder(Map para){
		xidaoHolderMapper.saveXidaoHolder(para);
	}
	
	//保存刀柄图片
	@Override
	public void savePictureXidaoHolder(Map para) {
		xidaoHolderMapper.savePictureXidaoHolder(para);
	}

	
	//清空刀柄图片路径
	@Override
	public void clearPictureXidaoHolderByIdXidaoHolder(Map para){
		xidaoHolderMapper.clearPictureXidaoHolderByIdXidaoHolder(para);
	}
	
	//保存详细图片
	@Override
	public void savePictureDetailXidaoHolder(Map para){
		xidaoHolderMapper.savePictureDetailXidaoHolder(para);
	}
	
	//清空详细图片路径
	@Override
	public void clearPictureDetailXidaoHolderByIdXidaoHolder(Map para){
		xidaoHolderMapper.clearPictureDetailXidaoHolderByIdXidaoHolder(para);
	}
	
	//保存详细信息
	@Override
	public void saveInformDetailXidaoHolder(Map para){
		xidaoHolderMapper.saveInformDetailXidaoHolder(para);
	}
	
	//清空详细信息路径
	@Override
	public void clearInformDetailXidaoHolderByIdXidaoHolder(Map para){
		xidaoHolderMapper.clearInformDetailXidaoHolderByIdXidaoHolder(para);
	}
	
	//删除车刀数据-刀柄数据
	@Override
	public void deleteXidaoHolder(Map para){
		xidaoHolderMapper.deleteXidaoHolder(para);
	}
	
	//查询ISO基准刀片 json
	@Override
	public List<String> queryIsoList(){
		return xidaoHolderMapper.queryIsoList();
	}
	
}

