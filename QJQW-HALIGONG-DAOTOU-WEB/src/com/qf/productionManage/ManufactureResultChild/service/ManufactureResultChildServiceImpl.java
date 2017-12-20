package com.qf.productionManage.ManufactureResultChild.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qf.productionManage.ManufactureResultChild.dao.ManufactureResultChildMapper;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("ManufactureResultChildService")
public class ManufactureResultChildServiceImpl implements ManufactureResultChildService{

	
	@Resource
	private ManufactureResultChildMapper mapper;

	@Override
	public List<Map> queryFileList(Map para) {
		return mapper.queryFileList(para);
	}

	@Override
	public void cleanFileManufactureResultChildById(Map para) {
		mapper.cleanFileManufactureResultChildById(para);
	}

	@Override
	public void deleteManufactureResultChildList(Map para) {
		mapper.deleteManufactureResultChildList(para);
	}

	@Override
	public Map queryManufactureResultChildById(Map para) {
		return mapper.queryManufactureResultChildById(para);
	}

	@Override
	public void updateManufactureResultChild(Map para) {
		mapper.updateManufactureResultChild(para);
	}

	@Override
	public void saveManufactureResultChild(Map para) {
		mapper.saveManufactureResultChild(para);
	}

	@Override
	public void saveFileManufactureResultChild(Map file) {
		mapper.saveFileManufactureResultChild(file);
	}

	@Override
	public Map queryManufactureResultChildList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryManufactureResultChildList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	@Override
	public Map queryCustomizationList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryCustomizationList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	@Override
	public void deleteCustomization(Map para) {
		mapper.deleteCustomization(para);
	}

	@Override
	public void saveCustomization(Map para) {
		mapper.saveCustomization(para);
	}

	@Override
	public Map queryCustomizationById(Map para) {
		return mapper.queryCustomizationById(para);
	}
	
	
	
}
