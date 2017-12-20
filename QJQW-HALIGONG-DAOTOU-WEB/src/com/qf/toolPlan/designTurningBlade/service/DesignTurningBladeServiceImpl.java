package com.qf.toolPlan.designTurningBlade.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qf.toolPlan.designTurningBlade.dao.DesignTurningBladeMapper;
import com.qf.util.PageData;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("designTurningBladeService")
public class DesignTurningBladeServiceImpl implements DesignTurningBladeService{

	@Resource
	private DesignTurningBladeMapper mapper;

	@Override
	public Map queryDesignTurningBladeList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryDesignTurningBladeList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	@Override
	public List<Map> queryPictureDesignTurningBladeList(Map para) {
		return mapper.queryPictureDesignTurningBladeList(para);
	}

	@Override
	public List<Map> queryInformDetailDesignTurningBladeList(Map para) {
		return mapper.queryInformDetailDesignTurningBladeList(para);
	}

	@Override
	public List<Map> queryPartDesignTurningBladeList(Map para) {
		return mapper.queryPartDesignTurningBladeList(para);
	}

	@Override
	public Map queryDesignTurningBladeById(Map para) {
		return mapper.queryDesignTurningBladeById(para);
	}

	@Override
	public void updateDesignTurningBlade(Map para) {
		mapper.updateDesignTurningBlade(para);
	}

	@Override
	public void saveDesignTurningBlade(Map para) {
		mapper.saveDesignTurningBlade(para);
	}

	@Override
	public void savePictureDesignTurningBlade(Map para) {
		mapper.savePictureDesignTurningBlade(para);
	}

	@Override
	public void clearPictureDesignTurningBladeById(Map para) {
		mapper.clearPictureDesignTurningBladeById(para);
	}

	@Override
	public void savePartDesignTurningBlade(Map para) {
		mapper.savePartDesignTurningBlade(para);
	}

	@Override
	public void clearPartDesignTurningBladeById(Map para) {
		mapper.clearPartDesignTurningBladeById(para);
	}

	@Override
	public void saveInformDetailDesignTurningBlade(Map para) {
		mapper.saveInformDetailDesignTurningBlade(para);
	}

	@Override
	public void clearInformDetailDesignTurningBladeById(Map para) {
		mapper.clearInformDetailDesignTurningBladeById(para);
	}

	@Override
	public void deleteDesignTurningBlade(Map para) {
		mapper.deleteDesignTurningBlade(para);
	}

	@Override
	public List<String> queryISOList() {
		return mapper.queryISOList();
	}

}
