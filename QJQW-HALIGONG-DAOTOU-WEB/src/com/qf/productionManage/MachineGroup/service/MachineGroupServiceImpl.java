package com.qf.productionManage.MachineGroup.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qf.productionManage.MachineGroup.dao.MachineGroupMapper;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("MachineGroupService")
public class MachineGroupServiceImpl implements MachineGroupService{

	@Resource
	private MachineGroupMapper mapper;

	@Override
	public Map queryMachineGroupList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryMachineGroupList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	@Override
	public Map queryMachineGroupListById(Map para) {
		return mapper.queryMachineGroupListById(para);
	}

	@Override
	public void deleteMachineGroupList(Map para) {
		mapper.deleteMachineGroupList(para);
	}

	@Override
	public void updateMachineGroup(Map para) {
		mapper.updateMachineGroup(para);
	}

	@Override
	public void saveMachineGroup(Map para) {
		mapper.saveMachineGroup(para);
	}

	@Override
	public List<Map> loadingMachineGroup() {
		return mapper.loadingMachineGroup();
	}

	@Override
	public List<Map> loadingChildDepartmentManufacture(Map para) {
		return mapper.loadingChildDepartmentManufacture(para);
	}
	
	
	
	
	
	
}
