package com.qf.machineTool.machineNodeInform.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.qf.machineTool.machineNodeInform.sercice.machineNodeInformService;
import com.qf.machineTool.standarMachineTool.service.standarMachineService;
import com.qf.util.PageData;
import com.qf.util.common.JackJson;
import com.qf.util.controller.BaseController;
import com.qf.util.file.ByteToFile;
import com.qf.util.page.Page;


@Controller
@RequestMapping("/machineNodeInformApp")
public class machineNodeInformAppController extends BaseController{
	
	@Resource(name = "machineNodeInformService")
	private machineNodeInformService machineNodeInformService;
	
	@Resource(name="standarMachineService")
	private standarMachineService standarMachineService;
	
	/**
	 * 查询机床节点列表
	 * @param pageNo
	 * @param pageSize
	 * @param NameMachine
	 * @param NumberMachine
	 * @param TypeMachine
	 * @param ControlSystemMachine
	 * @param SpindleSpeedMachine
	 * @param CompanyMachine
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "queryMachineNodeInformList",produces = "application/json; charset=utf-8")
	public String queryMachineNodeInformList(int pageNo, int pageSize,
			 String NumberMachineNode, String NumberMachine, String TypeMachineNode,
			 String DepartmentMachineNode,String WorkshopMachineNode){
		ModelAndView mv=new ModelAndView();
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		try{
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("NumberMachineNode", NumberMachineNode);
			pd.put("NumberMachine", NumberMachine);
			pd.put("TypeMachineNode", TypeMachineNode);
			pd.put("DepartmentMachineNode", DepartmentMachineNode);
			pd.put("WorkshopMachineNode", WorkshopMachineNode);
			
			page.setPd(pd);
			map	= machineNodeInformService.queryMachineNodeInformList(page);//查询机床节点信息页面
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			System.out.println("机床节点信息"+list);
			
			if(list != null && list.size() > 0){
				for(int i = 0; i < list.size(); i++){
					Map MachineNodeInform = list.get(i);
					int id_MachineNodeInform = (int) MachineNodeInform.get("id_MachineNodeInform");
					
					Map para = new HashMap();
					para.put("id_MachineNodeInform", id_MachineNodeInform);
					
					//查询详细信息列表 
					List<Map> informDetailMachineNodeInformList = machineNodeInformService.queryInformDetailMachineNodeInformList(para);
					
					MachineNodeInform.put("informDetailMachineNodeInformList", informDetailMachineNodeInformList);
					list.set(i, MachineNodeInform);
				}
				Map pageMap = new HashMap();
				int pageCount = page.getPageCount();
				pageMap.put("pageCount", pageCount);
				resultmap.put("page", pageMap);
			}else{
				Map pageMap = new HashMap();
				pageMap.put("pageCount", 0);
				resultmap.put("page", pageMap);
			}
			
			//查询类别列表
			List<Map> categoryMachineNodeInform = machineNodeInformService.queryCategoryMachineNodeInformList();
			
			resultmap.put("categoryMachineNodeInform", categoryMachineNodeInform);
			resultmap.put("result", "1");
			resultmap.put("list", list);
		}catch (Exception e) {
			e.printStackTrace();
			resultmap.put("result", "0");
		}
		Map para = new HashMap();
		para.put("NumberMachineNode", NumberMachineNode);
		para.put("NumberMachine", NumberMachine);
		para.put("TypeMachineNode", TypeMachineNode);
		para.put("DepartmentMachineNode", DepartmentMachineNode);
		para.put("WorkshopMachineNode", WorkshopMachineNode);
		resultmap.put("para",para);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	/** 
	 * 去添加
	 */
	
