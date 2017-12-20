package com.qf.machineTool.machineNodeInform.controller;

import java.io.File;
import java.util.Calendar;
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
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.qf.machineTool.machineNodeInform.sercice.machineNodeInformService;
import com.qf.machineTool.standarMachineTool.service.standarMachineService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.common.JackJson;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/machineNodeInform")
public class machineNodeInformController extends BaseController{
	
	
	@Resource(name = "machineNodeInformService")
	private machineNodeInformService machineNodeInformService;
	
	@Resource(name="standarMachineService")
	private standarMachineService standarMachineService;
	
	
	@RequestMapping("queryMachineNodeInformList")
	public ModelAndView queryMachineNodeInformList(Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= machineNodeInformService.queryMachineNodeInformList(page);//查询机床节点信息页面
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
			}
			//查询类别列表
			List<Map> categoryMachineNodeInform = machineNodeInformService.queryCategoryMachineNodeInformList();
			System.out.println("类别"+categoryMachineNodeInform);
			mv.addObject("categoryMachineNodeInform", categoryMachineNodeInform);
			
			System.out.println("机床节点信息带图片"+list);
			mv.addObject("machineNodeInformList", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName("/WEB-INF/machineTool/machineNodeInform/machineNodeInform_list");
		return mv;
	}
	
	
	
	
	
	@RequestMapping(value="/goAddMachineNodeInform")
	public ModelAndView goAddMachineNodeInform(String id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
			
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
			
			mv.addObject("array_InformDetailMachineNodeInform", array_InformDetailMachineNodeInform);
			mv.addObject("array_InformDetailMachineNodeInform_name", array_InformDetailMachineNodeInform_name);
			
		}
		
		//查询类别列表
		List<Map> categoryMachineNodeInform = machineNodeInformService.queryCategoryMachineNodeInformList();
		System.out.println("类别"+categoryMachineNodeInform);
		mv.addObject("categoryMachineNodeInform", categoryMachineNodeInform);
		
		mv.setViewName("/WEB-INF/machineTool/machineNodeInform/machineNodeInform_edit");
		mv.addObject("msg", "saveMachineNodeInform");
		mv.addObject("turn_url", turn_url);
		mv.addObject("MachineNodeInform", MachineNodeInform);
		
		List<String> DwList = machineNodeInformService.queryDwList();
		if(DwList != null && DwList.size() > 0){
			String isoArray[] = new String[DwList.size()];  
			for(int i=0;i<DwList.size();i++){
				isoArray[i] = DwList.get(i);
			}
			String json = JackJson.fromObjectToJson(isoArray);
			mv.addObject("DwArray", json);
		}
		
		List<String> CjList = machineNodeInformService.queryCjList();
		if(CjList != null && CjList.size() > 0){
			String isoArray1[] = new String[CjList.size()];  
			for(int i=0;i<CjList.size();i++){
				isoArray1[i] = CjList.get(i);
			}
			String json1 = JackJson.fromObjectToJson(isoArray1);
			mv.addObject("CjArray", json1);
		}
		
		
		
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	
	/**
	 * 保存
	 */
	
