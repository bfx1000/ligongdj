package com.qf.productionManage.MachineUseRecord.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qf.productionManage.MachineUseRecord.dao.MachineUseRecordMapper;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("MachineUseRecordService")
public class MachineUseRecordServiceImpl implements MachineUseRecordService{

	@Resource
	private MachineUseRecordMapper mapper;
	
	@Override
	public Map queryMachineUseRecordList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryMachineUseRecordList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	
	
}
