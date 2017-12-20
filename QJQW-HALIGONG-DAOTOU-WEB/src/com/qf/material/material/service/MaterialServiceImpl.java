package com.qf.material.material.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qf.material.material.dao.MaterialMapper;
import com.qf.tool.turningBlade.dao.TurningBladeMapper;
import com.qf.tool.turningHolder.dao.TurningHolderMapper;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("materialService")
public class MaterialServiceImpl implements MaterialService {
	private MaterialMapper mapper;

	public MaterialMapper getMapper() {
		return mapper;
	}
	
	@Autowired
	public void setMapper(MaterialMapper mapper) {
		this.mapper = mapper;
	}
	
	//查询工件材料列表
	public Map queryMaterialList(Page page){
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryMaterialList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}
	
	//查询材料图片列表 PictureMaterial
	public List<Map> queryPictureMaterialList(Map para){
		return mapper.queryPictureMaterialList(para);
	}
	
	//查询详细信息列表 InformDetailMaterial
	public List<Map> queryInformDetailMaterialList(Map para){
		return mapper.queryInformDetailMaterialList(para);
	}
	
	//查询应用实例列表 ApplicationMaterial
	public List<Map> queryApplicationMaterialList(Map para){
		return mapper.queryApplicationMaterialList(para);
	}
	
	//查询仿真参数列表 SimulationMaterial
	public List<Map> querySimulationMaterialList(Map para){
		return mapper.querySimulationMaterialList(para);
	}
	
	//查询工件材料数据
	public Map queryMaterialById(Map para){
		return mapper.queryMaterialById(para);
	}
	
	//修改
	public void updateMaterial(Map para){
		mapper.updateMaterial(para);
	}
	
	//新增
	public void saveMaterial(Map para){
		mapper.saveMaterial(para);
	}
	
	//清空材料图片路径 PictureMaterial
	public void clearPictureMaterialByIdMaterial(Map para){
		mapper.clearPictureMaterialByIdMaterial(para);
	}
	
	//保存刀柄图片
	public void savePictureMaterial(Map para){
		mapper.savePictureMaterial(para);
	}
	
	//清空详细信息路径
	public void clearInformDetailMaterialByIdMaterial(Map para){
		mapper.clearInformDetailMaterialByIdMaterial(para);
	}
	
	//保存刀柄图片
	public void saveInformDetailMaterial(Map para){
		mapper.saveInformDetailMaterial(para);
	}
	
	//清空应用实例路径
	public void clearApplicationMaterialByIdMaterial(Map para){
		mapper.clearApplicationMaterialByIdMaterial(para);
	}
	
	//保存刀柄图片
	public void saveApplicationMaterial(Map para){
		mapper.saveApplicationMaterial(para);
	}
	
	//清空仿真参数路径
	public void clearSimulationMaterialByIdMaterial(Map para){
		mapper.clearSimulationMaterialByIdMaterial(para);
	}
	
	//保存刀柄图片
	public void saveSimulationMaterial(Map para){
		mapper.saveSimulationMaterial(para);
	}
	
	//删除工件材料
	public void deleteMaterial(Map para){
		mapper.deleteMaterial(para);
	}
	
	//查询材料类别列表
	public List<Map> queryCategoryMaterialList(){
		return mapper.queryCategoryMaterialList();
	}
	
	//根据名称查询材料类别
	public Map queryCategoryMaterialById(Map temp){
		return mapper.queryCategoryMaterialById(temp);
	}
	
	//保存新的材料类别
	public void saveCategoryMaterial(Map temp){
		mapper.saveCategoryMaterial(temp);
	}

}
