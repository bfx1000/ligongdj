package com.qf.CuttingFluid.CuttingFluidMaterial.controller;

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

import com.qf.CuttingFluid.CuttingFluidMaterial.service.CuttingFluidMaterialService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/CuttingFluidMaterial")
public class CuttingFluidMaterialController extends BaseController{

	@Resource(name = "CuttingFluidMaterialService")
	private CuttingFluidMaterialService cuttingFluidMaterialService;
	
	
	
	@RequestMapping("queryCuttingFluidMaterialList")
	public ModelAndView queryCuttingToolMaterialList(Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= cuttingFluidMaterialService.queryCuttingFluidMaterialList(page);//查询工件材料列表
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			System.out.println("刀具材料："+list);
			if(list != null && list.size() > 0){
				for(int i = 0; i < list.size(); i++){
					Map CuttingFluidMaterial = list.get(i);
					int id_CuttingFluidMaterial = (int) CuttingFluidMaterial.get("id_CuttingFluidMaterial");
					
					Map para = new HashMap();
					para.put("id_CuttingFluidMaterial", id_CuttingFluidMaterial);
					
					List<Map> PictureCuttingFluidMaterialList = cuttingFluidMaterialService.queryPictureCuttingFluidMaterialList(para);
					List<Map> InformDetailCuttingFluidMaterialList = cuttingFluidMaterialService.queryInformDetailCuttingFluidMaterialList(para);
					List<Map> ApplicationCuttingFluidMaterialList = cuttingFluidMaterialService.queryApplicationCuttingFluidMaterialList(para);
					List<Map> UsingCuttingFluidList = cuttingFluidMaterialService.queryUsingCuttingFluidList(para);
					
					CuttingFluidMaterial.put("PictureCuttingFluidMaterialList", PictureCuttingFluidMaterialList);
					CuttingFluidMaterial.put("InformDetailCuttingFluidMaterialList", InformDetailCuttingFluidMaterialList);
					CuttingFluidMaterial.put("ApplicationCuttingFluidMaterialList", ApplicationCuttingFluidMaterialList);
					CuttingFluidMaterial.put("UsingCuttingFluidList", UsingCuttingFluidList);
					
					list.set(i, CuttingFluidMaterial);
				}
			}
			
			//查询材料类别列表
			List<Map> CategoryCuttingFluidMaterialList = cuttingFluidMaterialService.queryCategoryCuttingFluidMaterialList();
			System.out.println(list);
			mv.addObject("CategoryCuttingFluidMaterialList", CategoryCuttingFluidMaterialList);
			mv.addObject("cuttingFluidMaterialList", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/CuttingFluid/CuttingFluidMaterial/CuttingFluidMaterial_list");
		return mv;
	}
	
	@RequestMapping(value="/goAddCuttingFluidMaterial")
	public ModelAndView goAddCuttingFluidMaterial(String id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
			
		Map para = new HashMap();
		para.put("id_CuttingFluidMaterial", id);
		Map cuttingFluidMaterial = cuttingFluidMaterialService.queryCuttingFluidMaterialById(para);
		if(cuttingFluidMaterial != null){
			
			List<Map> PictureCuttingFluidMaterialList = cuttingFluidMaterialService.queryPictureCuttingFluidMaterialList(para);
			String array_PictureCuttingFluidMaterial = "";
			if(PictureCuttingFluidMaterialList != null && PictureCuttingFluidMaterialList.size() > 0){
				for(int i = 0; i < PictureCuttingFluidMaterialList.size(); i++){
					array_PictureCuttingFluidMaterial = array_PictureCuttingFluidMaterial + PictureCuttingFluidMaterialList.get(i).get("url_PictureCuttingFluid") + ",";
				}
			}
			List<Map> InformDetailCuttingFluidMaterialList = cuttingFluidMaterialService.queryInformDetailCuttingFluidMaterialList(para);
			String array_InformDetailCuttingFluidMaterial = "";
			String array_InformDetailCuttingFluidMaterial_name = "";
			if(InformDetailCuttingFluidMaterialList != null && InformDetailCuttingFluidMaterialList.size() > 0){
				for(int i = 0; i < InformDetailCuttingFluidMaterialList.size(); i++){
					array_InformDetailCuttingFluidMaterial = array_InformDetailCuttingFluidMaterial + InformDetailCuttingFluidMaterialList.get(i).get("url_InformDetailCuttingFluid") + ",";
					array_InformDetailCuttingFluidMaterial_name = array_InformDetailCuttingFluidMaterial_name + InformDetailCuttingFluidMaterialList.get(i).get("name_InformDetailCuttingFluid") + ",";
				}
			}
			List<Map> ApplicationCuttingFluidMaterialList = cuttingFluidMaterialService.queryApplicationCuttingFluidMaterialList(para);
			String array_ApplicationCuttingFluidMaterial = "";
			String array_ApplicationCuttingFluidMaterial_name = "";
			if(ApplicationCuttingFluidMaterialList != null && ApplicationCuttingFluidMaterialList.size() > 0){
				for(int i = 0; i < ApplicationCuttingFluidMaterialList.size(); i++){
					array_ApplicationCuttingFluidMaterial = array_ApplicationCuttingFluidMaterial + ApplicationCuttingFluidMaterialList.get(i).get("url_ApplicationCuttingFluid") + ",";
					array_ApplicationCuttingFluidMaterial_name = array_ApplicationCuttingFluidMaterial_name + ApplicationCuttingFluidMaterialList.get(i).get("name_ApplicationCuttingFluid") + ",";
				}
			}
			
			cuttingFluidMaterial.put("PictureCuttingFluidMaterialList", PictureCuttingFluidMaterialList);
			cuttingFluidMaterial.put("InformDetailCuttingFluidMaterialList", InformDetailCuttingFluidMaterialList);
			cuttingFluidMaterial.put("ApplicationCuttingFluidMaterialList", ApplicationCuttingFluidMaterialList);
			
			
			mv.addObject("array_PictureCuttingFluidMaterial", array_PictureCuttingFluidMaterial);
			mv.addObject("array_InformDetailCuttingFluidMaterial", array_InformDetailCuttingFluidMaterial);
			mv.addObject("array_InformDetailCuttingFluidMaterial_name", array_InformDetailCuttingFluidMaterial_name);
			mv.addObject("array_ApplicationCuttingFluidMaterial", array_ApplicationCuttingFluidMaterial);
			mv.addObject("array_ApplicationCuttingFluidMaterial_name", array_ApplicationCuttingFluidMaterial_name);
		}
		//查询材料类别列表
		List<Map> CategoryCuttingFluidMaterialList = cuttingFluidMaterialService.queryCategoryCuttingFluidMaterialList();
		List<Map> UsingCuttingFluidList = cuttingFluidMaterialService.queryUsingCuttingFluidList(para);
		String StrainRate = "";
		for(int i = 0;i<UsingCuttingFluidList.size();i++){
			String WorkpieceMaterial = (String) UsingCuttingFluidList.get(i).get("WorkpieceMaterial");
			String MachiningMethod = (String) UsingCuttingFluidList.get(i).get("MachiningMethod");
			String MachiningPrecision = (String) UsingCuttingFluidList.get(i).get("MachiningPrecision");
			StrainRate += WorkpieceMaterial+"-"+MachiningMethod+"-"+MachiningPrecision+",";
		}
		mv.addObject("StrainRate", StrainRate);
		mv.addObject("UsingCuttingFluidList", UsingCuttingFluidList);
		mv.addObject("CategoryCuttingFluidMaterialList", CategoryCuttingFluidMaterialList);
		mv.setViewName("/WEB-INF/CuttingFluid/CuttingFluidMaterial/CuttingFluidMaterial_edit");
		mv.addObject("msg", "saveCuttingFluidMaterial");
		mv.addObject("turn_url", turn_url);
		mv.addObject("cuttingFluidMaterial", cuttingFluidMaterial);
		
		mv.addObject("pd", pd);

		return mv;
	}
	
	
	
	
	
	@ResponseBody
	@RequestMapping("/saveCuttingFluidMaterial")
	public String saveCuttingFluidMaterial(HttpServletRequest request, 
			int id_CuttingFluidMaterial, 
			String array_PictureCuttingFluidMaterial, 
			String array_InformDetailCuttingFluidMaterial, String array_InformDetailCuttingFluidMaterial_name,
			String array_ApplicationCuttingFluidMaterial, String array_ApplicationCuttingFluidMaterial_name, 
			String NameCuttingFluid, String NumberCuttingFluid, String CategoryCuttingFluid, String CompanyCuttingFluid, String FormulaCuttingFluid,
			String CharacterCuttingFluid, String TechnicalCuttingFluid, String StrainRate
			) {
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		Map para = new HashMap();
		
		para.put("id_CuttingFluidMaterial", id_CuttingFluidMaterial);
		para.put("NameCuttingFluid", NameCuttingFluid);
		para.put("NumberCuttingFluid", NumberCuttingFluid);
		
		Map temp = new HashMap();
		temp.put("name_CategoryCuttingFluid", CategoryCuttingFluid);
		Map categoryCuttingFluid = cuttingFluidMaterialService.queryCategoryCuttingFluidMaterialByName(temp);
		if(categoryCuttingFluid!=null || "".equals(categoryCuttingFluid)){
			para.put("CategoryCuttingFluid", categoryCuttingFluid.get("id_CategoryCuttingFluid"));
		}else{
			//保存新的材料类别
			cuttingFluidMaterialService.saveCategoryCuttingFluidMaterial(temp);
			para.put("CategoryCuttingFluid", temp.get("id_CategoryCuttingFluid"));
		}
		
		para.put("CompanyCuttingFluid", CompanyCuttingFluid);
		para.put("FormulaCuttingFluid", FormulaCuttingFluid);
		para.put("CharacterCuttingFluid", CharacterCuttingFluid);
		para.put("TechnicalCuttingFluid", TechnicalCuttingFluid);
		para.put("add_time", System.currentTimeMillis() / 1000);
		if(user != null){
			para.put("user_id", user.get("user_id"));
		}else{
			para.put("user_id", 0);
		}
		
		try {
			if(id_CuttingFluidMaterial != 0){//修改
				cuttingFluidMaterialService.updateCuttingFluidMaterial(para);
			}else{//新增
				
				cuttingFluidMaterialService.saveCuttingFluidMaterial(para);
			}
			
			//清空材料图片路径 PictureMaterial
			cuttingFluidMaterialService.clearPictureCuttingFluidMaterialById(para);
			//保存刀柄图片
			if(array_PictureCuttingFluidMaterial != null && !"".equals(array_PictureCuttingFluidMaterial)){
				String array_PictureCuttingFluidMaterials[] = array_PictureCuttingFluidMaterial.split(",");
				for(int i=0; i<array_PictureCuttingFluidMaterials.length; i++){
					if(array_PictureCuttingFluidMaterials[i] != null && !"".equals(array_PictureCuttingFluidMaterials[i])){
						para.put("url_PictureCuttingFluid", array_PictureCuttingFluidMaterials[i]);
						cuttingFluidMaterialService.savePictureCuttingFluidMaterial(para);
					}
				}
			}
			
			
			//清空详细信息路径
			cuttingFluidMaterialService.clearInformDetailCuttingFluidMaterialById(para);
			//保存刀柄图片
			if(array_InformDetailCuttingFluidMaterial != null && !"".equals(array_InformDetailCuttingFluidMaterial)){
				String array_InformDetailCuttingFluidMaterials[] = array_InformDetailCuttingFluidMaterial.split(",");
				String array_InformDetailCuttingFluidMaterials_name[] = array_InformDetailCuttingFluidMaterial_name.split(",");
				for(int i=0; i<array_InformDetailCuttingFluidMaterials.length; i++){
					if(array_InformDetailCuttingFluidMaterials[i] != null && !"".equals(array_InformDetailCuttingFluidMaterials[i])){
						para.put("url_InformDetailCuttingFluid", array_InformDetailCuttingFluidMaterials[i]);
						para.put("name_InformDetailCuttingFluid", array_InformDetailCuttingFluidMaterials_name[i]);
						cuttingFluidMaterialService.saveInformDetailCuttingFluidMaterial(para);
					}
				}
			}
			
			//清空应用实例路径
			cuttingFluidMaterialService.clearApplicationCuttingFluidMaterialById(para);
			//保存刀柄图片
			System.out.println("添加后ID是："+para);
			if(array_ApplicationCuttingFluidMaterial != null && !"".equals(array_ApplicationCuttingFluidMaterial)){
				String array_ApplicationCuttingFluidMaterials[] = array_ApplicationCuttingFluidMaterial.split(",");
				String array_ApplicationCuttingFluidMaterials_name[] = array_ApplicationCuttingFluidMaterial_name.split(",");
				for(int i=0; i<array_ApplicationCuttingFluidMaterials.length; i++){
					if(array_ApplicationCuttingFluidMaterials[i] != null && !"".equals(array_ApplicationCuttingFluidMaterials[i])){
						para.put("url_ApplicationCuttingFluid", array_ApplicationCuttingFluidMaterials[i]);
						para.put("name_ApplicationCuttingFluid", array_ApplicationCuttingFluidMaterials_name[i]);
						cuttingFluidMaterialService.saveApplicationCuttingFluidMaterial(para);
					}
				}
			}
			cuttingFluidMaterialService.cleanUsingCuttingFluidById(para);
			
			if(StrainRate!=null && !"".equals(StrainRate)){
				String s[] = StrainRate.split(",");
				for(int i = 0;i<s.length;i++){
					String[] s1 = s[i].split("-");
					for(int j = 0;j<s1.length;j++){
						System.out.println(s1[j]);
					}
					Map p = new HashMap();
					p.put("WorkpieceMaterial", (s1[0]==null?"":s1[0]));
					p.put("MachiningMethod", (s1[1]==null?"":s1[1]));
					p.put("MachiningPrecision", (s1[2]==null?"":s1[2]));
					p.put("id_CuttingFluidMaterial", para.get("id_CuttingFluidMaterial"));
					
					cuttingFluidMaterialService.saveUsingCuttingFluid(p);
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}

	
	
	
	
	
	
	/**
	 * 保存材料图片
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/savePictureCuttingFluidMaterial")
	public ModelAndView savePictureCuttingFluidMaterial(
			int id_CuttingFluidMaterial, 
			String array_PictureCuttingFluidMaterial, 
			String array_InformDetailCuttingFluidMaterial, String array_InformDetailCuttingFluidMaterial_name,
			String array_ApplicationCuttingFluidMaterial, String array_ApplicationCuttingFluidMaterial_name, 
			String NameCuttingFluid, String NumberCuttingFluid, String CategoryCuttingFluid, String CompanyCuttingFluid, String FormulaCuttingFluid,
			String CharacterCuttingFluid, String TechnicalCuttingFluid,
			@RequestParam(value="PictureCuttingFluidMaterial",required=false)CommonsMultipartFile PictureCuttingFluidMaterial ,
			HttpServletRequest request ) throws Exception{
		
		Map cuttingFluidMaterial = new HashMap();
		
		Map para = new HashMap();//用于切削液应用查找
		para.put("id_CuttingFluidMaterial", id_CuttingFluidMaterial);
		
		cuttingFluidMaterial.put("id_CuttingFluidMaterial", id_CuttingFluidMaterial);
		cuttingFluidMaterial.put("NameCuttingFluid", NameCuttingFluid);
		cuttingFluidMaterial.put("NumberCuttingFluid", NumberCuttingFluid);
		
		Map temp = new HashMap();
		temp.put("name_CategoryCuttingFluid", CategoryCuttingFluid);
		Map categoryCuttingFluid = cuttingFluidMaterialService.queryCategoryCuttingFluidMaterialByName(temp);
		if(categoryCuttingFluid!=null || "".equals(categoryCuttingFluid)){
			cuttingFluidMaterial.put("CategoryCuttingFluid", categoryCuttingFluid.get("id_CategoryCuttingFluid"));
		}
		
		cuttingFluidMaterial.put("CompanyCuttingFluid", CompanyCuttingFluid);
		cuttingFluidMaterial.put("FormulaCuttingFluid", FormulaCuttingFluid);
		cuttingFluidMaterial.put("CharacterCuttingFluid", CharacterCuttingFluid);
		cuttingFluidMaterial.put("TechnicalCuttingFluid", TechnicalCuttingFluid);
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureCuttingFluidMaterialMap = new HashMap(); 
		
		String OriginalFilename = PictureCuttingFluidMaterial.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureCuttingFluidMaterial/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			PictureCuttingFluidMaterial.transferTo(materials_big_img_file); 
			PictureCuttingFluidMaterialMap.put("url_PictureCuttingFluid", "/pictureCuttingFluidMaterial/" + big_url + "." + fileSuffix);
			PictureCuttingFluidMaterialMap.put("id_CuttingFluidMaterial", id_CuttingFluidMaterial);
			array_PictureCuttingFluidMaterial = array_PictureCuttingFluidMaterial + "/pictureCuttingFluidMaterial/" + big_url + "." + fileSuffix + ",";
		}else{

		}
		//查询材料类别列表
		List<Map> CategoryCuttingFluidMaterialList = cuttingFluidMaterialService.queryCategoryCuttingFluidMaterialList();
		mv.addObject("CategoryCuttingFluidMaterialList", CategoryCuttingFluidMaterialList);
		List<Map> UsingCuttingFluidList = cuttingFluidMaterialService.queryUsingCuttingFluidList(para);
		mv.addObject("UsingCuttingFluidList", UsingCuttingFluidList);
		String StrainRate = "";
		for(int i = 0;i<UsingCuttingFluidList.size();i++){
			String WorkpieceMaterial = (String) UsingCuttingFluidList.get(i).get("WorkpieceMaterial");
			String MachiningMethod = (String) UsingCuttingFluidList.get(i).get("MachiningMethod");
			String MachiningPrecision = (String) UsingCuttingFluidList.get(i).get("MachiningPrecision");
			StrainRate += WorkpieceMaterial+"-"+MachiningMethod+"-"+MachiningPrecision+",";
		}
		mv.addObject("StrainRate", StrainRate);
		mv.addObject("array_PictureCuttingFluidMaterial", array_PictureCuttingFluidMaterial);
		mv.addObject("array_InformDetailCuttingFluidMaterial", array_InformDetailCuttingFluidMaterial);
		mv.addObject("array_InformDetailCuttingFluidMaterial_name", array_InformDetailCuttingFluidMaterial_name);
		mv.addObject("array_ApplicationCuttingFluidMaterial", array_ApplicationCuttingFluidMaterial);
		mv.addObject("array_ApplicationCuttingFluidMaterial_name", array_ApplicationCuttingFluidMaterial_name);
		
		mv.addObject("cuttingFluidMaterial", cuttingFluidMaterial);
		
		mv.setViewName("/WEB-INF/CuttingFluid/CuttingFluidMaterial/CuttingFluidMaterial_edit");

		return mv;
		
	}
	

	@RequestMapping(value="/saveInformDetailCuttingFluidMaterial")
	public ModelAndView saveInformDetailCuttingFluidMaterial(
			int id_CuttingFluidMaterial, 
			String array_PictureCuttingFluidMaterial, 
			String array_InformDetailCuttingFluidMaterial, String array_InformDetailCuttingFluidMaterial_name,
			String array_ApplicationCuttingFluidMaterial, String array_ApplicationCuttingFluidMaterial_name, 
			String NameCuttingFluid, String NumberCuttingFluid, String CategoryCuttingFluid, String CompanyCuttingFluid, String FormulaCuttingFluid,
			String CharacterCuttingFluid, String TechnicalCuttingFluid,
			@RequestParam(value="InformDetailCuttingFluidMaterial",required=false)CommonsMultipartFile InformDetailCuttingFluidMaterial ,
			HttpServletRequest request  ) throws Exception{
		
		Map cuttingFluidMaterial = new HashMap();
		
		Map para = new HashMap();
		para.put("id_CuttingFluidMaterial", id_CuttingFluidMaterial);
		
		cuttingFluidMaterial.put("id_CuttingFluidMaterial", id_CuttingFluidMaterial);
		cuttingFluidMaterial.put("NameCuttingFluid", NameCuttingFluid);
		cuttingFluidMaterial.put("NumberCuttingFluid", NumberCuttingFluid);
		
		Map temp = new HashMap();
		temp.put("name_CategoryCuttingFluid", CategoryCuttingFluid);
		Map categoryCuttingFluid = cuttingFluidMaterialService.queryCategoryCuttingFluidMaterialByName(temp);
		if(categoryCuttingFluid!=null || "".equals(categoryCuttingFluid)){
			cuttingFluidMaterial.put("CategoryCuttingFluid", categoryCuttingFluid.get("id_CategoryCuttingFluid"));
		}
		
		cuttingFluidMaterial.put("CompanyCuttingFluid", CompanyCuttingFluid);
		cuttingFluidMaterial.put("FormulaCuttingFluid", FormulaCuttingFluid);
		cuttingFluidMaterial.put("CharacterCuttingFluid", CharacterCuttingFluid);
		cuttingFluidMaterial.put("TechnicalCuttingFluid", TechnicalCuttingFluid);
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map InformDetailCuttingFluidMaterialMap = new HashMap(); 
		
		String OriginalFilename = InformDetailCuttingFluidMaterial.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informDetailCuttingFluid/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			InformDetailCuttingFluidMaterial.transferTo(materials_big_img_file); 
			InformDetailCuttingFluidMaterialMap.put("url_InformDetailCuttingFluid", "/informDetailCuttingFluid/" + big_url + "." + fileSuffix);
			InformDetailCuttingFluidMaterialMap.put("id_CuttingFluidMaterial", id_CuttingFluidMaterial);
			array_InformDetailCuttingFluidMaterial = array_InformDetailCuttingFluidMaterial + "/informDetailCuttingFluid/" + big_url + "." + fileSuffix + ",";
			array_InformDetailCuttingFluidMaterial_name = array_InformDetailCuttingFluidMaterial_name + OriginalFilename + ",";

		}else{

		}
		
		//查询材料类别列表
		List<Map> CategoryCuttingFluidMaterialList = cuttingFluidMaterialService.queryCategoryCuttingFluidMaterialList();
		mv.addObject("CategoryCuttingFluidMaterialList", CategoryCuttingFluidMaterialList);
		List<Map> UsingCuttingFluidList = cuttingFluidMaterialService.queryUsingCuttingFluidList(para);
		mv.addObject("UsingCuttingFluidList", UsingCuttingFluidList);
		String StrainRate = "";
		for(int i = 0;i<UsingCuttingFluidList.size();i++){
			String WorkpieceMaterial = (String) UsingCuttingFluidList.get(i).get("WorkpieceMaterial");
			String MachiningMethod = (String) UsingCuttingFluidList.get(i).get("MachiningMethod");
			String MachiningPrecision = (String) UsingCuttingFluidList.get(i).get("MachiningPrecision");
			StrainRate += WorkpieceMaterial+"-"+MachiningMethod+"-"+MachiningPrecision+",";
		}
		mv.addObject("StrainRate", StrainRate);
		mv.addObject("array_PictureCuttingFluidMaterial", array_PictureCuttingFluidMaterial);
		mv.addObject("array_InformDetailCuttingFluidMaterial", array_InformDetailCuttingFluidMaterial);
		mv.addObject("array_InformDetailCuttingFluidMaterial_name", array_InformDetailCuttingFluidMaterial_name);
		mv.addObject("array_ApplicationCuttingFluidMaterial", array_ApplicationCuttingFluidMaterial);
		mv.addObject("array_ApplicationCuttingFluidMaterial_name", array_ApplicationCuttingFluidMaterial_name);
				
		mv.addObject("cuttingFluidMaterial", cuttingFluidMaterial);
		
		mv.setViewName("/WEB-INF/CuttingFluid/CuttingFluidMaterial/CuttingFluidMaterial_edit");
		return mv;
		
	}

	@RequestMapping(value="/saveApplicationCuttingFluidMaterial")
	public ModelAndView saveApplicationCuttingFluidMaterial(
			int id_CuttingFluidMaterial, 
			String array_PictureCuttingFluidMaterial, 
			String array_InformDetailCuttingFluidMaterial, String array_InformDetailCuttingFluidMaterial_name,
			String array_ApplicationCuttingFluidMaterial, String array_ApplicationCuttingFluidMaterial_name, 
			String NameCuttingFluid, String NumberCuttingFluid, String CategoryCuttingFluid, String CompanyCuttingFluid, String FormulaCuttingFluid,
			String CharacterCuttingFluid, String TechnicalCuttingFluid,
			@RequestParam(value="ApplicationCuttingFluidMaterial",required=false)CommonsMultipartFile ApplicationCuttingFluidMaterial ,
			HttpServletRequest request ) throws Exception{
		
		Map cuttingFluidMaterial = new HashMap();
		
		Map para = new HashMap();
		para.put("id_CuttingFluidMaterial", id_CuttingFluidMaterial);
		
		cuttingFluidMaterial.put("id_CuttingFluidMaterial", id_CuttingFluidMaterial);
		cuttingFluidMaterial.put("NameCuttingFluid", NameCuttingFluid);
		cuttingFluidMaterial.put("NumberCuttingFluid", NumberCuttingFluid);
		
		Map temp = new HashMap();
		temp.put("name_CategoryCuttingFluid", CategoryCuttingFluid);
		Map categoryCuttingFluid = cuttingFluidMaterialService.queryCategoryCuttingFluidMaterialByName(temp);
		if(categoryCuttingFluid!=null || "".equals(categoryCuttingFluid)){
			cuttingFluidMaterial.put("CategoryCuttingFluid", categoryCuttingFluid.get("id_CategoryCuttingFluid"));
		}
		
		cuttingFluidMaterial.put("CompanyCuttingFluid", CompanyCuttingFluid);
		cuttingFluidMaterial.put("FormulaCuttingFluid", FormulaCuttingFluid);
		cuttingFluidMaterial.put("CharacterCuttingFluid", CharacterCuttingFluid);
		cuttingFluidMaterial.put("TechnicalCuttingFluid", TechnicalCuttingFluid);
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map ApplicationCuttingFluidMaterialMap = new HashMap(); 
		
		String OriginalFilename = ApplicationCuttingFluidMaterial.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/applicationCuttingFluidMaterial/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			ApplicationCuttingFluidMaterial.transferTo(materials_big_img_file); 
			ApplicationCuttingFluidMaterialMap.put("url_ApplicationCuttingFluid", "/applicationCuttingFluidMaterial/" + big_url + "." + fileSuffix);
			ApplicationCuttingFluidMaterialMap.put("id_CuttingFluidMaterial", id_CuttingFluidMaterial);
			array_ApplicationCuttingFluidMaterial = array_ApplicationCuttingFluidMaterial + "/applicationCuttingFluidMaterial/" + big_url + "." + fileSuffix + ",";
			array_ApplicationCuttingFluidMaterial_name = array_ApplicationCuttingFluidMaterial_name + OriginalFilename + ",";

		}else{

		}
		
		//查询材料类别列表
		List<Map> CategoryCuttingFluidMaterialList = cuttingFluidMaterialService.queryCategoryCuttingFluidMaterialList();
		mv.addObject("CategoryCuttingFluidMaterialList", CategoryCuttingFluidMaterialList);
		List<Map> UsingCuttingFluidList = cuttingFluidMaterialService.queryUsingCuttingFluidList(para);
		mv.addObject("UsingCuttingFluidList", UsingCuttingFluidList);
		String StrainRate = "";
		for(int i = 0;i<UsingCuttingFluidList.size();i++){
			String WorkpieceMaterial = (String) UsingCuttingFluidList.get(i).get("WorkpieceMaterial");
			String MachiningMethod = (String) UsingCuttingFluidList.get(i).get("MachiningMethod");
			String MachiningPrecision = (String) UsingCuttingFluidList.get(i).get("MachiningPrecision");
			StrainRate += WorkpieceMaterial+"-"+MachiningMethod+"-"+MachiningPrecision+",";
		}
		mv.addObject("StrainRate", StrainRate);
		mv.addObject("array_PictureCuttingFluidMaterial", array_PictureCuttingFluidMaterial);
		mv.addObject("array_InformDetailCuttingFluidMaterial", array_InformDetailCuttingFluidMaterial);
		mv.addObject("array_InformDetailCuttingFluidMaterial_name", array_InformDetailCuttingFluidMaterial_name);
		mv.addObject("array_ApplicationCuttingFluidMaterial", array_ApplicationCuttingFluidMaterial);
		mv.addObject("array_ApplicationCuttingFluidMaterial_name", array_ApplicationCuttingFluidMaterial_name);
				
		mv.addObject("cuttingFluidMaterial", cuttingFluidMaterial);
		
		mv.setViewName("/WEB-INF/CuttingFluid/CuttingFluidMaterial/CuttingFluidMaterial_edit");

		return mv;
		
	}
	
	
	
	
	@ResponseBody
	@RequestMapping("/deleteCuttingFluidMaterial")
	public String deleteCuttingToolMaterial(String id_CuttingFluidMaterial) {
		Map para = new HashMap();
		para.put("id_CuttingFluidMaterial", id_CuttingFluidMaterial);
		try {
		
			cuttingFluidMaterialService.clearPictureCuttingFluidMaterialById(para);
		
			cuttingFluidMaterialService.clearInformDetailCuttingFluidMaterialById(para);
			
			cuttingFluidMaterialService.clearApplicationCuttingFluidMaterialById(para);
			
			cuttingFluidMaterialService.cleanUsingCuttingFluidById(para);
			
			cuttingFluidMaterialService.deleteCuttingFluidMaterial(para);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
	
	@RequestMapping("/toCuttingFluidApply")
	public ModelAndView toCuttingFluidApply(Page page, HttpServletRequest request){
		
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= cuttingFluidMaterialService.queryCuttingFluidApplyList(page);//查询工件材料列表
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			System.out.println("切削液应用："+list);
			
			mv.addObject("CuttingFluidApply", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/CuttingFluid/CuttingFluidMaterial/CuttingFluidMaterial_toApply");
		return mv;
		
	}
	
	
}
