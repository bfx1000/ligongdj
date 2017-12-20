package com.qf.experimentControl.experimentItem.controller;

import java.io.File;
import java.util.ArrayList;
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
import com.qf.experimentControl.experimentItem.service.experimentItemService;
import com.qf.machineTool.standarMachineTool.service.standarMachineService;
import com.qf.material.material.service.MaterialService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.common.JackJson;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/experimentItem")
public class experimentItemController extends BaseController{

	
	@Resource(name="experimentItemService")
	private experimentItemService experimentItemService;
	
	
	@Resource(name="materialService")
    private MaterialService materialService; 
	/*
	 * 查询试验件列表
	 */
	@RequestMapping("/experimentItemList")
	public ModelAndView experimentItemList(Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= experimentItemService.queryExperimentItemList(page);//查询零件页面
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			
			if(list != null && list.size() > 0){
				for(int i = 0; i < list.size(); i++){
					Map ExperimentItem = list.get(i);
					int id_experimentPart = (int) ExperimentItem.get("id_experimentPart");
					
					Map para = new HashMap();
					para.put("id_experimentPart", id_experimentPart);
					
					//查询图片列表 
					List<Map> pictureExperimentPartList = experimentItemService.queryPictureExperimentItemList(para);
					//查询详细信息列表 
					List<Map> informDetailExperimentPartList = experimentItemService.queryInformDetailExperimentItemList(para);
					//part文件
					List<Map> partExperimentPartList = experimentItemService.queryPartExperimentPartList(para);
					
					ExperimentItem.put("pictureExperimentPartList", pictureExperimentPartList);
					ExperimentItem.put("informDetailExperimentPartList", informDetailExperimentPartList);
					ExperimentItem.put("partExperimentPartList", partExperimentPartList);
					list.set(i, ExperimentItem);
				}
			}
			System.out.println(list);
			
			List<Map> CategoryExperimentPart = experimentItemService.queryCategoryExperimentPartList();
			mv.addObject("CategoryExperimentPart", CategoryExperimentPart);
			
			List<Map> categoryMaterialExperimentPartList = experimentItemService.queryCategoryMaterialExperimentPartList();
			mv.addObject("categoryMaterialExperimentPartList", categoryMaterialExperimentPartList);
			
			mv.addObject("ExperimentItem", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/experimentControl/experimentItem/experimentItem_List");
		return mv;
		
	}
	
	
	@RequestMapping(value="/goAddExperimentPart")
	public ModelAndView goAddExperimentPart(String id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
			
		Map para = new HashMap();
		para.put("id_experimentPart", id);
		Map ExperimentItem = experimentItemService.queryExperimentItemListById(para);//查询标准机床
		if(ExperimentItem != null){
			
			//查询材料图片列表 PictureMaterial
			List<Map> pictureExperimentPart = experimentItemService.queryPictureExperimentItemList(para);
			String array_PictureExperimentPart = "";
			if(pictureExperimentPart != null && pictureExperimentPart.size() > 0){
				for(int i = 0; i < pictureExperimentPart.size(); i++){
					array_PictureExperimentPart = array_PictureExperimentPart + pictureExperimentPart.get(i).get("url_pictureExperimentPart") + ",";
				}
			}
			
			//查询机床节点详细信息列表 
			List<Map> informDetailExperimentPart = experimentItemService.queryInformDetailExperimentItemList(para);
			String array_InformDetailExperimentPart = "";
			String array_InformDetailExperimentPart_name = "";
			if(informDetailExperimentPart != null && informDetailExperimentPart.size() > 0){
				for(int i = 0; i < informDetailExperimentPart.size(); i++){
					array_InformDetailExperimentPart = array_InformDetailExperimentPart + informDetailExperimentPart.get(i).get("url_informDetailExperimentPart") + ",";
					array_InformDetailExperimentPart_name = array_InformDetailExperimentPart_name + informDetailExperimentPart.get(i).get("name_informDetailExperimentPart") + ",";
				}
			}
			
			//part
			List<Map> partExperimentPart = experimentItemService.queryPartExperimentPartList(para);
			String array_PartExperimentPart = "";
			String array_PartExperimentPart_name = "";
			if(partExperimentPart != null && partExperimentPart.size() > 0){
				for(int i = 0; i < partExperimentPart.size(); i++){
					array_PartExperimentPart = array_PartExperimentPart + partExperimentPart.get(i).get("url_partExperimentPart") + ",";
					array_PartExperimentPart_name = array_PartExperimentPart_name + partExperimentPart.get(i).get("name_partExperimentPart") + ",";
				}
			}
			
			ExperimentItem.put("pictureExperimentPart", pictureExperimentPart);
			ExperimentItem.put("informDetailExperimentPart", informDetailExperimentPart);
			ExperimentItem.put("partExperimentPart", partExperimentPart);
			
			mv.addObject("array_PictureExperimentPart", array_PictureExperimentPart);
			mv.addObject("array_InformDetailExperimentPart", array_InformDetailExperimentPart);
			mv.addObject("array_InformDetailExperimentPart_name", array_InformDetailExperimentPart_name);
			mv.addObject("array_PartExperimentPart", array_PartExperimentPart);
			mv.addObject("array_PartExperimentPart_name", array_PartExperimentPart_name);
			
			
		}
		
		//查询类别列表
		List<Map> CategoryExperimentPart = experimentItemService.queryCategoryExperimentPartList();
		System.out.println("类别"+CategoryExperimentPart);
		mv.addObject("CategoryExperimentPart", CategoryExperimentPart);
		
		List<Map> categoryMaterialExperimentPartList = experimentItemService.queryCategoryMaterialExperimentPartList();
		mv.addObject("categoryMaterialExperimentPartList", categoryMaterialExperimentPartList);
		
		mv.setViewName("/WEB-INF/experimentControl/experimentItem/experimentItem_edit");
		mv.addObject("msg", "saveMachineNodeInform");
		mv.addObject("turn_url", turn_url);
		mv.addObject("ExperimentItem", ExperimentItem);
		
		mv.addObject("pd", pd);
		System.out.println(ExperimentItem);
		
		return mv;
	}
	
	
	
	/**
	 * 保存
	 */
	
	@ResponseBody
	@RequestMapping("/saveExperimentPart")
	public String saveExperimentPart(HttpServletRequest request, 
			int id_experimentPart, 
			String array_PictureExperimentPart, 
			String array_InformDetailExperimentPart,
			String array_InformDetailExperimentPart_name,  
			String array_PartExperimentPart,String array_PartExperimentPart_name,
			String nameExperimentPart, String numberExperimentPart, String typeExperimentPart, 
			String numberMaterialExperimentPart, String categoryMaterialExperimentPart, String remarkExperimentPart
			) {
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		Map para = new HashMap();
		
		
		para.put("id_experimentPart", id_experimentPart);
		para.put("nameExperimentPart", nameExperimentPart);
		para.put("numberExperimentPart", numberExperimentPart);
		
		Map temp = new HashMap();
		temp.put("name_typeExperimentPart", typeExperimentPart);
		Map categoryTypeExperimentPart = experimentItemService.queryCategoryTypeExperimentPartByName(temp);
		if(categoryTypeExperimentPart!=null || "".equals(categoryTypeExperimentPart)){
			para.put("typeExperimentPart", categoryTypeExperimentPart.get("id_typeExperimentPart"));
		}else{
			//保存新的材料类别
			experimentItemService.saveCategoryTypeExperimentPart(temp);
			para.put("typeExperimentPart", temp.get("id_typeExperimentPart"));
		}
		
		para.put("numberMaterialExperimentPart", numberMaterialExperimentPart);
		
		
		Map temp1 = new HashMap();
		temp1.put("name_CategoryMaterialExperimentPart", categoryMaterialExperimentPart);
		Map categoryMaterialExperimentPartList = experimentItemService.queryCategoryMaterialExperimentPartListByName(temp1);
		if(categoryMaterialExperimentPartList!=null || "".equals(categoryMaterialExperimentPartList)){
			para.put("categoryMaterialExperimentPart", categoryMaterialExperimentPartList.get("id_CategoryMaterialExperimentPart"));
		}else{
			//保存新的材料类别
			experimentItemService.saveCategoryMaterialExperimentPartList(temp1);
			para.put("categoryMaterialExperimentPart", temp1.get("id_CategoryMaterialExperimentPart"));
		}
		
		para.put("remarkExperimentPart", remarkExperimentPart);
		
		para.put("add_time", System.currentTimeMillis() / 1000);
		if(user != null){
			para.put("user_id", user.get("user_id"));
		}else{
			para.put("user_id", 0);
		}
		try {
			if(id_experimentPart != 0){//修改
				experimentItemService.updateExperimentPart(para);
			}else{//新增
				
				experimentItemService.saveExperimentPart(para);
			}
			
			
			
			
			
			//清空详细信息路径1
			experimentItemService.clearPictureExperimentItemByIdMaterial(para);
			//保存详细信息
			if(array_PictureExperimentPart != null && !"".equals(array_PictureExperimentPart)){
				String array_PictureExperimentParts[] = array_PictureExperimentPart.split(",");
				
				for(int i=0; i<array_PictureExperimentParts.length; i++){
					if(array_PictureExperimentParts[i] != null && !"".equals(array_PictureExperimentParts[i])){
						para.put("url_pictureExperimentPart", array_PictureExperimentParts[i]);
						experimentItemService.savePictureExperimentItem(para);
					}
				}
			}
			
			
			
			
			//清空详细信息路径2
			experimentItemService.clearInformDetailExperimentItemById(para);
			//保存详细信息
			if(array_InformDetailExperimentPart != null && !"".equals(array_InformDetailExperimentPart)){
				String array_InformDetailExperimentParts[] = array_InformDetailExperimentPart.split(",");
				String array_InformDetailExperimentParts_name[] = array_InformDetailExperimentPart_name.split(",");
				for(int i=0; i<array_InformDetailExperimentParts.length; i++){
					if(array_InformDetailExperimentParts[i] != null && !"".equals(array_InformDetailExperimentParts[i])){
						para.put("url_InformDetailMachineNodeInform", array_InformDetailExperimentParts[i]);
						para.put("name_InformDetailMachineNodeInform", array_InformDetailExperimentParts_name[i]);
						experimentItemService.saveInformDetailExperimentItem(para);
					}
				}
			}
			
			
			
			//清空详细信息路径3
			experimentItemService.clearPartExperimentPartByIdMaterial(para);
			//保存详细信息
			if(array_PartExperimentPart != null && !"".equals(array_PartExperimentPart)){
				String array_PartExperimentParts[] = array_PartExperimentPart.split(",");
				String array_PartExperimentParts_name[] = array_PartExperimentPart_name.split(",");
				for(int i = 0;i<array_PartExperimentParts.length;i++){
					System.out.println(array_PartExperimentParts[i]);
				}
				for(int j = 0;j<array_PartExperimentParts_name.length;j++){
					System.out.println(array_PartExperimentParts_name[j]);
				}
				for(int i=0; i<array_PartExperimentParts.length; i++){
					if(array_PartExperimentParts[i] != null && !"".equals(array_PartExperimentParts[i])){
						para.put("url_partExperimentPart", array_PartExperimentParts[i]);
						para.put("name_partExperimentPart", array_PartExperimentParts_name[i]);
						experimentItemService.savePartExperimentPart(para);
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
	
	
	
	@RequestMapping("/savePictureExperimentItem")
	public ModelAndView savePictureExperimentItem(
			String id_experimentPart, 
			String array_PictureExperimentPart, 
			String array_InformDetailExperimentPart,
			String array_InformDetailExperimentPart_name,  
			String array_PartExperimentPart,String array_PartExperimentPart_name,
			String nameExperimentPart, String numberExperimentPart, String typeExperimentPart, 
			String numberMaterialExperimentPart, String categoryMaterialExperimentPart,String remarkExperimentPart,
			@RequestParam(value="PictureExperimentPart",required=false)CommonsMultipartFile PictureExperimentPart ,
			HttpServletRequest request ) throws Exception{
	
		
		Map ExperimentItem = new HashMap();
		
		ExperimentItem.put("id_experimentPart", id_experimentPart);
		ExperimentItem.put("nameExperimentPart", nameExperimentPart);	
		ExperimentItem.put("numberExperimentPart", numberExperimentPart);
		
		Map temp = new HashMap();
		temp.put("name_typeExperimentPart", typeExperimentPart);
		Map categoryTypeExperimentPart = experimentItemService.queryCategoryTypeExperimentPartByName(temp);
		if(categoryTypeExperimentPart!=null || "".equals(categoryTypeExperimentPart)){
			ExperimentItem.put("typeExperimentPart", categoryTypeExperimentPart.get("id_typeExperimentPart"));
		}

		ExperimentItem.put("numberMaterialExperimentPart", numberMaterialExperimentPart);
		
		Map temp1 = new HashMap();
		temp1.put("name_CategoryMaterialExperimentPart", categoryMaterialExperimentPart);
		Map categoryMaterialExperimentPartList = experimentItemService.queryCategoryMaterialExperimentPartListByName(temp1);
		if(categoryMaterialExperimentPartList!=null || "".equals(categoryMaterialExperimentPartList)){
			ExperimentItem.put("categoryMaterialExperimentPart", categoryMaterialExperimentPartList.get("id_CategoryMaterialExperimentPart"));
		}		
		
		ExperimentItem.put("remarkExperimentPart", remarkExperimentPart);
	
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureExperimentItem = new HashMap();
		
		String OriginalFilename = PictureExperimentPart.getOriginalFilename(); 
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureExperimentItem/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			PictureExperimentPart.transferTo(materials_big_img_file); 
			PictureExperimentItem.put("url_pictureExperimentPart", "/pictureExperimentItem/" + big_url + "." + fileSuffix);
			PictureExperimentItem.put("id_experimentPart", id_experimentPart);
			array_PictureExperimentPart = array_PictureExperimentPart + "/pictureExperimentItem/" + big_url + "." + fileSuffix + ",";
		}else{

		}
		
		
		//查询材料类别列表
		List<Map> CategoryExperimentPart = experimentItemService.queryCategoryExperimentPartList();
		
		List<Map> categoryMaterialExperimentPartList1 = experimentItemService.queryCategoryMaterialExperimentPartList();
		mv.addObject("categoryMaterialExperimentPartList", categoryMaterialExperimentPartList1);
		
		
		mv.addObject("array_PictureExperimentPart", array_PictureExperimentPart);
		mv.addObject("array_InformDetailExperimentPart", array_InformDetailExperimentPart);
		mv.addObject("array_InformDetailExperimentPart_name", array_InformDetailExperimentPart_name);
		mv.addObject("array_PartExperimentPart", array_PartExperimentPart);
		mv.addObject("array_PartExperimentPart_name", array_PartExperimentPart_name);
		
		mv.addObject("ExperimentItem",ExperimentItem);
		mv.addObject("CategoryExperimentPart", CategoryExperimentPart);
		
		mv.setViewName("/WEB-INF/experimentControl/experimentItem/experimentItem_edit");
		
		return mv;
	
	}
	
	@RequestMapping(value="/saveInformDetailExperimentPart")
	public ModelAndView saveInformDetailExperimentPart(
			String id_experimentPart, 
			String array_PictureExperimentPart, 
			String array_InformDetailExperimentPart,
			String array_InformDetailExperimentPart_name,  
			String array_PartExperimentPart,String array_PartExperimentPart_name,
			String nameExperimentPart, String numberExperimentPart, String typeExperimentPart, 
			String numberMaterialExperimentPart, String categoryMaterialExperimentPart,String remarkExperimentPart,
			@RequestParam(value="InformDetailExperimentPart",required=false)CommonsMultipartFile InformDetailExperimentPart ,
			HttpServletRequest request  ) throws Exception{
		
		Map ExperimentItem = new HashMap();
		
		ExperimentItem.put("id_experimentPart", id_experimentPart);
		ExperimentItem.put("nameExperimentPart", nameExperimentPart);	
		ExperimentItem.put("numberExperimentPart", numberExperimentPart);
		
		Map temp = new HashMap();
		temp.put("name_typeExperimentPart", typeExperimentPart);
		Map categoryTypeExperimentPart = experimentItemService.queryCategoryTypeExperimentPartByName(temp);
		if(categoryTypeExperimentPart!=null || "".equals(categoryTypeExperimentPart)){
			ExperimentItem.put("typeExperimentPart", categoryTypeExperimentPart.get("id_typeExperimentPart"));
		}

		ExperimentItem.put("numberMaterialExperimentPart", numberMaterialExperimentPart);
		
		Map temp1 = new HashMap();
		temp1.put("name_CategoryMaterialExperimentPart", categoryMaterialExperimentPart);
		Map categoryMaterialExperimentPartList = experimentItemService.queryCategoryMaterialExperimentPartListByName(temp1);
		if(categoryMaterialExperimentPartList!=null || "".equals(categoryMaterialExperimentPartList)){
			ExperimentItem.put("categoryMaterialExperimentPart", categoryMaterialExperimentPartList.get("id_CategoryMaterialExperimentPart"));
		}
		
		ExperimentItem.put("remarkExperimentPart", remarkExperimentPart);
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureBTADrillMap = new HashMap(); 
		
		String OriginalFilename = InformDetailExperimentPart.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informDetailExperimentPart/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			InformDetailExperimentPart.transferTo(materials_big_img_file); 
			PictureBTADrillMap.put("url_informDetailExperimentPart", "/informDetailExperimentPart/" + big_url + "." + fileSuffix);
			PictureBTADrillMap.put("id_experimentPart", id_experimentPart);
			array_InformDetailExperimentPart = array_InformDetailExperimentPart + "/informDetailExperimentPart/" + big_url + "." + fileSuffix + ",";
			array_InformDetailExperimentPart_name = array_InformDetailExperimentPart_name + OriginalFilename + ",";
		}else{

		}
	
		//查询材料类别列表
		List<Map> CategoryExperimentPart = experimentItemService.queryCategoryExperimentPartList();
		
		List<Map> categoryMaterialExperimentPartList1 = experimentItemService.queryCategoryMaterialExperimentPartList();
		mv.addObject("categoryMaterialExperimentPartList", categoryMaterialExperimentPartList1);
				
		mv.addObject("array_PictureExperimentPart", array_PictureExperimentPart);
		mv.addObject("array_InformDetailExperimentPart", array_InformDetailExperimentPart);
		mv.addObject("array_InformDetailExperimentPart_name", array_InformDetailExperimentPart_name);
		mv.addObject("array_PartExperimentPart", array_PartExperimentPart);
		mv.addObject("array_PartExperimentPart_name", array_PartExperimentPart_name);
		
		mv.addObject("ExperimentItem",ExperimentItem);
		mv.addObject("CategoryExperimentPart", CategoryExperimentPart);
				
		mv.setViewName("/WEB-INF/experimentControl/experimentItem/experimentItem_edit");
				
		return mv;
		
	}
	
	
	
	@RequestMapping(value="/savePartExperimentPart")
	public ModelAndView savePartExperimentPart(
			String id_experimentPart, 
			String array_PictureExperimentPart, 
			String array_InformDetailExperimentPart,
			String array_InformDetailExperimentPart_name,  
			String array_PartExperimentPart,String array_PartExperimentPart_name,
			String nameExperimentPart, String numberExperimentPart, String typeExperimentPart, 
			String numberMaterialExperimentPart, String categoryMaterialExperimentPart,String remarkExperimentPart,
			@RequestParam(value="PartExperimentPart",required=false)CommonsMultipartFile PartExperimentPart ,
			HttpServletRequest request  ) throws Exception{
		
		Map ExperimentItem = new HashMap();
		
		ExperimentItem.put("id_experimentPart", id_experimentPart);
		ExperimentItem.put("nameExperimentPart", nameExperimentPart);	
		ExperimentItem.put("numberExperimentPart", numberExperimentPart);
		
		Map temp = new HashMap();
		temp.put("name_typeExperimentPart", typeExperimentPart);
		Map categoryTypeExperimentPart = experimentItemService.queryCategoryTypeExperimentPartByName(temp);
		if(categoryTypeExperimentPart!=null || "".equals(categoryTypeExperimentPart)){
			ExperimentItem.put("typeExperimentPart", categoryTypeExperimentPart.get("id_typeExperimentPart"));
		}

		ExperimentItem.put("numberMaterialExperimentPart", numberMaterialExperimentPart);
		
		Map temp1 = new HashMap();
		temp1.put("name_CategoryMaterialExperimentPart", categoryMaterialExperimentPart);
		Map categoryMaterialExperimentPartList = experimentItemService.queryCategoryMaterialExperimentPartListByName(temp1);
		if(categoryMaterialExperimentPartList!=null || "".equals(categoryMaterialExperimentPartList)){
			ExperimentItem.put("categoryMaterialExperimentPart", categoryMaterialExperimentPartList.get("id_CategoryMaterialExperimentPart"));
		}
		
		ExperimentItem.put("remarkExperimentPart", remarkExperimentPart);
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureBTADrillMap = new HashMap(); 
		
		String OriginalFilename = PartExperimentPart.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/partExperimentPart/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			PartExperimentPart.transferTo(materials_big_img_file); 
			PictureBTADrillMap.put("url_informDetailExperimentPart", "/partExperimentPart/" + big_url + "." + fileSuffix);
			PictureBTADrillMap.put("id_experimentPart", id_experimentPart);
			array_PartExperimentPart = array_PartExperimentPart + "/partExperimentPart/" + big_url + "." + fileSuffix + ",";
			array_PartExperimentPart_name = array_PartExperimentPart_name + OriginalFilename + ",";
		}else{

		}
	
		//查询材料类别列表
		List<Map> CategoryExperimentPart = experimentItemService.queryCategoryExperimentPartList();
		
		List<Map> categoryMaterialExperimentPartList1 = experimentItemService.queryCategoryMaterialExperimentPartList();
		mv.addObject("categoryMaterialExperimentPartList", categoryMaterialExperimentPartList1);
				
		mv.addObject("array_PictureExperimentPart", array_PictureExperimentPart);
		mv.addObject("array_InformDetailExperimentPart", array_InformDetailExperimentPart);
		mv.addObject("array_InformDetailExperimentPart_name", array_InformDetailExperimentPart_name);
		mv.addObject("array_PartExperimentPart", array_PartExperimentPart);
		mv.addObject("array_PartExperimentPart_name", array_PartExperimentPart_name);
		
		mv.addObject("ExperimentItem",ExperimentItem);
		mv.addObject("CategoryExperimentPart", CategoryExperimentPart);
				
		mv.setViewName("/WEB-INF/experimentControl/experimentItem/experimentItem_edit");
				
		return mv;
		
	}
	
	@ResponseBody
	@RequestMapping("deleteExperimentItemList")
	public String deleteExperimentItemList(String id_experimentPart){
		Map para = new HashMap();
		para.put("id_experimentPart", id_experimentPart);
		try {
			experimentItemService.clearPictureExperimentItemByIdMaterial(para);
			
			experimentItemService.clearInformDetailExperimentItemById(para);
			
			experimentItemService.clearPartExperimentPartByIdMaterial(para);
			
			experimentItemService.deleteExperimentItemList(para);
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}	
		return "1";
	}
	
	
	
	@RequestMapping("loadingTool")
	public ModelAndView loadingTool(String id_experimentPart, 
			String array_PictureExperimentPart, 
			String array_InformDetailExperimentPart,
			String array_InformDetailExperimentPart_name,  
			String array_PartExperimentPart,String array_PartExperimentPart_name,
			String nameExperimentPart, String numberExperimentPart, String typeExperimentPart, 
			String numberMaterialExperimentPart, String categoryMaterialExperimentPart,String remarkExperimentPart,
			Page page , String NameMaterial, String NumberMaterial, String id_CategoryMaterial,
			 String ISOCuttingMaterial,String CategoryMaterial,String CompanyMaterial
			 ){
		
			ModelAndView mv = new ModelAndView();
			
			Map ExperimentItem = new HashMap();
		
			ExperimentItem.put("id_experimentPart", id_experimentPart);
			ExperimentItem.put("nameExperimentPart", nameExperimentPart);
			ExperimentItem.put("numberExperimentPart", numberExperimentPart);
			ExperimentItem.put("typeExperimentPart", typeExperimentPart);
			ExperimentItem.put("numberMaterialExperimentPart", numberMaterialExperimentPart);
			ExperimentItem.put("categoryMaterialExperimentPart", categoryMaterialExperimentPart);
			ExperimentItem.put("remarkExperimentPart", remarkExperimentPart);
			
			mv.addObject("array_PictureExperimentPart", array_PictureExperimentPart);
			mv.addObject("array_InformDetailExperimentPart", array_InformDetailExperimentPart);
			mv.addObject("array_InformDetailExperimentPart_name", array_InformDetailExperimentPart_name);
			mv.addObject("array_PartExperimentPart", array_PartExperimentPart);
			mv.addObject("array_PartExperimentPart_name", array_PartExperimentPart_name);
			
			mv.addObject("ExperimentItem", ExperimentItem);
			
			try{
				PageData pd = new PageData();
				pd.put("NameMaterial", NameMaterial);
				pd.put("NumberMaterial", NumberMaterial);
				pd.put("id_CategoryMaterial", id_CategoryMaterial);
				pd.put("ISOCuttingMaterial", ISOCuttingMaterial);
				pd.put("CategoryMaterial", CategoryMaterial);
				pd.put("CompanyMaterial", CompanyMaterial);
				
				page.setPd(pd);
				Map map	= materialService.queryMaterialList(page);//查询标准机床信息页面
				page = (Page)map.get("page");
				List<Map> list = (List<Map>)map.get("list");
				
				//查询类别列表
				List<Map> categoryMaterialList = materialService.queryCategoryMaterialList();
				mv.addObject("categoryMaterialList", categoryMaterialList);
				mv.addObject("materialList", list);
				mv.addObject("pd", pd);
				mv.addObject("page", page);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			
			mv.setViewName("/WEB-INF/experimentControl/experimentItem/experimentItem_loadingTool");

			return mv ;
	}
	
	
	@RequestMapping(value="/goLoading")
	public ModelAndView goLoading(HttpServletRequest request,String id){
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		Map ExperimentItem = new HashMap();
		ExperimentItem.put("id_experimentPart", pd.get("id_experimentPart"));	
		ExperimentItem.put("nameExperimentPart", pd.get("nameExperimentPart"));
		ExperimentItem.put("numberExperimentPart", pd.get("numberExperimentPart"));
		Map temp = new HashMap();
		temp.put("name_typeExperimentPart", pd.get("typeExperimentPart"));
		Map categoryTypeExperimentPart = experimentItemService.queryCategoryTypeExperimentPartByName(temp);
		if(categoryTypeExperimentPart!=null || "".equals(categoryTypeExperimentPart)){
			ExperimentItem.put("typeExperimentPart", categoryTypeExperimentPart.get("id_typeExperimentPart"));
		}
		ExperimentItem.put("numberMaterialExperimentPart", pd.get("numberMaterialExperimentPart"));
		
		Map temp1 = new HashMap();
		temp1.put("name_CategoryMaterialExperimentPart", pd.get("categoryMaterialExperimentPart"));
		Map categoryMaterialExperimentPartList = experimentItemService.queryCategoryMaterialExperimentPartListByName(temp1);
		if(categoryMaterialExperimentPartList!=null || "".equals(categoryMaterialExperimentPartList)){
			ExperimentItem.put("categoryMaterialExperimentPart", categoryMaterialExperimentPartList.get("id_CategoryMaterialExperimentPart"));
		}
		
		ExperimentItem.put("remarkExperimentPart", pd.get("remarkExperimentPart"));
		
		mv.addObject("array_PictureExperimentPart", pd.get("array_PictureExperimentPart"));
		mv.addObject("array_InformDetailExperimentPart", pd.get("array_InformDetailExperimentPart"));
		mv.addObject("array_InformDetailExperimentPart_name", pd.get("array_InformDetailExperimentPart_name"));
		mv.addObject("array_PartExperimentPart", pd.get("array_PartExperimentPart"));
		mv.addObject("array_PartExperimentPart_name", pd.get("array_PartExperimentPart_name"));
		
		mv.addObject("ExperimentItem",ExperimentItem);
		System.out.println(11+","+ExperimentItem);
		//查询材料类别列表
		List<Map> CategoryExperimentPart = experimentItemService.queryCategoryExperimentPartList();
		mv.addObject("CategoryExperimentPart", CategoryExperimentPart);
		List<Map> categoryMaterialExperimentPartList1 = experimentItemService.queryCategoryMaterialExperimentPartList();
		mv.addObject("categoryMaterialExperimentPartList", categoryMaterialExperimentPartList1);
		System.out.println(categoryMaterialExperimentPartList1);
		
		//查询类别列表
		List<Map> categorymaterial = materialService.queryCategoryMaterialList();
		Map para = new HashMap();
		
		para.put("id_Material", id);
		Map Material = materialService.queryMaterialById(para);//查询标准机床
		Integer id_CategoryMaterial = Integer.valueOf((String) Material.get("id_CategoryMaterial"));
		String name_CategoryMaterial = "";
		for(int i=0;i<categorymaterial.size();i++){
			Map map = categorymaterial.get(i);
			if((map.get("id_CategoryMaterial")).equals(id_CategoryMaterial)){
				name_CategoryMaterial = (String) map.get("name_CategoryMaterial");
				System.out.println(name_CategoryMaterial);
			}
		}
		
		mv.addObject("name_CategoryMaterial",name_CategoryMaterial);
		mv.addObject("Material", Material);
		
		mv.setViewName("/WEB-INF/experimentControl/experimentItem/experimentItem_edit");
		return mv;
	}
	
	
	
	
	
	
	
}