	@ResponseBody
	@RequestMapping("/saveMachineNodeInform")
	public String saveMachineNodeInform(HttpServletRequest request, 
			int id_MachineNodeInform, 
			String array_InformDetailMachineNodeInform, 
			String array_InformDetailMachineNodeInform_name,  
			String NumberMachineNode, String NumberMachine, String TypeMachineNode, 
			String DepartmentMachineNode, String WorkshopMachineNode, String PositionMachineNode, 
			String UseFrequencyMachineNode, String TimeUseMachineNode, String TimeDestroyMachineNode, String TypeCustomMachineNode) {
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		Map para = new HashMap();
		
		if(!"9".equals(TypeMachineNode)){
			TypeCustomMachineNode = null;
		}
		
		para.put("id_MachineNodeInform", id_MachineNodeInform);
		para.put("NumberMachineNode", NumberMachineNode);
		para.put("NumberMachine", NumberMachine);
		
		Map temp = new HashMap();
		temp.put("name_CategoryMachineNodeInform", TypeMachineNode);
		Map categoryMachineNodeInform = machineNodeInformService.queryCategoryMachineNodeInformByName(temp);
		if(categoryMachineNodeInform!=null && !"".equals(categoryMachineNodeInform)){
			para.put("TypeMachineNode", categoryMachineNodeInform.get("id_CategoryMachineNodeInform"));
		}else{
			//保存新的材料类别
			machineNodeInformService.saveCategoryMachineNodeInform(temp);
			para.put("TypeMachineNode", temp.get("id_CategoryMachineNodeInform"));
		}
		
		para.put("DepartmentMachineNode", DepartmentMachineNode);
		para.put("WorkshopMachineNode", WorkshopMachineNode);
		para.put("PositionMachineNode", PositionMachineNode);
		para.put("UseFrequencyMachineNode", UseFrequencyMachineNode);
		para.put("TimeUseMachineNode", TimeUseMachineNode);
		para.put("TimeDestroyMachineNode", TimeDestroyMachineNode);
		para.put("TypeCustomMachineNode", TypeCustomMachineNode);
		
		
		para.put("add_time", System.currentTimeMillis() / 1000);
		if(user != null){
			para.put("user_id", user.get("user_id"));
		}else{
			para.put("user_id", 0);
		}
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
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
	/**
	 * 保存详细信息
	 */

	@RequestMapping(value="/saveInformDetailMachineNodeInform")
	public ModelAndView saveInformDetailMachineNodeInform(String id_MachineNodeInform, 
			String array_InformDetailMachineNodeInform, 
			String array_InformDetailMachineNodeInform_name,  
			@RequestParam(value="InformDetailMachineNodeInform",required=false)CommonsMultipartFile InformDetailMachineNodeInform ,
			String NumberMachineNode, String NumberMachine, String TypeMachineNode, 
			String DepartmentMachineNode, String WorkshopMachineNode, String PositionMachineNode, 
			String UseFrequencyMachineNode, String TimeUseMachineNode, String TimeDestroyMachineNode, String DwArray, String CjArray,
			HttpServletRequest request ) throws Exception{
		
		Map MachineNodeInform = new HashMap();
		
		MachineNodeInform.put("id_MachineNodeInform", id_MachineNodeInform);
		MachineNodeInform.put("NumberMachineNode", NumberMachineNode);
		MachineNodeInform.put("NumberMachine", NumberMachine);

		Map temp = new HashMap();
		temp.put("name_CategoryMachineNodeInform", TypeMachineNode);
		Map categoryMachineNodeInform = machineNodeInformService.queryCategoryMachineNodeInformByName(temp);
		if(categoryMachineNodeInform!=null || "".equals(categoryMachineNodeInform)){
			MachineNodeInform.put("TypeMachineNode", categoryMachineNodeInform.get("id_CategoryMachineNodeInform"));
		}
		
		MachineNodeInform.put("DepartmentMachineNode", DepartmentMachineNode);
		MachineNodeInform.put("WorkshopMachineNode", WorkshopMachineNode);
		MachineNodeInform.put("PositionMachineNode", PositionMachineNode);
		MachineNodeInform.put("UseFrequencyMachineNode", UseFrequencyMachineNode);
		MachineNodeInform.put("TimeUseMachineNode", TimeUseMachineNode);
		MachineNodeInform.put("TimeDestroyMachineNode", TimeDestroyMachineNode);
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureBTADrillMap = new HashMap(); 
		
		String OriginalFilename = InformDetailMachineNodeInform.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informDetailMachineNodeInform/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			InformDetailMachineNodeInform.transferTo(materials_big_img_file); 
			PictureBTADrillMap.put("url_InformDetailMachineNodeInform", "/informDetailMachineNodeInform/" + big_url + "." + fileSuffix);
			PictureBTADrillMap.put("id_MachineNodeInform", id_MachineNodeInform);
			array_InformDetailMachineNodeInform = array_InformDetailMachineNodeInform + "/informDetailMachineNodeInform/" + big_url + "." + fileSuffix + ",";
			array_InformDetailMachineNodeInform_name = array_InformDetailMachineNodeInform_name + OriginalFilename + ",";
		}else{

		}
	
		mv.addObject("array_InformDetailMachineNodeInform", array_InformDetailMachineNodeInform);
		mv.addObject("array_InformDetailMachineNodeInform_name", array_InformDetailMachineNodeInform_name);
		mv.addObject("DwArray",DwArray);
		mv.addObject("CjArray",CjArray);
		//查询类别列表
		List<Map> categoryMachineNodeInform1 = machineNodeInformService.queryCategoryMachineNodeInformList();
		System.out.println("类别"+categoryMachineNodeInform1);
		
		mv.addObject("categoryMachineNodeInform", categoryMachineNodeInform1);
		mv.addObject("MachineNodeInform", MachineNodeInform);
		
		mv.setViewName("/WEB-INF/machineTool/machineNodeInform/machineNodeInform_edit");

		return mv;
		
	}
	

	
	@ResponseBody
	@RequestMapping("deleteMachineNodeInform")
	public String deleteMachineNodeInform(String id_MachineNodeInform){
		Map para = new HashMap();
		para.put("id_MachineNodeInform", id_MachineNodeInform);
		try {
			//清空机床节点详细信息路径
			machineNodeInformService.clearInformDetailMachineNodeInformById(para);
			//删除标准机床数据
			machineNodeInformService.deleteMachineNodeInform(para);
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}	
		return "1";
	}
	
	
	
	
	
