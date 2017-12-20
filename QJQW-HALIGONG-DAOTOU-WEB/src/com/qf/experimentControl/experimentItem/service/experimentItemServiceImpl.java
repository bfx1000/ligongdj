package com.qf.experimentControl.experimentItem.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qf.experimentControl.experimentItem.dao.experimentItemMapping;
import com.qf.machineTool.standarMachineTool.dao.standarMachineMapper;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("experimentItemService")
public class experimentItemServiceImpl implements experimentItemService{

	private experimentItemMapping mapper;

	public experimentItemMapping getMapper() {
		return mapper;
	}

	@Autowired
	public void setMapper(experimentItemMapping mapper) {
		this.mapper = mapper;
	}
	
	
	
	@Override
	public Map queryExperimentItemList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryExperimentItemList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	@Override
	public List<Map> queryPictureExperimentItemList(Map para) {
		return mapper.queryPictureExperimentItemList(para);
	}

	@Override
	public List<Map> queryInformDetailExperimentItemList(Map para) {
		return mapper.queryInformDetailExperimentItemList(para);
	}

	@Override
	public List<Map> queryPartExperimentPartList(Map para) {
		return mapper.queryPartExperimentPartList(para);
	}

	@Override
	public List<Map> queryCategoryExperimentPartList() {
		return mapper.queryCategoryExperimentPartList();
	}

	@Override
	public void deleteExperimentItemList(Map para) {
		mapper.deleteExperimentItemList(para);
	}

	@Override
	public void clearPictureExperimentItemByIdMaterial(Map para) {
		mapper.clearPictureExperimentItemByIdMaterial(para);
	}

	@Override
	public void clearInformDetailExperimentItemById(Map para) {
		mapper.clearInformDetailExperimentItemById(para);
	}

	@Override
	public void clearPartExperimentPartByIdMaterial(Map para) {
		mapper.clearPartExperimentPartByIdMaterial(para);
		
	}

	@Override
	public Map queryExperimentItemListById(Map para) {
		return mapper.queryExperimentItemListById(para);
	}

	@Override
	public void updateExperimentPart(Map para) {
		mapper.updateExperimentPart(para);
	}

	@Override
	public void saveExperimentPart(Map para) {
		mapper.saveExperimentPart(para);
	}

	@Override
	public void savePictureExperimentItem(Map para) {
		mapper.savePictureExperimentItem(para);
	}

	@Override
	public void saveInformDetailExperimentItem(Map para) {
		mapper.saveInformDetailExperimentItem(para);
	}

	@Override
	public void savePartExperimentPart(Map para) {
		mapper.savePartExperimentPart(para);
	}

	@Override
	public Map queryCategoryTypeExperimentPartByName(Map temp) {
		return mapper.queryCategoryTypeExperimentPartByName(temp);
	}

	@Override
	public void saveCategoryTypeExperimentPart(Map temp) {
		mapper.saveCategoryTypeExperimentPart(temp);
	}

	@Override
	public List<Map> queryCategoryMaterialExperimentPartList() {
		return mapper.queryCategoryMaterialExperimentPartList();
	}

	@Override
	public Map queryCategoryMaterialExperimentPartListByName(Map temp) {
		return mapper.queryCategoryMaterialExperimentPartListByName(temp);
	}

	@Override
	public void saveCategoryMaterialExperimentPartList(Map temp) {
		mapper.saveCategoryMaterialExperimentPartList(temp);
	}
	
	
	
	
	
}







