package com.qf.material.ToolCoatingMaterial.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qf.material.ToolCoatingMaterial.dao.CoatingMaterialMapper;
import com.qf.util.PageData;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("coatingMaterialService")
public class CoatingMaterialServiceImpl implements CoatingMaterialService{
	
	private CoatingMaterialMapper mapper;
	
	public CoatingMaterialMapper getMapper() {
		return mapper;
	}
	
	@Autowired
	public void setMapper(CoatingMaterialMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public Map queryCoatingMaterialList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryCoatingMaterialList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	@Override
	public List<Map> queryPictureCoatingMaterialList(Map para) {
		return mapper.queryPictureCoatingMaterialList(para);
	}

	@Override
	public List<Map> queryInformDetailCoatingMaterialList(Map para) {
		return mapper.queryInformDetailCoatingMaterialList(para);
	}

	@Override
	public List<Map> queryApplicationCoatingMaterialList(Map para) {
		return mapper.queryApplicationCoatingMaterialList(para);
	}

	@Override
	public List<Map> queryCategoryToolCoatingList() {
		return mapper.queryCategoryToolCoatingList();
	}

	@Override
	public void clearPictureCoatingMaterialById(Map para) {
		mapper.clearPictureCoatingMaterialById(para);
	}

	@Override
	public void clearInformDetailCoatingMaterialById(Map para) {
		mapper.clearInformDetailCoatingMaterialById(para);
	}

	@Override
	public void clearApplicationCoatingMaterialById(Map para) {
		mapper.clearApplicationCoatingMaterialById(para);
	}

	@Override
	public void deleteCoatingMaterial(Map para) {
		mapper.deleteCoatingMaterial(para);
	}

	@Override
	public Map queryCoatingMaterialById(Map para) {
		return mapper.queryCoatingMaterialById(para);
	}

	@Override
	public Map queryCategoryToolCoatingByName(Map temp) {
		return mapper.queryCategoryToolCoatingByName(temp);
	}

	@Override
	public void saveCategoryToolCoating(Map temp) {
		mapper.saveCategoryToolCoating(temp);
	}

	@Override
	public void updateCoatingMaterial(Map para) {
		mapper.updateCoatingMaterial(para);
	}

	@Override
	public void saveCoatingMaterial(Map para) {
		mapper.saveCoatingMaterial(para);
	}

	@Override
	public void savePictureCoatingMaterial(Map para) {
		mapper.savePictureCoatingMaterial(para);
	}

	@Override
	public void saveInformDetailCoatingMaterial(Map para) {
		mapper.saveInformDetailCoatingMaterial(para);
	}

	@Override
	public void saveApplicationCoatingMaterial(Map para) {
		mapper.saveApplicationCoatingMaterial(para);
	}


}
