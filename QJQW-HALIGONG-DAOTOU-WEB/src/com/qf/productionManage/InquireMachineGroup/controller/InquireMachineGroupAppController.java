package com.qf.productionManage.InquireMachineGroup.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qf.machineTool.machineNodeInform.sercice.machineNodeInformService;
import com.qf.productionManage.InquireMachineGroup.service.InquireMachineGroupService;
import com.qf.productionManage.MachineGroup.service.MachineGroupService;
import com.qf.productionManage.ManufacturePlan.service.ManufacturePlanService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.common.JackJson;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/InquireMachineGroupApp")
public class InquireMachineGroupAppController {

	
	@Resource(name = "ManufacturePlanService")
	private ManufacturePlanService manufacturePlanService;
	
	@Resource(name = "InquireMachineGroupService")
	private InquireMachineGroupService inquireMachineGroupService;
	
	@Resource(name = "machineNodeInformService")
	private machineNodeInformService machineNodeInformService;
	
	@Resource(name = "MachineGroupService")
	private MachineGroupService machineGroupService;
	
	//列表
	@ResponseBody
	@RequestMapping(value = "/InquireMachineGroupList",produces = "application/json; charset=utf-8")
	public String InquireMachineGroupList(int pageNo, int pageSize,
			 String NumberMachGrNode, String ModelMachGrNode, String TypeMachGrNode,
			 String DepartmentMachGrNode){
		ModelAndView mv=new ModelAndView();
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		try{
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("NumberMachGrNode", NumberMachGrNode);
			pd.put("ModelMachGrNode", ModelMachGrNode);
			pd.put("TypeMachGrNode", TypeMachGrNode);
			pd.put("DepartmentMachGrNode", DepartmentMachGrNode);
			
			page.setPd(pd);
			map	= inquireMachineGroupService.queryInquireMachineGroupList(page);//查询
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
		para.put("ModelMachGrNode", ModelMachGrNode);
		para.put("TypeMachGrNode", TypeMachGrNode);
		para.put("DepartmentMachGrNode", DepartmentMachGrNode);
		resultmap.put("para",para);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	/** 
	 * 去添加
	 */
	@ResponseBody
	@RequestMapping(value="/goAddInquireMachineGroup" ,produces = "application/json; charset=utf-8")
	public String goAddInquireMachineGroup(String id)throws Exception{
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		Map para = new HashMap();
		para.put("id_InquireMachineGroup", id);
		Map InquireMachineGroup = inquireMachineGroupService.queryInquireMachineGroupById(para);//查询标准机床
		if(InquireMachineGroup!=null){
			resultmap.put("result", "1");
			resultmap.put("InquireMachineGroup", InquireMachineGroup);
		}
		else{
			resultmap.put("result", "0");
		}
		
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	/**
	 * 添加/修改
	 */
	
	@ResponseBody
	@RequestMapping(value = "/saveInquireMachineGroup", produces = "application/json; charset=utf-8")
	public String saveInquireMachineGroup(
			int id_InquireMachineGroup, String NumberMachGrNode, String ModelMachGrNode, String TypeMachGrNode,  
			String DepartmentMachGrNode,String WorkshopMachGrNode, String PositionMachGrNode, String NameMachineGroup, String PartNoMachGr,
			String PartNameMachGr,String SetMachGrStatus,String InquireMachGrStatus,String displayMachGrStatus,int id_ManufacturePlan
			) {
	
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		para.put("id_InquireMachineGroup", id_InquireMachineGroup);
		para.put("NumberMachGrNode", NumberMachGrNode);
		para.put("ModelMachGrNode", ModelMachGrNode);
		para.put("TypeMachGrNode", TypeMachGrNode);
		para.put("DepartmentMachGrNode", DepartmentMachGrNode);
		para.put("WorkshopMachGrNode", WorkshopMachGrNode);
		para.put("PositionMachGrNode", PositionMachGrNode);
		para.put("NameMachineGroup", NameMachineGroup);
		para.put("PartNoMachGr", PartNoMachGr);
		para.put("PartNameMachGr", PartNameMachGr);
		para.put("SetMachGrStatus", SetMachGrStatus);
		para.put("InquireMachGrStatus", InquireMachGrStatus);
		para.put("displayMachGrStatus", displayMachGrStatus);
		para.put("id_ManufacturePlan", id_ManufacturePlan);
		
		try {
			if(id_InquireMachineGroup != 0){//修改
				inquireMachineGroupService.updateInquireMachineGroup(para);
			}else{//新增
				inquireMachineGroupService.saveInquireMachineGroup(para);
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
	@RequestMapping(value = "/deleteInquireMachineGroupList", produces = "application/json; charset=utf-8")
	public String deleteInquireMachineGroupList(String id_InquireMachineGroup) {
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		para.put("id_InquireMachineGroup", id_InquireMachineGroup);
		try {
			
			inquireMachineGroupService.deleteInquireMachineGroupList(para);
			
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
	
	
	
	//加载各种
	@ResponseBody
	@RequestMapping(value= "loading", produces = "application/json; charset=utf-8")
	public String jzAll(@RequestParam(value="deputy") int deputy, int pageNo, int pageSize, 
			String NumberMachineNode, String NumberMachine, String TypeMachineNode, String DepartmentMachineNode,String WorkshopMachineNode,
			String SuperiorMachineGroup, String NameMachineGroup, String NoMachineGroup,String AddressMachineGroup, String IDDeviceManufPlan,
			String NoManufPlan, String DateStartManufPlan, String DateFinishManufPlan,String PartNoManufPlan,String DeviceManufPlan
			){
		
		String json  = "";  
		Map resultmap = new HashMap();
		Page page = new Page(pageNo, pageSize);
		PageData pd = new PageData();
		
		List<Map> list = new ArrayList<Map>();
		if(deputy==1){
			pd.put("NumberMachineNode", NumberMachineNode);
			pd.put("NumberMachine", NumberMachine);
			pd.put("TypeMachineNode", TypeMachineNode);
			pd.put("DepartmentMachineNode", DepartmentMachineNode);
			pd.put("WorkshopMachineNode", WorkshopMachineNode);
			page.setPd(pd);
			Map map	= machineNodeInformService.queryMachineNodeInformList(page);//查询机床节点信息页面
			page = (Page)map.get("page");
			list = (List<Map>)map.get("list");
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
			//查询类别列表
			List<Map> categoryMachineNodeInform = machineNodeInformService.queryCategoryMachineNodeInformList();
			
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
		if(deputy==2){
			pd.put("SuperiorMachineGroup", SuperiorMachineGroup);
			pd.put("NameMachineGroup", NameMachineGroup);
			pd.put("NoMachineGroup", NoMachineGroup);
			pd.put("AddressMachineGroup", AddressMachineGroup);
			page.setPd(pd);
			Map map	= machineGroupService.queryMachineGroupList(page);//查询零件页面
			page = (Page)map.get("page");
			list = (List<Map>)map.get("list");
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
			
			Map para = new HashMap();
			para.put("SuperiorMachineGroup", SuperiorMachineGroup);
			para.put("NameMachineGroup", NameMachineGroup);
			para.put("NoMachineGroup", NoMachineGroup);
			para.put("AddressMachineGroup", AddressMachineGroup);
			resultmap.put("para",para);
			
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		if(deputy==3){
			if(IDDeviceManufPlan==null||"".equals(IDDeviceManufPlan)){
				resultmap.put("result","0");
				json = JackJson.fromObjectToJson(resultmap);
				return json;
			}
			pd.put("NoManufPlan", NoManufPlan);
			pd.put("DateStartManufPlan", DateStartManufPlan);
			pd.put("DateFinishManufPlan", DateFinishManufPlan);
			pd.put("PartNoManufPlan", PartNoManufPlan);
			pd.put("DeviceManufPlan", DeviceManufPlan);
			pd.put("IDDeviceManufPlan", IDDeviceManufPlan);
			page.setPd(pd);
			Map map	= inquireMachineGroupService.queryManufacturePlanListByNum(page);//查询零件页面
			page = (Page)map.get("page");
			list = (List<Map>)map.get("list");
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
			
			Map para = new HashMap();
			para.put("NoManufPlan", NoManufPlan);
			para.put("DateStartManufPlan", DateStartManufPlan);
			para.put("DateFinishManufPlan", DateFinishManufPlan);
			para.put("PartNoManufPlan", PartNoManufPlan);
			para.put("DeviceManufPlan", DeviceManufPlan);
			para.put("IDDeviceManufPlan", IDDeviceManufPlan);
			resultmap.put("para",para);
			
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		
		return null;
	}
	
	//查看是否为使用状态
	@ResponseBody
	@RequestMapping(value = "judgingState", produces = "application/json; charset=utf-8")
	public String judgingState(String startDate,String endDate){
	   
		String json  = "";  
		Map resultmap = new HashMap();
		
		Date Sdate = null;
	    Date Edate = null;
	    
	    Date NowDate = new Date();
	    long NowDate_Num = NowDate.getTime();//获取当前时间
	    
	    SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //时间格式     eg: 2017-04-14 10:19:33
	    
	    if(startDate!=null&&endDate!=null&&!"".equals(startDate)&&!"".equals(endDate)){   
		    try {
				Sdate = simpleDateFormat .parse(startDate); //将字符串转换成时间类型
				Edate = simpleDateFormat .parse(endDate);
				long Sdate_Num =  Sdate.getTime();	//转换成时间戳
				long Edate_Num =  Edate.getTime();
				
				if(NowDate_Num>Sdate_Num && NowDate_Num<Edate_Num){
					System.out.println("当前时间正在使用");
					resultmap.put("result", "1");
					resultmap.put("msg", "当前时间正在使用");
					json = JackJson.fromObjectToJson(resultmap);
					return json;
				}
				else{
					System.out.println("当前时间未使用");
					resultmap.put("result", "0");
					resultmap.put("msg", "当前时间未使用");
					json = JackJson.fromObjectToJson(resultmap);
					return json;
				}
			} catch (ParseException e) {//格式错误异常
				e.printStackTrace();
				System.out.println("时间格式错误，导致转换失败！");
			}
	    }
		
	    resultmap.put("result", "-1");
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
		
	//查看状态页面
	@ResponseBody
	@RequestMapping(value = "/MachineStatus",produces = "application/json; charset=utf-8")
	public String MachineStatus(int pageNo, int pageSize,String NameMachineGroup,
			 String NumberMachGrNode, String ModelMachGrNode, String TypeMachGrNode,
			 String DepartmentMachGrNode){
		ModelAndView mv=new ModelAndView();
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		try{
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("NameMachineGroup", NameMachineGroup);
			pd.put("NumberMachGrNode", NumberMachGrNode);
			pd.put("ModelMachGrNode", ModelMachGrNode);
			pd.put("TypeMachGrNode", TypeMachGrNode);
			pd.put("DepartmentMachGrNode", DepartmentMachGrNode);
			
			if(NameMachineGroup!=null && !"".equals(NameMachineGroup)){
				List<Map> SuperiorMachineGroup = new ArrayList<>();
				SuperiorMachineGroup = querySuperiorMachineGroupList(NameMachineGroup,SuperiorMachineGroup);
				System.out.println("工作组有值");
				List<String> name = new ArrayList<>();
				if(SuperiorMachineGroup!=null && !SuperiorMachineGroup.isEmpty()){
					System.out.println(SuperiorMachineGroup);
					for(int i = 0;i<SuperiorMachineGroup.size();i++){
						name.add(""+SuperiorMachineGroup.get(i).get("NameMachineGroup"));
					}
				}
				System.out.println(name.toString());
				pd.put("name", name);
			}
			
			page.setPd(pd);
			map	= inquireMachineGroupService.queryInquireMachineGroupList(page);//查询
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
		para.put("NameMachineGroup", NameMachineGroup);
		para.put("NumberMachGrNode", NumberMachGrNode);
		para.put("ModelMachGrNode", ModelMachGrNode);
		para.put("TypeMachGrNode", TypeMachGrNode);
		para.put("DepartmentMachGrNode", DepartmentMachGrNode);
		resultmap.put("para",para);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}

	//加载组所需方法
	private List<Map> querySuperiorMachineGroupList(String NameMachineGroup,List<Map> SuperiorMachineGroup){
		List<Map> SuperiorMachineGroupList = inquireMachineGroupService.querySuperiorMachineGroupList(NameMachineGroup);
		if(SuperiorMachineGroupList!=null && !"".equals(SuperiorMachineGroupList)){
			SuperiorMachineGroup.addAll(SuperiorMachineGroupList);
			for(int i = 0;i<SuperiorMachineGroupList.size();i++){
				if(Integer.valueOf(""+SuperiorMachineGroupList.get(i).get("LevelMachineGroup"))<4){
					querySuperiorMachineGroupList(""+SuperiorMachineGroupList.get(i).get("NameMachineGroup"),SuperiorMachineGroup);
				}
				
			}
		}
		return SuperiorMachineGroup;
	}
	
	
	//刷新状态方法
	@ResponseBody
	@RequestMapping(value = "renovateState",produces = "application/json; charset=utf-8")
	public String renovateState(){
		
		String json  = "";  
		Map resultmap = new HashMap();
		
		List<Map> InquireMachineGroupAll = inquireMachineGroupService.queryInquireMachineGroupAllList();
		
		try{
			if(InquireMachineGroupAll!=null && !InquireMachineGroupAll.isEmpty()){
				for(int i=0;i<InquireMachineGroupAll.size();i++){
					int SetMachGrStatus = Integer.valueOf((String) InquireMachineGroupAll.get(i).get("SetMachGrStatus"));
					if(SetMachGrStatus!=1){
						continue;
					}else{
						int id_ManufacturePlan = Integer.valueOf(""+InquireMachineGroupAll.get(i).get("id_ManufacturePlan"));
						Map para = new HashMap<>();
						para.put("id_ManufacturePlan", id_ManufacturePlan);
						Map ManufacturePlan = manufacturePlanService.queryManufacturePlanById(para);
						String startDate = ""+ManufacturePlan.get("DateStartManufPlan");
						String endDate = ""+ManufacturePlan.get("DateFinishManufPlan");
						
						Date Sdate = null;
					    Date Edate = null;
						
						Date NowDate = new Date();
					    long NowDate_Num = NowDate.getTime();//获取当前时间
					    
					    SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //时间格式     eg: 2017-04-14 10:19:33
					    
					    if(startDate!=null&&endDate!=null&&!"".equals(startDate)&&!"".equals(endDate)){   
						    try {
								Sdate = simpleDateFormat .parse(startDate); //将字符串转换成时间类型
								Edate = simpleDateFormat .parse(endDate);
								long Sdate_Num =  Sdate.getTime();	//转换成时间戳
								long Edate_Num =  Edate.getTime();
								
								if(NowDate_Num>Sdate_Num && NowDate_Num<Edate_Num){
									InquireMachineGroupAll.get(i).put("InquireMachGrStatus", "2");
									InquireMachineGroupAll.get(i).put("displayMachGrStatus", "2");
									inquireMachineGroupService.updataStatus(InquireMachineGroupAll.get(i));
								}
								else{
									InquireMachineGroupAll.get(i).put("InquireMachGrStatus", "3");
									InquireMachineGroupAll.get(i).put("displayMachGrStatus", "3");
									inquireMachineGroupService.updataStatus(InquireMachineGroupAll.get(i));
								}
							} catch (ParseException e) {//格式错误异常
								e.printStackTrace();
								System.out.println("时间格式错误，导致转换失败！");
							}
					    }
					    
					    
					}
				}
			}
			resultmap.put("result", "1");
			resultmap.put("msg", "刷新成功");
			json = JackJson.fromObjectToJson(resultmap);
			return json;
			
		}catch (Exception e) {
			e.printStackTrace();
			resultmap.put("result", "0");
			resultmap.put("msg", "刷新失败");
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
	}
	
	
	
	
	
	
	
}
