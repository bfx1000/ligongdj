package com.qf.productionManage.InquireMachineGroup.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qf.productionManage.InquireMachineGroup.dao.InquireMachineGroupMapper;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("InquireMachineGroupService")
public class InquireMachineGroupServiceImpl implements InquireMachineGroupService{

	@Resource
	private InquireMachineGroupMapper mapper;

	@Override
	public Map queryInquireMachineGroupList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryInquireMachineGroupList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	@Override
	public Map queryInquireMachineGroupById(Map para) {
		return mapper.queryInquireMachineGroupById(para);
	}

	@Override
	public void deleteInquireMachineGroupList(Map para) {
		mapper.deleteInquireMachineGroupList(para);
	}

	@Override
	public void updateInquireMachineGroup(Map para) {
		mapper.updateInquireMachineGroup(para);
	}

	@Override
	public void saveInquireMachineGroup(Map para) {
		mapper.saveInquireMachineGroup(para);
	}

	@Override
	public Map queryManufacturePlanListByNum(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryManufacturePlanListByNum(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	@Override
	public List<Map> querySuperiorMachineGroupList(String NameMachineGroup) {
		return mapper.querySuperiorMachineGroupList(NameMachineGroup);
	}

	@Override
	public List<Map> queryInquireMachineGroupAllList() {
		return mapper.queryInquireMachineGroupAllList();
	}

	@Override
	public void updataStatus(Map para) {
		mapper.updataStatus(para);
	}
	
	
	
	
	
	
}
