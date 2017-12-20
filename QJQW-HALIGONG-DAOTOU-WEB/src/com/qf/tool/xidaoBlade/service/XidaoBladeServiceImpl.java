package com.qf.tool.xidaoBlade.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qf.tool.xidaoBlade.dao.XidaoBladeMapper;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("xidaoBladeService")
public class XidaoBladeServiceImpl implements XidaoBladeService {
	private XidaoBladeMapper mapper;

	public XidaoBladeMapper getMapper() {
		return mapper;
	}
	
	@Autowired
	public void setMapper(XidaoBladeMapper mapper) {
		this.mapper = mapper;
	}

	//查询刀片列表
	public Map queryXidaoBladeList(Page page){
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryXidaoBladeList(page.getPd());
	    System.out.println(list);
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}
	
	//查询刀具图片列表 PictureBladeXidaoList
	public List<Map> queryPictureBladeXidaoList(Map para){
		return mapper.queryPictureBladeXidaoList(para);
	}
	
	//查询详细图片列表 PictureDetailBladeXidaoList
	public List<Map> queryPictureDetailBladeXidaoList(Map para){
		return mapper.queryPictureDetailBladeXidaoList(para);
	}
	
	//查询详细信息列表 InformDetailBladeXidaoList
	public List<Map> queryInformDetailBladeXidaoList(Map para){
		return mapper.queryInformDetailBladeXidaoList(para);
	}
	
	//查询应用实例列表 ApplicationBladeXidaoList
	public List<Map> queryApplicationBladeXidaoList(Map para){
		return mapper.queryApplicationBladeXidaoList(para);
	}
	
	//查询刀片详细信息
	public Map queryXidaoBladeById(Map para){
		return mapper.queryXidaoBladeById(para);
	}
	
	//修改
	public void updateXidaoBlade(Map para){
		mapper.updateXidaoBlade(para);
	}
	
	//新增
	public void saveXidaoBlade(Map para){
		mapper.saveXidaoBlade(para);
	}
	
	//保存刀具图片
	public void savePictureBladeXidao(Map para){
		mapper.savePictureBladeXidao(para);
	}
	
	//清空刀具图片路径
	public void clearPictureBladeXidaoByIdXidaoBlade(Map para){
		mapper.clearPictureBladeXidaoByIdXidaoBlade(para);
	}
	
	//保存详细图片
	public void savePictureDetailBladeXidao(Map para){
		mapper.savePictureDetailBladeXidao(para);
	}
	
	//清空详细图片路径
	public void clearPictureDetailBladeXidaoByIdXidaoBlade(Map para){
		mapper.clearPictureDetailBladeXidaoByIdXidaoBlade(para);
	}
	
	//保存应用实例
	public void saveApplicationBladeXidao(Map para){
		mapper.saveApplicationBladeXidao(para);
	}
	
	//清空应用实例路径
	public void clearApplicationBladeXidaoByIdXidaoBlade(Map para){
		mapper.clearApplicationBladeXidaoByIdXidaoBlade(para);
	}
	
	//保存详细信息
	public void saveInformDetailBladeXidao(Map para){
		mapper.saveInformDetailBladeXidao(para);
	}
	
	//清空详细信息路径
	public void clearInformDetailBladeXidaoByIdXidaoBlade(Map para){
		mapper.clearInformDetailBladeXidaoByIdXidaoBlade(para);
	}
	
	//删除刀片数据
	public void deleteXidaoBlade(Map para){
		mapper.deleteXidaoBlade(para);
	}
}
