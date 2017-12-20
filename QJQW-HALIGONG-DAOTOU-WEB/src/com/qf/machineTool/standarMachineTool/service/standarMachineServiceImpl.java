package com.qf.machineTool.standarMachineTool.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qf.machineTool.standarMachineTool.dao.standarMachineMapper;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("standarMachineService")
public class standarMachineServiceImpl implements standarMachineService{
	
	private standarMachineMapper mapper;

	public standarMachineMapper getMapper() {
		return mapper;
	}

	@Autowired
	public void setMapper(standarMachineMapper mapper) {
		this.mapper = mapper;
	}
	//查询标准机床信息
	public Map queryStandarMachineList(Page page){
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryStandarMachineList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}
	
	//查询标准机床图片列表 PictureMachineInform
	@Override
	public List<Map> queryPictureMachineInformList(Map para) {
		return mapper.queryPictureMachineInformList(para);
	}
	
	//查询标准机床详细信息 InformDetailMachineInform
	@Override
	public List<Map> queryInformDetailMachineInformList(Map para) {
		return mapper.queryInformDetailMachineInformList(para);
	}
	
	//查询标准机床信息（通过ID、用于去新增页面）
	@Override
	public Map queryMachineInformById(Map para) {
		return mapper.queryMachineInformById(para);
	}
	
	//删除标准机床的图片
	@Override
	public void clearPictureMachineInformByIdMachineInform(Map para) {
		mapper.clearPictureMachineInformByIdMachineInform(para);
	}
	
	//删除标准机床的详细信息
	@Override
	public void clearInformDetailMachineInformByIdMachineInform(Map para) {
		mapper.clearInformDetailMachineInformByIdMachineInform(para);
	}

	//删除标准机床
	@Override
	public void deleteMachineInform(Map para) {
		mapper.deleteMachineInform(para);
	}
	
	//修改
	@Override
	public void updateMachineInform(Map para) {
		mapper.updateMachineInform(para);
	}

	//添加
	@Override
	public void saveMachineInform(Map para) {
		mapper.saveMachineInform(para);
	}

	//添加机床图片
	@Override
	public void savePictureMachineInform(Map para) {
		mapper.savePictureMachineInform(para);
	}

	//添加详细信息
	@Override
	public void saveInformDetailMachineInform(Map para) {
		mapper.saveInformDetailMachineInform(para);
	}

	@Override
	public List<Map> queryCategoryMachineInformList() {
		return mapper.queryCategoryMachineInformList();
	}

	@Override
	public Map queryCategoryMachineInformByName(Map temp) {
		return mapper.queryCategoryMachineInformByName(temp);
	}

	@Override
	public void saveCategoryMachineInform(Map temp) {
		mapper.saveCategoryMachineInform(temp);
	}

	
	
	
}





