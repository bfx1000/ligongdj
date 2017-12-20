package com.qf.tool.turningHolder.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.qf.tool.turningHolder.dao.TurningHolderMapper;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("turningHolderService")
public class TurningHolderServiceImpl implements TurningHolderService {
	private TurningHolderMapper mapper;

	public TurningHolderMapper getMapper() {
		return mapper;
	}

	@Autowired
	public void setMapper(TurningHolderMapper mapper) {
		this.mapper = mapper;
	}

	//查询车刀数据-刀柄列表
	public Map queryTurningHolderList(Page page){
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryTurningHolderList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}
	
	//查询刀柄图片列表 PictureTurningHolder
	public List<Map> queryPictureTurningHolderList(Map para){
		return mapper.queryPictureTurningHolderList(para);
	}
	
	//查询详细图片列表 PictureDetailTurningHolder
	public List<Map> queryPictureDetailTurningHolderList(Map para){
		return mapper.queryPictureDetailTurningHolderList(para);
	}
	
	//查询详细信息列表 InformDetailTurningHolder
	public List<Map> queryInformDetailTurningHolderList(Map para){
		return mapper.queryInformDetailTurningHolderList(para);
	}
	
	//查询车刀数据-刀柄数据
	public Map queryTurningHolderById(Map para){
		return mapper.queryTurningHolderById(para);
	}
	
	//修改
	public void updateTurningHolder(Map para){
		mapper.updateTurningHolder(para);
	}
	
	//新增
	public void saveTurningHolder(Map para){
		mapper.saveTurningHolder(para);
	}
	
	//保存刀柄图片
	public void savePictureTurningHolder(Map para){
		mapper.savePictureTurningHolder(para);
	}
	
	//清空刀柄图片路径
	public void clearPictureTurningHolderByIdTurningHolder(Map para){
		mapper.clearPictureTurningHolderByIdTurningHolder(para);
	}
	
	//保存详细图片
	public void savePictureDetailTurningHolder(Map para){
		mapper.savePictureDetailTurningHolder(para);
	}
	
	//清空详细图片路径
	public void clearPictureDetailTurningHolderByIdTurningHolder(Map para){
		mapper.clearPictureDetailTurningHolderByIdTurningHolder(para);
	}
	
	//保存详细信息
	public void saveInformDetailTurningHolder(Map para){
		mapper.saveInformDetailTurningHolder(para);
	}
	
	//清空详细信息路径
	public void clearInformDetailTurningHolderByIdTurningHolder(Map para){
		mapper.clearInformDetailTurningHolderByIdTurningHolder(para);
	}
	
	//删除车刀数据-刀柄数据
	public void deleteTurningHolder(Map para){
		mapper.deleteTurningHolder(para);
	}
	
	//查询ISO基准刀片 json
	public List<String> queryISOList(){
		return mapper.queryISOList();
	}
	
}
