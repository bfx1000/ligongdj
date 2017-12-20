package com.qf.tool.toolBTAdrill.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;




import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

import com.qf.system.login.dao.LoginMapper;
import com.qf.system.user.dao.SystemUserMapper;
import com.qf.tool.toolBTAdrill.dao.ToolBTAdrillMapper;
import com.qf.util.PageData;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("toolBTAdrillService")
public class ToolBTAdrillServiceImpl implements ToolBTAdrillService {
	
	private ToolBTAdrillMapper mapper;

	public ToolBTAdrillMapper getMapper() {
		return mapper;
	}
	
	@Autowired
	public void setMapper(ToolBTAdrillMapper mapper) {
		this.mapper = mapper;
	}

	//查询深孔钻列表
	public Map queryToolBTAdrillList(Page page){
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryToolBTAdrillList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}
	
	
	//查询刀具图片列表 PictureBTADrill
	public List<Map> queryPictureBTADrillList(Map para){
		return mapper.queryPictureBTADrillList(para);
	}
	
	//查询详细图片列表 PictureDetailBTADrill
	public List<Map> queryPictureDetailBTADrillList(Map para){
		return mapper.queryPictureDetailBTADrillList(para);
	}
	
	//查询详细信息列表 InformDetailBTADrill
	public List<Map> queryInformDetailBTADrillList(Map para){
		return mapper.queryInformDetailBTADrillList(para);
	}
	
	//查询应用实例列表 ApplicationBTADrill
	public List<Map> queryApplicationBTADrillList(Map para){
		return mapper.queryApplicationBTADrillList(para);
	}
	
	//查询深孔钻
	public Map queryToolBTAdrillById(Map para){
		return mapper.queryToolBTAdrillById(para);
	}
	
	//修改
	public void updateToolBTAdrill(Map para){
		mapper.updateToolBTAdrill(para);
	}
	
	//新增
	public void saveToolBTAdrill(Map para){
		mapper.saveToolBTAdrill(para);
	}
	
	//保存刀具图片
	public void savePictureBTADrill(Map PictureBTADrillMap){
		mapper.savePictureBTADrill(PictureBTADrillMap);
	}
	
	//清空刀具图片路径
	public void clearPictureBTADrillByIdBTADrill(Map para){
		mapper.clearPictureBTADrillByIdBTADrill(para);
	}
	
	//保存详细图片
	public void savePictureDetailBTADrill(Map PictureBTADrillMap){
		mapper.savePictureDetailBTADrill(PictureBTADrillMap);
	}
	
	//清空详细图片路径
	public void clearPictureDetailBTADrillByIdBTADrill(Map para){
		mapper.clearPictureDetailBTADrillByIdBTADrill(para);
	}
	
	//保存应用实例
	public void saveApplicationBTADrill(Map PictureBTADrillMap){
		mapper.saveApplicationBTADrill(PictureBTADrillMap);
	}
	
	//清空应用实例路径
	public void clearApplicationBTADrillByIdBTADrill(Map para){
		mapper.clearApplicationBTADrillByIdBTADrill(para);
	}
	
	//保存详细信息
	public void saveInformDetailBTADrill(Map PictureBTADrillMap){
		mapper.saveInformDetailBTADrill(PictureBTADrillMap);
	}
	
	//清空详细信息路径
	public void clearInformDetailBTADrillByIdBTADrill(Map para){
		mapper.clearInformDetailBTADrillByIdBTADrill(para);
	}
	
	//删除深孔钻数据
	public void deleteToolBTAdrill(Map para){
		mapper.deleteToolBTAdrill(para);
	}
	@Override
	public List<Map> queryToolBTAdrillListOfExport() {
		return mapper.queryToolBTAdrillListOfExport();
	}
	
}
