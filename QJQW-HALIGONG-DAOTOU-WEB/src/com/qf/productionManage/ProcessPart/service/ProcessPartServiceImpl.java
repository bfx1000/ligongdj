package com.qf.productionManage.ProcessPart.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qf.productionManage.ProcessPart.dao.ProcessPartMapper;
import com.qf.util.PageData;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("processPartService")
public class ProcessPartServiceImpl implements ProcessPartService{

	
	@Resource
	private ProcessPartMapper mapper;

	@Override
	public Map queryProcessPartList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryProcessPartList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	@Override
	public List<Map> queryPictureProcessPartList(Map para) {
		return mapper.queryPictureProcessPartList(para);
	}

	@Override
	public List<Map> queryInformProcessPartList(Map para) {
		return mapper.queryInformProcessPartList(para);
	}

	@Override
	public List<Map> queryPartProcessPartList(Map para) {
		return mapper.queryPartProcessPartList(para);
	}

	@Override
	public List<Map> queryCategoryTypeProcessPartList() {
		return mapper.queryCategoryTypeProcessPartList();
	}

	@Override
	public List<Map> queryCategoryIndustryProcessPartList() {
		return mapper.queryCategoryIndustryProcessPartList();
	}
	
	@Override
	public void deleteProcessPartList(Map para) {
		mapper.deleteProcessPartList(para);
	}

	@Override
	public void clearProcessPartFileById(Map para) {
		mapper.clearProcessPartFileById(para);
	}

	@Override
	public Map queryProcessPartListById(Map para) {
		return mapper.queryProcessPartListById(para);
	}

	@Override
	public void updateProcessPart(Map para) {
		mapper.updateProcessPart(para);
	}

	@Override
	public void saveProcessPart(Map para) {
		mapper.saveProcessPart(para);
	}

	@Override
	public void savePictureProcessPart(Map para) {
		mapper.savePictureProcessPart(para);
	}

	@Override
	public void saveInformProcessPart(Map para) {
		mapper.saveInformProcessPart(para);
	}

	@Override
	public void savePartProcessPart(Map para) {
		mapper.savePartProcessPart(para);
	}

	@Override
	public Map queryCategoryTypeProcessPartByName(Map temp) {
		return mapper.queryCategoryTypeProcessPartByName(temp);
	}

	@Override
	public void saveCategoryTypeProcessPart(Map temp) {
		mapper.saveCategoryTypeProcessPart(temp);
	}

	@Override
	public Map queryCategoryIndustryProcessPartByName(Map temp) {
		return mapper.queryCategoryIndustryProcessPartByName(temp);
	}

	@Override
	public void saveCategoryIndustryProcessPart(Map temp) {
		mapper.saveCategoryIndustryProcessPart(temp);
	}

	


	
	
	
	
}
