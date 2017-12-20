package com.qf.productionManage.DepartmentManufacture.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qf.productionManage.DepartmentManufacture.dao.DepartmentManufactureMapper;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("DepartmentManufactureService")
public class DepartmentManufactureServiceImpl implements DepartmentManufactureService{

	
	@Resource
	private DepartmentManufactureMapper mapper;
	
	
	@Override
	public Map queryDepartmentManufactureListById(Map para) {
		return mapper.queryDepartmentManufactureListById(para);
	}

	@Override
	public void deleteDepartmentManufactureList(Map para) {
		mapper.deleteDepartmentManufactureList(para);
	}

	@Override
	public void updateDepartmentManufacture(Map para) {
		mapper.updateDepartmentManufacture(para);
	}

	@Override
	public void saveDepartmentManufacture(Map para) {
		mapper.saveDepartmentManufacture(para);
	}

	@Override
	public Map queryDepartmentManufactureList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryDepartmentManufactureList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	@Override
	public List<Map> loadingDepartmentManufacture() {
		return mapper.loadingDepartmentManufacture();
	}

	@Override
	public List<Map> loadingChildDepartmentManufacture(Map para) {
		return mapper.loadingChildDepartmentManufacture(para);
	}

	
	
	
	
	
	
	
	
	
	
	
}





