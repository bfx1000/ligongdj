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
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.qf.CuttingFluid.CuttingFluidMaterial.service.CuttingFluidMaterialService;
import com.qf.material.cuttingToolMaterial.service.CuttingToolMaterialService;
import com.qf.material.material.service.MaterialService;
import com.qf.tool.turningBlade.service.TurningBladeService;
import com.qf.tool.turningHolder.service.TurningHolderService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.common.JackJson;
import com.qf.util.controller.BaseController;
import com.qf.util.file.ByteToFile;
import com.qf.util.page.Page;

/**
*
* 项目名称：qf
* 类名称：SystemUserController
* 类描述：用户管理
* 创建人：周广文
* 创建时间：2015年5月13日 下午2:02:00
* 修改人：周广文
* 修改时间：2015年5月13日 下午2:02:00
* 修改备注：
* @version
*
*/
@Controller
@RequestMapping("/CuttingFluidMaterialApp")
public class CuttingFluidMaterialAppController  extends BaseController{
	
	@Resource(name = "CuttingFluidMaterialService")
	private CuttingFluidMaterialService cuttingFluidMaterialService;
    
    /**
	 * 查询刀具材料列表
	 * @param page
	 * @param request
	 * @return
	 */
    
    
    
    @ResponseBody
    @RequestMapping(value = "/queryCuttingFluidMaterialList", produces = "application/json; charset=utf-8")
	public String queryMaterialList(int pageNo, int pageSize, 
			String NameCuttingFluid, String	NumberCuttingFluid, String CategoryCuttingFluid,
			String CompanyCuttingFluid){
		
		
    	String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		
		try {
			
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("NameCuttingFluid", NameCuttingFluid);
			pd.put("NumberCuttingFluid", NumberCuttingFluid);
			pd.put("CategoryCuttingFluid", CategoryCuttingFluid);
			pd.put("CompanyCuttingFluid", CompanyCuttingFluid);
			
			page.setPd(pd);
			map	= cuttingFluidMaterialService.queryCuttingFluidMaterialList(page);//查询工件材料列表
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
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
					
					String StrainRate = "";
					for(int j = 0;j<UsingCuttingFluidList.size();j++){
						String WorkpieceMaterial = (String) UsingCuttingFluidList.get(j).get("WorkpieceMaterial");
						String MachiningMethod = (String) UsingCuttingFluidList.get(j).get("MachiningMethod");
						String MachiningPrecision = (String) UsingCuttingFluidList.get(j).get("MachiningPrecision");
						StrainRate += WorkpieceMaterial+"-"+MachiningMethod+"-"+MachiningPrecision+",";
					}
					
					CuttingFluidMaterial.put("PictureCuttingFluidMaterialList", PictureCuttingFluidMaterialList);
					CuttingFluidMaterial.put("InformDetailCuttingFluidMaterialList", InformDetailCuttingFluidMaterialList);
					CuttingFluidMaterial.put("ApplicationCuttingFluidMaterialList", ApplicationCuttingFluidMaterialList);
					CuttingFluidMaterial.put("StrainRate", StrainRate);
					
					list.set(i, CuttingFluidMaterial);
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
			List<Map> CategoryCuttingFluidMaterialList = cuttingFluidMaterialService.queryCategoryCuttingFluidMaterialList();
			
			
			resultmap.put("result", "1");
			resultmap.put("list", list);
			resultmap.put("CategoryCuttingFluidMaterialList", CategoryCuttingFluidMaterialList);
		} catch (Exception e) {
			e.printStackTrace();
			resultmap.put("result", "0");
		}
		Map para = new HashMap();
		para.put("NameCuttingFluid", NameCuttingFluid);
		para.put("NumberCuttingFluid", NumberCuttingFluid);
		para.put("CategoryCuttingFluid", CategoryCuttingFluid);
		para.put("CompanyCuttingFluid", CompanyCuttingFluid);
		resultmap.put("para", para);
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}


