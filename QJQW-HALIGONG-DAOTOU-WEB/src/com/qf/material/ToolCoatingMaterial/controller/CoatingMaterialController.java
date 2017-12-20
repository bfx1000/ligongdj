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
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.qf.material.ToolCoatingMaterial.service.CoatingMaterialService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/CoatingMaterial")
public class CoatingMaterialController extends BaseController{

	@Resource(name="coatingMaterialService")
	private CoatingMaterialService coatingMaterialService;
	
	
	/**
	 * 涂层材料列表
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping("/queryCoatingMaterialList")
	public ModelAndView queryCoatingMaterialList(Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= coatingMaterialService.queryCoatingMaterialList(page);//查询工件材料列表
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
			}
			
			//查询材料类别列表
			List<Map> categoryToolCoatingList = coatingMaterialService.queryCategoryToolCoatingList();
			
			mv.addObject("categoryToolCoatingList", categoryToolCoatingList);
			mv.addObject("materialList", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
			System.out.println(list+"---------"+categoryToolCoatingList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/material/ToolCoatingMaterial/materialList");
		return mv;
	}
	
	
	/**
	 * 去添加涂层材料
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("goAddCoatingMaterial")
	public ModelAndView goAddCoatingMaterial(String id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
			
		Map para = new HashMap();
		para.put("id_ToolCoatingMaterial", id);
		
		Map CoatingMaterial = coatingMaterialService.queryCoatingMaterialById(para);
		
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
			
			mv.addObject("array_PictureCoatingMaterial", array_PictureCoatingMaterial);
			mv.addObject("array_InformDetailCoatingMaterial", array_InformDetailCoatingMaterial);
			mv.addObject("array_InformDetailCoatingMaterial_name", array_InformDetailCoatingMaterial_name);
			mv.addObject("array_ApplicationCoatingMaterial", array_ApplicationCoatingMaterial);
			mv.addObject("array_ApplicationCoatingMaterial_name", array_ApplicationCoatingMaterial_name);
			
			System.out.println("列表:"+CoatingMaterial);
			System.out.println("图片："+array_PictureCoatingMaterial);
			System.out.println("详细："+array_InformDetailCoatingMaterial);
			System.out.println("详细名："+array_InformDetailCoatingMaterial_name);
			System.out.println("应用："+array_ApplicationCoatingMaterial);
			System.out.println("应用名："+array_ApplicationCoatingMaterial_name);
		}
		
		//查询材料类别列表
		List<Map> categoryToolCoatingList = coatingMaterialService.queryCategoryToolCoatingList();
		
		mv.setViewName("/WEB-INF/material/ToolCoatingMaterial/material_edit");
		mv.addObject("msg", "saveCoatingMaterial");
		mv.addObject("turn_url", turn_url);
		mv.addObject("CoatingMaterial", CoatingMaterial);
		mv.addObject("categoryToolCoatingList",categoryToolCoatingList);
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	
	/**
	 * 保存/修改涂层材料
	 * @param request
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
	@RequestMapping("/saveCoatingMaterial")
	public String saveCoatingMaterial(HttpServletRequest request, 
			int id_ToolCoatingMaterial, 
			String array_PictureCoatingMaterial, 
			String array_InformDetailCoatingMaterial, String array_InformDetailCoatingMaterial_name,
			String array_ApplicationCoatingMaterial, String array_ApplicationCoatingMaterial_name, 
			String NameToolCoating, String NumberToolCoating, String CategoryToolCoating, String ProcessingToolCoating, String CompanyToolCoating,
			String ISOToolCoating, String ColourToolCoating, String HardnessToolCoating, String ThicknessToolCoating, String FrictionToolCoating,
			String TemperatureToolCoating, String CharacterToolCoating
			) {
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
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
		if(user != null){
			para.put("user_id", user.get("user_id"));
		}else{
			para.put("user_id", 0);
		}
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
				return "0";
			}	
		return "1";
		
	}
	
	
	
	
	
	
	/**
	 * 保存图片
	 * @param id_ToolCoatingMaterial
	 * @param array_PictureCoatingMaterial
	 * @param array_InformDetailCoatingMaterial
	 * @param array_InformDetailCoatingMaterial_name
	 * @param array_ApplicationCoatingMaterial
	 * @param array_ApplicationCoatingMaterial_name
	 * @param NameToolCoating
	 * @param NumberToolCoating
	 * @param CategoryToolCoating
	 * @param ProcessingToolCoating
	 * @param CompanyToolCoating
	 * @param ISOToolCoating
	 * @param ColourToolCoating
	 * @param HardnessToolCoating
	 * @param ThicknessToolCoating
	 * @param FrictionToolCoating
	 * @param TemperatureToolCoating
	 * @param CharacterToolCoating
	 * @param PictureCoatingMaterial
	 * @param request
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping("savePictureCoatingMaterial")
	public ModelAndView savePictureCoatingMaterial(
			int id_ToolCoatingMaterial, 
			String array_PictureCoatingMaterial, 
			String array_InformDetailCoatingMaterial, String array_InformDetailCoatingMaterial_name,
			String array_ApplicationCoatingMaterial, String array_ApplicationCoatingMaterial_name, 
			String NameToolCoating, String NumberToolCoating, String CategoryToolCoating, String ProcessingToolCoating, String CompanyToolCoating,
			String ISOToolCoating, String ColourToolCoating, String HardnessToolCoating, String ThicknessToolCoating, String FrictionToolCoating,
			String TemperatureToolCoating, String CharacterToolCoating,	
			@RequestParam(value="PictureCoatingMaterial",required=false)CommonsMultipartFile PictureCoatingMaterial ,
			HttpServletRequest request ) throws Exception{
	
		Map coatingMaterial = new HashMap();
		
		coatingMaterial.put("id_ToolCoatingMaterial", id_ToolCoatingMaterial);
		coatingMaterial.put("NameToolCoating", NameToolCoating);	
		coatingMaterial.put("NumberToolCoating", NumberToolCoating);
		
		Map temp = new HashMap();
		temp.put("name_CategoryToolCoating", CategoryToolCoating);
		Map categoryToolCoating = coatingMaterialService.queryCategoryToolCoatingByName(temp);
		if(categoryToolCoating!=null || "".equals(categoryToolCoating)){
			coatingMaterial.put("CategoryToolCoating", categoryToolCoating.get("id_CategoryToolCoating"));
		}

		coatingMaterial.put("ProcessingToolCoating", ProcessingToolCoating);
		coatingMaterial.put("CompanyToolCoating", CompanyToolCoating);
		coatingMaterial.put("ISOToolCoating", ISOToolCoating);
		coatingMaterial.put("ColourToolCoating", ColourToolCoating);
		coatingMaterial.put("HardnessToolCoating", HardnessToolCoating);
		coatingMaterial.put("ThicknessToolCoating", ThicknessToolCoating);
		coatingMaterial.put("FrictionToolCoating", FrictionToolCoating);
		coatingMaterial.put("TemperatureToolCoating", TemperatureToolCoating);
		coatingMaterial.put("CharacterToolCoating", CharacterToolCoating);
	
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureCoatingMaterialMap = new HashMap();
		
		String OriginalFilename = PictureCoatingMaterial.getOriginalFilename(); 
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureCoatingMaterial/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			PictureCoatingMaterial.transferTo(materials_big_img_file); 
			PictureCoatingMaterialMap.put("url_PictureCoatingMaterial", "/pictureCoatingMaterial/" + big_url + "." + fileSuffix);
			PictureCoatingMaterialMap.put("id_ToolCoatingMaterial", id_ToolCoatingMaterial);
			array_PictureCoatingMaterial = array_PictureCoatingMaterial + "/pictureCoatingMaterial/" + big_url + "." + fileSuffix + ",";
		}else{

		}
		
		//查询材料主要成分列表
		String ISOToolCoating_str = (String)ISOToolCoating;
		List<Map> ISOToolCoatingList = new ArrayList();
		if(ISOToolCoating_str != null && !"".equals(ISOToolCoating_str)){
			String ConstituentsMaterials[] = ISOToolCoating_str.split(",");
			for(int j=0;j<ConstituentsMaterials.length;j++){
				if(ConstituentsMaterials[j] != null && !"".equals(ConstituentsMaterials[j])){
					String yuansu = ConstituentsMaterials[j].split("-")[0];
					String baifenbi = ConstituentsMaterials[j].split("-")[1];
					Map temp1 = new HashMap();
					temp1.put("yuansu", yuansu);
					temp1.put("baifenbi", baifenbi);
					ISOToolCoatingList.add(temp1);
				}
			}
			coatingMaterial.put("ISOToolCoatingList", ISOToolCoatingList);	
		}
		
		//查询材料类别列表
		List<Map> categoryToolCoatingList = coatingMaterialService.queryCategoryToolCoatingList();
		
		mv.addObject("array_PictureCoatingMaterial", array_PictureCoatingMaterial);
		mv.addObject("array_InformDetailCoatingMaterial", array_InformDetailCoatingMaterial);
		mv.addObject("array_InformDetailCoatingMaterial_name", array_InformDetailCoatingMaterial_name);
		mv.addObject("array_ApplicationCoatingMaterial", array_ApplicationCoatingMaterial);
		mv.addObject("array_ApplicationCoatingMaterial_name", array_ApplicationCoatingMaterial_name);
		
		mv.addObject("CoatingMaterial",coatingMaterial);
		mv.addObject("categoryToolCoatingList", categoryToolCoatingList);
		
		mv.setViewName("/WEB-INF/material/ToolCoatingMaterial/material_edit");
		
		return mv;
	
	}
	
	/**
	 * 保存详细信息
	 * @param id_ToolCoatingMaterial
	 * @param array_PictureCoatingMaterial
	 * @param array_InformDetailCoatingMaterial
	 * @param array_InformDetailCoatingMaterial_name
	 * @param array_ApplicationCoatingMaterial
	 * @param array_ApplicationCoatingMaterial_name
	 * @param NameToolCoating
	 * @param NumberToolCoating
	 * @param CategoryToolCoating
	 * @param ProcessingToolCoating
	 * @param CompanyToolCoating
	 * @param ISOToolCoating
	 * @param ColourToolCoating
	 * @param HardnessToolCoating
	 * @param ThicknessToolCoating
	 * @param FrictionToolCoating
	 * @param TemperatureToolCoating
	 * @param CharacterToolCoating
	 * @param InformDetailCoatingMaterial
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("saveInformDetailCoatingMaterial")
	public ModelAndView saveInformDetailCoatingMaterial(
			int id_ToolCoatingMaterial, 
			String array_PictureCoatingMaterial, 
			String array_InformDetailCoatingMaterial, String array_InformDetailCoatingMaterial_name,
			String array_ApplicationCoatingMaterial, String array_ApplicationCoatingMaterial_name, 
			String NameToolCoating, String NumberToolCoating, String CategoryToolCoating, String ProcessingToolCoating, String CompanyToolCoating,
			String ISOToolCoating, String ColourToolCoating, String HardnessToolCoating, String ThicknessToolCoating, String FrictionToolCoating,
			String TemperatureToolCoating, String CharacterToolCoating,	
			@RequestParam(value="InformDetailCoatingMaterial",required=false)CommonsMultipartFile InformDetailCoatingMaterial ,
			HttpServletRequest request ) throws Exception{
	
		Map coatingMaterial = new HashMap();
		
		coatingMaterial.put("id_ToolCoatingMaterial", id_ToolCoatingMaterial);
		coatingMaterial.put("NameToolCoating", NameToolCoating);	
		coatingMaterial.put("NumberToolCoating", NumberToolCoating);
		
		Map temp = new HashMap();
		temp.put("name_CategoryToolCoating", CategoryToolCoating);
		Map categoryToolCoating = coatingMaterialService.queryCategoryToolCoatingByName(temp);
		if(categoryToolCoating!=null || "".equals(categoryToolCoating)){
			coatingMaterial.put("CategoryToolCoating", categoryToolCoating.get("id_CategoryToolCoating"));
		}

		coatingMaterial.put("ProcessingToolCoating", ProcessingToolCoating);
		coatingMaterial.put("CompanyToolCoating", CompanyToolCoating);
		coatingMaterial.put("ISOToolCoating", ISOToolCoating);
		coatingMaterial.put("ColourToolCoating", ColourToolCoating);
		coatingMaterial.put("HardnessToolCoating", HardnessToolCoating);
		coatingMaterial.put("ThicknessToolCoating", ThicknessToolCoating);
		coatingMaterial.put("FrictionToolCoating", FrictionToolCoating);
		coatingMaterial.put("TemperatureToolCoating", TemperatureToolCoating);
		coatingMaterial.put("CharacterToolCoating", CharacterToolCoating);
	
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map InformDetailCoatingMaterialMap = new HashMap();
		
		String OriginalFilename = InformDetailCoatingMaterial.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informDetailCoatingMaterial/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			InformDetailCoatingMaterial.transferTo(materials_big_img_file); 
			InformDetailCoatingMaterialMap.put("url_InformDetailToolCoating", "/informDetailCoatingMaterial/" + big_url + "." + fileSuffix);
			InformDetailCoatingMaterialMap.put("id_ToolCoatingMaterial", id_ToolCoatingMaterial);
			array_InformDetailCoatingMaterial = array_InformDetailCoatingMaterial + "/informDetailCoatingMaterial/" + big_url + "." + fileSuffix + ",";
			array_InformDetailCoatingMaterial_name = array_InformDetailCoatingMaterial_name + OriginalFilename + ",";

		}else{

		}
		//查询材料主要成分列表
		String ISOToolCoating_str = (String)ISOToolCoating;
		List<Map> ISOToolCoatingList = new ArrayList();
		if(ISOToolCoating_str != null && !"".equals(ISOToolCoating_str)){
			String ConstituentsMaterials[] = ISOToolCoating_str.split(",");
			for(int j=0;j<ConstituentsMaterials.length;j++){
				if(ConstituentsMaterials[j] != null && !"".equals(ConstituentsMaterials[j])){
					String yuansu = ConstituentsMaterials[j].split("-")[0];
					String baifenbi = ConstituentsMaterials[j].split("-")[1];
					Map temp1 = new HashMap();
					temp1.put("yuansu", yuansu);
					temp1.put("baifenbi", baifenbi);
					ISOToolCoatingList.add(temp1);
				}
			}
			coatingMaterial.put("ISOToolCoatingList", ISOToolCoatingList);	
		}
		
		//查询材料类别列表
		List<Map> categoryToolCoatingList = coatingMaterialService.queryCategoryToolCoatingList();
		
		mv.addObject("array_PictureCoatingMaterial", array_PictureCoatingMaterial);
		mv.addObject("array_InformDetailCoatingMaterial", array_InformDetailCoatingMaterial);
		mv.addObject("array_InformDetailCoatingMaterial_name", array_InformDetailCoatingMaterial_name);
		mv.addObject("array_ApplicationCoatingMaterial", array_ApplicationCoatingMaterial);
		mv.addObject("array_ApplicationCoatingMaterial_name", array_ApplicationCoatingMaterial_name);
		
		mv.addObject("CoatingMaterial",coatingMaterial);
		mv.addObject("categoryToolCoatingList", categoryToolCoatingList);
		
		mv.setViewName("/WEB-INF/material/ToolCoatingMaterial/material_edit");
		
		return mv;
	
	}
	/**
	 * 保存应用实例
	 * @param id_ToolCoatingMaterial
	 * @param array_PictureCoatingMaterial
	 * @param array_InformDetailCoatingMaterial
	 * @param array_InformDetailCoatingMaterial_name
	 * @param array_ApplicationCoatingMaterial
	 * @param array_ApplicationCoatingMaterial_name
	 * @param NameToolCoating
	 * @param NumberToolCoating
	 * @param CategoryToolCoating
	 * @param ProcessingToolCoating
	 * @param CompanyToolCoating
	 * @param ISOToolCoating
	 * @param ColourToolCoating
	 * @param HardnessToolCoating
	 * @param ThicknessToolCoating
	 * @param FrictionToolCoating
	 * @param TemperatureToolCoating
	 * @param CharacterToolCoating
	 * @param ApplicationCoatingMaterial
	 * @param request
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping("saveApplicationCoatingMaterial")
	public ModelAndView saveApplicationCoatingMaterial(
			int id_ToolCoatingMaterial, 
			String array_PictureCoatingMaterial, 
			String array_InformDetailCoatingMaterial, String array_InformDetailCoatingMaterial_name,
			String array_ApplicationCoatingMaterial, String array_ApplicationCoatingMaterial_name, 
			String NameToolCoating, String NumberToolCoating, String CategoryToolCoating, String ProcessingToolCoating, String CompanyToolCoating,
			String ISOToolCoating, String ColourToolCoating, String HardnessToolCoating, String ThicknessToolCoating, String FrictionToolCoating,
			String TemperatureToolCoating, String CharacterToolCoating,	
			@RequestParam(value="ApplicationCoatingMaterial",required=false)CommonsMultipartFile ApplicationCoatingMaterial ,
			HttpServletRequest request ) throws Exception{
	
		Map coatingMaterial = new HashMap();
		
		coatingMaterial.put("id_ToolCoatingMaterial", id_ToolCoatingMaterial);	
		coatingMaterial.put("NameToolCoating", NameToolCoating);	
		coatingMaterial.put("NumberToolCoating", NumberToolCoating);
		
		Map temp = new HashMap();
		temp.put("name_CategoryToolCoating", CategoryToolCoating);
		Map categoryToolCoating = coatingMaterialService.queryCategoryToolCoatingByName(temp);
		if(categoryToolCoating!=null || "".equals(categoryToolCoating)){
			coatingMaterial.put("CategoryToolCoating", categoryToolCoating.get("id_CategoryToolCoating"));
		}

		coatingMaterial.put("ProcessingToolCoating", ProcessingToolCoating);
		coatingMaterial.put("CompanyToolCoating", CompanyToolCoating);
		coatingMaterial.put("ISOToolCoating", ISOToolCoating);
		coatingMaterial.put("ColourToolCoating", ColourToolCoating);
		coatingMaterial.put("HardnessToolCoating", HardnessToolCoating);
		coatingMaterial.put("ThicknessToolCoating", ThicknessToolCoating);
		coatingMaterial.put("FrictionToolCoating", FrictionToolCoating);
		coatingMaterial.put("TemperatureToolCoating", TemperatureToolCoating);
		coatingMaterial.put("CharacterToolCoating", CharacterToolCoating);
	
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map ApplicationCoatingMaterialMap = new HashMap();
		
		String OriginalFilename = ApplicationCoatingMaterial.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/applicationCoatingMaterial/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			ApplicationCoatingMaterial.transferTo(materials_big_img_file); 
			ApplicationCoatingMaterialMap.put("url_ApplicationToolCoating", "/applicationCoatingMaterial/" + big_url + "." + fileSuffix);
			ApplicationCoatingMaterialMap.put("id_ToolCoatingMaterial", id_ToolCoatingMaterial);
			array_ApplicationCoatingMaterial = array_ApplicationCoatingMaterial + "/applicationCoatingMaterial/" + big_url + "." + fileSuffix + ",";
			array_ApplicationCoatingMaterial_name = array_ApplicationCoatingMaterial_name + OriginalFilename + ",";

		}else{

		}
		
		//查询材料主要成分列表
		String ISOToolCoating_str = (String)ISOToolCoating;
		List<Map> ISOToolCoatingList = new ArrayList();
		if(ISOToolCoating_str != null && !"".equals(ISOToolCoating_str)){
			String ConstituentsMaterials[] = ISOToolCoating_str.split(",");
			for(int j=0;j<ConstituentsMaterials.length;j++){
				if(ConstituentsMaterials[j] != null && !"".equals(ConstituentsMaterials[j])){
					String yuansu = ConstituentsMaterials[j].split("-")[0];
					String baifenbi = ConstituentsMaterials[j].split("-")[1];
					Map temp1 = new HashMap();
					temp1.put("yuansu", yuansu);
					temp1.put("baifenbi", baifenbi);
					ISOToolCoatingList.add(temp1);
				}
			}
			coatingMaterial.put("ISOToolCoatingList", ISOToolCoatingList);	
		}
		//查询材料类别列表
		List<Map> categoryToolCoatingList = coatingMaterialService.queryCategoryToolCoatingList();
		
		mv.addObject("array_PictureCoatingMaterial", array_PictureCoatingMaterial);
		mv.addObject("array_InformDetailCoatingMaterial", array_InformDetailCoatingMaterial);
		mv.addObject("array_InformDetailCoatingMaterial_name", array_InformDetailCoatingMaterial_name);
		mv.addObject("array_ApplicationCoatingMaterial", array_ApplicationCoatingMaterial);
		mv.addObject("array_ApplicationCoatingMaterial_name", array_ApplicationCoatingMaterial_name);
		
		mv.addObject("CoatingMaterial",coatingMaterial);
		mv.addObject("categoryToolCoatingList", categoryToolCoatingList);
		
		mv.setViewName("/WEB-INF/material/ToolCoatingMaterial/material_edit");
		
		return mv;
	
	}
	
	
	
	
	
	
	
	/**
	 * 删除涂层材料
	 * @param id_ToolCoatingMaterial
	 * @return
	 */
	
	@ResponseBody
	@RequestMapping("deleteCoatingMaterial")
	public String deleteCoatingMaterial(String id_ToolCoatingMaterial){
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
			return "0";
		}
		return "1";
	}
	
	
	
	
	
}








