package com.qf.toolPlan.designToolBTAdrill.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qf.toolPlan.designToolBTAdrill.dao.DesignToolBTAdrillMapper;
import com.qf.util.PageData;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("designToolBTAdrillService")
public class DesignToolBTAdrillServiceImpl implements DesignToolBTAdrillService{

	@Resource
	private DesignToolBTAdrillMapper mapper;

	@Override
	public Map queryDesignToolBTAdrillList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryDesignToolBTAdrillList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	@Override
	public List<Map> queryPictureDesignToolBTAdrillList(Map para) {
		return mapper.queryPictureDesignToolBTAdrillList(para);
	}

	@Override
	public List<Map> queryInformDetailDesignToolBTAdrillList(Map para) {
		return mapper.queryInformDetailDesignToolBTAdrillList(para);
	}

	@Override
	public List<Map> queryPartDesignToolBTAdrillList(Map para) {
		return mapper.queryPartDesignToolBTAdrillList(para);
	}

	@Override
	public List<Map> queryPartAllList(Map para) {
		return mapper.queryPartAllList(para);
	}

	@Override
	public void clearPictureDesignToolBTAdrillById(Map para) {
		mapper.clearPictureDesignToolBTAdrillById(para);
	}

	@Override
	public void clearPartDesignToolBTAdrillById(Map para) {
		mapper.clearPartDesignToolBTAdrillById(para);
	}

	@Override
	public void clearInformDetailDesignToolBTAdrillById(Map para) {
		mapper.clearInformDetailDesignToolBTAdrillById(para);
	}

	@Override
	public void clearPartAllById(Map para) {
		mapper.clearPartAllById(para);
	}

	@Override
	public void deleteDesignToolBTAdrill(Map para) {
		mapper.deleteDesignToolBTAdrill(para);
	}

	@Override
	public Map queryDesignToolBTAdrillById(Map para) {
		return mapper.queryDesignToolBTAdrillById(para);
	}

	@Override
	public void updateDesignToolBTAdrill(Map para) {
		mapper.updateDesignToolBTAdrill(para);
	}

	@Override
	public void saveDesignToolBTAdrill(Map para) {
		mapper.saveDesignToolBTAdrill(para);
	}

	@Override
	public void savePictureDesignToolBTAdrill(Map para) {
		mapper.savePictureDesignToolBTAdrill(para);
	}

	@Override
	public void saveInformDetailDesignToolBTAdrill(Map para) {
		mapper.saveInformDetailDesignToolBTAdrill(para);
	}

	@Override
	public void savePartDesignToolBTAdrill(Map para) {
		mapper.savePartDesignToolBTAdrill(para);
	}
	
	@Override
	public void savePartAll(Map para) {
		mapper.savePartAll(para);
	}
	
	@Override
	public void cleanPartAllDesignToolBTAdrillById(Map para) {
		mapper.cleanPartAllDesignToolBTAdrillById(para);
	}

	
}
