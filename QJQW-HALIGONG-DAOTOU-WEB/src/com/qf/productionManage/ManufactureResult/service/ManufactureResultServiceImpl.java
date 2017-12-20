package com.qf.productionManage.ManufactureResult.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qf.productionManage.ManufactureResult.dao.ManufactureResultMapper;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("ManufactureResultService")
public class ManufactureResultServiceImpl implements ManufactureResultService{

	@Resource
	private ManufactureResultMapper mapper;

	@Override
	public List<Map> queryFileList(Map para) {
		return mapper.queryFileList(para);
	}

	@Override
	public void cleanFileManufactureResultById(Map para) {
		mapper.cleanFileManufactureResultById(para);
	}

	@Override
	public void deleteManufactureResultList(Map para) {
		mapper.deleteManufactureResultList(para);
	}

	@Override
	public Map queryManufactureResultById(Map para) {
		return mapper.queryManufactureResultById(para);
	}

	@Override
	public void updateManufactureResult(Map para) {
		mapper.updateManufactureResult(para);
	}

	@Override
	public void saveManufactureResult(Map para) {
		mapper.saveManufactureResult(para);
	}

	@Override
	public void saveFileManufactureResult(Map file) {
		mapper.saveFileManufactureResult(file);
	}

	@Override
	public Map queryManufactureResultList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryManufactureResultList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}
	
	
	
	
	
}
