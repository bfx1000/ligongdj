package com.qf.experimentControl.experimentManage.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.mysql.fabric.xmlrpc.base.Array;
import com.qf.CuttingFluid.CuttingFluidMaterial.service.CuttingFluidMaterialService;
import com.qf.experimentControl.experimentItem.service.experimentItemService;
import com.qf.experimentControl.experimentManage.service.experimentManageService;
import com.qf.experimentControl.experimentParameterResult.service.ExperimentParameterResultService;
import com.qf.machineTool.machineNodeInform.sercice.machineNodeInformService;
import com.qf.material.material.service.MaterialService;
import com.qf.tool.toolBTAdrill.service.ToolBTAdrillService;
import com.qf.tool.turningBlade.service.TurningBladeService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.common.JackJson;
import com.qf.util.controller.BaseController;
import com.qf.util.file.ByteToFile;
import com.qf.util.page.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("experimentManageApp")
public class experimentManageAppController extends BaseController{

	//试验
	@Resource(name="experimentManageService")
	private experimentManageService experimentManageService;
	
	//机床节点
	@Resource(name = "machineNodeInformService")
	private machineNodeInformService machineNodeInformService;
	
	//试验件
	@Resource(name="experimentItemService")
	private experimentItemService experimentItemService;
	
	//工件材料
	@Resource(name="materialService")
    private MaterialService materialService;  
	
	//刀具-->刀片
	@Resource(name="turningBladeService")
	private TurningBladeService turningBladeService;
	
	//刀具-->深孔钻
	@Resource(name="toolBTAdrillService")
    private ToolBTAdrillService toolBTAdrillService; 
	
	//切削液
	@Resource(name = "CuttingFluidMaterialService")
	private CuttingFluidMaterialService cuttingFluidMaterialService;
	
