package com.qf.machineTool.machineNodeInform.sercice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qf.machineTool.machineNodeInform.dao.machineNodeInformMapper;
import com.qf.util.PageData;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("machineNodeInformService")
public class machineNodeInformServiceImpl implements machineNodeInformService{

	private machineNodeInformMapper mapper;

	public machineNodeInformMapper getMapper() {
		return mapper;
	}

	@Autowired
	public void setMapper(machineNodeInformMapper mapper) {
		this.mapper = mapper;
	}
	
	public Map queryMachineNodeInformList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryMachineNodeInformList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	@Override
	public List<Map> queryInformDetailMachineNodeInformList(Map para) {
		return mapper.queryInformDetailMachineNodeInformList(para);
	}

	@Override
	public void deleteMachineNodeInform(Map para) {
		mapper.deleteMachineNodeInform(para);
	}

	@Override
	public void clearInformDetailMachineNodeInformById(Map para) {
		mapper.clearInformDetailMachineNodeInformById(para);
	}

	@Override
	public Map queryMachineNodeInformById(Map para) {
		return mapper.queryMachineNodeInformById(para);
	}

	@Override
	public void updateMachineNodeInform(Map para) {
		mapper.updateMachineNodeInform(para);
	}

	@Override
	public void saveMachineNodeInform(Map para) {
		mapper.saveMachineNodeInform(para);
	}

	@Override
	public void saveInformDetailMachineNodeInform(Map para) {
		mapper.saveInformDetailMachineNodeInform(para);
	}

	@Override
	public List<Map> queryCategoryMachineNodeInformList() {
		return mapper.queryCategoryMachineNodeInformList();
	}

	@Override
	public Map queryCategoryMachineNodeInformByName(Map temp) {
		return mapper.queryCategoryMachineNodeInformByName(temp);
	}

	@Override
	public void saveCategoryMachineNodeInform(Map temp) {
		mapper.saveCategoryMachineNodeInform(temp);
	}

	@Override
	public List<String> queryCjList() {
		return mapper.queryCjList();
	}

	@Override
	public List<String> queryDwList() {
		return mapper.queryDwList();
	}

	

	
	
	
	
}