    @ResponseBody
    @RequestMapping(value="/goAddCuttingFluidMaterial", produces = "application/json; charset=utf-8")
	public String goAddMaterial(String id)throws Exception{
    	String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
			
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
			
			
			resultmap.put("result", "1");
			resultmap.put("array_PictureCuttingFluidMaterial", array_PictureCuttingFluidMaterial);
			resultmap.put("array_InformDetailCuttingFluidMaterial", array_InformDetailCuttingFluidMaterial);
			resultmap.put("array_InformDetailCuttingFluidMaterial_name", array_InformDetailCuttingFluidMaterial_name);
			resultmap.put("array_ApplicationCuttingFluidMaterial", array_ApplicationCuttingFluidMaterial);
			resultmap.put("array_ApplicationCuttingFluidMaterial_name", array_ApplicationCuttingFluidMaterial_name);
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
		resultmap.put("StrainRate", StrainRate);
		resultmap.put("CategoryCuttingFluidMaterialList", CategoryCuttingFluidMaterialList);
		resultmap.put("cuttingFluidMaterial", cuttingFluidMaterial);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}

    
    
    
    
    
    @ResponseBody
	@RequestMapping(value = "/saveCuttingFluidMaterial", produces = "application/json; charset=utf-8")
	public String saveMaterial(String user_id, 
			int id_CuttingFluidMaterial, 
			String array_PictureCuttingFluidMaterial, 
			String array_InformDetailCuttingFluidMaterial, String array_InformDetailCuttingFluidMaterial_name,
			String array_ApplicationCuttingFluidMaterial, String array_ApplicationCuttingFluidMaterial_name, 
			String NameCuttingFluid, String NumberCuttingFluid, String CategoryCuttingFluid, String CompanyCuttingFluid, String FormulaCuttingFluid,
			String CharacterCuttingFluid, String TechnicalCuttingFluid, String StrainRate){
		
    	String json  = "";  
		Map resultmap = new HashMap();
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
		para.put("user_id", user_id);
		
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
					
					Map p = new HashMap();
					p.put("WorkpieceMaterial", s1[0]);
					p.put("MachiningMethod", s1[1]);
					p.put("MachiningPrecision", s1[2]);
					p.put("id_CuttingFluidMaterial", para.get("id_CuttingFluidMaterial"));
					
					cuttingFluidMaterialService.saveUsingCuttingFluid(p);
					
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
    
    
    
    
    
    /**
	 * 保存刀具材料图片
	 * @param request
	 * @return
	 * @throws Exception
	 */
    @ResponseBody
	@RequestMapping(value="/savePictureCuttingFluidMaterial", produces = "application/json; charset=utf-8")
	public String savePictureCuttingFluidMaterial(
			int id_CuttingFluidMaterial, 
			String array_PictureCuttingFluidMaterial, 
			String array_InformDetailCuttingFluidMaterial, String array_InformDetailCuttingFluidMaterial_name,
			String array_ApplicationCuttingFluidMaterial, String array_ApplicationCuttingFluidMaterial_name, 
			String PictureCuttingFluidMaterial ,String fileSuffix, String filename
			) throws Exception{
		
    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		
		Map PictureCuttingFluidMaterialMap = new HashMap(); 
		
		if(PictureCuttingFluidMaterial != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureCuttingFluidMaterial/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/pictureCuttingFluidMaterial/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PictureCuttingFluidMaterial,  filepath2);
			array_PictureCuttingFluidMaterial = array_PictureCuttingFluidMaterial + "/pictureCuttingFluidMaterial/" + big_url + "." + fileSuffix + ",";
		}
		
		//查询材料类别列表
		List<Map> CategoryCuttingFluidMaterialList = cuttingFluidMaterialService.queryCategoryCuttingFluidMaterialList();
		
		resultmap.put("result", "1");
		resultmap.put("array_PictureCuttingFluidMaterial", array_PictureCuttingFluidMaterial);
		resultmap.put("array_InformDetailCuttingFluidMaterial", array_InformDetailCuttingFluidMaterial);
		resultmap.put("array_InformDetailCuttingFluidMaterial_name", array_InformDetailCuttingFluidMaterial_name);
		resultmap.put("array_ApplicationCuttingFluidMaterial", array_ApplicationCuttingFluidMaterial);
		resultmap.put("array_ApplicationCuttingFluidMaterial_name", array_ApplicationCuttingFluidMaterial_name);
		resultmap.put("CategoryCuttingFluidMaterialList", CategoryCuttingFluidMaterialList);
		
		json = JackJson.fromObjectToJson(resultmap);

		return json;
		
	}
    
    
    
