package com.qf.experimentControl.experimentParameterResult.service;

import java.util.List;
import java.util.Map;

import com.qf.util.page.Page;

public interface ExperimentParameterResultService {

	public Map ByExperimentNo(Map para);
	
	public void saveExperimentParameterResult(List<Map> list);
	
	public void saveKey(Map map);
	
	public void cleanKey(Map map);
	
	public String selectKeys(String id_ExperimentManage);
	
	public List<Map> ExperimentParameterResult(List<String> parameters,String id_ExperimentManage);
	
	public void cleansaveExperimentParameterResult(String id);
	
	public Map CheckExperimentResultById(String id_ExperimentParameterResult);
		
	public List<Map> CheckExperimentParameterToolWear(String id_ExperimentParameterResult);
	
	public List<Map> CheckExperimentResultFile(String id_ExperimentParameterResult);
	
	public List<Map> CheckExperimentParameterToolWearPicture(String id_ExperimentParameterToolWear);
	
	public void saveResultInfo(Map resultInfo);
	
	public void cleanResultFile(Map resultInfo);
	
	public void saveFileAll(Map resultInfo);
	
	public void saveLifeInfo(List<Map> lifeList,String id_ExperimentParameterResult);
	
	public Map queryResultList(Page page);
	
	public List<Map> queryExperimentReportList(Map para);
	
	
	
	
}






