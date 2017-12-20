package com.qf.productionManage.ProcessStep.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qf.productionManage.ProcessStep.dao.ProcessStepMapper;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("ProcessStepService")
public class ProcessStepServiceImpl implements ProcessStepService{

	
	@Resource
	private ProcessStepMapper mapper;

	@Override
	public Map queryWorkingProcedureList(String NoProcedureProcessFlow) {
		return mapper.queryWorkingProcedureList(NoProcedureProcessFlow);
	}

	@Override
	public Map queryProcessFlowList(String id_WorkingProcedure) {
		return mapper.queryProcessFlowList(id_WorkingProcedure);
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
	public List<Map> queryPictureProcessStepList(Map para) {
		return mapper.queryPictureProcessStepList(para);
	}

	@Override
	public void deleteProcessStepList(Map para) {
		mapper.deleteProcessStepList(para);
	}

	@Override
	public void clearPictureProcessStep(Map para) {
		mapper.clearPictureProcessStep(para);
	}

	@Override
	public Map queryProcessStepListById(Map para) {
		return mapper.queryProcessStepListById(para);
	}

	@Override
	public void updateProcessStep(Map para) {
		mapper.updateProcessStep(para);
	}

	@Override
	public void saveProcessStep(Map para) {
		mapper.saveProcessStep(para);
	}

	@Override
	public void savePictureProcessStep(Map para) {
		mapper.savePictureProcessStep(para);
	}
	
	
	
	
	
}
