package com.qf.cuttingSimulation.cuttingSimulation.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qf.CuttingFluid.CuttingFluidMaterial.dao.CuttingFluidMaterialMapping;
import com.qf.cuttingSimulation.cuttingSimulation.dao.CuttingSimulationMapping;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("cuttingSimulationService")
public class CuttingSimulationServiceImpl implements CuttingSimulationService{

	
	@Resource
	private CuttingSimulationMapping mapper;

	@Override
	public Map queryCuttingSimulationList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryCuttingSimulationList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}
	
	@Override
	public List<Map> queryModelPictureCutSimList(Map para) {
		return mapper.queryModelPictureCutSimList(para);
	}

	@Override
	public List<Map> queryFileCutSimList(Map pare) {
		return mapper.queryFileCutSimList(pare);
	}

	@Override
	public List<Map> queryCategoryTypeCutSimList() {
		return mapper.queryCategoryTypeCutSimList();
	}

	@Override
	public List<Map> queryCategorySoftwareCutSimList() {
		return mapper.queryCategorySoftwareCutSimList();
	}

	@Override
	public void cleanCuttingSimulationFileById(Map para) {
		mapper.cleanCuttingSimulationFileById(para);
	}

	@Override
	public void deleteCuttingSimulationById(Map para) {
		mapper.deleteCuttingSimulationById(para);
	}

	@Override
	public Map queryCuttingSimulationById(Map para) {
		return mapper.queryCuttingSimulationById(para);
	}

	@Override
	public Map queryCategoryTypeCutSimByName(Map temp) {
		return mapper.queryCategoryTypeCutSimByName(temp);
	}

	@Override
	public Map queryCategorySoftwareCutSimByName(Map temp1) {
		return mapper.queryCategorySoftwareCutSimByName(temp1);
	}

	@Override
	public void saveCategoryTypeCutSim(Map temp) {
		mapper.saveCategoryTypeCutSim(temp);
	}

	@Override
	public void saveCategorySoftwareCutSim(Map temp1) {
		mapper.saveCategorySoftwareCutSim(temp1);
	}

	@Override
	public void updateCuttingSimulation(Map para) {
		mapper.updateCuttingSimulation(para);
	}

	@Override
	public void saveCuttingSimulation(Map para) {
		mapper.saveCuttingSimulation(para);
	}

	@Override
	public void saveModelPictureCutSim(Map pere) {
		mapper.saveModelPictureCutSim(pere);
	}

	@Override
	public void saveFileCutSim(Map pare) {
		mapper.saveFileCutSim(pare);
	}

	
	
	
	
	
	
	
}





