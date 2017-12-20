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
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
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
import com.qf.util.file.ByteToFile;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/experimentItemApp")
public class experimentItemAppController extends BaseController{

	
	@Resource(name="experimentItemService")
	private experimentItemService experimentItemService;
	
	
	@Resource(name="materialService")
    private MaterialService materialService; 
	/*
	 * 查询试验件列表
	 */
	@ResponseBody
	@RequestMapping(value = "experimentItemList",produces = "application/json; charset=utf-8")
	public String experimentItemList(int pageNo, int pageSize,
			 String nameExperimentPart, String numberExperimentPart, String typeExperimentPart,
			 String numberMaterialExperimentPart,String categoryMaterialExperimentPart){
		ModelAndView mv=new ModelAndView();
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		try{
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("nameExperimentPart", nameExperimentPart);
			pd.put("numberExperimentPart", numberExperimentPart);
			pd.put("typeExperimentPart", typeExperimentPart);
			pd.put("numberMaterialExperimentPart", numberMaterialExperimentPart);
			pd.put("categoryMaterialExperimentPart", categoryMaterialExperimentPart);
			
			page.setPd(pd);
			map	= experimentItemService.queryExperimentItemList(page);//查询零件页面
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
				Map pageMap = new HashMap();
				int pageCount = page.getPageCount();
				pageMap.put("pageCount", pageCount);
				resultmap.put("page", pageMap);
			}else{
				Map pageMap = new HashMap();
				pageMap.put("pageCount", 0);
				resultmap.put("page", pageMap);
			}
			
			List<Map> CategoryExperimentPart = experimentItemService.queryCategoryExperimentPartList();
			
			List<Map> categoryMaterialExperimentPartList = experimentItemService.queryCategoryMaterialExperimentPartList();
			
			resultmap.put("CategoryExperimentPart", CategoryExperimentPart);
			resultmap.put("categoryMaterialExperimentPartList", categoryMaterialExperimentPartList);
			resultmap.put("result", "1");
			resultmap.put("list", list);
		}catch (Exception e) {
			e.printStackTrace();
			resultmap.put("result", "0");
		}
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
	
	
	/** 
	 * 去添加
	 */
	
	@ResponseBody
	@RequestMapping(value="/goAddExperimentPart" ,produces = "application/json; charset=utf-8")
	public String goAddExperimentPart(String id)throws Exception{
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
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
			
			resultmap.put("result", "1");
			resultmap.put("array_PictureExperimentPart", array_PictureExperimentPart);
			resultmap.put("array_InformDetailExperimentPart", array_InformDetailExperimentPart);
			resultmap.put("array_InformDetailExperimentPart_name", array_InformDetailExperimentPart_name);
			resultmap.put("array_PartExperimentPart", array_PartExperimentPart);
			resultmap.put("array_PartExperimentPart_name", array_PartExperimentPart_name);
		}
		
		//查询类别列表
		List<Map> CategoryExperimentPart = experimentItemService.queryCategoryExperimentPartList();
		resultmap.put("CategoryExperimentPart", CategoryExperimentPart);
				
		List<Map> categoryMaterialExperimentPartList = experimentItemService.queryCategoryMaterialExperimentPartList();
		resultmap.put("categoryMaterialExperimentPartList", categoryMaterialExperimentPartList);
		
		resultmap.put("ExperimentItem", ExperimentItem);
		
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	/**
	 * 添加/修改
	 */
	
