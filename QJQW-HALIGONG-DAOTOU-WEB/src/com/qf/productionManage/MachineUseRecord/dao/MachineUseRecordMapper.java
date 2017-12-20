package com.qf.productionManage.MachineUseRecord.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.qf.util.PageData;

@Repository
public interface MachineUseRecordMapper {

	public List<Map> queryMachineUseRecordList(PageData pd);
	
}
