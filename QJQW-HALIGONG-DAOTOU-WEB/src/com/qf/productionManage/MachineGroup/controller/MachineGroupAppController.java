package com.qf.productionManage.MachineGroup.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qf.productionManage.MachineGroup.service.MachineGroupService;
import com.qf.util.PageData;
import com.qf.util.common.JackJson;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/MachineGroupApp")
public class MachineGroupAppController {

	
	@Resource(name = "MachineGroupService")
	private MachineGroupService machineGroupService;
	
	
	//列表
	@ResponseBody
	@RequestMapping(value = "/MachineGroupList",produces = "application/json; charset=utf-8")
	public String MachineGroupList(int pageNo, int pageSize,
			 String SuperiorMachineGroup, String NameMachineGroup, String NoMachineGroup,String AddressMachineGroup){
		ModelAndView mv=new ModelAndView();
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		try{
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("SuperiorMachineGroup", SuperiorMachineGroup);
			pd.put("NameMachineGroup", NameMachineGroup);
			pd.put("NoMachineGroup", NoMachineGroup);
			pd.put("AddressMachineGroup", AddressMachineGroup);
			
			page.setPd(pd);
			map	= machineGroupService.queryMachineGroupList(page);//查询零件页面
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
		para.put("SuperiorMachineGroup", SuperiorMachineGroup);
		para.put("NameMachineGroup", NameMachineGroup);
		para.put("NoMachineGroup", NoMachineGroup);
		para.put("AddressMachineGroup", AddressMachineGroup);
		resultmap.put("para",para);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	/** 
	 * 去添加
	 */
	@ResponseBody
	@RequestMapping(value="/goAddMachineGroup" ,produces = "application/json; charset=utf-8")
	public String goAddMachineGroup(String id)throws Exception{
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		Map para = new HashMap();
		para.put("id_MachineGroup", id);
		Map MachineGroup = machineGroupService.queryMachineGroupListById(para);//查询标准机床
		if(MachineGroup != null){
			resultmap.put("result", "1");
		}
		
		resultmap.put("MachineGroup", MachineGroup);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	/**
	 * 添加/修改
	 */
	@ResponseBody
	@RequestMapping(value = "/saveMachineGroup", produces = "application/json; charset=utf-8")
	public String saveMachineGroup(String user_id, 
			int id_MachineGroup, String SuperiorMachineGroup, String NameMachineGroup, String NoMachineGroup,  
			String AddressMachineGroup,String PrincipalMachineGroup, String RemarkMachineGroup,String LevelMachineGroup
			) {
	
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		
		List<Map> MachineGroup = null;
		
		MachineGroup = machineGroupService.loadingMachineGroup();
		for(int i = 0;i<MachineGroup.size();i++){
			String name = ""+MachineGroup.get(i).get("NameMachineGroup");
			if(NameMachineGroup.equals(name)&&id_MachineGroup==0){
				return "-1";
			}
		}
		
		para.put("id_MachineGroup", id_MachineGroup);
		
		if(SuperiorMachineGroup==null || "".equals(SuperiorMachineGroup)){
			para.put("SuperiorMachineGroup", "无");
		}else{
			para.put("SuperiorMachineGroup", SuperiorMachineGroup);
		}
		
		para.put("NameMachineGroup", NameMachineGroup);
		para.put("NoMachineGroup", NoMachineGroup);
		para.put("AddressMachineGroup", AddressMachineGroup);
		para.put("PrincipalMachineGroup", PrincipalMachineGroup);
		para.put("RemarkMachineGroup", RemarkMachineGroup);
		if(LevelMachineGroup==null || "".equals(LevelMachineGroup)){
			para.put("LevelMachineGroup", "1");
		}else{
			para.put("LevelMachineGroup", LevelMachineGroup);
		}
		
		
		try {
			if(id_MachineGroup != 0){//修改
				machineGroupService.updateMachineGroup(para);
			}else{//新增
				machineGroupService.saveMachineGroup(para);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			resultmap.put("result", "0");
			resultmap.put("msg", "操作失败");
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		resultmap.put("result", "1");
		resultmap.put("msg", "操作成功");
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	
	/**
	 * 删除标准机床信息
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteMachineGroupList", produces = "application/json; charset=utf-8")
	public String deleteMachineGroupList(String id_MachineGroup) {
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		para.put("id_MachineGroup", id_MachineGroup);
		try {
			machineGroupService.deleteMachineGroupList(para);
			
		} catch (Exception e) {
			e.printStackTrace();
			resultmap.put("result", "0");
			resultmap.put("msg", "操作失败");
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		resultmap.put("result", "1");
		resultmap.put("msg", "操作成功");
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	
	
	//加载部门
	@ResponseBody
	@RequestMapping(value ="loading", produces = "application/json; charset=utf-8")
	public Object loading(){
		String json  = "";  
		Map resultmap = new HashMap();
		List<Map> MachineGroup = null;
		
		MachineGroup = machineGroupService.loadingMachineGroup();
			
		resultmap.put("result", "1");
		resultmap.put("MachineGroup", MachineGroup);
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
}
