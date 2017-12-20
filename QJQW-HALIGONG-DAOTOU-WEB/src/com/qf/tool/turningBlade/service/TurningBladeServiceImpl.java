package com.qf.tool.turningBlade.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qf.tool.turningBlade.dao.TurningBladeMapper;
import com.qf.tool.turningHolder.dao.TurningHolderMapper;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("turningBladeService")
public class TurningBladeServiceImpl implements TurningBladeService {
	private TurningBladeMapper mapper;

	public TurningBladeMapper getMapper() {
		return mapper;
	}
	
	@Autowired
	public void setMapper(TurningBladeMapper mapper) {
		this.mapper = mapper;
	}

	//查询刀片列表
	public Map queryTurningBladeList(Page page){
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryTurningBladeList(page.getPd());
	    System.out.println(list);
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}
	
	//查询刀具图片列表 PictureBladeTurningList
	public List<Map> queryPictureBladeTurningList(Map para){
		return mapper.queryPictureBladeTurningList(para);
	}
	
	//查询详细图片列表 PictureDetailBladeTurningList
	public List<Map> queryPictureDetailBladeTurningList(Map para){
		return mapper.queryPictureDetailBladeTurningList(para);
	}
	
	//查询详细信息列表 InformDetailBladeTurningList
	public List<Map> queryInformDetailBladeTurningList(Map para){
		return mapper.queryInformDetailBladeTurningList(para);
	}
	
	//查询应用实例列表 ApplicationBladeTurningList
	public List<Map> queryApplicationBladeTurningList(Map para){
		return mapper.queryApplicationBladeTurningList(para);
	}
	
	//查询刀片详细信息
	public Map queryTurningBladeById(Map para){
		return mapper.queryTurningBladeById(para);
	}
	
	//修改
	public void updateTurningBlade(Map para){
		mapper.updateTurningBlade(para);
	}
	
	//新增
	public void saveTurningBlade(Map para){
		mapper.saveTurningBlade(para);
	}
	
	//保存刀具图片
	public void savePictureBladeTurning(Map para){
		mapper.savePictureBladeTurning(para);
	}
	
	//清空刀具图片路径
	public void clearPictureBladeTurningByIdTurningBlade(Map para){
		mapper.clearPictureBladeTurningByIdTurningBlade(para);
	}
	
	//保存详细图片
	public void savePictureDetailBladeTurning(Map para){
		mapper.savePictureDetailBladeTurning(para);
	}
	
	//清空详细图片路径
	public void clearPictureDetailBladeTurningByIdTurningBlade(Map para){
		mapper.clearPictureDetailBladeTurningByIdTurningBlade(para);
	}
	
	//保存应用实例
	public void saveApplicationBladeTurning(Map para){
		mapper.saveApplicationBladeTurning(para);
	}
	
	//清空应用实例路径
	public void clearApplicationBladeTurningByIdTurningBlade(Map para){
		mapper.clearApplicationBladeTurningByIdTurningBlade(para);
	}
	
	//保存详细信息
	public void saveInformDetailBladeTurning(Map para){
		mapper.saveInformDetailBladeTurning(para);
	}
	
	//清空详细信息路径
	public void clearInformDetailBladeTurningByIdTurningBlade(Map para){
		mapper.clearInformDetailBladeTurningByIdTurningBlade(para);
	}
	
	//删除刀片数据
	public void deleteTurningBlade(Map para){
		mapper.deleteTurningBlade(para);
	}
}
