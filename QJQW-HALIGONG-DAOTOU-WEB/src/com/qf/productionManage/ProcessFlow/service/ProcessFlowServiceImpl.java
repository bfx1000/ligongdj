package com.qf.productionManage.ProcessFlow.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qf.productionManage.ProcessFlow.dao.ProcessFlowMapper;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;

@Service("ProcessFlowService")
public class ProcessFlowServiceImpl implements ProcessFlowService{
	
	
	@Resource
	private ProcessFlowMapper mapper;

	@Override
	public Map queryProcessFlowList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
	    PageHelper.startPage(page); // 起始位置，长度
	    List<Map> list =  mapper.queryProcessFlowList(page.getPd());
	    Page p = PageHelper.endPage();
	    page.setRowCount(p.getRowCount());
	    page.setPageCount(p.getPageCount());
	    map.put("page", page);
	    map.put("list", p.getResult());
	    return map;
	}

	@Override
	public List<Map> queryPicturePartProcessFlowList(Map para) {
		return mapper.queryPicturePartProcessFlowList(para);
	}

	@Override
	public List<Map> queryWorkingProcedureList(Map para) {
		return mapper.queryWorkingProcedureList(para);
	}

	@Override
	public List<Map> queryProcessFlowServiceList(Map para1) {
		return mapper.queryProcessFlowServiceList(para1);
	}

	@Override
	public void deleteProcessFlowList(Map para) {
		mapper.deleteProcessFlowList(para);
	}

	@Override
	public void cleanPicturePartProcessFlow(Map para) {
		mapper.cleanPicturePartProcessFlow(para);
	}

	@Override
	public void cleanPictureProcessFlow(Map para1) {
		mapper.cleanPictureProcessFlow(para1);
	}

	@Override
	public void deleteWorkingProcedure(Map para) {
		mapper.deleteWorkingProcedure(para);
	}

	@Override
	public Map queryProcessFlowListById(Map para) {
		return mapper.queryProcessFlowListById(para);
	}

	@Override
	public void saveProcessFlow(Map form) {
		mapper.saveProcessFlow(form);
	}

	@Override
	public void updataProcessFlow(Map form) {
		mapper.updataProcessFlow(form);
	}

	@Override
	public void cleanWorkingProcedure(int id_ProcessFlow) {
		mapper.cleanWorkingProcedure(id_ProcessFlow);
	}

	@Override
	public void saveWorkingProcedure(List<Map> WorkingProcedure,int id_ProcessFlow) {
		Map map = new HashMap();
		for(int i =0; i<WorkingProcedure.size();i++){
			map = WorkingProcedure.get(i);
			map.put("id_ProcessFlow", id_ProcessFlow);
			if(Integer.parseInt(""+map.get("id_WorkingProcedure"))==0){
				mapper.saveWorkingProcedure(map);
			}else{
				mapper.saveIdAndWorkingProcedure(map);
			}
			mapper.clearPictureProcessFlow(map);
			String array_PictureProcessFlow = ""+map.get("array_PictureProcessFlow");
			if(array_PictureProcessFlow != null && !"".equals(array_PictureProcessFlow)){
				String array_PictureProcessFlows[] = array_PictureProcessFlow.split(",");
				
				for(int j=0; j<array_PictureProcessFlows.length; j++){
					if(array_PictureProcessFlows[j] != null && !"".equals(array_PictureProcessFlows[j])){
						map.put("url_PictureProcessFlow", array_PictureProcessFlows[j]);
						mapper.savePictureProcessFlow(map);
					}
				}
			}
			
			
		}
	}

	@Override
	public void clearPicturePartProcessFlow(Map form) {
		mapper.clearPicturePartProcessFlow(form);
	}

	@Override
	public void savePicturePartProcessFlow(Map form) {
		mapper.savePicturePartProcessFlow(form);
	}
	
	
	
	
	
}
