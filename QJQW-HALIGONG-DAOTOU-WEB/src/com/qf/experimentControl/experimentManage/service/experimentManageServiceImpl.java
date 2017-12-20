package com.qf.experimentControl.experimentManage.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qf.experimentControl.experimentManage.dao.experimentManageMapping;

@Service("experimentManageService")
public class experimentManageServiceImpl implements experimentManageService{

	@Resource
	private experimentManageMapping mapper;

	@Override
	public int judgeExperimentNoRepeat(String ExperimentNo_userForm) {
		return mapper.judgeExperimentNoRepeat(ExperimentNo_userForm);
	}

	@Override
	public List<Map> CategoryExperimentType() {
		return mapper.CategoryExperimentType();
	}

	@Override
	public List<String> ExperimentContentList() {
		return mapper.ExperimentContentList();
	}

	@Override
	public void saveExperimentManage(Map para) {
		mapper.saveExperimentManage(para);
	}

	@Override
	public void saveExperimentReport(Map para) {
		mapper.saveExperimentReport(para);
	}

	@Override
	public Map queryCategoryExperimentTypeById(Map temp) {
		return mapper.queryCategoryExperimentTypeById(temp);
	}

	@Override
	public void saveCategoryExperimentType(Map temp) {
		mapper.saveCategoryExperimentType(temp);
	}

	@Override
	public Map queryExperimentManageById(Map para) {
		return mapper.queryExperimentManageById(para);
	}

	@Override
	public void updateExperimentManage(Map para) {
		mapper.updateExperimentManage(para);
	}

	@Override
	public void cleanExperimentReport(Map para) {
		mapper.cleanExperimentReport(para);
	}

	@Override
	public void deleteExperimentManage(Map para) {
		mapper.deleteExperimentManage(para);
	}
	
	
}