	@RequestMapping("loadingTool")
	public ModelAndView loadingTool(int id_MachineNodeInform, 
			String array_InformDetailMachineNodeInform, 
			String array_InformDetailMachineNodeInform_name,  String DwArray,String CjArray,
			String NumberMachineNode, String NumberMachine, String TypeMachineNode, 
			String DepartmentMachineNode, String WorkshopMachineNode, String PositionMachineNode, 
			String UseFrequencyMachineNode, String TimeUseMachineNode, String TimeDestroyMachineNode,
			Page page , String NameMachine, String NumberMachine1, String TypeMachine,
			 String ControlSystemMachine,String SpindleSpeedMachine,String CompanyMachine
			 ){
		
			ModelAndView mv = new ModelAndView();
			
			Map MachineNodeInform = new HashMap();
		
			MachineNodeInform.put("id_MachineNodeInform", id_MachineNodeInform);
			MachineNodeInform.put("NumberMachineNode", NumberMachineNode);
			MachineNodeInform.put("NumberMachine", NumberMachine);
			MachineNodeInform.put("TypeMachineNode", TypeMachineNode);
			MachineNodeInform.put("DepartmentMachineNode", DepartmentMachineNode);
			MachineNodeInform.put("WorkshopMachineNode", WorkshopMachineNode);
			MachineNodeInform.put("PositionMachineNode", PositionMachineNode);
			MachineNodeInform.put("UseFrequencyMachineNode", UseFrequencyMachineNode);
			MachineNodeInform.put("TimeUseMachineNode", TimeUseMachineNode);
			MachineNodeInform.put("TimeDestroyMachineNode", TimeDestroyMachineNode);
			
			mv.addObject("array_InformDetailMachineNodeInform", array_InformDetailMachineNodeInform);
			mv.addObject("array_InformDetailMachineNodeInform_name", array_InformDetailMachineNodeInform_name);
			mv.addObject("DwArray",DwArray);
			mv.addObject("CjArray",CjArray);
			mv.addObject("MachineNodeInform", MachineNodeInform);
			
			try{
				PageData pd = new PageData();
				pd.put("NameMachine", NameMachine);
				pd.put("NumberMachine", NumberMachine1);
				pd.put("TypeMachine", TypeMachine);
				pd.put("ControlSystemMachine", ControlSystemMachine);
				pd.put("SpindleSpeedMachine", SpindleSpeedMachine);
				pd.put("CompanyMachine", CompanyMachine);
				
				page.setPd(pd);
				Map map	= standarMachineService.queryStandarMachineList(page);//查询标准机床信息页面
				page = (Page)map.get("page");
				List<Map> list = (List<Map>)map.get("list");
				
				//查询类别列表
				List<Map> categoryMachineInform = standarMachineService.queryCategoryMachineInformList();
				mv.addObject("categoryMachineInform", categoryMachineInform);
				mv.addObject("machineInformList", list);
				mv.addObject("pd", pd);
				mv.addObject("page", page);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			
			mv.setViewName("/WEB-INF/machineTool/machineNodeInform/machineNodeInform_loadingTool");

			return mv ;
	}
	
	
	@RequestMapping(value="/goLoading")
	public ModelAndView goLoading(HttpServletRequest request,String id){
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		Map MachineNodeInform = new HashMap();
		MachineNodeInform.put("id_MachineNodeInform", pd.get("id_MachineNodeInform"));	
		MachineNodeInform.put("NumberMachineNode", pd.get("NumberMachineNode"));
		MachineNodeInform.put("NumberMachine", pd.get("NumberMachine"));
		Map temp = new HashMap();
		temp.put("name_CategoryMachineNodeInform", pd.get("TypeMachineNode"));
		Map categoryMachineNodeInform = machineNodeInformService.queryCategoryMachineNodeInformByName(temp);
		if(categoryMachineNodeInform!=null || "".equals(categoryMachineNodeInform)){
			MachineNodeInform.put("TypeMachineNode", categoryMachineNodeInform.get("id_CategoryMachineNodeInform"));
		}
		MachineNodeInform.put("DepartmentMachineNode", pd.get("DepartmentMachineNode"));
		MachineNodeInform.put("WorkshopMachineNode", pd.get("WorkshopMachineNode"));
		MachineNodeInform.put("PositionMachineNode", pd.get("PositionMachineNode"));
		MachineNodeInform.put("UseFrequencyMachineNode", pd.get("UseFrequencyMachineNode"));
		MachineNodeInform.put("TimeUseMachineNode", pd.get("TimeUseMachineNode"));
		MachineNodeInform.put("TimeDestroyMachineNode", pd.get("TimeDestroyMachineNode"));
		
		mv.addObject("array_InformDetailMachineNodeInform", pd.get("array_InformDetailMachineNodeInform"));
		mv.addObject("array_InformDetailMachineNodeInform_name", pd.get("array_InformDetailMachineNodeInform_name"));
		mv.addObject("DwArray", pd.get("DwArray"));
		mv.addObject("CjArray", pd.get("CjArray"));
		mv.addObject("MachineNodeInform",MachineNodeInform);
		
		//查询类别列表
		List<Map> categoryMachineNodeInform1 = machineNodeInformService.queryCategoryMachineNodeInformList();
		mv.addObject("categoryMachineNodeInform", categoryMachineNodeInform1);
		
		//查询类别列表
		List<Map> categoryMachineInform1 = standarMachineService.queryCategoryMachineInformList();
		Map para = new HashMap();
		
		para.put("id_MachineInform", id);
		Map MachineInform = standarMachineService.queryMachineInformById(para);//查询标准机床
		Integer TypeMachine_id = Integer.valueOf((String) MachineInform.get("TypeMachine"));
		String TypeMachine_name = "";
		for(int i=0;i<categoryMachineInform1.size();i++){
			Map map = categoryMachineInform1.get(i);
			if((map.get("id_CategoryMachineInform")).equals(TypeMachine_id)){
				TypeMachine_name = (String) map.get("name_CategoryMachineInform");
				System.out.println(TypeMachine_name);
			}
		}
		mv.addObject("TypeMachine_name",TypeMachine_name);
		mv.addObject("MachineInform", MachineInform);
		
		mv.setViewName("/WEB-INF/machineTool/machineNodeInform/machineNodeInform_edit");
		return mv;
	}
	
	
}










