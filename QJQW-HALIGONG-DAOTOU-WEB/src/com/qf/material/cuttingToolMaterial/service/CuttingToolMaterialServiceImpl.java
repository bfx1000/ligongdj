package com.qf.material.cuttingToolMaterial.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qf.material.cuttingToolMaterial.dao.CuttingToolMaterialMapper;
import com.qf.material.material.dao.MaterialMapper;
import com.qf.tool.turningBlade.dao.TurningBladeMapper;
import com.qf.tool.turningHolder.dao.TurningHolderMapper;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("cuttingToolMaterialService")
public class CuttingToolMaterialServiceImpl implements CuttingToolMaterialService {
	private CuttingToolMaterialMapper mapper;

	public CuttingToolMaterialMapper getMapper() {
		return mapper;
	}
	
	@Autowired
	public void setMapper(CuttingToolMaterialMapper mapper) {
		this.mapper = mapper;
	}
	

	public Map queryCuttingToolMaterialList(Page page){
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryCuttingToolMaterialList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}
	
	public List<Map> queryPictureToolMaterialList(Map para){
		return mapper.queryPictureToolMaterialList(para);
	}
	
	public List<Map> queryInformToolMaterialList(Map para){
		return mapper.queryInformToolMaterialList(para);
	}
	
	public List<Map> queryApplicationToolMaterialList(Map para){
		return mapper.queryApplicationToolMaterialList(para);
	}
	
	public Map queryCuttingToolMaterialById(Map para){
		return mapper.queryCuttingToolMaterialById(para);
	}
	
	public void updateCuttingToolMaterial(Map para){
		mapper.updateCuttingToolMaterial(para);
	}
	
	public void saveCuttingToolMaterial(Map para){
		mapper.saveCuttingToolMaterial(para);
	}
	
	public void clearPictureToolMaterialByIdCuttingToolMaterial(Map para){
		mapper.clearPictureToolMaterialByIdCuttingToolMaterial(para);
	}
	
	public void savePictureToolMaterial(Map para){
		mapper.savePictureToolMaterial(para);
	}
	
	public void clearInformToolMaterialByIdCuttingToolMaterial(Map para){
		mapper.clearInformToolMaterialByIdCuttingToolMaterial(para);
	}
	
	public void saveInformToolMaterial(Map para){
		mapper.saveInformToolMaterial(para);
	}
	
	public void clearApplicationToolMaterialByIdCuttingToolMaterial(Map para){
		mapper.clearApplicationToolMaterialByIdCuttingToolMaterial(para);
	}
	
	public void saveApplicationToolMaterial(Map para){
		mapper.saveApplicationToolMaterial(para);
	}
	
	public void deleteCuttingToolMaterial(Map para){
		mapper.deleteCuttingToolMaterial(para);
	}

	@Override
	public Map queryCategoryToolMaterialByName(Map temp) {
		return mapper.queryCategoryToolMaterialByName(temp);
	}

	@Override
	public void saveCategoryToolMaterial(Map temp) {
		mapper.saveCategoryToolMaterial(temp);
	}

	@Override
	public List<Map> queryCategoryToolMaterialList() {
		return mapper.queryCategoryToolMaterialList();
	}
}
