package com.qf.experimentControl.experimentManage.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
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
import com.qf.util.page.Page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("experimentManage")
public class experimentManageController extends BaseController{

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
	
	@RequestMapping(value="/selectResult")
	 public ModelAndView selectResult(Page page, HttpServletRequest request){
		 ModelAndView mv=new ModelAndView();
			
			PageData pd = new PageData();
			
			HttpSession session = request.getSession();
			Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
			
			try {
				
				pd = this.getPageData();
				
				page.setPd(pd);
				System.out.println(pd);
				Map map	= experimentParameterResultService.queryResultList(page);//查询试验基本信息页面
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
				}
				
				List<Map> CategoryExperimentType = experimentManageService.CategoryExperimentType(); //用于和类型值对应。
				mv.addObject("CategoryExperimentType",CategoryExperimentType);
				
				mv.addObject("ExperimentManage", list);
				mv.addObject("pd", pd);
				mv.addObject("page", page);
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.setViewName("/WEB-INF/experimentControl/experimentManage/experimentManage_list");
			
			return mv;
	 }
	
	
	//进入添加试验页
	@RequestMapping("goExperimentManageAdd")
	public ModelAndView experimentManageAdd(Page page, HttpServletRequest request, String id){
		
		ModelAndView mv=new ModelAndView();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		try {
			Map para1 = new HashMap();
			para1.put("id_ExperimentManage", id);
			Map ExperimentManage	= experimentManageService.queryExperimentManageById(para1);//查询试验基本信息页面
			
			if(ExperimentManage != null && ExperimentManage.size() > 0){
					int id_ExperimentManage = (int) ExperimentManage.get("id_ExperimentManage");
					
					Map para = new HashMap();
					para.put("id_ExperimentManage", id_ExperimentManage);
					
					//查询试验报告
					List<Map> ExperimentReportList = experimentParameterResultService.queryExperimentReportList(para);
					ExperimentManage.put("ExperimentReportList", ExperimentReportList);
					
					String array_ExperimentReport = "";
					String array_ExperimentReport_name = "";
					if(ExperimentReportList != null && ExperimentReportList.size() > 0){
						for(int i = 0; i < ExperimentReportList.size(); i++){
							array_ExperimentReport = array_ExperimentReport + ExperimentReportList.get(i).get("url_ExperimentReport") + ",";
							array_ExperimentReport_name = array_ExperimentReport_name + ExperimentReportList.get(i).get("name_ExperimentReport") + ",";
						}
					}
					mv.addObject("array_ExperimentReport", array_ExperimentReport);
					mv.addObject("array_ExperimentReport_name", array_ExperimentReport_name);
					mv.addObject("ExperimentManage", ExperimentManage);
				}
			List<Map> CategoryExperimentType = experimentManageService.CategoryExperimentType();
			mv.addObject("CategoryExperimentType",CategoryExperimentType);
			
			List<String> ExperimentContentList = experimentManageService.ExperimentContentList();
			if(ExperimentContentList != null && ExperimentContentList.size() > 0){
				String isoArray[] = new String[ExperimentContentList.size()];  
				for(int i=0;i<ExperimentContentList.size();i++){
					isoArray[i] = ExperimentContentList.get(i);
				}
				String json = JackJson.fromObjectToJson(isoArray);
				System.out.println(isoArray);
				mv.addObject("isoArray", json);
			}
			
			mv.setViewName("/WEB-INF/experimentControl/experimentManage/experimentManage_edit");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
		
	}
	
	
	
	//检测试验编号是否重复
	@ResponseBody
	@RequestMapping("jc")
	public Object jc(@RequestParam(value="ExperimentNo_userForm") String ExperimentNo_userForm){
		int number = experimentManageService.judgeExperimentNoRepeat(ExperimentNo_userForm);
		return number;
	}
	
	
	
	//加载各种
	@RequestMapping("jzExperimentMachine")
	public ModelAndView jzExperimentMachine(@RequestParam(value="deputy") int deputy, Page page, HttpServletRequest request){
		System.out.println("lalalalala"+deputy);
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		page.setPd(pd);
		List<Map> list = new ArrayList<Map>();
		//1为查询加载机床节点
		if(deputy==1){
			Map map	= machineNodeInformService.queryMachineNodeInformList(page);//查询机床节点信息页面
			list = (List<Map>)map.get("list");
			mv.addObject("machineNodeInformList", list);
			mv.addObject("pd", pd);
			//查询类别列表
			List<Map> categoryMachineNodeInform = machineNodeInformService.queryCategoryMachineNodeInformList();
			mv.addObject("categoryMachineNodeInform", categoryMachineNodeInform);
			mv.setViewName("/WEB-INF/experimentControl/experimentManage/experimentManage_loadingMachineNode");
		}
		if(deputy==2){
			Map map	= experimentItemService.queryExperimentItemList(page);//查询零件页面
			list = (List<Map>)map.get("list");
			mv.addObject("ExperimentItem", list);
			
			List<Map> CategoryExperimentPart = experimentItemService.queryCategoryExperimentPartList();
			mv.addObject("CategoryExperimentPart", CategoryExperimentPart);
			
			List<Map> categoryMaterialExperimentPartList = experimentItemService.queryCategoryMaterialExperimentPartList();
			mv.addObject("categoryMaterialExperimentPartList", categoryMaterialExperimentPartList);
			
			mv.addObject("pd", pd);
			mv.setViewName("/WEB-INF/experimentControl/experimentManage/experimentManage_loadingExperimentItem");
		}
		if(deputy==3){
			Map map	= materialService.queryMaterialList(page);//查询工件材料列表
			list = (List<Map>)map.get("list");
			mv.addObject("materialList", list);
			//查询材料类别列表
			List<Map> categoryMaterialList = materialService.queryCategoryMaterialList();
			mv.addObject("categoryMaterialList", categoryMaterialList);
			
			mv.addObject("pd", pd);
			mv.setViewName("/WEB-INF/experimentControl/experimentManage/experimentManage_loadingMaterial");
		}
		if(deputy==4){
			Map map	= turningBladeService.queryTurningBladeList(page);//查询刀片列表
			list = (List<Map>)map.get("list");
			mv.addObject("turningBladeList", list);
			
			mv.addObject("pd", pd);
			mv.setViewName("/WEB-INF/experimentControl/experimentManage/experimentManage_loadingturningBlade");
		}
		if(deputy==5){
			Map map	= toolBTAdrillService.queryToolBTAdrillList(page);//查询深孔钻列表
			list = (List<Map>)map.get("list");
			mv.addObject("toolBTAdrillList", list);
			
			mv.addObject("pd", pd);
			mv.setViewName("/WEB-INF/experimentControl/experimentManage/experimentManage_loadingToolBTAdrillList");
		}
		if(deputy==6){
			Map map	= cuttingFluidMaterialService.queryCuttingFluidMaterialList(page);//查询工件材料列表
			list = (List<Map>)map.get("list");
			mv.addObject("cuttingFluidMaterialList", list);
			
			List<Map> CategoryCuttingFluidMaterialList = cuttingFluidMaterialService.queryCategoryCuttingFluidMaterialList();
			mv.addObject("CategoryCuttingFluidMaterialList", CategoryCuttingFluidMaterialList);
			
			mv.addObject("pd", pd);
			mv.setViewName("/WEB-INF/experimentControl/experimentManage/experimentManage_loadingCuttingFluid");
		}
		
		
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping("saveExperimentReport")
	public Object saveExperimentReport(
		@RequestParam(value="ExperimentReport",required=false)MultipartFile file ,
		String ascription, HttpServletRequest request ) throws Exception{
		
		Map<String,String> data = new HashMap<String, String>();
		String OriginalFilename = file.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/experimentReport/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			file.transferTo(materials_big_img_file); 
			data.put("url", "/experimentReport/" + big_url + "." + fileSuffix);
			data.put("fileName", OriginalFilename);
			data.put("ascription", ascription);
		}else{

		}
		return data;
	}
	
	
	
	
	@ResponseBody
	@RequestMapping("saveExperimentManage")
	public Object saveExperimentManage(Page page, HttpServletRequest request,
			String array_ExperimentReport, String array_ExperimentReport_name, int id_ExperimentManage, String ExperimentNo , String ExperimentName, String ExperimentType , String ExperimentMachine , String ExperimentPerson,
			String ExperimentTeacher,String ExperimentPart , String NumberMaterialExperimentPart , String CategoryMaterialExperimentPart , String ExperimentTool , String ExperimentToolMaterial , 
			String ExperimentCuttingFluid , String ExperimentMachiningType[] , String ExperimentContent , String ExperimentTime , String ExperimentCondition , String ExperimentRemark){
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		
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
		String ExperimentMachiningTypes = "";
		if(ExperimentMachiningType!=null&&ExperimentMachiningType.length>0){
			for(int i = 0 ; i<ExperimentMachiningType.length;i++){
				ExperimentMachiningTypes += ExperimentMachiningType[i] +"," ;
			}
		}
		para.put("ExperimentMachiningType", ExperimentMachiningTypes);
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
		}catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 1;
	}
	
	
	@ResponseBody
	@RequestMapping("/deleteExperimentManage")
	public String deleteExperimentManage(String id_ExperimentManage) {
		Map para = new HashMap();
		para.put("id_ExperimentManage", id_ExperimentManage);
		try {
		
			experimentManageService.cleanExperimentReport(para);
		
			experimentManageService.deleteExperimentManage(para);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
}






