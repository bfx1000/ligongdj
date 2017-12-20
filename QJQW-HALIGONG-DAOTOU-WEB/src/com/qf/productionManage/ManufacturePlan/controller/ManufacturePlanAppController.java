package com.qf.productionManage.ManufacturePlan.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.qf.productionManage.DepartmentManufacture.service.DepartmentManufactureService;
import com.qf.productionManage.ManufacturePlan.service.ManufacturePlanService;
import com.qf.productionManage.ProcessPart.service.ProcessPartService;
import com.qf.productionManage.StaffManuf.service.StaffManufService;
import com.qf.util.PageData;
import com.qf.util.common.JackJson;
import com.qf.util.file.ByteToFile;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/ManufacturePlanApp")
public class ManufacturePlanAppController {

	@Resource(name = "ManufacturePlanService")
	private ManufacturePlanService manufacturePlanService;
	
	//加工零件
	@Resource(name = "processPartService")
	private ProcessPartService processPartService;
	
	//部门分厂
	@Resource(name = "DepartmentManufactureService")
	private DepartmentManufactureService departmentManufactureService;
	
	//人员
	@Resource(name = "StaffManufService")
	private StaffManufService staffManufService;
	
	
	//列表
	@ResponseBody
	@RequestMapping(value = "/ManufacturePlanList",produces = "application/json; charset=utf-8")
	public String ManufacturePlanList(int pageNo, int pageSize,
			 String NoManufPlan, String DateStartManufPlan, String DateFinishManufPlan,
			 String PartNoManufPlan,String DeviceManufPlan){
		ModelAndView mv=new ModelAndView();
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		try{
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("NoManufPlan", NoManufPlan);
			pd.put("DateStartManufPlan", DateStartManufPlan);
			pd.put("DateFinishManufPlan", DateFinishManufPlan);
			pd.put("PartNoManufPlan", PartNoManufPlan);
			pd.put("DeviceManufPlan", DeviceManufPlan);
			
			page.setPd(pd);
			map	= manufacturePlanService.queryManufacturePlanList(page);//查询零件页面
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
		para.put("NoManufPlan", NoManufPlan);
		para.put("DateStartManufPlan", DateStartManufPlan);
		para.put("DateFinishManufPlan", DateFinishManufPlan);
		para.put("PartNoManufPlan", PartNoManufPlan);
		para.put("DeviceManufPlan", DeviceManufPlan);
		resultmap.put("para",para);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	/** 
	 * 去添加
	 */
	@ResponseBody
	@RequestMapping(value="/goAddManufacturePlan" ,produces = "application/json; charset=utf-8")
	public String goAddManufacturePlan(String id)throws Exception{
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		Map para = new HashMap();
		para.put("id_ManufacturePlan", id);
		
		Map ManufacturePlan = manufacturePlanService.queryManufacturePlanById(para);//查询标准机床
		if(ManufacturePlan!=null){
			resultmap.put("result", "1");
			resultmap.put("ManufacturePlan", ManufacturePlan);
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
	@RequestMapping(value = "/saveManufacturePlan", produces = "application/json; charset=utf-8")
	public String saveManufacturePlan(
			int id_ManufacturePlan, String NoManufPlan, String QuantityManufPlan,String DateStartManufPlan, String DateFinishManufPlan,
			String RemarkManufPlan,String PartNoManufPlan, String NameManufPlan, String NumberMaterialManufPlan, String CategoryMaterialManufPlan, 
			String DeviceManufPlan, String IDDeviceManufPlan, String BranchManufPlan, String StaffManufPlan, String NoProcessManufPlan, 
			String NameProcessManufPlan,String NoProcessStepManufPlan, String NameProcessStepManufPlan, String MachiningTypeManufPlan, 
			String MachiningLevelManufPlan, String CuttingFluidManufPlan, String CutterSpeedManufPlan, String SpindleSpeedManufPlan, 
			String FeedManufPlan,String CuttingDepthManufPlan, String CuttingWidthManufPlan, String FeedSpeedManufPlan, String ToolHolderManufPlan, 
			String ToolbladeManufPlan, String ToolMaterialManufPlan, String CutterManufPlan
			) {
	
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		para.put("id_ManufacturePlan", id_ManufacturePlan);
		para.put("NoManufPlan", NoManufPlan);
		para.put("QuantityManufPlan", QuantityManufPlan);
		para.put("DateStartManufPlan", DateStartManufPlan);
		para.put("DateFinishManufPlan", DateFinishManufPlan);
		para.put("RemarkManufPlan", RemarkManufPlan);
		para.put("PartNoManufPlan", PartNoManufPlan);
		para.put("NameManufPlan", NameManufPlan);
		para.put("NumberMaterialManufPlan", NumberMaterialManufPlan);
		para.put("CategoryMaterialManufPlan", CategoryMaterialManufPlan);
		para.put("DeviceManufPlan", DeviceManufPlan);
		para.put("IDDeviceManufPlan", IDDeviceManufPlan);
		para.put("BranchManufPlan", BranchManufPlan);
		para.put("StaffManufPlan", StaffManufPlan);
		para.put("NoProcessManufPlan", NoProcessManufPlan);
		para.put("NameProcessManufPlan", NameProcessManufPlan);
		para.put("NoProcessStepManufPlan", NoProcessStepManufPlan);
		para.put("NameProcessStepManufPlan", NameProcessStepManufPlan);
		para.put("MachiningTypeManufPlan", MachiningTypeManufPlan);
		para.put("MachiningLevelManufPlan", MachiningLevelManufPlan);
		para.put("CuttingFluidManufPlan", CuttingFluidManufPlan);
		para.put("CutterSpeedManufPlan", CutterSpeedManufPlan);
		para.put("SpindleSpeedManufPlan", SpindleSpeedManufPlan);
		para.put("FeedManufPlan", FeedManufPlan);
		para.put("CuttingDepthManufPlan", CuttingDepthManufPlan);
		para.put("CuttingWidthManufPlan", CuttingWidthManufPlan);
		para.put("FeedSpeedManufPlan", FeedSpeedManufPlan);
		para.put("ToolHolderManufPlan", ToolHolderManufPlan);
		para.put("ToolbladeManufPlan", ToolbladeManufPlan);
		para.put("ToolMaterialManufPlan", ToolMaterialManufPlan);
		para.put("CutterManufPlan", CutterManufPlan);
		
		Map para1 = new HashMap();
		para1.put("id_MachineUseRecord", 0);
		para1.put("id_ManufacturePlan", id_ManufacturePlan);
		para1.put("NumberMachGrNode", IDDeviceManufPlan);
		para1.put("DateStartManufGr", DateStartManufPlan);
		para1.put("DateFinishManufGr", DateFinishManufPlan);
		
		try {
			if(id_ManufacturePlan != 0){//修改
				manufacturePlanService.updateManufacturePlan(para);
				
				//修改记录
				manufacturePlanService.updateMachineUseRecord(para1);
				
			}else{//新增
				manufacturePlanService.saveManufacturePlan(para);
				
				para1.put("id_ManufacturePlan", para.get("id_ManufacturePlan"));
				//新增记录
				manufacturePlanService.saveMachineUseRecord(para1);
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
	@RequestMapping(value = "/deleteManufacturePlanList", produces = "application/json; charset=utf-8")
	public String deleteManufacturePlanList(String id_ManufacturePlan) {
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		para.put("id_ManufacturePlan", id_ManufacturePlan);
		try {
			
			manufacturePlanService.deleteManufacturePlanList(para);
			
			manufacturePlanService.deleteMachineUseRecord(para);
			
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
	public String jzAll(@RequestParam(value="deputy") int deputy, int pageNo, int pageSize, String NameProcessPart, String NumberProcessPart, 
			String TypeProcessPart, String AssemblyProcessPart, String NoAssemblyProcessPart, String NoProcedureProcessFlow, String NameProcedureProcessFlow,
			 String ContentProcedureProcessFlow, String EquipmentType, String NoProcessStep, String MachiningTypeProcessStep, String MachiningLevelProcessStep,
			 String NameProcessStep,String ContentProcessStep, String SuperiorDepartmentManuf, String NameDepartmentManuf, String NoDepartmentManuf,String AddressDepartmentManuf,
			 String NameStaffManuf, String DepartStaffManuf, String NoStaffManuf,String JobStaffManuf ){
		
		String json  = "";  
		Map resultmap = new HashMap();
		Page page = new Page(pageNo, pageSize);
		PageData pd = new PageData();
		
		List<Map> list = new ArrayList<Map>();
		if(deputy==1){
			pd.put("NameProcessPart", NameProcessPart);
			pd.put("NumberProcessPart", NumberProcessPart);
			pd.put("TypeProcessPart", TypeProcessPart);
			pd.put("AssemblyProcessPart", AssemblyProcessPart);
			pd.put("NoAssemblyProcessPart", NoAssemblyProcessPart);
			page.setPd(pd);
			Map map	= processPartService.queryProcessPartList(page);//查询零件页面
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
			List<Map> CategoryTypeProcessPart = processPartService.queryCategoryTypeProcessPartList();
			resultmap.put("CategoryTypeProcessPart", CategoryTypeProcessPart);
			
			List<Map> CategoryIndustryProcessPart = processPartService.queryCategoryIndustryProcessPartList();
			resultmap.put("CategoryIndustryProcessPart", CategoryIndustryProcessPart);
			
			Map para = new HashMap();
			para.put("NameProcessPart", NameProcessPart);
			para.put("NumberProcessPart", NumberProcessPart);
			para.put("TypeProcessPart", TypeProcessPart);
			para.put("AssemblyProcessPart", AssemblyProcessPart);
			para.put("NoAssemblyProcessPart", NoAssemblyProcessPart);
			resultmap.put("para",para);
			
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		if(deputy==2){
			pd.put("NoProcedureProcessFlow", NoProcedureProcessFlow);
			pd.put("NameProcedureProcessFlow", NameProcedureProcessFlow);
			pd.put("ContentProcedureProcessFlow", ContentProcedureProcessFlow);
			pd.put("EquipmentType", EquipmentType);
			page.setPd(pd);
			Map map = manufacturePlanService.queryWorkingProcedureList(page);   //工序
			list = (List<Map>)map.get("list");
			page = (Page)map.get("page");
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
			para.put("NoProcedureProcessFlow", NoProcedureProcessFlow);
			para.put("NameProcedureProcessFlow", NameProcedureProcessFlow);
			para.put("ContentProcedureProcessFlow", ContentProcedureProcessFlow);
			para.put("EquipmentType", EquipmentType);
			resultmap.put("para",para);
			
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		if(deputy==3){
			pd.put("NoProcessStep", NoProcessStep);
			pd.put("MachiningTypeProcessStep", MachiningTypeProcessStep);
			pd.put("MachiningLevelProcessStep", MachiningLevelProcessStep);
			pd.put("NameProcessStep", NameProcessStep);
			pd.put("ContentProcessStep", ContentProcessStep);
			page.setPd(pd);
			Map map	= manufacturePlanService.queryProcessStepList(page);//查询工步
			list = (List<Map>)map.get("list");
			page = (Page)map.get("page");
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
			para.put("NoProcessStep", NoProcessStep);
			para.put("MachiningTypeProcessStep", MachiningTypeProcessStep);
			para.put("MachiningLevelProcessStep", MachiningLevelProcessStep);
			para.put("NameProcessStep", NameProcessStep);
			para.put("ContentProcessStep", ContentProcessStep);
			resultmap.put("para",para);
			
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		if(deputy==4){
			pd.put("SuperiorDepartmentManuf", SuperiorDepartmentManuf);
			pd.put("NameDepartmentManuf", NameDepartmentManuf);
			pd.put("NoDepartmentManuf", NoDepartmentManuf);
			pd.put("AddressDepartmentManuf", AddressDepartmentManuf);
			
			page.setPd(pd);
			Map map	= departmentManufactureService.queryDepartmentManufactureList(page);//查询零件页面
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
			para.put("SuperiorDepartmentManuf", SuperiorDepartmentManuf);
			para.put("NameDepartmentManuf", NameDepartmentManuf);
			para.put("NoDepartmentManuf", NoDepartmentManuf);
			para.put("AddressDepartmentManuf", AddressDepartmentManuf);
			resultmap.put("para",para);
			
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		if(deputy==5){
			pd.put("NameStaffManuf", NameStaffManuf);
			pd.put("DepartStaffManuf", DepartStaffManuf);
			pd.put("NoStaffManuf", NoStaffManuf);
			pd.put("JobStaffManuf", JobStaffManuf);
			
			page.setPd(pd);
			Map map	= staffManufService.queryStaffManufList(page);//查询
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
			
			List<Map> CategoryTitlesStaffManuf = staffManufService.queryCategoryTitlesStaffManufList();
			resultmap.put("CategoryTitlesStaffManuf", CategoryTitlesStaffManuf);
			
			resultmap.put("result", "1");
			resultmap.put("list", list);
			Map para = new HashMap();
			para.put("NameStaffManuf", NameStaffManuf);
			para.put("DepartStaffManuf", DepartStaffManuf);
			para.put("NoStaffManuf", NoStaffManuf);
			para.put("JobStaffManuf", JobStaffManuf);
			resultmap.put("para",para);
			
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		
		return null;
	}
	
	
	
	
}