	//实验参数结果
	@Resource(name="experimentParameterResultService")
	private ExperimentParameterResultService experimentParameterResultService;
	
	
	@ResponseBody
    @RequestMapping(value = "/selectResult", produces = "application/json; charset=utf-8")
	public String queryMaterialList(int pageNo, int pageSize, 
			String ExperimentNo, String ExperimentType,String ExperimentMachine, 
			String ExperimentPart, String NumberMaterialExperimentPart,String CategoryMaterialExperimentPart, 
			String ExperimentTool, String ExperimentToolMaterial,String ExperimentCuttingFluid, String ExperimentMachiningType
			){
		
    	String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		try {
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("ExperimentNo", ExperimentNo);
			pd.put("ExperimentType", ExperimentType);
			pd.put("ExperimentMachine", ExperimentMachine);
			pd.put("ExperimentPart", ExperimentPart);
			pd.put("NumberMaterialExperimentPart", NumberMaterialExperimentPart);
			pd.put("CategoryMaterialExperimentPart", CategoryMaterialExperimentPart);
			pd.put("ExperimentTool", ExperimentTool);
			pd.put("ExperimentToolMaterial", ExperimentToolMaterial);
			pd.put("ExperimentCuttingFluid", ExperimentCuttingFluid);
			pd.put("ExperimentMachiningType", ExperimentMachiningType);
			
			page.setPd(pd);
			map	= experimentParameterResultService.queryResultList(page);//查询试验基本信息页面
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			
			if(list != null && list.size() > 0){
				for(int i = 0; i < list.size(); i++){
					Map ExperimentManage = list.get(i);
					int id_ExperimentManage = (int) ExperimentManage.get("id_ExperimentManage");
					
					Map para = new HashMap();
					para.put("id_ExperimentManage", id_ExperimentManage);
					
					//查询试验报告
					List<Map> ExperimentReportList = experimentParameterResultService.queryExperimentReportList(para);
					ExperimentManage.put("ExperimentReportList", ExperimentReportList);
					
					list.set(i, ExperimentManage);
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
			
			//查询材料类别列表
			List<Map> CategoryExperimentType = experimentManageService.CategoryExperimentType(); //用于和类型值对应。
			
			resultmap.put("result", "1");
			resultmap.put("list", list);
			resultmap.put("CategoryExperimentType", CategoryExperimentType);
		} catch (Exception e) {
			e.printStackTrace();
			resultmap.put("result", "0");
		}
		Map para = new HashMap();
		para.put("ExperimentNo", ExperimentNo);
		para.put("ExperimentType", ExperimentType);
		para.put("ExperimentMachine", ExperimentMachine);
		para.put("ExperimentPart", ExperimentPart);
		para.put("NumberMaterialExperimentPart", NumberMaterialExperimentPart);
		para.put("CategoryMaterialExperimentPart", CategoryMaterialExperimentPart);
		para.put("ExperimentTool", ExperimentTool);
		para.put("ExperimentToolMaterial", ExperimentToolMaterial);
		para.put("ExperimentCuttingFluid", ExperimentCuttingFluid);
		para.put("ExperimentMachiningType", ExperimentMachiningType);
		resultmap.put("para", para);
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}

	
	
	//进入添加试验页
	@ResponseBody
    @RequestMapping(value="/goAddCuttingFluidMaterial", produces = "application/json; charset=utf-8")
	public String goAddMaterial(String id)throws Exception{
    	String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
			
		Map para1 = new HashMap();
		para1.put("id_ExperimentManage", id);
		Map ExperimentManage	= experimentManageService.queryExperimentManageById(para1);//查询试验基本信息页面
		if(ExperimentManage != null && ExperimentManage.size() > 0){
			int id_ExperimentManage = (int) ExperimentManage.get("id_ExperimentManage");
			
			Map para = new HashMap();
			para.put("id_ExperimentManage", id_ExperimentManage);
			
			//查询试验报告
			List<Map> ExperimentReportList = experimentParameterResultService.queryExperimentReportList(para);
			
			String array_ExperimentReport = "";
			String array_ExperimentReport_name = "";
			if(ExperimentReportList != null && ExperimentReportList.size() > 0){
				for(int i = 0; i < ExperimentReportList.size(); i++){
					array_ExperimentReport = array_ExperimentReport + ExperimentReportList.get(i).get("url_ExperimentReport") + ",";
					array_ExperimentReport_name = array_ExperimentReport_name + ExperimentReportList.get(i).get("name_ExperimentReport") + ",";
				}
			}
			
			ExperimentManage.put("ExperimentReportList", ExperimentReportList);
			
			
			resultmap.put("result", "1");
			resultmap.put("array_ExperimentReport", array_ExperimentReport);
			resultmap.put("array_ExperimentReport_name", array_ExperimentReport_name);
		}
		List<Map> CategoryExperimentType = experimentManageService.CategoryExperimentType();
		resultmap.put("CategoryExperimentType",CategoryExperimentType);
		
		resultmap.put("ExperimentManage", ExperimentManage);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}

    
	
	
	
	//检测试验编号是否重复
	@ResponseBody
	@RequestMapping("jc")
	public String jc(@RequestParam(value="ExperimentNo_userForm") String ExperimentNo_userForm){
		String json  = "";  
		Map resultmap = new HashMap();
		int number = experimentManageService.judgeExperimentNoRepeat(ExperimentNo_userForm);
		if(number==0){
			resultmap.put("result","1");
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		else{
			resultmap.put("result","0");
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		
	}
	
	
	
	//加载各种
	@ResponseBody
	@RequestMapping("jzExperimentMachine")
	public String jzExperimentMachine(@RequestParam(value="deputy") int deputy, int pageNo, int pageSize, String NumberMachineNode, 
			String NumberMachine, String TypeMachineNode,String DepartmentMachineNode,String WorkshopMachineNode,String nameExperimentPart, 
			String numberExperimentPart, String typeExperimentPart,String numberMaterialExperimentPart,String categoryMaterialExperimentPart,
			String NameMaterial, String	NumberMaterial, String id_CategoryMaterial,String ISOCuttingMaterial, String CategoryMaterial, 
			String CompanyMaterial,String NumberTurningBlade, String TypeBTADrill, String ISOBladeTurning, String ToolCoatBladeTurning, 
			String ToolMaterialBladeTurning,String MachiningTypeBladeTurning, String ToolBladeFeatureTurning,String CompanyTurningBlade, 
			String MateriaBladeTurning,String NumberBTADrill, String TypeBTADrill1, String NameBTADrill, String DiameterBTADrill, 
			String MateriaBTAlDrill, String ToolMaterialBTADrill, String ToolCoatBTADrill, String BreakerBTADrill, String CompanyBTADrill,
			String NameCuttingFluid, String	NumberCuttingFluid, String CategoryCuttingFluid,String CompanyCuttingFluid){
		
		String json  = "";  
		Map resultmap = new HashMap();
		Page page = new Page(pageNo, pageSize);
		PageData pd = new PageData();
		
		List<Map> list = new ArrayList<Map>();
		//1为查询加载机床节点
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
			
			resultmap.put("list", list);
			
			//查询类别列表
			List<Map> categoryMachineNodeInform = machineNodeInformService.queryCategoryMachineNodeInformList();
			resultmap.put("categoryMachineNodeInform", categoryMachineNodeInform);
			
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
			pd.put("nameExperimentPart", nameExperimentPart);
			pd.put("numberExperimentPart", numberExperimentPart);
			pd.put("typeExperimentPart", typeExperimentPart);
			pd.put("numberMaterialExperimentPart", numberMaterialExperimentPart);
			pd.put("categoryMaterialExperimentPart", categoryMaterialExperimentPart);
			page.setPd(pd);
			Map map	= experimentItemService.queryExperimentItemList(page);//查询零件页面
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
			resultmap.put("list", list);
			
			List<Map> CategoryExperimentPart = experimentItemService.queryCategoryExperimentPartList();
			resultmap.put("CategoryExperimentPart", CategoryExperimentPart);
			
			List<Map> categoryMaterialExperimentPartList = experimentItemService.queryCategoryMaterialExperimentPartList();
			resultmap.put("categoryMaterialExperimentPartList", categoryMaterialExperimentPartList);
			
			Map para = new HashMap();
			para.put("nameExperimentPart", nameExperimentPart);
			para.put("numberExperimentPart", numberExperimentPart);
			para.put("typeExperimentPart", typeExperimentPart);
			para.put("numberMaterialExperimentPart", numberMaterialExperimentPart);
			para.put("categoryMaterialExperimentPart", categoryMaterialExperimentPart);
			resultmap.put("para",para);
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		if(deputy==3){
			pd.put("NameMaterial", NameMaterial);
			pd.put("NumberMaterial", NumberMaterial);
			pd.put("id_CategoryMaterial", id_CategoryMaterial);
			pd.put("ISOCuttingMaterial", ISOCuttingMaterial);
			pd.put("CategoryMaterial", CategoryMaterial);
			pd.put("CompanyMaterial", CompanyMaterial);
			page.setPd(pd);
			Map map	= materialService.queryMaterialList(page);//查询工件材料列表
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
			resultmap.put("list", list);
			//查询材料类别列表
			List<Map> categoryMaterialList = materialService.queryCategoryMaterialList();
			resultmap.put("categoryMaterialList", categoryMaterialList);
			
			Map para = new HashMap();
			para.put("NameMaterial", NameMaterial);
			para.put("NumberMaterial", NumberMaterial);
			para.put("id_CategoryMaterial", id_CategoryMaterial);
			para.put("ISOCuttingMaterial", ISOCuttingMaterial);
			para.put("CategoryMaterial", CategoryMaterial);
			para.put("CompanyMaterial", CompanyMaterial);
			resultmap.put("para",para);
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		if(deputy==4){
			pd.put("NumberTurningBlade", NumberTurningBlade);
			pd.put("TypeBTADrill", TypeBTADrill);
			pd.put("ISOBladeTurning", ISOBladeTurning);
			pd.put("ToolCoatBladeTurning", ToolCoatBladeTurning);
			pd.put("ToolMaterialBladeTurning", ToolMaterialBladeTurning);
			pd.put("MachiningTypeBladeTurning", MachiningTypeBladeTurning);
			pd.put("ToolBladeFeatureTurning", ToolBladeFeatureTurning);
			pd.put("CompanyTurningBlade", CompanyTurningBlade);
			pd.put("MateriaBladeTurning", MateriaBladeTurning);
			page.setPd(pd);
			Map map	= turningBladeService.queryTurningBladeList(page);//查询刀片列表
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
			resultmap.put("list", list);
			
			Map para = new HashMap();
			para.put("NumberTurningBlade", NumberTurningBlade);
			para.put("TypeBTADrill", TypeBTADrill);
			para.put("ISOBladeTurning", ISOBladeTurning);
			para.put("ToolCoatBladeTurning", ToolCoatBladeTurning);
			para.put("ToolMaterialBladeTurning", ToolMaterialBladeTurning);
			para.put("MachiningTypeBladeTurning", MachiningTypeBladeTurning);
			para.put("ToolBladeFeatureTurning", ToolBladeFeatureTurning);
			para.put("CompanyTurningBlade", CompanyTurningBlade);
			para.put("MateriaBladeTurning", MateriaBladeTurning);
			resultmap.put("para",para);
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		if(deputy==5){
			pd.put("NumberBTADrill", NumberBTADrill);
			pd.put("TypeBTADrill", TypeBTADrill1);
			pd.put("NameBTADrill", NameBTADrill);
			pd.put("DiameterBTADrill", DiameterBTADrill);
			pd.put("MateriaBTAlDrill", MateriaBTAlDrill);
			pd.put("ToolMaterialBTADrill", ToolMaterialBTADrill);
			pd.put("ToolCoatBTADrill", ToolCoatBTADrill);
			pd.put("BreakerBTADrill", BreakerBTADrill);
			pd.put("CompanyBTADrill", CompanyBTADrill);
			page.setPd(pd);
			Map map	= toolBTAdrillService.queryToolBTAdrillList(page);//查询深孔钻列表
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
			resultmap.put("list", list);
			
			Map para = new HashMap();
			para.put("NumberBTADrill", NumberBTADrill);
			para.put("TypeBTADrill", TypeBTADrill1);
			para.put("NameBTADrill", NameBTADrill);
			para.put("DiameterBTADrill", DiameterBTADrill);
			para.put("MateriaBTAlDrill", MateriaBTAlDrill);
			para.put("ToolMaterialBTADrill", ToolMaterialBTADrill);
			para.put("ToolCoatBTADrill", ToolCoatBTADrill);
			para.put("BreakerBTADrill", BreakerBTADrill);
			para.put("CompanyBTADrill", CompanyBTADrill);
			resultmap.put("para",para);
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		if(deputy==6){
			pd.put("NameCuttingFluid", NameCuttingFluid);
			pd.put("NumberCuttingFluid", NumberCuttingFluid);
			pd.put("CategoryCuttingFluid", CategoryCuttingFluid);
			pd.put("CompanyCuttingFluid", CompanyCuttingFluid);
			page.setPd(pd);
			Map map	= cuttingFluidMaterialService.queryCuttingFluidMaterialList(page);//查询工件材料列表
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
			resultmap.put("list", list);
			
			List<Map> CategoryCuttingFluidMaterialList = cuttingFluidMaterialService.queryCategoryCuttingFluidMaterialList();
			resultmap.put("CategoryCuttingFluidMaterialList", CategoryCuttingFluidMaterialList);
			
			Map para = new HashMap();
			para.put("NameCuttingFluid", NameCuttingFluid);
			para.put("NumberCuttingFluid", NumberCuttingFluid);
			para.put("CategoryCuttingFluid", CategoryCuttingFluid);
			para.put("CompanyCuttingFluid", CompanyCuttingFluid);
			resultmap.put("para",para);
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		
		
		return null;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/saveExperimentReport", produces = "application/json; charset=utf-8")
	public String saveInformDetailDesignToolBTAdrill(
			String file ,String fileSuffix, String filename) throws Exception{
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		String json  = "";  
		Map resultmap = new HashMap();
		String url = null;
		String name = null;
		if(file != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/experimentReport/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/experimentReport/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(file,  filepath2);
			url =  "/experimentReport/" + big_url + "." + fileSuffix;
			name = filename;
		}
		
				
		resultmap.put("result", "1");
		
		resultmap.put("url", url);
		resultmap.put("name", name);
		
		json = JackJson.fromObjectToJson(resultmap);
		
		return json;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/saveExperimentManage", produces = "application/json; charset=utf-8")
	public String saveDesignToolBTAdrill(String user_id, 
			String array_ExperimentReport, String array_ExperimentReport_name, int id_ExperimentManage, String ExperimentNo , String ExperimentName, String ExperimentType , String ExperimentMachine , String ExperimentPerson,
			String ExperimentTeacher,String ExperimentPart , String NumberMaterialExperimentPart , String CategoryMaterialExperimentPart , String ExperimentTool , String ExperimentToolMaterial , 
			String ExperimentCuttingFluid , String ExperimentMachiningType , String ExperimentContent , String ExperimentTime , String ExperimentCondition , String ExperimentRemark) {
	
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		
		para.put("id_ExperimentManage", id_ExperimentManage);
		para.put("ExperimentNo", ExperimentNo);
		para.put("ExperimentName", ExperimentName);
		
		Map temp = new HashMap();
		temp.put("name_ExperimentType", ExperimentType);
		//根据名称查询材料类别
		Map categoryExperimentType = experimentManageService.queryCategoryExperimentTypeById(temp);
		if(categoryExperimentType != null && !"".equals(categoryExperimentType)){
			para.put("ExperimentType", categoryExperimentType.get("id_ExperimentType"));
		}else{
			//保存新的材料类别
			experimentManageService.saveCategoryExperimentType(temp);
			para.put("ExperimentType", temp.get("id_ExperimentType"));
		}
		
		para.put("ExperimentMachine", ExperimentMachine);
		para.put("ExperimentPerson", ExperimentPerson);
		para.put("ExperimentTeacher", ExperimentTeacher);
		para.put("ExperimentPart", ExperimentPart);
		para.put("NumberMaterialExperimentPart", NumberMaterialExperimentPart);
		para.put("CategoryMaterialExperimentPart", CategoryMaterialExperimentPart);
		para.put("ExperimentTool", ExperimentTool);
		para.put("ExperimentToolMaterial", ExperimentToolMaterial);
		para.put("ExperimentCuttingFluid", ExperimentCuttingFluid);
		para.put("ExperimentMachiningType", ExperimentMachiningType);
		para.put("ExperimentContent", ExperimentContent);
		para.put("ExperimentTime", ExperimentTime);
		para.put("ExperimentCondition", ExperimentCondition);
		para.put("ExperimentRemark", ExperimentRemark);
		
		try {
			if(id_ExperimentManage==0){
				experimentManageService.saveExperimentManage(para);
			}else{
				experimentManageService.updateExperimentManage(para);
			}
		experimentManageService.cleanExperimentReport(para);
		//保存刀柄图片
		if(array_ExperimentReport != null && !"".equals(array_ExperimentReport)){
			String array_ExperimentReports[] = array_ExperimentReport.split(",");
			String array_ExperimentReports_name[] = array_ExperimentReport_name.split(",");
			for(int i=0; i<array_ExperimentReports.length; i++){
				if(array_ExperimentReports[i] != null && !"".equals(array_ExperimentReports[i])){
					para.put("url_ExperimentReport", array_ExperimentReports[i]);
					para.put("name_ExperimentReport", array_ExperimentReports_name[i]);
					experimentManageService.saveExperimentReport(para);
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
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "/deleteExperimentManage", produces = "application/json; charset=utf-8")
	public String deleteExperimentManage(String id_ExperimentManage) {
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		para.put("id_ExperimentManage", id_ExperimentManage);
		try {
			experimentManageService.cleanExperimentReport(para);
		
			experimentManageService.deleteExperimentManage(para);
			
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
	
	
}






