package com.qf.experimentControl.experimentParameterResult.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qf.experimentControl.experimentParameterResult.dao.ExperimentParameterResultMapping;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("experimentParameterResultService")
public class ExperimentParameterResultServiceImpl implements ExperimentParameterResultService{

	@Resource
	private ExperimentParameterResultMapping mapping;

	@Override
	public Map ByExperimentNo(Map para) {
		return mapping.ByExperimentNo(para);
	}

	@Override
	public void saveExperimentParameterResult(List<Map> list) {
		Map map = new HashMap();
		for(int i =0; i<list.size();i++){
			map = list.get(i);
			mapping.saveExperimentParameterResult(map);
		}
		
	}

	@Override
	public void saveKey(Map map) {
		mapping.saveKey(map);
	}

	@Override
	public void cleanKey(Map map) {
		mapping.cleanKey(map);
	}

	@Override
	public String selectKeys(String id_ExperimentManage) {
		return mapping.selectKeys(id_ExperimentManage);
	}

	@Override
	public List<Map> ExperimentParameterResult(List<String> parameters ,String id_ExperimentManage) {
		return mapping.ExperimentParameterResult(parameters,id_ExperimentManage);
	}

	@Override
	public void cleansaveExperimentParameterResult(String id) {
		mapping.cleansaveExperimentParameterResult(id);
	}

	@Override
	public Map CheckExperimentResultById(String id_ExperimentParameterResult) {
		return mapping.CheckExperimentResultById(id_ExperimentParameterResult);
	}

	@Override
	public List<Map> CheckExperimentParameterToolWear(String id_ExperimentParameterResult) {
		return mapping.CheckExperimentParameterToolWear(id_ExperimentParameterResult);
	}

	@Override
	public List<Map> CheckExperimentResultFile(String id_ExperimentParameterResult) {
		return mapping.CheckExperimentResultFile(id_ExperimentParameterResult);
	}

	@Override
	public List<Map> CheckExperimentParameterToolWearPicture(String id_ExperimentParameterToolWear) {
		return mapping.CheckExperimentParameterToolWearPicture(id_ExperimentParameterToolWear);
	}

	@Override
	public void saveResultInfo(Map resultInfo) {
		mapping.saveResultInfo(resultInfo);
	}

	@Override
	public void cleanResultFile(Map resultInfo) {
		mapping.cleanResultFile(resultInfo);
	}

	@Override
	public void saveFileAll(Map resultInfo) {
		mapping.saveFileAll(resultInfo);
	}

	@Override
	public void saveLifeInfo(List<Map> lifeList,String id_ExperimentParameterResult) {
		mapping.cleanlifeInfoById(id_ExperimentParameterResult);
		for(int i =0;i<lifeList.size();i++){
			Map life = lifeList.get(i);
			life.put("id_ExperimentParameterResult", id_ExperimentParameterResult);
			mapping.saveListInfo(life);
			
			mapping.cleanLifePictureById(life);
			if(life.get("array_ExReQianDaoPicture") != null && !"".equals(life.get("array_ExReQianDaoPicture"))){
				String array_ExReQianDaoPictures[] = ((String) life.get("array_ExReQianDaoPicture")).split(",");
				for(int j=0; j<array_ExReQianDaoPictures.length; j++){
					if(array_ExReQianDaoPictures[j] != null && !"".equals(array_ExReQianDaoPictures[j])){
						life.put("url_ExperimentParameterToolWearPicture", array_ExReQianDaoPictures[j]);
						life.put("ascription", "ExReQianDaoPicture");
						mapping.saveLifePictureAll(life);
					}
				}
			}
			if(life.get("array_ExReHouDaoPicture") != null && !"".equals(life.get("array_ExReHouDaoPicture"))){
				String array_ExReHouDaoPictures[] = ((String) life.get("array_ExReHouDaoPicture")).split(",");
				for(int j=0; j<array_ExReHouDaoPictures.length; j++){
					if(array_ExReHouDaoPictures[j] != null && !"".equals(array_ExReHouDaoPictures[j])){
						life.put("url_ExperimentParameterToolWearPicture", array_ExReHouDaoPictures[j]);
						life.put("ascription", "ExReHouDaoPicture");
						mapping.saveLifePictureAll(life);
					}
				}
			}
			if(life.get("array_ExReDaojianPicture") != null && !"".equals(life.get("array_ExReDaojianPicture"))){
				String array_ExReDaojianPictures[] = ((String) life.get("array_ExReDaojianPicture")).split(",");
				for(int j=0; j<array_ExReDaojianPictures.length; j++){
					if(array_ExReDaojianPictures[j] != null && !"".equals(array_ExReDaojianPictures[j])){
						life.put("url_ExperimentParameterToolWearPicture", array_ExReDaojianPictures[j]);
						life.put("ascription", "ExReDaojianPicture");
						mapping.saveLifePictureAll(life);
					}
				}
			}
			if(life.get("array_ExReotherPicture") != null && !"".equals(life.get("array_ExReotherPicture"))){
				String array_ExReotherPictures[] = ((String) life.get("array_ExReotherPicture")).split(",");
				for(int j=0; j<array_ExReotherPictures.length; j++){
					if(array_ExReotherPictures[j] != null && !"".equals(array_ExReotherPictures[j])){
						life.put("url_ExperimentParameterToolWearPicture", array_ExReotherPictures[j]);
						life.put("ascription", "ExReotherPicture");
						mapping.saveLifePictureAll(life);
					}
				}
			}
			
		}
	}

	@Override
	public Map queryResultList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapping.queryResultList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	@Override
	public List<Map> queryExperimentReportList(Map para) {
		return mapping.queryExperimentReportList(para);
	}
	
	
	
	
}
