package com.qf.toolPlan.designTurningHolder.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qf.toolPlan.designTurningHolder.dao.designTurningHolderMapper;
import com.qf.util.PageData;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("designTurningHolderService")
public class designTurningHolderServiceImpl implements designTurningHolderService{

	@Resource
	private designTurningHolderMapper mapper;

	@Override
	public Map queryDesignTurningHolderList(Page page){
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryDesignTurningHolderList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	@Override
	public List<Map> queryPictureDesignTurningHolderList(Map para) {
		return mapper.queryPictureDesignTurningHolderList(para);
	}

	@Override
	public List<Map> queryInformDetailDesignTurningHolderList(Map para) {
		return mapper.queryInformDetailDesignTurningHolderList(para);
	}

	@Override
	public List<Map> queryPartDesignTurningHolderList(Map para) {
		return mapper.queryPartDesignTurningHolderList(para);
	}

	@Override
	public List<Map> queryCategoryDesignTurningHolderList() {
		return mapper.queryCategoryDesignTurningHolderList();
	}

	@Override
	public Map queryCategoryDesignTurningHolderByName(Map temp) {
		return mapper.queryCategoryDesignTurningHolderByName(temp);
	}

	@Override
	public void saveCategoryDesignTurningHolder(Map temp) {
		mapper.saveCategoryDesignTurningHolder(temp);
	}

	@Override
	public Map queryDesignTurningHolderById(Map para) {
		return mapper.queryDesignTurningHolderById(para);
	}

	@Override
	public void updateDesignTurningHolder(Map para) {
		mapper.updateDesignTurningHolder(para);
	}

	@Override
	public void saveDesignTurningHolder(Map para) {
		mapper.saveDesignTurningHolder(para);
	}

	@Override
	public void savePictureDesignTurningHolder(Map para) {
		mapper.savePictureDesignTurningHolder(para);
	}

	@Override
	public void clearPictureDesignTurningHolderById(Map para) {
		mapper.clearPictureDesignTurningHolderById(para);
	}

	@Override
	public void savePartDesignTurningHolder(Map para) {
		mapper.savePartDesignTurningHolder(para);
	}

	@Override
	public void clearPartDesignTurningHolderById(Map para) {
		mapper.clearPartDesignTurningHolderById(para);
	}

	@Override
	public void saveInformDetailDesignTurningHolder(Map para) {
		mapper.saveInformDetailDesignTurningHolder(para);
	}

	@Override
	public void clearInformDetailDesignTurningHolderById(Map para) {
		mapper.clearInformDetailDesignTurningHolderById(para);
	}

	@Override
	public void deleteDesignTurningHolder(Map para) {
		mapper.deleteDesignTurningHolder(para);
	}

	@Override
	public List<String> queryISOList() {
		return mapper.queryISOList();
	}
	
	
}
