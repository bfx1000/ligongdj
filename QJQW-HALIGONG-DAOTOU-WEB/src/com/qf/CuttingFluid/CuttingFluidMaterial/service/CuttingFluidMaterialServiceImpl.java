package com.qf.CuttingFluid.CuttingFluidMaterial.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qf.CuttingFluid.CuttingFluidMaterial.dao.CuttingFluidMaterialMapping;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("CuttingFluidMaterialService")
public class CuttingFluidMaterialServiceImpl implements CuttingFluidMaterialService{
	
	@Resource
	private CuttingFluidMaterialMapping mapper;

	@Override
	public Map queryCuttingFluidMaterialList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryCuttingFluidMaterialList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	@Override
	public List<Map> queryPictureCuttingFluidMaterialList(Map para) {
		return mapper.queryPictureCuttingFluidMaterialList(para);
	}

	@Override
	public List<Map> queryInformDetailCuttingFluidMaterialList(Map para) {
		return mapper.queryInformDetailCuttingFluidMaterialList(para);
	}

	@Override
	public List<Map> queryApplicationCuttingFluidMaterialList(Map para) {
		return mapper.queryApplicationCuttingFluidMaterialList(para);
	}

	@Override
	public List<Map> queryCategoryCuttingFluidMaterialList() {
		return mapper.queryCategoryCuttingFluidMaterialList();
	}

	@Override
	public Map queryCuttingFluidMaterialById(Map para) {
		return mapper.queryCuttingFluidMaterialById(para);
	}

	@Override
	public void clearPictureCuttingFluidMaterialById(Map para) {
		mapper.clearPictureCuttingFluidMaterialById(para);
	}

	@Override
	public void clearInformDetailCuttingFluidMaterialById(Map para) {
		mapper.clearInformDetailCuttingFluidMaterialById(para);
	}

	@Override
	public void clearApplicationCuttingFluidMaterialById(Map para) {
		mapper.clearApplicationCuttingFluidMaterialById(para);
	}

	@Override
	public void deleteCuttingFluidMaterial(Map para) {
		mapper.deleteCuttingFluidMaterial(para);
	}

	@Override
	public Map queryCategoryCuttingFluidMaterialByName(Map temp) {
		return mapper.queryCategoryCuttingFluidMaterialByName(temp);
	}

	@Override
	public void saveCategoryCuttingFluidMaterial(Map temp) {
		mapper.saveCategoryCuttingFluidMaterial(temp);
	}

	@Override
	public void updateCuttingFluidMaterial(Map para) {
		mapper.updateCuttingFluidMaterial(para);
	}

	@Override
	public void saveCuttingFluidMaterial(Map para) {
		mapper.saveCuttingFluidMaterial(para);
	}

	@Override
	public void savePictureCuttingFluidMaterial(Map para) {
		mapper.savePictureCuttingFluidMaterial(para);
	}

	@Override
	public void saveInformDetailCuttingFluidMaterial(Map para) {
		mapper.saveInformDetailCuttingFluidMaterial(para);
	}

	@Override
	public void saveApplicationCuttingFluidMaterial(Map para) {
		mapper.saveApplicationCuttingFluidMaterial(para);
	}

	@Override
	public Map queryCuttingFluidApplyList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryCuttingFluidApplyList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	@Override
	public List<Map> queryUsingCuttingFluidList(Map para) {
		return mapper.queryUsingCuttingFluidList(para);
	}

	@Override
	public void cleanUsingCuttingFluidById(Map para) {
		mapper.cleanUsingCuttingFluidById(para);
	}

	@Override
	public void saveUsingCuttingFluid(Map p) {
		mapper.saveUsingCuttingFluid(p);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
