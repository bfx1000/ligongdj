package com.qf.productionManage.MachineUseRecord.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qf.productionManage.MachineUseRecord.service.MachineUseRecordService;
import com.qf.util.PageData;
import com.qf.util.common.JackJson;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/MachineUseRecordApp")
public class MachineUseRecordAppController {

	@Resource(name = "MachineUseRecordService")
	private MachineUseRecordService machineUseRecordService;
	
	
	
	//列表
	@ResponseBody
	@RequestMapping(value = "/MachineUseRecordList",produces = "application/json; charset=utf-8")
	public String MachineUseRecordList(int pageNo, int pageSize,
			 String NumberMachGrNode, String DateStartManufGr, String DateFinishManufGr){
		ModelAndView mv=new ModelAndView();
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		try{
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("NumberMachGrNode", NumberMachGrNode);
			pd.put("DateStartManufGr", DateStartManufGr);
			pd.put("DateFinishManufGr", DateFinishManufGr);
			
			page.setPd(pd);
			map	= machineUseRecordService.queryMachineUseRecordList(page);//查询
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			if(list != null && list.size() > 0){
				Map pageMap = new HashMap();
				int pageCount = page.getPageCount();
				pageMap.put("pageCount", pageCount);
				resultmap.put("page", pageMap);
			}else{
				Map pageMap = new HashMap();
				pageMap.put("pageCount", 0);
				resultmap.put("page", pageMap);
			}
			
			resultmap.put("result", "1");
			resultmap.put("list", list);
		}catch (Exception e) {
			e.printStackTrace();
			resultmap.put("result", "0");
		}
		Map para = new HashMap();
		para.put("NumberMachGrNode", NumberMachGrNode);
		para.put("DateStartManufGr", DateStartManufGr);
		para.put("DateFinishManufGr", DateFinishManufGr);
		resultmap.put("para",para);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
		
}
