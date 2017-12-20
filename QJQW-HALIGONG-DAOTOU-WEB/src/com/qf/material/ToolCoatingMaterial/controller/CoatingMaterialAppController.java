package com.qf.material.ToolCoatingMaterial.controller;

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

import com.qf.material.ToolCoatingMaterial.service.CoatingMaterialService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.common.JackJson;
import com.qf.util.controller.BaseController;
import com.qf.util.file.ByteToFile;
import com.qf.util.page.Page;


@Controller
@RequestMapping("/CoatingMaterialApp")
public class CoatingMaterialAppController extends BaseController{

	@Resource(name="coatingMaterialService")
	private CoatingMaterialService coatingMaterialService;
	
	
	
	/**
	 * 涂层材料列表
	 * @param page
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/queryCoatingMaterialList", produces = "application/json; charset=utf-8")
	public String queryCoatingMaterialList(int pageNo, int pageSize, 
			String NameToolCoating, String NumberToolCoating, String CategoryToolCoating, 
			String ProcessingToolCoating, String CompanyToolCoating){
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		try {
			
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("NameToolCoating", NameToolCoating);
			pd.put("NumberToolCoating", NumberToolCoating);
			pd.put("CategoryToolCoating", CategoryToolCoating);
			pd.put("ProcessingToolCoating", ProcessingToolCoating);
			pd.put("CompanyToolCoating", CompanyToolCoating);
			
			page.setPd(pd);
			map	= coatingMaterialService.queryCoatingMaterialList(page);//查询涂层材料列表
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			if(list != null && list.size() > 0){
				for(int i = 0; i < list.size(); i++){
					Map coatingMaterial = list.get(i);
					int id_ToolCoatingMaterial = (int) coatingMaterial.get("id_ToolCoatingMaterial");
					
					Map para = new HashMap();
					para.put("id_ToolCoatingMaterial", id_ToolCoatingMaterial);
					
					//查询涂层材料图片列表 PictureCoatingMaterial
					List<Map> pictureCoatingMaterialList = coatingMaterialService.queryPictureCoatingMaterialList(para);
					//查询涂层详细信息列表 InformDetailCoatingMaterial
					List<Map> informDetailCoatingMaterialList = coatingMaterialService.queryInformDetailCoatingMaterialList(para);
					//查询涂层应用实例列表 ApplicationCoatingMaterial
					List<Map> applicationCoatingMaterialList = coatingMaterialService.queryApplicationCoatingMaterialList(para);
					
					coatingMaterial.put("pictureCoatingMaterialList", pictureCoatingMaterialList);
					coatingMaterial.put("informDetailCoatingMaterialList", informDetailCoatingMaterialList);
					coatingMaterial.put("applicationCoatingMaterialList", applicationCoatingMaterialList);
					
					//查询材料主要成分列表
					String ISOToolCoating_str = (String) coatingMaterial.get("ISOToolCoating");
					List<Map> ISOToolCoatingList = new ArrayList();
					if(ISOToolCoating_str != null && !"".equals(ISOToolCoating_str)){
						String ConstituentsMaterials[] = ISOToolCoating_str.split(",");
						for(int j=0;j<ConstituentsMaterials.length;j++){
							if(ConstituentsMaterials[j] != null && !"".equals(ConstituentsMaterials[j])){
								String yuansu = ConstituentsMaterials[j].split("-")[0];
								String baifenbi = ConstituentsMaterials[j].split("-")[1];
								Map temp = new HashMap();
								temp.put("yuansu", yuansu);
								temp.put("baifenbi", baifenbi);
								ISOToolCoatingList.add(temp);
							}
						}
						coatingMaterial.put("ISOToolCoatingList", ISOToolCoatingList);	
					}
					
					list.set(i, coatingMaterial);
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
			List<Map> categoryToolCoatingList = coatingMaterialService.queryCategoryToolCoatingList();
			
			resultmap.put("result", "1");
			resultmap.put("list", list);
			resultmap.put("categoryToolCoatingList", categoryToolCoatingList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map para = new HashMap();
		para.put("NameToolCoating", NameToolCoating);
		para.put("NumberToolCoating", NumberToolCoating);
		para.put("CategoryToolCoating", CategoryToolCoating);
		para.put("ProcessingToolCoating", ProcessingToolCoating);
		para.put("CompanyToolCoating", CompanyToolCoating);
		resultmap.put("para", para);
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	
	/**
	 * 去添加涂层材料
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "goAddCoatingMaterial", produces = "application/json; charset=utf-8")
	public String goAddCoatingMaterial(String id)throws Exception{
		String json  = "";  
		Map resultmap = new HashMap();
		Map CoatingMaterial	= null;
		
		Map para = new HashMap();
		para.put("id_ToolCoatingMaterial", id);
		CoatingMaterial = coatingMaterialService.queryCoatingMaterialById(para);
		
		if(CoatingMaterial != null){
			//查询图片列表 
			List<Map> pictureCoatingMaterialList = coatingMaterialService.queryPictureCoatingMaterialList(para);
			String array_PictureCoatingMaterial = "";
			if(pictureCoatingMaterialList != null && pictureCoatingMaterialList.size() > 0){
				for(int i = 0; i < pictureCoatingMaterialList.size(); i++){
					array_PictureCoatingMaterial = array_PictureCoatingMaterial + pictureCoatingMaterialList.get(i).get("url_PictureToolCoating") + ",";
				}
			}

			//查询详细信息列表
			List<Map> informDetailCoatingMaterialList = coatingMaterialService.queryInformDetailCoatingMaterialList(para);
			String array_InformDetailCoatingMaterial = "";
			String array_InformDetailCoatingMaterial_name = "";
			if(informDetailCoatingMaterialList != null && informDetailCoatingMaterialList.size() > 0){
				for(int i = 0; i < informDetailCoatingMaterialList.size(); i++){
					array_InformDetailCoatingMaterial = array_InformDetailCoatingMaterial + informDetailCoatingMaterialList.get(i).get("url_InformDetailToolCoating") + ",";
					array_InformDetailCoatingMaterial_name = array_InformDetailCoatingMaterial_name + informDetailCoatingMaterialList.get(i).get("name_InformDetailToolCoating") + ",";
				}
			}
			
			//查询应用实例列表
			List<Map> applicationCoatingMaterial = coatingMaterialService.queryApplicationCoatingMaterialList(para);
			String array_ApplicationCoatingMaterial = "";
			String array_ApplicationCoatingMaterial_name = "";
			if(applicationCoatingMaterial != null && applicationCoatingMaterial.size() > 0){
				for(int i = 0; i < applicationCoatingMaterial.size(); i++){
					array_ApplicationCoatingMaterial = array_ApplicationCoatingMaterial + applicationCoatingMaterial.get(i).get("url_ApplicationToolCoating") + ",";
					array_ApplicationCoatingMaterial_name = array_ApplicationCoatingMaterial_name + applicationCoatingMaterial.get(i).get("name_ApplicationToolCoating") + ",";
				}
			}
			
			//查询材料主要成分列表
			String ISOToolCoating_str = (String) CoatingMaterial.get("ISOToolCoating");
			List<Map> ISOToolCoatingList = new ArrayList();
			if(ISOToolCoating_str != null && !"".equals(ISOToolCoating_str)){
				String ConstituentsMaterials[] = ISOToolCoating_str.split(",");
				for(int j=0;j<ConstituentsMaterials.length;j++){
					if(ConstituentsMaterials[j] != null && !"".equals(ConstituentsMaterials[j])){
						String yuansu = ConstituentsMaterials[j].split("-")[0];
						String baifenbi = ConstituentsMaterials[j].split("-")[1];
						Map temp = new HashMap();
						temp.put("yuansu", yuansu);
						temp.put("baifenbi", baifenbi);
						ISOToolCoatingList.add(temp);
					}
				}
				CoatingMaterial.put("ISOToolCoatingList", ISOToolCoatingList);	
			}
			CoatingMaterial.put("pictureCoatingMaterialList", pictureCoatingMaterialList);
			CoatingMaterial.put("informDetailCoatingMaterialList", informDetailCoatingMaterialList);
			CoatingMaterial.put("applicationCoatingMaterial", applicationCoatingMaterial);
			
			resultmap.put("result", "1");
			resultmap.put("array_PictureCoatingMaterial", array_PictureCoatingMaterial);
			resultmap.put("array_InformDetailCoatingMaterial", array_InformDetailCoatingMaterial);
			resultmap.put("array_InformDetailCoatingMaterial_name", array_InformDetailCoatingMaterial_name);
			resultmap.put("array_ApplicationCoatingMaterial", array_ApplicationCoatingMaterial);
			resultmap.put("array_ApplicationCoatingMaterial_name", array_ApplicationCoatingMaterial_name);
			
		}
		
		//查询材料类别列表
		List<Map> categoryToolCoatingList = coatingMaterialService.queryCategoryToolCoatingList();
		
		resultmap.put("CoatingMaterial", CoatingMaterial);
		resultmap.put("categoryToolCoatingList", categoryToolCoatingList);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	
	/**
	 * 保存/修改涂层材料
	 * @param user_id
	 * @param id_ToolCoatingMaterial
	 * @param array_PictureCoatingMaterial
	 * @param array_InformDetailCoatingMaterial
	 * @param array_InformDetailCoatingMaterial_name
	 * @param array_ApplicationCoatingMaterial
	 * @param array_ApplicationCoatingMaterial_name
	 * @param NameToolCoating
	 * @param NumberToolCoating
	 * @param id_CategoryToolCoating
	 * @param ProcessingToolCoating
	 * @param CompanyToolCoating
	 * @param ISOToolCoating
	 * @param ColourToolCoating
	 * @param HardnessToolCoating
	 * @param ThicknessToolCoating
	 * @param FrictionToolCoating
	 * @param TemperatureToolCoating
	 * @param CharacterToolCoating
	 * @return
	 */
	
	
	@ResponseBody
	@RequestMapping(value = "/saveCoatingMaterial", produces = "application/json; charset=utf-8")
	public String saveCoatingMaterial(String user_id, 
			int id_ToolCoatingMaterial, 
			String array_PictureCoatingMaterial, 
			String array_InformDetailCoatingMaterial, String array_InformDetailCoatingMaterial_name,
			String array_ApplicationCoatingMaterial, String array_ApplicationCoatingMaterial_name, 
			String NameToolCoating, String NumberToolCoating, String CategoryToolCoating, String ProcessingToolCoating, String CompanyToolCoating,
			String ISOToolCoating, String ColourToolCoating, String HardnessToolCoating, String ThicknessToolCoating, String FrictionToolCoating,
			String TemperatureToolCoating, String CharacterToolCoating
			) {
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map para = new HashMap();
		
		para.put("id_ToolCoatingMaterial", id_ToolCoatingMaterial);
		para.put("NameToolCoating", NameToolCoating);
		para.put("NumberToolCoating", NumberToolCoating);
		
		Map temp = new HashMap();
		temp.put("name_CategoryToolCoating", CategoryToolCoating);
		Map categoryToolCoating = coatingMaterialService.queryCategoryToolCoatingByName(temp);
		if(categoryToolCoating!=null && !"".equals(categoryToolCoating)){
			para.put("CategoryToolCoating", categoryToolCoating.get("id_CategoryToolCoating"));
		}else{
			//保存新的材料类别
			coatingMaterialService.saveCategoryToolCoating(temp);
			para.put("CategoryToolCoating", temp.get("id_CategoryToolCoating"));
		}
		
		para.put("ProcessingToolCoating", ProcessingToolCoating);
		para.put("CompanyToolCoating", CompanyToolCoating);
		para.put("ISOToolCoating", ISOToolCoating);
		para.put("ColourToolCoating", ColourToolCoating);
		para.put("HardnessToolCoating", HardnessToolCoating);
		para.put("ThicknessToolCoating", ThicknessToolCoating);
		para.put("FrictionToolCoating", FrictionToolCoating);
		para.put("TemperatureToolCoating", TemperatureToolCoating);
		para.put("CharacterToolCoating", CharacterToolCoating);
		
		para.put("add_time", System.currentTimeMillis() / 1000);
		para.put("user_id", user_id);
		
		try {
			if(id_ToolCoatingMaterial != 0){//修改
				coatingMaterialService.updateCoatingMaterial(para);
			}else{//新增
				
				coatingMaterialService.saveCoatingMaterial(para);
			}
			//清空材料图片路径 PictureMaterial
			coatingMaterialService.clearPictureCoatingMaterialById(para);
			//保存图片
			if(array_PictureCoatingMaterial != null && !"".equals(array_PictureCoatingMaterial)){
				String array_PictureCoatingMaterials[] = array_PictureCoatingMaterial.split(",");
				for(int i=0; i<array_PictureCoatingMaterials.length; i++){
					if(array_PictureCoatingMaterials[i] != null && !"".equals(array_PictureCoatingMaterials[i])){
						para.put("url_PictureToolCoating", array_PictureCoatingMaterials[i]);
						coatingMaterialService.savePictureCoatingMaterial(para);
					}
				}
			}
			
			
			//清空详细信息路径
			coatingMaterialService.clearInformDetailCoatingMaterialById(para);
			//保存详细信息
			if(array_InformDetailCoatingMaterial != null && !"".equals(array_InformDetailCoatingMaterial)){
				String array_InformDetailCoatingMaterials[] = array_InformDetailCoatingMaterial.split(",");
				String array_InformDetailCoatingMaterials_name[] = array_InformDetailCoatingMaterial_name.split(",");
				for(int i=0; i<array_InformDetailCoatingMaterials.length; i++){
					if(array_InformDetailCoatingMaterials[i] != null && !"".equals(array_InformDetailCoatingMaterials[i])){
						para.put("url_InformDetailToolCoating", array_InformDetailCoatingMaterials[i]);
						para.put("name_InformDetailToolCoating", array_InformDetailCoatingMaterials_name[i]);
						coatingMaterialService.saveInformDetailCoatingMaterial(para);
					}
				}
			}
			
			//清空应用实例路径
			coatingMaterialService.clearApplicationCoatingMaterialById(para);
			//保存应用实例
			if(array_ApplicationCoatingMaterial != null && !"".equals(array_ApplicationCoatingMaterial)){
				String array_ApplicationCoatingMaterials[] = array_ApplicationCoatingMaterial.split(",");
				String array_ApplicationCoatingMaterials_name[] = array_ApplicationCoatingMaterial_name.split(",");
				for(int i=0; i<array_ApplicationCoatingMaterials.length; i++){
					if(array_ApplicationCoatingMaterials[i] != null && !"".equals(array_ApplicationCoatingMaterials[i])){
						para.put("url_ApplicationToolCoating", array_ApplicationCoatingMaterials[i]);
						para.put("name_ApplicationToolCoating", array_ApplicationCoatingMaterials_name[i]);
						coatingMaterialService.saveApplicationCoatingMaterial(para);
					}
				}
			}
		
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
	@RequestMapping(value = "savePictureCoatingMaterial", produces = "application/json; charset=utf-8")
	public String savePictureCoatingMaterial(
			String array_PictureCoatingMaterial, 
			String array_InformDetailCoatingMaterial, String array_InformDetailCoatingMaterial_name,
			String array_ApplicationCoatingMaterial, String array_ApplicationCoatingMaterial_name, 
			String PictureCoatingMaterial, String fileSuffix, String filename
			) throws Exception{
	
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		
		if(PictureCoatingMaterial != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureCoatingMaterial/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/pictureCoatingMaterial/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PictureCoatingMaterial,  filepath2);
			array_PictureCoatingMaterial = array_PictureCoatingMaterial + "/pictureCoatingMaterial/" + big_url + "." + fileSuffix + ",";
		}
		
	
		//查询材料类别列表
		List<Map> categoryToolCoatingList = coatingMaterialService.queryCategoryToolCoatingList();
		
		resultmap.put("result", "1");
		resultmap.put("array_PictureCoatingMaterial", array_PictureCoatingMaterial);
		resultmap.put("array_InformDetailCoatingMaterial", array_InformDetailCoatingMaterial);
		resultmap.put("array_InformDetailCoatingMaterial_name", array_InformDetailCoatingMaterial_name);
		resultmap.put("array_ApplicationCoatingMaterial", array_ApplicationCoatingMaterial);
		resultmap.put("array_ApplicationCoatingMaterial_name", array_ApplicationCoatingMaterial_name);
		
		resultmap.put("categoryToolCoatingList", categoryToolCoatingList);
		
		json = JackJson.fromObjectToJson(resultmap);

		return json;
	
	}
	
	
	@ResponseBody
	@RequestMapping(value = "saveInformDetailCoatingMaterial", produces = "application/json; charset=utf-8")
	public String saveInformDetailCoatingMaterial(
			String array_PictureCoatingMaterial, 
			String array_InformDetailCoatingMaterial, String array_InformDetailCoatingMaterial_name,
			String array_ApplicationCoatingMaterial, String array_ApplicationCoatingMaterial_name, 
			String InformDetailCoatingMaterial, String fileSuffix, String filename
			) throws Exception{
	
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		
		if(InformDetailCoatingMaterial != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informDetailCoatingMaterial/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/informDetailCoatingMaterial/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(InformDetailCoatingMaterial,  filepath2);
			array_InformDetailCoatingMaterial = array_InformDetailCoatingMaterial + "/informDetailCoatingMaterial/" + big_url + "." + fileSuffix + ",";
			array_InformDetailCoatingMaterial_name = array_InformDetailCoatingMaterial_name + filename + ",";
		}
		//查询材料类别列表
		List<Map> categoryToolCoatingList = coatingMaterialService.queryCategoryToolCoatingList();
		
		resultmap.put("result", "1");
		resultmap.put("array_PictureCoatingMaterial", array_PictureCoatingMaterial);
		resultmap.put("array_InformDetailCoatingMaterial", array_InformDetailCoatingMaterial);
		resultmap.put("array_InformDetailCoatingMaterial_name", array_InformDetailCoatingMaterial_name);
		resultmap.put("array_ApplicationCoatingMaterial", array_ApplicationCoatingMaterial);
		resultmap.put("array_ApplicationCoatingMaterial_name", array_ApplicationCoatingMaterial_name);
		
		resultmap.put("categoryToolCoatingList", categoryToolCoatingList);
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "saveApplicationCoatingMaterial", produces = "application/json; charset=utf-8")
	public String saveApplicationCoatingMaterial(
			String array_PictureCoatingMaterial, 
			String array_InformDetailCoatingMaterial, String array_InformDetailCoatingMaterial_name,
			String array_ApplicationCoatingMaterial, String array_ApplicationCoatingMaterial_name, 
			String ApplicationCoatingMaterial, String fileSuffix, String filename
			) throws Exception{
	
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		
		if(ApplicationCoatingMaterial != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/applicationCoatingMaterial/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/applicationCoatingMaterial/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(ApplicationCoatingMaterial,  filepath2);
			array_ApplicationCoatingMaterial = array_ApplicationCoatingMaterial + "/applicationCoatingMaterial/" + big_url + "." + fileSuffix + ",";
			array_ApplicationCoatingMaterial_name = array_ApplicationCoatingMaterial_name + filename + ",";
		}
		
		//查询材料类别列表
		List<Map> categoryToolCoatingList = coatingMaterialService.queryCategoryToolCoatingList();
		
		resultmap.put("result", "1");
		resultmap.put("array_PictureCoatingMaterial", array_PictureCoatingMaterial);
		resultmap.put("array_InformDetailCoatingMaterial", array_InformDetailCoatingMaterial);
		resultmap.put("array_InformDetailCoatingMaterial_name", array_InformDetailCoatingMaterial_name);
		resultmap.put("array_ApplicationCoatingMaterial", array_ApplicationCoatingMaterial);
		resultmap.put("array_ApplicationCoatingMaterial_name", array_ApplicationCoatingMaterial_name);
		
		resultmap.put("categoryToolCoatingList", categoryToolCoatingList);
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	
	}
	
	
	@ResponseBody
	@RequestMapping(value = "deleteCoatingMaterial" , produces = "application/json; charset=utf-8")
	public String deleteCoatingMaterial(String id_ToolCoatingMaterial){
		
		String json = "";
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		para.put("id_ToolCoatingMaterial", id_ToolCoatingMaterial);
		
		try {
			//清空涂层材料图片路径
			coatingMaterialService.clearPictureCoatingMaterialById(para);
			//清空详细信息路径
			coatingMaterialService.clearInformDetailCoatingMaterialById(para);
			//清空应用实例路径
			coatingMaterialService.clearApplicationCoatingMaterialById(para);
			
			//删除工件材料
			coatingMaterialService.deleteCoatingMaterial(para);
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