	@ResponseBody
	@RequestMapping(value="/goAddMachineNodeInform" ,produces = "application/json; charset=utf-8")
	public String goAddTurningHolder(String id)throws Exception{
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		Map para = new HashMap();
		para.put("id_MachineNodeInform", id);
		Map MachineNodeInform = machineNodeInformService.queryMachineNodeInformById(para);//查询标准机床
		System.out.println(MachineNodeInform);
		if(MachineNodeInform != null){
			
			
			//查询机床节点详细信息列表 
			List<Map> informDetailMachineNodeInformList = machineNodeInformService.queryInformDetailMachineNodeInformList(para);
			String array_InformDetailMachineNodeInform = "";
			String array_InformDetailMachineNodeInform_name = "";
			if(informDetailMachineNodeInformList != null && informDetailMachineNodeInformList.size() > 0){
				for(int i = 0; i < informDetailMachineNodeInformList.size(); i++){
					array_InformDetailMachineNodeInform = array_InformDetailMachineNodeInform + informDetailMachineNodeInformList.get(i).get("url_InformDetailMachineNodeInform") + ",";
					array_InformDetailMachineNodeInform_name = array_InformDetailMachineNodeInform_name + informDetailMachineNodeInformList.get(i).get("name_InformDetailMachineNodeInform") + ",";
				}
			}
			
			MachineNodeInform.put("informDetailMachineNodeInformList", informDetailMachineNodeInformList);
			
			resultmap.put("result", "1");
			resultmap.put("array_InformDetailMachineNodeInform", array_InformDetailMachineNodeInform);
			resultmap.put("array_InformDetailMachineNodeInform_name", array_InformDetailMachineNodeInform_name);
		}
		
		List<Map> categoryMachineNodeInform = machineNodeInformService.queryCategoryMachineNodeInformList();
		
		resultmap.put("MachineNodeInform", MachineNodeInform);
		resultmap.put("categoryMachineNodeInform", categoryMachineNodeInform);
		
		List<String> DwList = machineNodeInformService.queryDwList();
		List<String> CjList = machineNodeInformService.queryCjList();
		resultmap.put("DwList", DwList);
		resultmap.put("CjList", CjList);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	/**
	 * 添加/修改
	 */
	
	@ResponseBody
	@RequestMapping(value = "/saveMachineNodeInform", produces = "application/json; charset=utf-8")
	public String saveMachineInform(String user_id, 
			int id_MachineNodeInform, 
			String array_InformDetailMachineNodeInform, 
			String array_InformDetailMachineNodeInform_name,  
			String NumberMachineNode, String NumberMachine, String TypeMachineNode, 
			String DepartmentMachineNode, String WorkshopMachineNode, String PositionMachineNode, 
			String UseFrequencyMachineNode, String TimeUseMachineNode, String TimeDestroyMachineNode) {
	
	
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		
		
		
		para.put("id_MachineNodeInform", id_MachineNodeInform);
		para.put("NumberMachineNode", NumberMachineNode);
		para.put("NumberMachine", NumberMachine);
		
		if(TypeMachineNode!=null&&!"".equals(TypeMachineNode)){
			Map temp = new HashMap();
			temp.put("name_CategoryMachineNodeInform", TypeMachineNode);
			Map categoryMachineNodeInform = machineNodeInformService.queryCategoryMachineNodeInformByName(temp);
			if(categoryMachineNodeInform!=null || "".equals(categoryMachineNodeInform)){
				para.put("TypeMachineNode", categoryMachineNodeInform.get("id_CategoryMachineNodeInform"));
			}else{
				//保存新的材料类别
				machineNodeInformService.saveCategoryMachineNodeInform(temp);
				para.put("TypeMachineNode", temp.get("id_CategoryMachineNodeInform"));
			}
		}else{
			para.put("TypeMachineNode", "0");
		}
		
		para.put("DepartmentMachineNode", DepartmentMachineNode);
		para.put("WorkshopMachineNode", WorkshopMachineNode);
		para.put("PositionMachineNode", PositionMachineNode);
		para.put("UseFrequencyMachineNode", UseFrequencyMachineNode);
		para.put("TimeUseMachineNode", TimeUseMachineNode);
		para.put("TimeDestroyMachineNode", TimeDestroyMachineNode);
		
		
		para.put("add_time", System.currentTimeMillis() / 1000);
		para.put("user_id", user_id);
		
		try {
			if(id_MachineNodeInform != 0){//修改
				machineNodeInformService.updateMachineNodeInform(para);
			}else{//新增
				
				machineNodeInformService.saveMachineNodeInform(para);
			}
			
			//清空详细信息路径
			machineNodeInformService.clearInformDetailMachineNodeInformById(para);
			//保存详细信息
			if(array_InformDetailMachineNodeInform != null && !"".equals(array_InformDetailMachineNodeInform)){
				String array_InformDetailMachineNodeInforms[] = array_InformDetailMachineNodeInform.split(",");
				String array_InformDetailMachineNodeInforms_name[] = array_InformDetailMachineNodeInform_name.split(",");
				
				for(int i=0; i<array_InformDetailMachineNodeInforms.length; i++){
					if(array_InformDetailMachineNodeInforms[i] != null && !"".equals(array_InformDetailMachineNodeInforms[i])){
						para.put("url_InformDetailMachineNodeInform", array_InformDetailMachineNodeInforms[i]);
						para.put("name_InformDetailMachineNodeInform", array_InformDetailMachineNodeInforms_name[i]);
						machineNodeInformService.saveInformDetailMachineNodeInform(para);
					}
				}
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
	 * 保存详细信息
	 */
	
	@ResponseBody
	@RequestMapping(value="/saveInformDetailMachineNodeInform", produces = "application/json; charset=utf-8")
	public String saveInformDetailMachineInform(String id_MachineNodeInform, 
			String array_InformDetailMachineNodeInform, 
			String array_InformDetailMachineNodeInform_name,  
			String InformDetailMachineNodeInform ,String fileSuffix, String filename) throws Exception{
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		String json  = "";  
		Map resultmap = new HashMap();
	
		if(InformDetailMachineNodeInform != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informDetailMachineNodeInform/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/informDetailMachineNodeInform/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(InformDetailMachineNodeInform,  filepath2);
			array_InformDetailMachineNodeInform = array_InformDetailMachineNodeInform + "/informDetailMachineNodeInform/" + big_url + "." + fileSuffix + ",";
			array_InformDetailMachineNodeInform_name = array_InformDetailMachineNodeInform_name + filename + ",";
		}
		
		//查询类别列表
		List<Map> categoryMachineNodeInform1 = machineNodeInformService.queryCategoryMachineNodeInformList();
				
		resultmap.put("result", "1");
		resultmap.put("array_InformDetailMachineNodeInform", array_InformDetailMachineNodeInform);
		resultmap.put("array_InformDetailMachineNodeInform_name", array_InformDetailMachineNodeInform_name);
		
		resultmap.put("categoryMachineNodeInform", categoryMachineNodeInform1);
		
		json = JackJson.fromObjectToJson(resultmap);
		
		return json;
	}
	
	
	/**
	 * 删除标准机床信息
	 */
	
	@ResponseBody
	@RequestMapping(value = "/deleteMachineInform", produces = "application/json; charset=utf-8")
	public String deleteTurningHolder(String id_MachineNodeInform) {
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		para.put("id_MachineNodeInform", id_MachineNodeInform);
		try {
			//清空机床节点详细信息路径
			machineNodeInformService.clearInformDetailMachineNodeInformById(para);
			//删除标准机床数据
			machineNodeInformService.deleteMachineNodeInform(para);
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
	
	
	@ResponseBody
	@RequestMapping(value = "loadingTool", produces = "application/json; charset=utf-8")
	public String loadingTool(int pageNo, int pageSize,
			String NameMachine, String NumberMachine1, String TypeMachine,
			String ControlSystemMachine,String SpindleSpeedMachine,String CompanyMachine
			 ){
			String json  = "";  
			Map resultmap = new HashMap();
			Map map	= null;
			
			try{
				Page page = new Page(pageNo, pageSize);
				PageData pd = new PageData();
				pd.put("NameMachine", NameMachine);
				pd.put("NumberMachine", NumberMachine1);
				pd.put("TypeMachine", TypeMachine);
				pd.put("ControlSystemMachine", ControlSystemMachine);
				pd.put("SpindleSpeedMachine", SpindleSpeedMachine);
				pd.put("CompanyMachine", CompanyMachine);
				
				page.setPd(pd);
				map	= standarMachineService.queryStandarMachineList(page);//查询标准机床信息页面
				page = (Page)map.get("page");
				List<Map> list = (List<Map>)map.get("list");
				
				//查询类别列表
				List<Map> categoryMachineInform = standarMachineService.queryCategoryMachineInformList();
				resultmap.put("categoryMachineInform", categoryMachineInform);
				resultmap.put("machineInformList", list);
			}catch (Exception e) {
				e.printStackTrace();
			}
			json = JackJson.fromObjectToJson(resultmap);
			return json;
			
			
	}
	
	@ResponseBody
	@RequestMapping(value="/goLoading", produces = "application/json; charset=utf-8")
	public String goLoading(String id){
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		//查询类别列表
		List<Map> categoryMachineInform1 = standarMachineService.queryCategoryMachineInformList();
		Map para = new HashMap();
		
		para.put("id_MachineInform", id);
		
		Map MachineInform = standarMachineService.queryMachineInformById(para);//查询标准机床
		
		Integer TypeMachine_id = Integer.valueOf((String) MachineInform.get("TypeMachine"));
		
		String TypeMachine_name = "";
		for(int i=0;i<categoryMachineInform1.size();i++){
			map = categoryMachineInform1.get(i);
			if((map.get("id_CategoryMachineInform")).equals(TypeMachine_id)){
				TypeMachine_name = (String) map.get("name_CategoryMachineInform");
				System.out.println(TypeMachine_name);
			}
		}
		
		String NumberMachine = (String) MachineInform.get("NumberMachine");
		
		resultmap.put("NumberMachine",NumberMachine);
		resultmap.put("TypeMachine_name",TypeMachine_name);
		resultmap.put("MachineInform", MachineInform);
		resultmap.put("categoryMachineInform", categoryMachineInform1);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
}











	
	
	
	
	
	