	@ResponseBody
	@RequestMapping(value = "/saveExperimentPart", produces = "application/json; charset=utf-8")
	public String saveExperimentPart(String user_id, 
			int id_experimentPart, 
			String array_PictureExperimentPart, 
			String array_InformDetailExperimentPart,
			String array_InformDetailExperimentPart_name,  
			String array_PartExperimentPart,String array_PartExperimentPart_name,
			String nameExperimentPart, String numberExperimentPart, String typeExperimentPart, 
			String numberMaterialExperimentPart, String categoryMaterialExperimentPart, String remarkExperimentPart) {
	
		String json  = "";  
		Map resultmap = new HashMap();
		
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
		para.put("user_id", user_id);
		
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
				
				for(int i=0; i<array_PartExperimentParts.length; i++){
					if(array_PartExperimentParts[i] != null && !"".equals(array_PartExperimentParts[i])){
						para.put("url_partExperimentPart", array_PartExperimentParts[i]);
						para.put("name_partExperimentPart", array_PartExperimentParts_name[i]);
						experimentItemService.savePartExperimentPart(para);
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
	 * 保存图片
	 */
	
	@ResponseBody
	@RequestMapping(value="/savePictureExperimentItem", produces = "application/json; charset=utf-8")
	public String savePictureExperimentItem(String id_experimentPart, 
			String array_PictureExperimentPart, 
			String array_InformDetailExperimentPart,
			String array_InformDetailExperimentPart_name,  
			String array_PartExperimentPart,String array_PartExperimentPart_name,
			String PictureExperimentPart ,String fileSuffix, String filename) throws Exception{
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		String json  = "";  
		Map resultmap = new HashMap();
	
		if(PictureExperimentPart != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureExperimentItem/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/pictureExperimentItem/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PictureExperimentPart,  filepath2);
			array_PictureExperimentPart = array_PictureExperimentPart + "/pictureExperimentItem/" + big_url + "." + fileSuffix + ",";
		}
		
		List<Map> CategoryExperimentPart = experimentItemService.queryCategoryExperimentPartList();
		
		List<Map> categoryMaterialExperimentPartList1 = experimentItemService.queryCategoryMaterialExperimentPartList();
				
		resultmap.put("result", "1");
		resultmap.put("array_PictureExperimentPart", array_PictureExperimentPart);
		resultmap.put("array_InformDetailExperimentPart", array_InformDetailExperimentPart);
		resultmap.put("array_InformDetailExperimentPart_name", array_InformDetailExperimentPart_name);
		resultmap.put("array_PartExperimentPart", array_PartExperimentPart);
		resultmap.put("array_PartExperimentPart_name", array_PartExperimentPart_name);
		
		resultmap.put("CategoryExperimentPart", CategoryExperimentPart);
		resultmap.put("categoryMaterialExperimentPartList", categoryMaterialExperimentPartList1);
		
		json = JackJson.fromObjectToJson(resultmap);
		
		return json;
	}
	
	@ResponseBody
	@RequestMapping(value="/saveInformDetailExperimentPart", produces = "application/json; charset=utf-8")
	public String saveInformDetailExperimentPart(String id_experimentPart, 
			String array_PictureExperimentPart, 
			String array_InformDetailExperimentPart,
			String array_InformDetailExperimentPart_name,  
			String array_PartExperimentPart,String array_PartExperimentPart_name,
			String InformDetailExperimentPart ,String fileSuffix, String filename) throws Exception{
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		String json  = "";  
		Map resultmap = new HashMap();
	
		if(InformDetailExperimentPart != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informDetailExperimentPart/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/informDetailExperimentPart/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(InformDetailExperimentPart,  filepath2);
			array_InformDetailExperimentPart = array_InformDetailExperimentPart + "/informDetailExperimentPart/" + big_url + "." + fileSuffix + ",";
			array_InformDetailExperimentPart_name = array_InformDetailExperimentPart_name + filename + ",";
		}
		
		//查询材料类别列表
		List<Map> CategoryExperimentPart = experimentItemService.queryCategoryExperimentPartList();
				
		List<Map> categoryMaterialExperimentPartList1 = experimentItemService.queryCategoryMaterialExperimentPartList();
				
		resultmap.put("result", "1");
		resultmap.put("array_PictureExperimentPart", array_PictureExperimentPart);
		resultmap.put("array_InformDetailExperimentPart", array_InformDetailExperimentPart);
		resultmap.put("array_InformDetailExperimentPart_name", array_InformDetailExperimentPart_name);
		resultmap.put("array_PartExperimentPart", array_PartExperimentPart);
		resultmap.put("array_PartExperimentPart_name", array_PartExperimentPart_name);
		
		resultmap.put("CategoryExperimentPart", CategoryExperimentPart);
		resultmap.put("categoryMaterialExperimentPartList", categoryMaterialExperimentPartList1);
		
		json = JackJson.fromObjectToJson(resultmap);
		
		return json;
	}
	
	@ResponseBody
	@RequestMapping(value="/savePartExperimentPart", produces = "application/json; charset=utf-8")
	public String savePartExperimentPart(String id_experimentPart, 
			String array_PictureExperimentPart, 
			String array_InformDetailExperimentPart,
			String array_InformDetailExperimentPart_name,  
			String array_PartExperimentPart,String array_PartExperimentPart_name, 
			String PartExperimentPart ,String fileSuffix, String filename) throws Exception{
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		String json  = "";  
		Map resultmap = new HashMap();
	
		if(PartExperimentPart != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informDetailMachineNodeInform/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/informDetailMachineNodeInform/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PartExperimentPart,  filepath2);
			array_PartExperimentPart = array_PartExperimentPart + "/informDetailMachineNodeInform/" + big_url + "." + fileSuffix + ",";
			array_PartExperimentPart_name = array_PartExperimentPart_name + filename + ",";
		}
		
		//查询类别列表
		List<Map> CategoryExperimentPart = experimentItemService.queryCategoryExperimentPartList();
		
		List<Map> categoryMaterialExperimentPartList1 = experimentItemService.queryCategoryMaterialExperimentPartList();
				
		resultmap.put("result", "1");
		resultmap.put("array_PictureExperimentPart", array_PictureExperimentPart);
		resultmap.put("array_InformDetailExperimentPart", array_InformDetailExperimentPart);
		resultmap.put("array_InformDetailExperimentPart_name", array_InformDetailExperimentPart_name);
		resultmap.put("array_PartExperimentPart", array_PartExperimentPart);
		resultmap.put("array_PartExperimentPart_name", array_PartExperimentPart_name);
		
		resultmap.put("CategoryExperimentPart", CategoryExperimentPart);
		resultmap.put("categoryMaterialExperimentPartList", categoryMaterialExperimentPartList1);
		
		json = JackJson.fromObjectToJson(resultmap);
		
		return json;
	}
	
	
	/**
	 * 删除标准机床信息
	 */
	
	@ResponseBody
	@RequestMapping(value = "/deleteExperimentItemList", produces = "application/json; charset=utf-8")
	public String deleteExperimentItemList(String id_experimentPart) {
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		para.put("id_experimentPart", id_experimentPart);
		try {
			experimentItemService.clearPictureExperimentItemByIdMaterial(para);
			
			experimentItemService.clearInformDetailExperimentItemById(para);
			
			experimentItemService.clearPartExperimentPartByIdMaterial(para);
			
			experimentItemService.deleteExperimentItemList(para);
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
			String NameMaterial, String NumberMaterial, String id_CategoryMaterial,
			String ISOCuttingMaterial,String CategoryMaterial,String CompanyMaterial
			 ){
			String json  = "";  
			Map resultmap = new HashMap();
			Map map	= null;
			
			try{
				Page page = new Page(pageNo, pageSize);
				PageData pd = new PageData();
				pd.put("NameMaterial", NameMaterial);
				pd.put("NumberMaterial", NumberMaterial);
				pd.put("id_CategoryMaterial", id_CategoryMaterial);
				pd.put("ISOCuttingMaterial", ISOCuttingMaterial);
				pd.put("CategoryMaterial", CategoryMaterial);
				pd.put("CompanyMaterial", CompanyMaterial);
				
				page.setPd(pd);
				map	= materialService.queryMaterialList(page);//查询标准机床信息页面
				page = (Page)map.get("page");
				List<Map> list = (List<Map>)map.get("list");
				
				//查询材料类别列表
				List<Map> categoryMaterialList = materialService.queryCategoryMaterialList();
				resultmap.put("categoryMaterialList", categoryMaterialList);
				resultmap.put("materialList", list);
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
		
		String NumberMaterial = (String) Material.get("NumberMaterial");
		
		resultmap.put("NumberMaterial",NumberMaterial);
		resultmap.put("name_CategoryMaterial",name_CategoryMaterial);
		resultmap.put("materialList", Material);
		resultmap.put("categoryMaterialList", categorymaterial);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	
	
	
	
	
}
