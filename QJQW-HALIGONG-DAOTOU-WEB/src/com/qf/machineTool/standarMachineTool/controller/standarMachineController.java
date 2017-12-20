package com.qf.machineTool.standarMachineTool.controller;



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

import com.itextpdf.text.log.SysoCounter;
import com.qf.machineTool.standarMachineTool.service.standarMachineService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.common.JackJson;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/standarMachine")
public class standarMachineController extends BaseController{
	
	@Resource(name="standarMachineService")
	private standarMachineService standarMachineService;
	
	
	
	/**
	 * 查询标准机床信息页面
	 */
	
	@RequestMapping("queryStandarMachineList")
	public ModelAndView queryStandarMachineList(Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= standarMachineService.queryStandarMachineList(page);//查询标准机床信息页面
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			System.out.println("标准机床信息"+list);
			
			if(list != null && list.size() > 0){
				for(int i = 0; i < list.size(); i++){
					Map MachineInform = list.get(i);
					int id_MachineInform = (int) MachineInform.get("id_MachineInform");
					
					Map para = new HashMap();
					para.put("id_MachineInform", id_MachineInform);
					
					//查询图片列表 
					List<Map> pictureMachineInformList = standarMachineService.queryPictureMachineInformList(para);
					//查询详细信息列表 
					List<Map> informDetailMachineInformList = standarMachineService.queryInformDetailMachineInformList(para);
					
					
					MachineInform.put("pictureMachineInformList", pictureMachineInformList);
					MachineInform.put("informDetailMachineInformList", informDetailMachineInformList);
					list.set(i, MachineInform);
				}
			}
			
			//查询类别列表
			List<Map> categoryMachineInform = standarMachineService.queryCategoryMachineInformList();
			System.out.println("类别"+categoryMachineInform);
			mv.addObject("categoryMachineInform", categoryMachineInform);
			System.out.println("标准机床信息带图片"+list);
			mv.addObject("machineInformList", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		mv.setViewName("/WEB-INF/machineTool/standardMachineTool/standardMachineTool_list");
		return mv;
	}
	
	
	
	/**
	 * 去新增标准机床页面
	 */
	@RequestMapping(value="/goAddMachineInform")
	public ModelAndView goAddTurningHolder(String id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
			
		Map para = new HashMap();
		para.put("id_MachineInform", id);
		Map MachineInform = standarMachineService.queryMachineInformById(para);//查询标准机床
		System.out.println(MachineInform);
		if(MachineInform != null){
			
			//查询标准机床图片列表 PictureMachineInform
			List<Map> pictureMachineInformList = standarMachineService.queryPictureMachineInformList(para);
			String array_PictureMachineInform = "";
			if(pictureMachineInformList != null && pictureMachineInformList.size() > 0){
				for(int i = 0; i < pictureMachineInformList.size(); i++){
					array_PictureMachineInform = array_PictureMachineInform + pictureMachineInformList.get(i).get("url_PictureMachineInform") + ",";
				}
			}

			//查询标准机床详细信息列表 InformDetailMachineInform
			List<Map> informDetailMachineInformList = standarMachineService.queryInformDetailMachineInformList(para);
			String array_InformDetailMachineInform = "";
			String array_InformDetailMachineInform_name = "";
			if(informDetailMachineInformList != null && informDetailMachineInformList.size() > 0){
				for(int i = 0; i < informDetailMachineInformList.size(); i++){
					array_InformDetailMachineInform = array_InformDetailMachineInform + informDetailMachineInformList.get(i).get("url_InformDetailMachineInform") + ",";
					array_InformDetailMachineInform_name = array_InformDetailMachineInform_name + informDetailMachineInformList.get(i).get("name_InformDetailMachineInform") + ",";
				}
			}
			
			MachineInform.put("pictureMachineInformList", pictureMachineInformList);
			MachineInform.put("informDetailMachineInformList", informDetailMachineInformList);
			
			mv.addObject("array_PictureMachineInform", array_PictureMachineInform);
			mv.addObject("array_InformDetailMachineInform", array_InformDetailMachineInform);
			mv.addObject("array_InformDetailMachineInform_name", array_InformDetailMachineInform_name);
			
		}

		//查询类别列表
		List<Map> categoryMachineInform = standarMachineService.queryCategoryMachineInformList();
		System.out.println("类别"+categoryMachineInform);
		mv.addObject("categoryMachineInform", categoryMachineInform);
		
		mv.setViewName("/WEB-INF/machineTool/standardMachineTool/standardMachineTool_edit");
		mv.addObject("msg", "saveMachineInform");
		mv.addObject("turn_url", turn_url);
		mv.addObject("MachineInform", MachineInform);
		
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	
	/**
	 * 保存
	 */
	
	@ResponseBody
	@RequestMapping("/saveMachineInform")
	public String saveMachineInform(HttpServletRequest request, 
			int id_MachineInform, 
			String array_PictureMachineInform, 
			String array_InformDetailMachineInform, 
			String array_InformDetailMachineInform_name,  
			String NumberMachine, String NameMachine, String TypeMachine, 
			String TypeCustomMachineInform, String ControlSystemMachine, String SpindleSpeedMachine, 
			String CompanyMachine, String CuttingDiameterMachine, String MaxweightMachine, String TypeTurningHolderMachine) {
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		Map para = new HashMap();
		
		para.put("id_MachineInform", id_MachineInform);
		para.put("NumberMachine", NumberMachine);
		para.put("NameMachine", NameMachine);
		
		Map temp = new HashMap();
		temp.put("name_CategoryMachineInform", TypeMachine);
		Map categoryMachineInform = standarMachineService.queryCategoryMachineInformByName(temp);
		if(categoryMachineInform!=null || "".equals(categoryMachineInform)){
			para.put("TypeMachine", categoryMachineInform.get("id_CategoryMachineInform"));
		}else{
			//保存新的材料类别
			standarMachineService.saveCategoryMachineInform(temp);
			para.put("TypeMachine", temp.get("id_CategoryMachineInform"));
		}
		
		para.put("TypeCustomMachineInform", TypeCustomMachineInform);
		para.put("ControlSystemMachine", ControlSystemMachine);
		
		//由于SpindleSpeedMachine为整型，所以加入判断
		if(SpindleSpeedMachine == null || "".equals(SpindleSpeedMachine)){
			para.put("SpindleSpeedMachine", "0");
		}else{
			para.put("SpindleSpeedMachine", SpindleSpeedMachine);
		}
		
		para.put("CompanyMachine", CompanyMachine);
		para.put("CuttingDiameterMachine", CuttingDiameterMachine);
		para.put("MaxweightMachine", MaxweightMachine);
		para.put("TypeTurningHolderMachine", TypeTurningHolderMachine);
		
		
		
		para.put("add_time", System.currentTimeMillis() / 1000);
		if(user != null){
			para.put("user_id", user.get("user_id"));
		}else{
			para.put("user_id", 0);
		}
		try {
			if(id_MachineInform != 0){//修改
				standarMachineService.updateMachineInform(para);
			}else{//新增
				
				standarMachineService.saveMachineInform(para);
			}
			//清空刀柄图片路径
			standarMachineService.clearPictureMachineInformByIdMachineInform(para);
			//保存刀柄图片
			if(array_PictureMachineInform != null && !"".equals(array_PictureMachineInform)){
				String array_PictureMachineInforms[] = array_PictureMachineInform.split(",");
				for(int i=0; i<array_PictureMachineInforms.length; i++){
					if(array_PictureMachineInforms[i] != null && !"".equals(array_PictureMachineInforms[i])){
						para.put("url_PictureMachineInform", array_PictureMachineInforms[i]);
						standarMachineService.savePictureMachineInform(para);
					}
				}
			}
			
			//清空详细信息路径
			standarMachineService.clearInformDetailMachineInformByIdMachineInform(para);
			//保存详细信息
			if(array_InformDetailMachineInform != null && !"".equals(array_InformDetailMachineInform)){
				String array_InformDetailMachineInforms[] = array_InformDetailMachineInform.split(",");
				String array_InformDetailMachineInforms_name[] = array_InformDetailMachineInform_name.split(",");
				
				for(int i=0; i<array_InformDetailMachineInforms.length; i++){
					if(array_InformDetailMachineInforms[i] != null && !"".equals(array_InformDetailMachineInforms[i])){
						para.put("url_InformDetailMachineInform", array_InformDetailMachineInforms[i]);
						para.put("name_InformDetailMachineInform", array_InformDetailMachineInforms_name[i]);
						standarMachineService.saveInformDetailMachineInform(para);
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
	 * 保存机床图片
	 */
	
	@RequestMapping(value="/savePictureMachineInform")
	public ModelAndView savePictureMachineInform(String id_MachineInform, 
			String array_PictureMachineInform, 
			String array_InformDetailMachineInform, 
			String array_InformDetailMachineInform_name,  
			@RequestParam(value="PictureMachineInform",required=false)CommonsMultipartFile PictureMachineInform ,
			String NumberMachine, String NameMachine, String TypeMachine, 
			String ControlSystemMachine, String SpindleSpeedMachine, String CompanyMachine, 
			String CuttingDiameterMachine, String MaxweightMachine, String TypeTurningHolderMachine, 
			HttpServletRequest request ) throws Exception{
		System.out.println(array_PictureMachineInform);
		System.out.println(array_InformDetailMachineInform);
		System.out.println(array_InformDetailMachineInform_name);
		Map MachineInform = new HashMap();
		
		MachineInform.put("id_MachineInform", id_MachineInform);
		MachineInform.put("NumberMachine", NumberMachine);
		MachineInform.put("NameMachine", NameMachine);
		
		Map temp = new HashMap();
		temp.put("name_CategoryMachineInform", TypeMachine);
		Map categoryMachineInform = standarMachineService.queryCategoryMachineInformByName(temp);
		if(categoryMachineInform!=null || "".equals(categoryMachineInform)){
			MachineInform.put("TypeMachine", categoryMachineInform.get("id_CategoryMachineInform"));
		}
		
		MachineInform.put("ControlSystemMachine", ControlSystemMachine);
		MachineInform.put("SpindleSpeedMachine", SpindleSpeedMachine);
		MachineInform.put("CompanyMachine", CompanyMachine);
		MachineInform.put("CuttingDiameterMachine", CuttingDiameterMachine);
		MachineInform.put("MaxweightMachine", MaxweightMachine);
		MachineInform.put("TypeTurningHolderMachine", TypeTurningHolderMachine);
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureBTADrillMap = new HashMap(); 
		
		String OriginalFilename = PictureMachineInform.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureMachineInform/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			System.out.println(filepath1);
			
			PictureMachineInform.transferTo(materials_big_img_file); 
			PictureBTADrillMap.put("url_PictureMachineInform", "/pictureMachineInform/" + big_url + "." + fileSuffix);
			PictureBTADrillMap.put("id_MachineInform", id_MachineInform);
			array_PictureMachineInform = array_PictureMachineInform + "/pictureMachineInform/" + big_url + "." + fileSuffix + ",";

		}else{

		}
	
		//查询类别列表
		List<Map> categoryMachineInform1 = standarMachineService.queryCategoryMachineInformList();
		System.out.println("类别"+categoryMachineInform1);
		mv.addObject("categoryMachineInform", categoryMachineInform1);
		
		mv.addObject("array_PictureMachineInform", array_PictureMachineInform);
		mv.addObject("array_InformDetailMachineInform", array_InformDetailMachineInform);
		mv.addObject("array_InformDetailMachineInform_name", array_InformDetailMachineInform_name);
		System.out.println("————————————————分割线————————————————");
		System.out.println(array_PictureMachineInform);
		System.out.println(array_InformDetailMachineInform);
		System.out.println(array_InformDetailMachineInform_name);
		mv.addObject("MachineInform", MachineInform);
		
		mv.setViewName("/WEB-INF/machineTool/standardMachineTool/standardMachineTool_edit");

		return mv;
		
	}
	
	
	/**
	 * 保存详细信息
	 */

	@RequestMapping(value="/saveInformDetailMachineInform")
	public ModelAndView saveInformDetailMachineInform(String id_MachineInform, 
			String array_PictureMachineInform, 
			String array_InformDetailMachineInform, 
			String array_InformDetailMachineInform_name,  
			@RequestParam(value="InformDetailMachineInform",required=false)CommonsMultipartFile InformDetailMachineInform ,
			String NumberMachine, String NameMachine, String TypeMachine, 
			String ControlSystemMachine, String SpindleSpeedMachine, String CompanyMachine, 
			String CuttingDiameterMachine, String MaxweightMachine, String TypeTurningHolderMachine, 
			HttpServletRequest request ) throws Exception{
		
		Map MachineInform = new HashMap();
		
		MachineInform.put("id_MachineInform", id_MachineInform);
		MachineInform.put("NumberMachine", NumberMachine);
		MachineInform.put("NameMachine", NameMachine);
		
		Map temp = new HashMap();
		temp.put("name_CategoryMachineInform", TypeMachine);
		Map categoryMachineInform = standarMachineService.queryCategoryMachineInformByName(temp);
		if(categoryMachineInform!=null || "".equals(categoryMachineInform)){
			MachineInform.put("TypeMachine", categoryMachineInform.get("id_CategoryMachineInform"));
		}
		
		MachineInform.put("ControlSystemMachine", ControlSystemMachine);
		MachineInform.put("SpindleSpeedMachine", SpindleSpeedMachine);
		MachineInform.put("CompanyMachine", CompanyMachine);
		MachineInform.put("CuttingDiameterMachine", CuttingDiameterMachine);
		MachineInform.put("MaxweightMachine", MaxweightMachine);
		MachineInform.put("TypeTurningHolderMachine", TypeTurningHolderMachine);
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureBTADrillMap = new HashMap(); 
		
		String OriginalFilename = InformDetailMachineInform.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informDetailMachineInform/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			InformDetailMachineInform.transferTo(materials_big_img_file); 
			PictureBTADrillMap.put("url_InformDetailMachineInform", "/informDetailMachineInform/" + big_url + "." + fileSuffix);
			PictureBTADrillMap.put("id_MachineInform", id_MachineInform);
			array_InformDetailMachineInform = array_InformDetailMachineInform + "/informDetailMachineInform/" + big_url + "." + fileSuffix + ",";
			array_InformDetailMachineInform_name = array_InformDetailMachineInform_name + OriginalFilename + ",";
		}else{

		}
	
		//查询类别列表
		List<Map> categoryMachineInform1 = standarMachineService.queryCategoryMachineInformList();
		System.out.println("类别"+categoryMachineInform1);
		mv.addObject("categoryMachineInform", categoryMachineInform1);
		
		mv.addObject("array_PictureMachineInform", array_PictureMachineInform);
		mv.addObject("array_InformDetailMachineInform", array_InformDetailMachineInform);
		mv.addObject("array_InformDetailMachineInform_name", array_InformDetailMachineInform_name);
		
		mv.addObject("MachineInform", MachineInform);
		
		mv.setViewName("/WEB-INF/machineTool/standardMachineTool/standardMachineTool_edit");

		return mv;
		
	}
	
	
	/**
	 * 删除标准机床信息
	 */
	@ResponseBody
	@RequestMapping("/deleteMachineInform")
	public String deleteTurningHolder(String id_MachineInform) {
		Map para = new HashMap();
		para.put("id_MachineInform", id_MachineInform);
		try {
			//清空标准图片路径
			standarMachineService.clearPictureMachineInformByIdMachineInform(para);
			//清空标准机床详细信息路径
			standarMachineService.clearInformDetailMachineInformByIdMachineInform(para);
			//删除标准机床数据
			standarMachineService.deleteMachineInform(para);
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
	
	
	
	
	
	
}











