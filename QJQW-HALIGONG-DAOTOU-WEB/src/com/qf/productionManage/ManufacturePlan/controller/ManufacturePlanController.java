package com.qf.productionManage.ManufacturePlan.controller;

import java.util.ArrayList;
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
import com.qf.productionManage.DepartmentManufacture.service.DepartmentManufactureService;
import com.qf.productionManage.ManufacturePlan.service.ManufacturePlanService;
import com.qf.productionManage.ProcessPart.service.ProcessPartService;
import com.qf.productionManage.StaffManuf.service.StaffManufService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/ManufacturePlan")
public class ManufacturePlanController extends BaseController{

	@Resource(name = "ManufacturePlanService")
	private ManufacturePlanService manufacturePlanService;
	
	
	//部门分厂
	@Resource(name = "DepartmentManufactureService")
	private DepartmentManufactureService departmentManufactureService;
	
	//人员
	@Resource(name = "StaffManufService")
	private StaffManufService staffManufService;
	
	//加工零件
	@Resource(name = "processPartService")
	private ProcessPartService processPartService;
	
	//机床
	@Resource(name = "machineNodeInformService")
	private machineNodeInformService machineNodeInformService;
	
	//列表
	@RequestMapping("/ManufacturePlanList")
	public ModelAndView ManufacturePlanList(Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= manufacturePlanService.queryManufacturePlanList(page);//查询零件页面
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			
			mv.addObject("ManufacturePlan", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/productionManage/ManufacturePlan/ManufacturePlan_list");
		return mv;
	}
	
	
	
	
	//去添加页面
	@RequestMapping(value="/goAddManufacturePlan")
	public ModelAndView goAddManufacturePlan(String id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
			
		Map para = new HashMap();
		para.put("id_ManufacturePlan", id);
		
		Map ManufacturePlan = manufacturePlanService.queryManufacturePlanById(para);//查询标准机床
		
		mv.setViewName("/WEB-INF/productionManage/ManufacturePlan/ManufacturePlan_edit");
		mv.addObject("turn_url", turn_url);
		mv.addObject("ManufacturePlan", ManufacturePlan);
		
		mv.addObject("pd", pd);
		return mv;
	}
		
	
	
		
	 /**
	 * 保存
	 */
		
	@ResponseBody
	@RequestMapping("/saveManufacturePlan")
	public String saveManufacturePlan(HttpServletRequest request, 
			int id_ManufacturePlan, String NoManufPlan, String QuantityManufPlan,String DateStartManufPlan, String DateFinishManufPlan,
			String RemarkManufPlan,String PartNoManufPlan, String NameManufPlan, String NumberMaterialManufPlan, String CategoryMaterialManufPlan, 
			String DeviceManufPlan, String IDDeviceManufPlan, String BranchManufPlan, String StaffManufPlan, String NoProcessManufPlan, 
			String NameProcessManufPlan,String NoProcessStepManufPlan, String NameProcessStepManufPlan, String MachiningTypeManufPlan, 
			String MachiningLevelManufPlan, String CuttingFluidManufPlan, String CutterSpeedManufPlan, String SpindleSpeedManufPlan, 
			String FeedManufPlan,String CuttingDepthManufPlan, String CuttingWidthManufPlan, String FeedSpeedManufPlan, String ToolHolderManufPlan, 
			String ToolbladeManufPlan, String ToolMaterialManufPlan, String CutterManufPlan
			) {
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
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
				//修改加工计划
				manufacturePlanService.updateManufacturePlan(para);
				
				//修改记录
				manufacturePlanService.updateMachineUseRecord(para1);
				
			}else{//新增
				//新增加工计划
				manufacturePlanService.saveManufacturePlan(para);
				
				para1.put("id_ManufacturePlan", para.get("id_ManufacturePlan"));
				//新增记录
				manufacturePlanService.saveMachineUseRecord(para1);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
	
	
	//加载各种信息
	@RequestMapping("loading")
	public ModelAndView loading(@RequestParam(value="deputy") int deputy,Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		page.setPd(pd);
		List<Map> list = new ArrayList<Map>();
		
		//1为查询加载机床节点
		if(deputy==1){
			Map map	= processPartService.queryProcessPartList(page);//查询零件页面
			page = (Page)map.get("page");
			list = (List<Map>)map.get("list");
			
			List<Map> CategoryTypeProcessPart = processPartService.queryCategoryTypeProcessPartList();
			mv.addObject("CategoryTypeProcessPart", CategoryTypeProcessPart);
			
			List<Map> CategoryIndustryProcessPart = processPartService.queryCategoryIndustryProcessPartList();
			mv.addObject("CategoryIndustryProcessPart", CategoryIndustryProcessPart);
			
			mv.addObject("ProcessPart", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
			mv.setViewName("/WEB-INF/productionManage/ManufacturePlan/ManufacturePlan_loadingPart");
		}
		if(deputy==2){
			Map map = manufacturePlanService.queryWorkingProcedureList(page);   //工序
			list = (List<Map>)map.get("list");
			page = (Page)map.get("page");
			mv.addObject("WorkingProcedure", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
			mv.setViewName("/WEB-INF/productionManage/ManufacturePlan/ManufacturePlan_loadingWorkingProcedure");
		}
		if(deputy==3){
			Map map	= manufacturePlanService.queryProcessStepList(page);//查询工步
			list = (List<Map>)map.get("list");
			page = (Page)map.get("page");
			mv.addObject("ProcessStep", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
			
			mv.setViewName("/WEB-INF/productionManage/ManufacturePlan/ManufacturePlan_loadingProcessStep");
		}
		if(deputy==4){
			Map map	= staffManufService.queryStaffManufList(page);//查询零件页面
			page = (Page)map.get("page");
			list = (List<Map>)map.get("list");
			
			List<Map> CategoryTitlesStaffManuf = staffManufService.queryCategoryTitlesStaffManufList();
			mv.addObject("CategoryTitlesStaffManuf", CategoryTitlesStaffManuf);
			
			mv.addObject("StaffManuf", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
			
			mv.setViewName("/WEB-INF/productionManage/ManufacturePlan/ManufacturePlan_loadingStaffManuf");
		}
		if(deputy==5){
			Map map	= departmentManufactureService.queryDepartmentManufactureList(page);//查询零件页面
			page = (Page)map.get("page");
			list = (List<Map>)map.get("list");
			
			mv.addObject("DepartmentManufacture", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
			
			mv.setViewName("/WEB-INF/productionManage/ManufacturePlan/ManufacturePlan_loadingDepartmentfacture");
		}
		if(deputy==6){
			Map map	= machineNodeInformService.queryMachineNodeInformList(page);//查询机床节点信息页面
			page = (Page)map.get("page");
			list = (List<Map>)map.get("list");
			
			List<Map> categoryMachineNodeInform = machineNodeInformService.queryCategoryMachineNodeInformList();
			mv.addObject("categoryMachineNodeInform", categoryMachineNodeInform);
			
			mv.addObject("machineNodeInformList", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
			
			mv.setViewName("/WEB-INF/productionManage/ManufacturePlan/ManufacturePlan_loadingMachineNodeInform");
		}
		
		return mv;
	}
	
	
	
	
	//删除
	@ResponseBody
	@RequestMapping("deleteManufacturePlanList")
	public String deleteManufacturePlanList(String id_ManufacturePlan){
		Map para = new HashMap();
		para.put("id_ManufacturePlan", id_ManufacturePlan);
		try {
			
			manufacturePlanService.deleteManufacturePlanList(para);
			
			manufacturePlanService.deleteMachineUseRecord(para);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}	
		return "1";
	}
		
	
	
	
	
	
	
}
