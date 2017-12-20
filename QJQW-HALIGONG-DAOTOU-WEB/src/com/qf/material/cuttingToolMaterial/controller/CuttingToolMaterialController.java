package com.qf.material.cuttingToolMaterial.controller;

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

import com.qf.material.cuttingToolMaterial.service.CuttingToolMaterialService;
import com.qf.material.material.service.MaterialService;
import com.qf.tool.turningBlade.service.TurningBladeService;
import com.qf.tool.turningHolder.service.TurningHolderService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.common.JackJson;
import com.qf.util.controller.BaseController;
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
@RequestMapping("/cuttingToolMaterial")
public class CuttingToolMaterialController  extends BaseController{
	
	@Resource(name="cuttingToolMaterialService")
    private CuttingToolMaterialService cuttingToolMaterialService;  
	

	/**
	 * 查询工件材料列表
	 * @param page
	 * @param request
	 * @return
	 */
    @RequestMapping("queryCuttingToolMaterialList")
	public ModelAndView queryCuttingToolMaterialList(Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= cuttingToolMaterialService.queryCuttingToolMaterialList(page);//查询工件材料列表
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			System.out.println("刀具材料："+list);
			if(list != null && list.size() > 0){
				for(int i = 0; i < list.size(); i++){
					Map cuttingToolMaterial = list.get(i);
					int id_CuttingToolMaterialD = (int) cuttingToolMaterial.get("id_CuttingToolMaterialD");
					
					Map para = new HashMap();
					para.put("id_CuttingToolMaterialD", id_CuttingToolMaterialD);
					
					
					List<Map> pictureToolMaterialList = cuttingToolMaterialService.queryPictureToolMaterialList(para);
					List<Map> informToolMaterialList = cuttingToolMaterialService.queryInformToolMaterialList(para);
					List<Map> applicationToolMaterialList = cuttingToolMaterialService.queryApplicationToolMaterialList(para);
					
					cuttingToolMaterial.put("pictureToolMaterialList", pictureToolMaterialList);
					cuttingToolMaterial.put("informToolMaterialList", informToolMaterialList);
					cuttingToolMaterial.put("applicationToolMaterialList", applicationToolMaterialList);
					
					//查询材料主要成分列表
					String ISOCuttingMaterial_str = (String) cuttingToolMaterial.get("ISOCuttingMaterial");
					List<Map> ISOCuttingMaterialList = new ArrayList();
					if(ISOCuttingMaterial_str != null && !"".equals(ISOCuttingMaterial_str)){
						String ConstituentsMaterials[] = ISOCuttingMaterial_str.split(",");
						for(int j=0;j<ConstituentsMaterials.length;j++){
							if(ConstituentsMaterials[j] != null && !"".equals(ConstituentsMaterials[j])){
								String yuansu = ConstituentsMaterials[j].split("-")[0];
								String baifenbi = ConstituentsMaterials[j].split("-")[1];
								Map temp = new HashMap();
								temp.put("yuansu", yuansu);
								temp.put("baifenbi", baifenbi);
								ISOCuttingMaterialList.add(temp);
							}
						}
						cuttingToolMaterial.put("ISOCuttingMaterialList", ISOCuttingMaterialList);	
					}
					
					
					list.set(i, cuttingToolMaterial);
				}
			}
			//查询材料类别列表
			List<Map> categoryToolMaterialList = cuttingToolMaterialService.queryCategoryToolMaterialList();
			
			mv.addObject("categoryToolMaterialList", categoryToolMaterialList);
			mv.addObject("categoryMaterialList", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/material/cuttingToolMaterial/cuttingToolMaterialList");
		return mv;
	}


	@RequestMapping(value="/goAddCuttingToolMaterial")
	public ModelAndView goAddCuttingToolMaterial(String id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
			
		Map para = new HashMap();
		para.put("id_CuttingToolMaterialD", id);
		Map cuttingToolMaterial = cuttingToolMaterialService.queryCuttingToolMaterialById(para);
		if(cuttingToolMaterial != null){
			
			List<Map> pictureToolMaterialList = cuttingToolMaterialService.queryPictureToolMaterialList(para);
			String array_PictureToolMaterial = "";
			if(pictureToolMaterialList != null && pictureToolMaterialList.size() > 0){
				for(int i = 0; i < pictureToolMaterialList.size(); i++){
					array_PictureToolMaterial = array_PictureToolMaterial + pictureToolMaterialList.get(i).get("url_PictureToolMaterial") + ",";
				}
			}
			List<Map> informToolMaterialList = cuttingToolMaterialService.queryInformToolMaterialList(para);
			String array_InformToolMaterial = "";
			String array_InformToolMaterial_name = "";
			if(informToolMaterialList != null && informToolMaterialList.size() > 0){
				for(int i = 0; i < informToolMaterialList.size(); i++){
					array_InformToolMaterial = array_InformToolMaterial + informToolMaterialList.get(i).get("url_InformToolMaterial") + ",";
					array_InformToolMaterial_name = array_InformToolMaterial_name + informToolMaterialList.get(i).get("name_InformToolMaterial") + ",";
				}
			}
			List<Map> applicationToolMaterialList = cuttingToolMaterialService.queryApplicationToolMaterialList(para);
			String array_ApplicationToolMaterial = "";
			String array_ApplicationToolMaterial_name = "";
			if(applicationToolMaterialList != null && applicationToolMaterialList.size() > 0){
				for(int i = 0; i < applicationToolMaterialList.size(); i++){
					array_ApplicationToolMaterial = array_ApplicationToolMaterial + applicationToolMaterialList.get(i).get("url_ApplicationToolMaterial") + ",";
					array_ApplicationToolMaterial_name = array_ApplicationToolMaterial_name + applicationToolMaterialList.get(i).get("name_ApplicationToolMaterial") + ",";
				}
			}
			//查询材料主要成分列表
			String ISOCuttingMaterial_str = (String) cuttingToolMaterial.get("ISOCuttingMaterial");
			List<Map> ISOCuttingMaterialList = new ArrayList();
			if(ISOCuttingMaterial_str != null && !"".equals(ISOCuttingMaterial_str)){
				String ConstituentsMaterials[] = ISOCuttingMaterial_str.split(",");
				for(int j=0;j<ConstituentsMaterials.length;j++){
					if(ConstituentsMaterials[j] != null && !"".equals(ConstituentsMaterials[j])){
						String yuansu = ConstituentsMaterials[j].split("-")[0];
						String baifenbi = ConstituentsMaterials[j].split("-")[1];
						Map temp = new HashMap();
						temp.put("yuansu", yuansu);
						temp.put("baifenbi", baifenbi);
						ISOCuttingMaterialList.add(temp);
					}
				}
				cuttingToolMaterial.put("ISOCuttingMaterialList", ISOCuttingMaterialList);	
			}
			cuttingToolMaterial.put("pictureToolMaterialList", pictureToolMaterialList);
			cuttingToolMaterial.put("informToolMaterialList", informToolMaterialList);
			cuttingToolMaterial.put("applicationToolMaterialList", applicationToolMaterialList);
			
			mv.addObject("array_PictureToolMaterial", array_PictureToolMaterial);
			mv.addObject("array_InformToolMaterial", array_InformToolMaterial);
			mv.addObject("array_InformToolMaterial_name", array_InformToolMaterial_name);
			mv.addObject("array_ApplicationToolMaterial", array_ApplicationToolMaterial);
			mv.addObject("array_ApplicationToolMaterial_name", array_ApplicationToolMaterial_name);
		}
		//查询材料类别列表
		List<Map> categoryToolMaterialList = cuttingToolMaterialService.queryCategoryToolMaterialList();
		
		mv.addObject("categoryToolMaterialList", categoryToolMaterialList);
		mv.setViewName("/WEB-INF/material/cuttingToolMaterial/cuttingToolMaterial_edit");
		mv.addObject("msg", "saveCuttingToolMaterial");
		mv.addObject("turn_url", turn_url);
		mv.addObject("cuttingToolMaterial", cuttingToolMaterial);
		
		mv.addObject("pd", pd);

		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/saveCuttingToolMaterial")
	public String saveMaterial(HttpServletRequest request, 
			int id_CuttingToolMaterialD, 
			String array_PictureToolMaterial, 
			String array_InformToolMaterial, String array_InformToolMaterial_name,
			String array_ApplicationToolMaterial, String array_ApplicationToolMaterial_name, 
			String NameToolMaterial, String NumberToolMaterial, String CategoryToolMaterial, String CompanyToolMaterial, String ISOCuttingMaterial,
			String MachineableMaterial, String DensityToolMaterial,	String HardnessToolMaterial, String BendingStrengthToolMaterial, String ImpactToughnessToolMaterial, 
			String ModulusToolMaterial,	String HeatResistanceToolMaterial, String ConductivityToolMaterial,	String ThermalexpansionToolMaterial
			) {
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		Map para = new HashMap();
		
		para.put("id_CuttingToolMaterialD", id_CuttingToolMaterialD);
		para.put("NameToolMaterial", NameToolMaterial);
		para.put("NumberToolMaterial", NumberToolMaterial);
		
		Map temp = new HashMap();
		temp.put("name_CategoryToolMaterial", CategoryToolMaterial);
		Map categoryToolMaterial = cuttingToolMaterialService.queryCategoryToolMaterialByName(temp);
		if(categoryToolMaterial!=null || "".equals(categoryToolMaterial)){
			para.put("CategoryToolMaterial", categoryToolMaterial.get("id_CategoryToolMaterial"));
		}else{
			//保存新的材料类别
			cuttingToolMaterialService.saveCategoryToolMaterial(temp);
			para.put("CategoryToolMaterial", temp.get("id_CategoryToolMaterial"));
		}
		
		para.put("CompanyToolMaterial", CompanyToolMaterial);
		para.put("ISOCuttingMaterial", ISOCuttingMaterial);
		para.put("MachineableMaterial", MachineableMaterial);
		para.put("DensityToolMaterial", DensityToolMaterial);
		para.put("HardnessToolMaterial", HardnessToolMaterial);
		para.put("BendingStrengthToolMaterial", BendingStrengthToolMaterial);
		para.put("ImpactToughnessToolMaterial", ImpactToughnessToolMaterial);
		para.put("ModulusToolMaterial", ModulusToolMaterial);
		para.put("HeatResistanceToolMaterial", HeatResistanceToolMaterial);
		para.put("ConductivityToolMaterial", ConductivityToolMaterial);
		para.put("ThermalexpansionToolMaterial", ThermalexpansionToolMaterial);
		
		para.put("add_time", System.currentTimeMillis() / 1000);
		if(user != null){
			para.put("user_id", user.get("user_id"));
		}else{
			para.put("user_id", 0);
		}
		try {
			if(id_CuttingToolMaterialD != 0){//修改
				cuttingToolMaterialService.updateCuttingToolMaterial(para);
			}else{//新增
				
				cuttingToolMaterialService.saveCuttingToolMaterial(para);
			}
			
			//清空材料图片路径 PictureMaterial
			cuttingToolMaterialService.clearPictureToolMaterialByIdCuttingToolMaterial(para);
			//保存刀柄图片
			if(array_PictureToolMaterial != null && !"".equals(array_PictureToolMaterial)){
				String array_PictureToolMaterials[] = array_PictureToolMaterial.split(",");
				for(int i=0; i<array_PictureToolMaterials.length; i++){
					if(array_PictureToolMaterials[i] != null && !"".equals(array_PictureToolMaterials[i])){
						para.put("url_PictureToolMaterial", array_PictureToolMaterials[i]);
						cuttingToolMaterialService.savePictureToolMaterial(para);
					}
				}
			}
			
			
			//清空详细信息路径
			cuttingToolMaterialService.clearInformToolMaterialByIdCuttingToolMaterial(para);
			//保存刀柄图片
			if(array_InformToolMaterial != null && !"".equals(array_InformToolMaterial)){
				String array_InformToolMaterials[] = array_InformToolMaterial.split(",");
				String array_InformToolMaterials_name[] = array_InformToolMaterial_name.split(",");
				for(int i=0; i<array_InformToolMaterials.length; i++){
					if(array_InformToolMaterials[i] != null && !"".equals(array_InformToolMaterials[i])){
						para.put("url_InformToolMaterial", array_InformToolMaterials[i]);
						para.put("name_InformToolMaterial", array_InformToolMaterials_name[i]);
						cuttingToolMaterialService.saveInformToolMaterial(para);
					}
				}
			}
			
			//清空应用实例路径
			cuttingToolMaterialService.clearApplicationToolMaterialByIdCuttingToolMaterial(para);
			//保存刀柄图片
			if(array_ApplicationToolMaterial != null && !"".equals(array_ApplicationToolMaterial)){
				String array_ApplicationToolMaterials[] = array_ApplicationToolMaterial.split(",");
				String array_ApplicationToolMaterials_name[] = array_ApplicationToolMaterial_name.split(",");
				for(int i=0; i<array_ApplicationToolMaterials.length; i++){
					if(array_ApplicationToolMaterials[i] != null && !"".equals(array_ApplicationToolMaterials[i])){
						para.put("url_ApplicationToolMaterial", array_ApplicationToolMaterials[i]);
						para.put("name_ApplicationToolMaterial", array_ApplicationToolMaterials_name[i]);
						cuttingToolMaterialService.saveApplicationToolMaterial(para);
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
	 * 保存材料图片
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/savePictureToolMaterial")
	public ModelAndView savePictureToolMaterial(
			int id_CuttingToolMaterialD, 
			String array_PictureToolMaterial, 
			String array_InformToolMaterial, String array_InformToolMaterial_name,
			String array_ApplicationToolMaterial, String array_ApplicationToolMaterial_name, 
			String NameToolMaterial, String NumberToolMaterial, String CategoryToolMaterial, String CompanyToolMaterial, String ISOCuttingMaterial,
			String MachineableMaterial, String DensityToolMaterial,	String HardnessToolMaterial, String BendingStrengthToolMaterial, String ImpactToughnessToolMaterial, 
			String ModulusToolMaterial,	String HeatResistanceToolMaterial, String ConductivityToolMaterial,	String ThermalexpansionToolMaterial,
			@RequestParam(value="PictureToolMaterial",required=false)CommonsMultipartFile PictureToolMaterial ,
			HttpServletRequest request ) throws Exception{
		
		Map cuttingToolMaterial = new HashMap();
		
		cuttingToolMaterial.put("id_CuttingToolMaterialD", id_CuttingToolMaterialD);
		cuttingToolMaterial.put("NameToolMaterial", NameToolMaterial);
		cuttingToolMaterial.put("NumberToolMaterial", NumberToolMaterial);
		
		Map temp = new HashMap();
		temp.put("name_CategoryToolMaterial", CategoryToolMaterial);
		Map categoryToolMaterial = cuttingToolMaterialService.queryCategoryToolMaterialByName(temp);
		if(categoryToolMaterial!=null || "".equals(categoryToolMaterial)){
			cuttingToolMaterial.put("CategoryToolMaterial", categoryToolMaterial.get("id_CategoryToolMaterial"));
		}
		
		cuttingToolMaterial.put("CompanyToolMaterial", CompanyToolMaterial);
		cuttingToolMaterial.put("ISOCuttingMaterial", ISOCuttingMaterial);
		cuttingToolMaterial.put("MachineableMaterial", MachineableMaterial);
		cuttingToolMaterial.put("DensityToolMaterial", DensityToolMaterial);
		cuttingToolMaterial.put("HardnessToolMaterial", HardnessToolMaterial);
		cuttingToolMaterial.put("BendingStrengthToolMaterial", BendingStrengthToolMaterial);
		cuttingToolMaterial.put("ImpactToughnessToolMaterial", ImpactToughnessToolMaterial);
		cuttingToolMaterial.put("ModulusToolMaterial", ModulusToolMaterial);
		cuttingToolMaterial.put("HeatResistanceToolMaterial", HeatResistanceToolMaterial);
		cuttingToolMaterial.put("ConductivityToolMaterial", ConductivityToolMaterial);
		cuttingToolMaterial.put("ThermalexpansionToolMaterial", ThermalexpansionToolMaterial);
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureToolMaterialMap = new HashMap(); 
		
		String OriginalFilename = PictureToolMaterial.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureToolMaterial/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			PictureToolMaterial.transferTo(materials_big_img_file); 
			PictureToolMaterialMap.put("url_PictureToolMaterial", "/pictureToolMaterial/" + big_url + "." + fileSuffix);
			PictureToolMaterialMap.put("id_CuttingToolMaterialD", id_CuttingToolMaterialD);
			array_PictureToolMaterial = array_PictureToolMaterial + "/pictureToolMaterial/" + big_url + "." + fileSuffix + ",";
		}else{

		}
		//查询材料主要成分列表
		String ISOCuttingMaterial_str = (String)ISOCuttingMaterial;
		List<Map> ISOCuttingMaterialList = new ArrayList();
		if(ISOCuttingMaterial_str != null && !"".equals(ISOCuttingMaterial_str)){
			String ConstituentsMaterials[] = ISOCuttingMaterial_str.split(",");
			for(int j=0;j<ConstituentsMaterials.length;j++){
				if(ConstituentsMaterials[j] != null && !"".equals(ConstituentsMaterials[j])){
					String yuansu = ConstituentsMaterials[j].split("-")[0];
					String baifenbi = ConstituentsMaterials[j].split("-")[1];
					Map temp1 = new HashMap();
					temp1.put("yuansu", yuansu);
					temp1.put("baifenbi", baifenbi);
					ISOCuttingMaterialList.add(temp1);
				}
			}
		cuttingToolMaterial.put("ISOCuttingMaterialList", ISOCuttingMaterialList);
		}
		
		//查询材料类别列表
		List<Map> categoryToolMaterialList = cuttingToolMaterialService.queryCategoryToolMaterialList();
		
		mv.addObject("categoryToolMaterialList", categoryToolMaterialList);
		mv.addObject("array_PictureToolMaterial", array_PictureToolMaterial);
		mv.addObject("array_InformToolMaterial", array_InformToolMaterial);
		mv.addObject("array_InformToolMaterial_name", array_InformToolMaterial_name);
		mv.addObject("array_ApplicationToolMaterial", array_ApplicationToolMaterial);
		mv.addObject("array_ApplicationToolMaterial_name", array_ApplicationToolMaterial_name);
		
		mv.addObject("cuttingToolMaterial", cuttingToolMaterial);
		
		mv.setViewName("/WEB-INF/material/cuttingToolMaterial/cuttingToolMaterial_edit");

		return mv;
		
	}
	

	@RequestMapping(value="/saveInformToolMaterial")
	public ModelAndView saveInformToolMaterial(
			int id_CuttingToolMaterialD, 
			String array_PictureToolMaterial, 
			String array_InformToolMaterial, String array_InformToolMaterial_name,
			String array_ApplicationToolMaterial, String array_ApplicationToolMaterial_name, 
			String NameToolMaterial, String NumberToolMaterial, String CategoryToolMaterial, String CompanyToolMaterial, String ISOCuttingMaterial,
			String MachineableMaterial, String DensityToolMaterial,	String HardnessToolMaterial, String BendingStrengthToolMaterial, String ImpactToughnessToolMaterial, 
			String ModulusToolMaterial,	String HeatResistanceToolMaterial, String ConductivityToolMaterial,	String ThermalexpansionToolMaterial,
			@RequestParam(value="InformToolMaterial",required=false)CommonsMultipartFile InformToolMaterial ,
			HttpServletRequest request ) throws Exception{
		
		Map cuttingToolMaterial = new HashMap();
		
		cuttingToolMaterial.put("id_CuttingToolMaterialD", id_CuttingToolMaterialD);
		cuttingToolMaterial.put("NameToolMaterial", NameToolMaterial);
		cuttingToolMaterial.put("NumberToolMaterial", NumberToolMaterial);
		
		Map temp = new HashMap();
		temp.put("name_CategoryToolMaterial", CategoryToolMaterial);
		Map categoryToolMaterial = cuttingToolMaterialService.queryCategoryToolMaterialByName(temp);
		if(categoryToolMaterial!=null && !"".equals(categoryToolMaterial)){
			cuttingToolMaterial.put("CategoryToolMaterial", categoryToolMaterial.get("id_CategoryToolMaterial"));
		}
		
		cuttingToolMaterial.put("CompanyToolMaterial", CompanyToolMaterial);
		cuttingToolMaterial.put("ISOCuttingMaterial", ISOCuttingMaterial);
		cuttingToolMaterial.put("MachineableMaterial", MachineableMaterial);
		cuttingToolMaterial.put("DensityToolMaterial", DensityToolMaterial);
		cuttingToolMaterial.put("HardnessToolMaterial", HardnessToolMaterial);
		cuttingToolMaterial.put("BendingStrengthToolMaterial", BendingStrengthToolMaterial);
		cuttingToolMaterial.put("ImpactToughnessToolMaterial", ImpactToughnessToolMaterial);
		cuttingToolMaterial.put("ModulusToolMaterial", ModulusToolMaterial);
		cuttingToolMaterial.put("HeatResistanceToolMaterial", HeatResistanceToolMaterial);
		cuttingToolMaterial.put("ConductivityToolMaterial", ConductivityToolMaterial);
		cuttingToolMaterial.put("ThermalexpansionToolMaterial", ThermalexpansionToolMaterial);
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map InformToolMaterialMap = new HashMap(); 
		
		String OriginalFilename = InformToolMaterial.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informToolMaterial/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			InformToolMaterial.transferTo(materials_big_img_file); 
			InformToolMaterialMap.put("url_InformToolMaterial", "/informToolMaterial/" + big_url + "." + fileSuffix);
			InformToolMaterialMap.put("id_CuttingToolMaterialD", id_CuttingToolMaterialD);
			array_InformToolMaterial = array_InformToolMaterial + "/informToolMaterial/" + big_url + "." + fileSuffix + ",";
			array_InformToolMaterial_name = array_InformToolMaterial_name + OriginalFilename + ",";

		}else{

		}
		//查询材料主要成分列表
		String ISOCuttingMaterial_str = (String)ISOCuttingMaterial;
		List<Map> ISOCuttingMaterialList = new ArrayList();
		if(ISOCuttingMaterial_str != null && !"".equals(ISOCuttingMaterial_str)){
			String ConstituentsMaterials[] = ISOCuttingMaterial_str.split(",");
			for(int j=0;j<ConstituentsMaterials.length;j++){
				if(ConstituentsMaterials[j] != null && !"".equals(ConstituentsMaterials[j])){
					String yuansu = ConstituentsMaterials[j].split("-")[0];
					String baifenbi = ConstituentsMaterials[j].split("-")[1];
					Map temp1 = new HashMap();
					temp1.put("yuansu", yuansu);
					temp1.put("baifenbi", baifenbi);
					ISOCuttingMaterialList.add(temp1);
				}
			}
		cuttingToolMaterial.put("ISOCuttingMaterialList", ISOCuttingMaterialList);
		}
		
		//查询材料类别列表
		List<Map> categoryToolMaterialList = cuttingToolMaterialService.queryCategoryToolMaterialList();
		
		mv.addObject("categoryToolMaterialList", categoryToolMaterialList);	
		mv.addObject("array_PictureToolMaterial", array_PictureToolMaterial);
		mv.addObject("array_InformToolMaterial", array_InformToolMaterial);
		mv.addObject("array_InformToolMaterial_name", array_InformToolMaterial_name);
		mv.addObject("array_ApplicationToolMaterial", array_ApplicationToolMaterial);
		mv.addObject("array_ApplicationToolMaterial_name", array_ApplicationToolMaterial_name);
		
		mv.addObject("cuttingToolMaterial", cuttingToolMaterial);
		
		mv.setViewName("/WEB-INF/material/cuttingToolMaterial/cuttingToolMaterial_edit");

		return mv;
		
	}

	@RequestMapping(value="/saveApplicationToolMaterial")
	public ModelAndView saveApplicationToolMaterial(
			int id_CuttingToolMaterialD, 
			String array_PictureToolMaterial, 
			String array_InformToolMaterial, String array_InformToolMaterial_name,
			String array_ApplicationToolMaterial, String array_ApplicationToolMaterial_name, 
			String NameToolMaterial, String NumberToolMaterial, String CategoryToolMaterial, String CompanyToolMaterial, String ISOCuttingMaterial,
			String MachineableMaterial, String DensityToolMaterial,	String HardnessToolMaterial, String BendingStrengthToolMaterial, String ImpactToughnessToolMaterial, 
			String ModulusToolMaterial,	String HeatResistanceToolMaterial, String ConductivityToolMaterial,	String ThermalexpansionToolMaterial,
			@RequestParam(value="ApplicationToolMaterial",required=false)CommonsMultipartFile ApplicationToolMaterial ,
			HttpServletRequest request ) throws Exception{
		
		Map cuttingToolMaterial = new HashMap();
		
		cuttingToolMaterial.put("id_CuttingToolMaterialD", id_CuttingToolMaterialD);
		cuttingToolMaterial.put("NameToolMaterial", NameToolMaterial);
		cuttingToolMaterial.put("NumberToolMaterial", NumberToolMaterial);
		
		Map temp = new HashMap();
		temp.put("name_CategoryToolMaterial", CategoryToolMaterial);
		Map categoryToolMaterial = cuttingToolMaterialService.queryCategoryToolMaterialByName(temp);
		if(categoryToolMaterial!=null || "".equals(categoryToolMaterial)){
			cuttingToolMaterial.put("CategoryToolMaterial", categoryToolMaterial.get("id_CategoryToolMaterial"));
		}
		
		cuttingToolMaterial.put("CompanyToolMaterial", CompanyToolMaterial);
		cuttingToolMaterial.put("ISOCuttingMaterial", ISOCuttingMaterial);
		cuttingToolMaterial.put("MachineableMaterial", MachineableMaterial);
		cuttingToolMaterial.put("DensityToolMaterial", DensityToolMaterial);
		cuttingToolMaterial.put("HardnessToolMaterial", HardnessToolMaterial);
		cuttingToolMaterial.put("BendingStrengthToolMaterial", BendingStrengthToolMaterial);
		cuttingToolMaterial.put("ImpactToughnessToolMaterial", ImpactToughnessToolMaterial);
		cuttingToolMaterial.put("ModulusToolMaterial", ModulusToolMaterial);
		cuttingToolMaterial.put("HeatResistanceToolMaterial", HeatResistanceToolMaterial);
		cuttingToolMaterial.put("ConductivityToolMaterial", ConductivityToolMaterial);
		cuttingToolMaterial.put("ThermalexpansionToolMaterial", ThermalexpansionToolMaterial);
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map ApplicationToolMaterialMap = new HashMap(); 
		
		String OriginalFilename = ApplicationToolMaterial.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/applicationToolMaterial/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			ApplicationToolMaterial.transferTo(materials_big_img_file); 
			ApplicationToolMaterialMap.put("url_ApplicationToolMaterial", "/applicationToolMaterial/" + big_url + "." + fileSuffix);
			ApplicationToolMaterialMap.put("id_CuttingToolMaterialD", id_CuttingToolMaterialD);
			array_ApplicationToolMaterial = array_ApplicationToolMaterial + "/applicationToolMaterial/" + big_url + "." + fileSuffix + ",";
			array_ApplicationToolMaterial_name = array_ApplicationToolMaterial_name + OriginalFilename + ",";

		}else{

		}
		//查询材料主要成分列表
		String ISOCuttingMaterial_str = (String)ISOCuttingMaterial;
		List<Map> ISOCuttingMaterialList = new ArrayList();
		if(ISOCuttingMaterial_str != null && !"".equals(ISOCuttingMaterial_str)){
			String ConstituentsMaterials[] = ISOCuttingMaterial_str.split(",");
			for(int j=0;j<ConstituentsMaterials.length;j++){
				if(ConstituentsMaterials[j] != null && !"".equals(ConstituentsMaterials[j])){
					String yuansu = ConstituentsMaterials[j].split("-")[0];
					String baifenbi = ConstituentsMaterials[j].split("-")[1];
					Map temp1 = new HashMap();
					temp1.put("yuansu", yuansu);
					temp1.put("baifenbi", baifenbi);
					ISOCuttingMaterialList.add(temp1);
				}
			}
		cuttingToolMaterial.put("ISOCuttingMaterialList", ISOCuttingMaterialList);
		}
		
		//查询材料类别列表
		List<Map> categoryToolMaterialList = cuttingToolMaterialService.queryCategoryToolMaterialList();
		
		mv.addObject("categoryToolMaterialList", categoryToolMaterialList);
		mv.addObject("array_PictureToolMaterial", array_PictureToolMaterial);
		mv.addObject("array_InformToolMaterial", array_InformToolMaterial);
		mv.addObject("array_InformToolMaterial_name", array_InformToolMaterial_name);
		mv.addObject("array_ApplicationToolMaterial", array_ApplicationToolMaterial);
		mv.addObject("array_ApplicationToolMaterial_name", array_ApplicationToolMaterial_name);
		
		mv.addObject("cuttingToolMaterial", cuttingToolMaterial);
		
		mv.setViewName("/WEB-INF/material/cuttingToolMaterial/cuttingToolMaterial_edit");

		return mv;
		
	}
	
	
	
	
	
	/**
	 * 删除工件材料
	 * @param id_BTADrill
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteCuttingToolMaterial")
	public String deleteCuttingToolMaterial(String id_CuttingToolMaterialD) {
		Map para = new HashMap();
		para.put("id_CuttingToolMaterialD", id_CuttingToolMaterialD);
		try {
		
			cuttingToolMaterialService.clearPictureToolMaterialByIdCuttingToolMaterial(para);
		
			cuttingToolMaterialService.clearInformToolMaterialByIdCuttingToolMaterial(para);
			
			cuttingToolMaterialService.clearApplicationToolMaterialByIdCuttingToolMaterial(para);
			
			cuttingToolMaterialService.deleteCuttingToolMaterial(para);
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
	
	
		
}