    /**
	 * 保存刀具材料详细信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
    @ResponseBody
	@RequestMapping(value="/saveInformDetailCuttingFluidMaterial", produces = "application/json; charset=utf-8")
	public String saveInformDetailCuttingFluidMaterial(
			int id_CuttingFluidMaterial, 
			String array_PictureCuttingFluidMaterial, 
			String array_InformDetailCuttingFluidMaterial, String array_InformDetailCuttingFluidMaterial_name,
			String array_ApplicationCuttingFluidMaterial, String array_ApplicationCuttingFluidMaterial_name, 
			String InformDetailCuttingFluidMaterial ,String fileSuffix, String filename
			) throws Exception{
		
    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
    	Map resultmap = new HashMap();
		Map InformDetailCuttingFluidMaterialMap = new HashMap(); 
		
		if(InformDetailCuttingFluidMaterial != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informDetailCuttingFluid/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/informDetailCuttingFluid/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(InformDetailCuttingFluidMaterial,  filepath2);
			array_InformDetailCuttingFluidMaterial = array_InformDetailCuttingFluidMaterial + "/informDetailCuttingFluid/" + big_url + "." + fileSuffix + ",";
			array_InformDetailCuttingFluidMaterial_name = array_InformDetailCuttingFluidMaterial_name + filename + ",";
		}
		
		//查询材料类别列表
		List<Map> CategoryCuttingFluidMaterialList = cuttingFluidMaterialService.queryCategoryCuttingFluidMaterialList();
		
		resultmap.put("result", "1");
		resultmap.put("array_PictureCuttingFluidMaterial", array_PictureCuttingFluidMaterial);
		resultmap.put("array_InformDetailCuttingFluidMaterial", array_InformDetailCuttingFluidMaterial);
		resultmap.put("array_InformDetailCuttingFluidMaterial_name", array_InformDetailCuttingFluidMaterial_name);
		resultmap.put("array_ApplicationCuttingFluidMaterial", array_ApplicationCuttingFluidMaterial);
		resultmap.put("array_ApplicationCuttingFluidMaterial_name", array_ApplicationCuttingFluidMaterial_name);
		resultmap.put("CategoryCuttingFluidMaterialList", CategoryCuttingFluidMaterialList);
		
		json = JackJson.fromObjectToJson(resultmap);

		return json;
		
	}
    
    
    
    
    /**
	 * 保存刀具材料应用实例
	 * @param request
	 * @return
	 * @throws Exception
	 */
    @ResponseBody
	@RequestMapping(value="/saveApplicationCuttingFluidMaterial", produces = "application/json; charset=utf-8")
	public String saveApplicationCuttingFluidMaterial(
			int id_CuttingFluidMaterial, 
			String array_PictureCuttingFluidMaterial, 
			String array_InformDetailCuttingFluidMaterial, String array_InformDetailCuttingFluidMaterial_name,
			String array_ApplicationCuttingFluidMaterial, String array_ApplicationCuttingFluidMaterial_name, 
			String ApplicationCuttingFluidMaterial ,String fileSuffix, String filename
			) throws Exception{
		
    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		Map ApplicationCuttingFluidMaterialMap = new HashMap(); 
		
		if(ApplicationCuttingFluidMaterial != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/applicationCuttingFluidMaterial/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/applicationCuttingFluidMaterial/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(ApplicationCuttingFluidMaterial,  filepath2);
			array_ApplicationCuttingFluidMaterial = array_ApplicationCuttingFluidMaterial + "/applicationCuttingFluidMaterial/" + big_url + "." + fileSuffix + ",";
			array_ApplicationCuttingFluidMaterial_name = array_ApplicationCuttingFluidMaterial_name + filename + ",";
		}
		//查询材料类别列表
		List<Map> CategoryCuttingFluidMaterialList = cuttingFluidMaterialService.queryCategoryCuttingFluidMaterialList();
		
		resultmap.put("result", "1");
		resultmap.put("array_PictureCuttingFluidMaterial", array_PictureCuttingFluidMaterial);
		resultmap.put("array_InformDetailCuttingFluidMaterial", array_InformDetailCuttingFluidMaterial);
		resultmap.put("array_InformDetailCuttingFluidMaterial_name", array_InformDetailCuttingFluidMaterial_name);
		resultmap.put("array_ApplicationCuttingFluidMaterial", array_ApplicationCuttingFluidMaterial);
		resultmap.put("array_ApplicationCuttingFluidMaterial_name", array_ApplicationCuttingFluidMaterial_name);
		resultmap.put("CategoryCuttingFluidMaterialList", CategoryCuttingFluidMaterialList);
		
		json = JackJson.fromObjectToJson(resultmap);

		return json;
	}
    
    
    
    
    
    /**
	 * 删除工件材料
	 * @param id_BTADrill
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteCuttingFluidMaterial", produces = "application/json; charset=utf-8")
	public String deleteCuttingFluidMaterial(String id_CuttingFluidMaterial) {
		String json  = "";  
		Map resultmap = new HashMap();
		
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
	@RequestMapping("/toCuttingFluidApply")
	public String toCuttingFluidApply(int pageNo, int pageSize, String WorkpieceMaterial,
			String MachiningMethod,String MachiningPrecision){
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		try {
			
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("WorkpieceMaterial", WorkpieceMaterial);
			pd.put("MachiningMethod", MachiningMethod);
			pd.put("MachiningPrecision", MachiningPrecision);
			
			page.setPd(pd);
			map	= cuttingFluidMaterialService.queryCuttingFluidApplyList(page);//查询工件材料列表
			page = (Page)map.get("page");
			
			List<Map> list = (List<Map>)map.get("list");
			if(list!=null && list.size()>0){
				Map pageMap = new HashMap();
				int pageCount = page.getPageCount();
				pageMap.put("pageCount", pageCount);
				resultmap.put("page", pageMap);
			}else{
				Map pageMap = new HashMap();
				pageMap.put("pageCount", 0);
				resultmap.put("page", pageMap);
			}
			
			resultmap.put("result", "1");
			resultmap.put("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			resultmap.put("result", "0");
		}
		Map para = new HashMap();
		para.put("WorkpieceMaterial", WorkpieceMaterial);
		para.put("MachiningMethod", MachiningMethod);
		para.put("MachiningPrecision", MachiningPrecision);
		resultmap.put("para", para);
		json = JackJson.fromObjectToJson(resultmap);
		return json;
		
	}
	
	
	
	
	
}
