package com.qf.productionManage.StaffManuf.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qf.productionManage.StaffManuf.dao.StaffManufMapper;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("StaffManufService")
public class StaffManufServiceImpl implements StaffManufService{

	@Resource
	private StaffManufMapper mapper;
	
	@Override
	public List<Map> queryCategoryTitlesStaffManufList() {
		return mapper.queryCategoryTitlesStaffManufList();
	}

	@Override
	public Map queryStaffManufListById(Map para) {
		return mapper.queryStaffManufListById(para);
	}

	@Override
	public void deleteStaffManufList(Map para) {
		mapper.deleteStaffManufList(para);
	}

	@Override
	public void updateStaffManuf(Map para) {
		mapper.updateStaffManuf(para);
	}

	@Override
	public void saveStaffManuf(Map para) {
		mapper.saveStaffManuf(para);
	}

	@Override
	public Map queryCategoryTitlesStaffManufByName(Map temp) {
		return mapper.queryCategoryTitlesStaffManufByName(temp);
	}

	@Override
	public void saveCategoryTitlesStaffManuf(Map temp) {
		mapper.saveCategoryTitlesStaffManuf(temp);
	}

	@Override
	public Map queryStaffManufList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryStaffManufList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	
	
	
	
	
	
	
	
	
}
