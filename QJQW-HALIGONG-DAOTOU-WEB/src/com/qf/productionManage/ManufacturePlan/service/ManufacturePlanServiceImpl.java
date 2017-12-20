package com.qf.productionManage.ManufacturePlan.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qf.productionManage.ManufacturePlan.dao.ManufacturePlanMapper;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("ManufacturePlanService")
public class ManufacturePlanServiceImpl implements ManufacturePlanService{

	@Resource
	private ManufacturePlanMapper mapper;

	@Override
	public Map queryManufacturePlanList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryManufacturePlanList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	@Override
	public Map queryManufacturePlanById(Map para) {
		return mapper.queryManufacturePlanById(para);
	}

	@Override
	public void deleteManufacturePlanList(Map para) {
		mapper.deleteManufacturePlanList(para);
	}

	@Override
	public void updateManufacturePlan(Map para) {
		mapper.updateManufacturePlan(para);
	}

	@Override
	public void saveManufacturePlan(Map para) {
		mapper.saveManufacturePlan(para);
	}

	@Override
	public Map queryWorkingProcedureList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryWorkingProcedureList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	@Override
	public Map queryProcessStepList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryProcessStepList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	@Override
	public void updateMachineUseRecord(Map para1) {
		mapper.updateMachineUseRecord(para1);
	}

	@Override
	public void saveMachineUseRecord(Map para1) {
		mapper.saveMachineUseRecord(para1);
	}

	@Override
	public void deleteMachineUseRecord(Map para) {
		mapper.deleteMachineUseRecord(para);
	}
	
	
	
	
	
	
}
