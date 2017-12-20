package com.qf.productionManage.FixturePart.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qf.productionManage.FixturePart.dao.FixturePartMapper;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("FixturePartService")
public class FixturePartServiceImpl implements FixturePartService{
	
	
	@Resource
	private FixturePartMapper mapper;

	@Override
	public Map queryFixturePartList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryFixturePartList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	@Override
	public List<Map> queryPictureFixturePartList(Map para) {
		return mapper.queryPictureFixturePartList(para);
	}

	@Override
	public List<Map> queryInformFixturePartList(Map para) {
		return mapper.queryInformFixturePartList(para);
	}

	@Override
	public List<Map> queryPartFixturePartList(Map para) {
		return mapper.queryPartFixturePartList(para);
	}

	@Override
	public List<Map> queryCategoryTypeFixturePartList() {
		return mapper.queryCategoryTypeFixturePartList();
	}

	@Override
	public Map queryFixturePartListById(Map para) {
		return mapper.queryFixturePartListById(para);
	}

	@Override
	public void deleteFixturePartList(Map para) {
		mapper.deleteFixturePartList(para);
	}

	@Override
	public void clearFixturePartFileById(Map para) {
		mapper.clearFixturePartFileById(para);
	}

	@Override
	public void updateFixturePart(Map para) {
		mapper.updateFixturePart(para);
	}

	@Override
	public void saveFixturePart(Map para) {
		mapper.saveFixturePart(para);
	}

	@Override
	public void savePictureFixturePart(Map para) {
		mapper.savePictureFixturePart(para);
	}

	@Override
	public void saveInformFixturePart(Map para) {
		mapper.saveInformFixturePart(para);
	}

	@Override
	public void savePartFixturePart(Map para) {
		mapper.savePartFixturePart(para);
	}

	@Override
	public Map queryCategoryTypeFixturePartByName(Map temp) {
		return mapper.queryCategoryTypeFixturePartByName(temp);
	}

	@Override
	public void saveCategoryTypeFixturePart(Map temp) {
		mapper.saveCategoryTypeFixturePart(temp);
	}
	
	
}
