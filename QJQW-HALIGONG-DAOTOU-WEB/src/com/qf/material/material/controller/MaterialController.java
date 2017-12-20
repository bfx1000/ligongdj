package com.qf.material.material.controller;

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

import com.qf.material.material.service.MaterialService;
import com.qf.tool.turningBlade.service.TurningBladeService;
import com.qf.tool.turningHolder.service.TurningHolderService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.common.JackJson;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;

/**
 * 工件材料controller
 * @ClassName:  MaterialController   
 * @Description:TODO
 * @author: 	yinxf
 * @date:   	2017年10月29日 上午11:17:44   
 *
 */
@Controller
@RequestMapping("/material")
public class MaterialController  extends BaseController{
	
	@Resource(name="materialService")
    private MaterialService materialService;  
	

	/**
	 * 查询工件材料列表
	 * @param page
	 * @param request
	 * @return ModelAndView mv
	 */
    @RequestMapping("queryMaterialList")
	public ModelAndView queryMaterialList(Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= materialService.queryMaterialList(page);//查询工件材料列表
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			if(list != null && list.size() > 0){
				for(int i = 0; i < list.size(); i++){
					Map material = list.get(i);
					int id_Material = (int) material.get("id_Material");
					
					Map para = new HashMap();
					para.put("id_Material", id_Material);
					
					//查询材料图片列表 PictureMaterial
					List<Map> pictureMaterialList = materialService.queryPictureMaterialList(para);
					//查询详细信息列表 InformDetailMaterial
					List<Map> informDetailMaterialList = materialService.queryInformDetailMaterialList(para);
					//查询应用实例列表 ApplicationMaterial
					List<Map> applicationMaterialList = materialService.queryApplicationMaterialList(para);
					//查询仿真参数列表 SimulationMaterial
					List<Map> simulationMaterialList = materialService.querySimulationMaterialList(para);
					
					material.put("pictureMaterialList", pictureMaterialList);
					material.put("informDetailMaterialList", informDetailMaterialList);
					material.put("applicationMaterialList", applicationMaterialList);
					material.put("simulationMaterialList", simulationMaterialList);
					
					//查询材料主要成分列表
					String ConstituentsMaterial_str = (String) material.get("ConstituentsMaterial");
					List<Map> ConstituentsMaterialList = new ArrayList();
					if(ConstituentsMaterial_str != null && !"".equals(ConstituentsMaterial_str)){
						String ConstituentsMaterials[] = ConstituentsMaterial_str.split(",");
						for(int j=0;j<ConstituentsMaterials.length;j++){
							if(ConstituentsMaterials[j] != null && !"".equals(ConstituentsMaterials[j])){
								String yuansu = ConstituentsMaterials[j].split("-")[0];
								String baifenbi = ConstituentsMaterials[j].split("-")[1];
								Map temp = new HashMap();
								temp.put("yuansu", yuansu);
								temp.put("baifenbi", baifenbi);
								ConstituentsMaterialList.add(temp);
							}
						}
						material.put("ConstituentsMaterialList", ConstituentsMaterialList);
						
					}
					
					//查询应变 应变率列表
					String StrainRate_str = (String) material.get("StrainRate");
					List<Map> StrainRateList = new ArrayList();
					if(StrainRate_str != null && !"".equals(StrainRate_str)){
						String StrainRates[] = StrainRate_str.split(",");
						for(int j=0;j<StrainRates.length;j++){
							if(StrainRates[j] != null && !"".equals(StrainRates[j])){
								String shujudian = StrainRates[j].split("-")[0];
								String wendu = StrainRates[j].split("-")[1];
								String yingbian = StrainRates[j].split("-")[2];
								String yingbianlv = StrainRates[j].split("-")[3];
								Map temp = new HashMap();
								temp.put("shujudian", shujudian);
								temp.put("wendu", wendu);
								temp.put("yingbian", yingbian);
								temp.put("yingbianlv", yingbianlv);
								StrainRateList.add(temp);
							}
						}
						material.put("StrainRateList", StrainRateList);
						
					}
					
					//JC模型
					String JCMaterial_str = (String) material.get("JCMaterial");
					if(JCMaterial_str != null && !"".equals(JCMaterial_str)){
						String JCMaterials[] = JCMaterial_str.split(",");
						material.put("JCMaterials", JCMaterials);
					}
					
					list.set(i, material);
				}
			}
			
			//查询材料类别列表
			List<Map> categoryMaterialList = materialService.queryCategoryMaterialList();
			
			mv.addObject("categoryMaterialList", categoryMaterialList);
			mv.addObject("materialList", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/material/material/materialList");
		return mv;
	}


    /**
	 * 去新增工件材料页面
	 */
	@RequestMapping(value="/goAddMaterial")
	public ModelAndView goAddMaterial(String id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
			
		Map para = new HashMap();
		para.put("id_Material", id);
		Map material = materialService.queryMaterialById(para);//查询工件材料数据
		if(material != null){
			
			//查询材料图片列表 PictureMaterial
			List<Map> pictureMaterialList = materialService.queryPictureMaterialList(para);
			String array_PictureMaterial = "";
			if(pictureMaterialList != null && pictureMaterialList.size() > 0){
				for(int i = 0; i < pictureMaterialList.size(); i++){
					array_PictureMaterial = array_PictureMaterial + pictureMaterialList.get(i).get("url_PictureMaterial") + ",";
				}
			}
			//查询详细信息列表 InformDetailMaterial
			List<Map> informDetailMaterialList = materialService.queryInformDetailMaterialList(para);
			String array_InformDetailMaterial = "";
			String array_InformDetailMaterial_name = "";
			if(informDetailMaterialList != null && informDetailMaterialList.size() > 0){
				for(int i = 0; i < informDetailMaterialList.size(); i++){
					array_InformDetailMaterial = array_InformDetailMaterial + informDetailMaterialList.get(i).get("url_InformDetailMaterial") + ",";
					array_InformDetailMaterial_name = array_InformDetailMaterial_name + informDetailMaterialList.get(i).get("name_InformDetailMaterial") + ",";
				}
			}
			//查询应用实例列表 ApplicationMaterial
			List<Map> applicationMaterialList = materialService.queryApplicationMaterialList(para);
			String array_ApplicationMaterial = "";
			String array_ApplicationMaterial_name = "";
			if(applicationMaterialList != null && applicationMaterialList.size() > 0){
				for(int i = 0; i < applicationMaterialList.size(); i++){
					array_ApplicationMaterial = array_ApplicationMaterial + applicationMaterialList.get(i).get("url_ApplicationMaterial") + ",";
					array_ApplicationMaterial_name = array_ApplicationMaterial_name + applicationMaterialList.get(i).get("name_ApplicationMaterial") + ",";
				}
			}
			//查询仿真参数列表 SimulationMaterial
			List<Map> simulationMaterialList = materialService.querySimulationMaterialList(para);
			String array_SimulationMaterial = "";
			String array_SimulationMaterial_name = "";
			if(simulationMaterialList != null && simulationMaterialList.size() > 0){
				for(int i = 0; i < simulationMaterialList.size(); i++){
					array_SimulationMaterial = array_SimulationMaterial + simulationMaterialList.get(i).get("url_SimulationMaterial") + ",";
					array_SimulationMaterial_name = array_SimulationMaterial_name + simulationMaterialList.get(i).get("name_SimulationMaterial") + ",";
				}
			}
			
			//查询材料主要成分列表
			String ConstituentsMaterial_str = (String) material.get("ConstituentsMaterial");
			List<Map> ConstituentsMaterialList = new ArrayList();
			if(ConstituentsMaterial_str != null && !"".equals(ConstituentsMaterial_str)){
				String ConstituentsMaterials[] = ConstituentsMaterial_str.split(",");
				for(int i=0;i<ConstituentsMaterials.length;i++){
					if(ConstituentsMaterials[i] != null && !"".equals(ConstituentsMaterials[i])){
						String yuansu = ConstituentsMaterials[i].split("-")[0];
						String baifenbi = ConstituentsMaterials[i].split("-")[1];
						Map temp = new HashMap();
						temp.put("yuansu", yuansu);
						temp.put("baifenbi", baifenbi);
						ConstituentsMaterialList.add(temp);
					}
				}
				material.put("ConstituentsMaterialList", ConstituentsMaterialList);
				
			}
			
			//查询应变 应变率列表
			String StrainRate_str = (String) material.get("StrainRate");
			List<Map> StrainRateList = new ArrayList();
			if(StrainRate_str != null && !"".equals(StrainRate_str)){
				String StrainRates[] = StrainRate_str.split(",");
				for(int i=0;i<StrainRates.length;i++){
					if(StrainRates[i] != null && !"".equals(StrainRates[i])){
						String shujudian = StrainRates[i].split("-")[0];
						String wendu = StrainRates[i].split("-")[1];
						String yingbian = StrainRates[i].split("-")[2];
						String yingbianlv = StrainRates[i].split("-")[3];
						Map temp = new HashMap();
						temp.put("shujudian", shujudian);
						temp.put("wendu", wendu);
						temp.put("yingbian", yingbian);
						temp.put("yingbianlv", yingbianlv);
						StrainRateList.add(temp);
					}
				}
				material.put("StrainRateList", StrainRateList);
				
			}
			
			//JC模型
			String JCMaterial_str = (String) material.get("JCMaterial");
			if(JCMaterial_str != null && !"".equals(JCMaterial_str)){
				String JCMaterials[] = JCMaterial_str.split(",");
				material.put("JCMaterials", JCMaterials);
			}
			
			material.put("pictureMaterialList", pictureMaterialList);
			material.put("informDetailMaterialList", informDetailMaterialList);
			material.put("applicationMaterialList", applicationMaterialList);
			material.put("simulationMaterialList", simulationMaterialList);
			
			mv.addObject("array_PictureMaterial", array_PictureMaterial);
			mv.addObject("array_InformDetailMaterial", array_InformDetailMaterial);
			mv.addObject("array_InformDetailMaterial_name", array_InformDetailMaterial_name);
			mv.addObject("array_ApplicationMaterial", array_ApplicationMaterial);
			mv.addObject("array_ApplicationMaterial_name", array_ApplicationMaterial_name);
			mv.addObject("array_SimulationMaterial", array_SimulationMaterial);
			mv.addObject("array_SimulationMaterial_name", array_SimulationMaterial_name);
			
		}
		
		//查询材料类别列表
		List<Map> categoryMaterialList = materialService.queryCategoryMaterialList();
		
		mv.setViewName("/WEB-INF/material/material/material_edit");
		mv.addObject("msg", "saveMaterial");
		mv.addObject("turn_url", turn_url);
		mv.addObject("material", material);
		mv.addObject("categoryMaterialList", categoryMaterialList);
		
		mv.addObject("pd", pd);

		return mv;
	}


	/**
	 * 保存工件材料
	 * @param request
	 * @param id_TurningHolder
	 * @param array_PictureTurningHolder
	 * @param array_PictureDetailTurningHolder
	 * @param array_InformDetailTurningHolder
	 * @param array_InformDetailTurningHolder_name
	 * @param NumberTurningHolder
	 * @param NameTurningHolder
	 * @param TypeTurningHolder
	 * @param TypeCustomTurningHolder
	 * @param ISOBladeTurning
	 * @param TypeBlade
	 * @param TypeCustomBlade
	 * @param DiameterTurningHolder
	 * @param CompanyTurningHolder
	 * @param FeatureTurningHolder
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/saveMaterial")
	public String saveMaterial(HttpServletRequest request, 
			int id_Material, 
			String array_PictureMaterial, 
			String array_InformDetailMaterial, String array_InformDetailMaterial_name,
			String array_ApplicationMaterial, String array_ApplicationMaterial_name, 
			String array_SimulationMaterial, String array_SimulationMaterial_name, 
			String NameMaterial, String NumberMaterial, String id_CategoryMaterial, String ISOCuttingMaterial, String CategoryMaterial,
			String CompanyMaterial, String ConstituentsMaterial, String MachineableMaterial, String DensityMaterial, String ModulusMaterial,
			String HardnessMaterial, String ConductivityMaterial,	String SpecificheatMaterial, String StrengthMaterial,	String ThermalExpansionMaterial,
			String JCMaterial,	String StrainRate
			) {
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		Map para = new HashMap();
		
		para.put("id_Material", id_Material);
		para.put("NameMaterial", NameMaterial);
		para.put("NumberMaterial", NumberMaterial);
		
		Map temp = new HashMap();
		temp.put("name_CategoryMaterial", id_CategoryMaterial);
		//根据名称查询材料类别
		Map categoryMaterial = materialService.queryCategoryMaterialById(temp);
		if(categoryMaterial != null && !"".equals(categoryMaterial)){
			para.put("id_CategoryMaterial", categoryMaterial.get("id_CategoryMaterial"));
		}else{
			//保存新的材料类别
			materialService.saveCategoryMaterial(temp);
			para.put("id_CategoryMaterial", temp.get("id_CategoryMaterial"));
		}
		
		para.put("ISOCuttingMaterial", ISOCuttingMaterial);
		para.put("CategoryMaterial", CategoryMaterial);
		para.put("CompanyMaterial", CompanyMaterial);
		para.put("ConstituentsMaterial", ConstituentsMaterial);
		para.put("MachineableMaterial", MachineableMaterial);
		para.put("DensityMaterial", DensityMaterial);
		para.put("ModulusMaterial", ModulusMaterial);
		para.put("HardnessMaterial", HardnessMaterial);
		para.put("ConductivityMaterial", ConductivityMaterial);
		para.put("SpecificheatMaterial", SpecificheatMaterial);
		para.put("StrengthMaterial", StrengthMaterial);
		para.put("ThermalExpansionMaterial", ThermalExpansionMaterial);
		para.put("JCMaterial", JCMaterial);
		para.put("StrainRate", StrainRate);
		
		para.put("add_time", System.currentTimeMillis() / 1000);
		if(user != null){
			para.put("user_id", user.get("user_id"));
		}else{
			para.put("user_id", 0);
		}
		try {
			if(id_Material != 0){//修改
				materialService.updateMaterial(para);
			}else{//新增
				
				materialService.saveMaterial(para);
			}
			
			//清空材料图片路径 PictureMaterial
			materialService.clearPictureMaterialByIdMaterial(para);
			//保存刀柄图片
			if(array_PictureMaterial != null && !"".equals(array_PictureMaterial)){
				String array_PictureMaterials[] = array_PictureMaterial.split(",");
				for(int i=0; i<array_PictureMaterials.length; i++){
					if(array_PictureMaterials[i] != null && !"".equals(array_PictureMaterials[i])){
						para.put("url_PictureMaterial", array_PictureMaterials[i]);
						materialService.savePictureMaterial(para);
					}
				}
			}
			
			
			//清空详细信息路径
			materialService.clearInformDetailMaterialByIdMaterial(para);
			//保存刀柄图片
			if(array_InformDetailMaterial != null && !"".equals(array_InformDetailMaterial)){
				String array_InformDetailMaterials[] = array_InformDetailMaterial.split(",");
				String array_InformDetailMaterials_name[] = array_InformDetailMaterial_name.split(",");
				for(int i=0; i<array_InformDetailMaterials.length; i++){
					if(array_InformDetailMaterials[i] != null && !"".equals(array_InformDetailMaterials[i])){
						para.put("url_InformDetailMaterial", array_InformDetailMaterials[i]);
						para.put("name_InformDetailMaterial", array_InformDetailMaterials_name[i]);
						materialService.saveInformDetailMaterial(para);
					}
				}
			}
			
			//清空应用实例路径
			materialService.clearApplicationMaterialByIdMaterial(para);
			//保存刀柄图片
			if(array_ApplicationMaterial != null && !"".equals(array_ApplicationMaterial)){
				String array_ApplicationMaterials[] = array_ApplicationMaterial.split(",");
				String array_ApplicationMaterials_name[] = array_ApplicationMaterial_name.split(",");
				for(int i=0; i<array_ApplicationMaterials.length; i++){
					if(array_ApplicationMaterials[i] != null && !"".equals(array_ApplicationMaterials[i])){
						para.put("url_ApplicationMaterial", array_ApplicationMaterials[i]);
						para.put("name_ApplicationMaterial", array_ApplicationMaterials_name[i]);
						materialService.saveApplicationMaterial(para);
					}
				}
			}
			
			//清空仿真参数路径
			materialService.clearSimulationMaterialByIdMaterial(para);
			//保存刀柄图片
			if(array_SimulationMaterial != null && !"".equals(array_SimulationMaterial)){
				String array_SimulationMaterials[] = array_SimulationMaterial.split(",");
				String array_SimulationMaterials_name[] = array_SimulationMaterial_name.split(",");
				for(int i=0; i<array_SimulationMaterials.length; i++){
					if(array_SimulationMaterials[i] != null && !"".equals(array_SimulationMaterials[i])){
						para.put("url_SimulationMaterial", array_SimulationMaterials[i]);
						para.put("name_SimulationMaterial", array_SimulationMaterials_name[i]);
						materialService.saveSimulationMaterial(para);
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
	@RequestMapping(value="/savePictureMaterial")
	public ModelAndView savePictureMaterial(
			int id_Material, 
			String array_PictureMaterial, 
			String array_InformDetailMaterial, String array_InformDetailMaterial_name,
			String array_ApplicationMaterial, String array_ApplicationMaterial_name, 
			String array_SimulationMaterial, String array_SimulationMaterial_name, 
			String NameMaterial, String NumberMaterial, String id_CategoryMaterial, String ISOCuttingMaterial, String CategoryMaterial,
			String CompanyMaterial, String ConstituentsMaterial, String MachineableMaterial, String DensityMaterial, String ModulusMaterial,
			String HardnessMaterial, String ConductivityMaterial,	String SpecificheatMaterial, String StrengthMaterial,	String ThermalExpansionMaterial,
			String JCMaterial,	String StrainRate,
			@RequestParam(value="PictureMaterial",required=false)CommonsMultipartFile PictureMaterial ,
			HttpServletRequest request ) throws Exception{
		
		Map material = new HashMap();
		
		material.put("id_Material", id_Material);
		material.put("NameMaterial", NameMaterial);
		material.put("NumberMaterial", NumberMaterial);
		
		Map temp = new HashMap();
		temp.put("name_CategoryMaterial", id_CategoryMaterial);
		//根据名称查询材料类别
		Map categoryMaterial = materialService.queryCategoryMaterialById(temp);
	
		material.put("id_CategoryMaterial", categoryMaterial.get("id_CategoryMaterial"));
			
//		material.put("id_CategoryMaterial", id_CategoryMaterial);
		material.put("ISOCuttingMaterial", ISOCuttingMaterial);
		material.put("CategoryMaterial", CategoryMaterial);
		material.put("CompanyMaterial", CompanyMaterial);
		material.put("ConstituentsMaterial", ConstituentsMaterial);
		material.put("MachineableMaterial", MachineableMaterial);
		material.put("DensityMaterial", DensityMaterial);
		material.put("ModulusMaterial", ModulusMaterial);
		material.put("HardnessMaterial", HardnessMaterial);
		material.put("ConductivityMaterial", ConductivityMaterial);
		material.put("SpecificheatMaterial", SpecificheatMaterial);
		material.put("StrengthMaterial", StrengthMaterial);
		material.put("ThermalExpansionMaterial", ThermalExpansionMaterial);
		material.put("JCMaterial", JCMaterial);
		material.put("StrainRate", StrainRate);
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureMaterialMap = new HashMap(); 
		
		String OriginalFilename = PictureMaterial.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureMaterial/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			PictureMaterial.transferTo(materials_big_img_file); 
			PictureMaterialMap.put("url_PictureMaterial", "/pictureMaterial/" + big_url + "." + fileSuffix);
			PictureMaterialMap.put("id_Material", id_Material);
			array_PictureMaterial = array_PictureMaterial + "/pictureMaterial/" + big_url + "." + fileSuffix + ",";
		}else{

		}
		
		//查询材料主要成分列表
		String ConstituentsMaterial_str = (String) ConstituentsMaterial;
		List<Map> ConstituentsMaterialList = new ArrayList();
		if(ConstituentsMaterial_str != null && !"".equals(ConstituentsMaterial_str)){
			String ConstituentsMaterials[] = ConstituentsMaterial_str.split(",");
			for(int i=0;i<ConstituentsMaterials.length;i++){
				if(ConstituentsMaterials[i] != null && !"".equals(ConstituentsMaterials[i])){
					String yuansu = ConstituentsMaterials[i].split("-")[0];
					String baifenbi = ConstituentsMaterials[i].split("-")[1];
					Map temp1 = new HashMap();
					temp1.put("yuansu", yuansu);
					temp1.put("baifenbi", baifenbi);
					ConstituentsMaterialList.add(temp1);
				}
			}
			material.put("ConstituentsMaterialList", ConstituentsMaterialList);
			
		}
		//查询材料类别列表
		List<Map> categoryMaterialList = materialService.queryCategoryMaterialList();
	
		mv.addObject("array_PictureMaterial", array_PictureMaterial);
		mv.addObject("array_InformDetailMaterial", array_InformDetailMaterial);
		mv.addObject("array_InformDetailMaterial_name", array_InformDetailMaterial_name);
		mv.addObject("array_ApplicationMaterial", array_ApplicationMaterial);
		mv.addObject("array_ApplicationMaterial_name", array_ApplicationMaterial_name);
		mv.addObject("array_SimulationMaterial", array_SimulationMaterial);
		mv.addObject("array_SimulationMaterial_name", array_SimulationMaterial_name);
		
		mv.addObject("material", material);
		mv.addObject("categoryMaterialList", categoryMaterialList);
		
		mv.setViewName("/WEB-INF/material/material/material_edit");

		return mv;
		
	}
	
	/**
	 * 保存详细信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveInformDetailMaterial")
	public ModelAndView saveInformDetailMaterial(
			int id_Material, 
			String array_PictureMaterial, 
			String array_InformDetailMaterial, String array_InformDetailMaterial_name,
			String array_ApplicationMaterial, String array_ApplicationMaterial_name, 
			String array_SimulationMaterial, String array_SimulationMaterial_name, 
			String NameMaterial, String NumberMaterial, String id_CategoryMaterial, String ISOCuttingMaterial, String CategoryMaterial,
			String CompanyMaterial, String ConstituentsMaterial, String MachineableMaterial, String DensityMaterial, String ModulusMaterial,
			String HardnessMaterial, String ConductivityMaterial,	String SpecificheatMaterial, String StrengthMaterial,	String ThermalExpansionMaterial,
			String JCMaterial,	String StrainRate,
			@RequestParam(value="InformDetailMaterial",required=false)CommonsMultipartFile InformDetailMaterial ,
			HttpServletRequest request ) throws Exception{
		
		Map material = new HashMap();
		
		material.put("id_Material", id_Material);
		material.put("NameMaterial", NameMaterial);
		material.put("NumberMaterial", NumberMaterial);
		Map temp = new HashMap();
		temp.put("name_CategoryMaterial", id_CategoryMaterial);
		//根据名称查询材料类别
		Map categoryMaterial = materialService.queryCategoryMaterialById(temp);
	
		material.put("id_CategoryMaterial", categoryMaterial.get("id_CategoryMaterial"));
//		material.put("id_CategoryMaterial", id_CategoryMaterial);
		material.put("ISOCuttingMaterial", ISOCuttingMaterial);
		material.put("CategoryMaterial", CategoryMaterial);
		material.put("CompanyMaterial", CompanyMaterial);
		material.put("ConstituentsMaterial", ConstituentsMaterial);
		material.put("MachineableMaterial", MachineableMaterial);
		material.put("DensityMaterial", DensityMaterial);
		material.put("ModulusMaterial", ModulusMaterial);
		material.put("HardnessMaterial", HardnessMaterial);
		material.put("ConductivityMaterial", ConductivityMaterial);
		material.put("SpecificheatMaterial", SpecificheatMaterial);
		material.put("StrengthMaterial", StrengthMaterial);
		material.put("ThermalExpansionMaterial", ThermalExpansionMaterial);
		material.put("JCMaterial", JCMaterial);
		material.put("StrainRate", StrainRate);
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map InformDetailMaterialMap = new HashMap(); 
		
		String OriginalFilename = InformDetailMaterial.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informDetailMaterial/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			InformDetailMaterial.transferTo(materials_big_img_file); 
			InformDetailMaterialMap.put("url_InformDetailMaterial", "/informDetailMaterial/" + big_url + "." + fileSuffix);
			InformDetailMaterialMap.put("id_Material", id_Material);
			array_InformDetailMaterial = array_InformDetailMaterial + "/informDetailMaterial/" + big_url + "." + fileSuffix + ",";
			array_InformDetailMaterial_name = array_InformDetailMaterial_name + OriginalFilename + ",";

		}else{

		}
		
		//查询材料主要成分列表
		String ConstituentsMaterial_str = (String) ConstituentsMaterial;
		List<Map> ConstituentsMaterialList = new ArrayList();
		if(ConstituentsMaterial_str != null && !"".equals(ConstituentsMaterial_str)){
			String ConstituentsMaterials[] = ConstituentsMaterial_str.split(",");
			for(int i=0;i<ConstituentsMaterials.length;i++){
				if(ConstituentsMaterials[i] != null && !"".equals(ConstituentsMaterials[i])){
					String yuansu = ConstituentsMaterials[i].split("-")[0];
					String baifenbi = ConstituentsMaterials[i].split("-")[1];
					Map temp1 = new HashMap();
					temp1.put("yuansu", yuansu);
					temp1.put("baifenbi", baifenbi);
					ConstituentsMaterialList.add(temp1);
				}
			}
			material.put("ConstituentsMaterialList", ConstituentsMaterialList);
			
		}
		//查询材料类别列表
		List<Map> categoryMaterialList = materialService.queryCategoryMaterialList();
			
		mv.addObject("array_PictureMaterial", array_PictureMaterial);
		mv.addObject("array_InformDetailMaterial", array_InformDetailMaterial);
		mv.addObject("array_InformDetailMaterial_name", array_InformDetailMaterial_name);
		mv.addObject("array_ApplicationMaterial", array_ApplicationMaterial);
		mv.addObject("array_ApplicationMaterial_name", array_ApplicationMaterial_name);
		mv.addObject("array_SimulationMaterial", array_SimulationMaterial);
		mv.addObject("array_SimulationMaterial_name", array_SimulationMaterial_name);
		mv.addObject("categoryMaterialList", categoryMaterialList);
		
		mv.addObject("material", material);
		
		mv.setViewName("/WEB-INF/material/material/material_edit");

		return mv;
		
	}
	/**
	 * 保存应用实例
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveApplicationMaterial")
	public ModelAndView saveApplicationMaterial(
			int id_Material, 
			String array_PictureMaterial, 
			String array_InformDetailMaterial, String array_InformDetailMaterial_name,
			String array_ApplicationMaterial, String array_ApplicationMaterial_name, 
			String array_SimulationMaterial, String array_SimulationMaterial_name, 
			String NameMaterial, String NumberMaterial, String id_CategoryMaterial, String ISOCuttingMaterial, String CategoryMaterial,
			String CompanyMaterial, String ConstituentsMaterial, String MachineableMaterial, String DensityMaterial, String ModulusMaterial,
			String HardnessMaterial, String ConductivityMaterial,	String SpecificheatMaterial, String StrengthMaterial,	String ThermalExpansionMaterial,
			String JCMaterial,	String StrainRate,
			@RequestParam(value="ApplicationMaterial",required=false)CommonsMultipartFile ApplicationMaterial ,
			HttpServletRequest request ) throws Exception{
		
		Map material = new HashMap();
		
		material.put("id_Material", id_Material);
		material.put("NameMaterial", NameMaterial);
		material.put("NumberMaterial", NumberMaterial);
		Map temp = new HashMap();
		temp.put("name_CategoryMaterial", id_CategoryMaterial);
		//根据名称查询材料类别
		Map categoryMaterial = materialService.queryCategoryMaterialById(temp);
	
		material.put("id_CategoryMaterial", categoryMaterial.get("id_CategoryMaterial"));
		material.put("ISOCuttingMaterial", ISOCuttingMaterial);
		material.put("CategoryMaterial", CategoryMaterial);
		material.put("CompanyMaterial", CompanyMaterial);
		material.put("ConstituentsMaterial", ConstituentsMaterial);
		material.put("MachineableMaterial", MachineableMaterial);
		material.put("DensityMaterial", DensityMaterial);
		material.put("ModulusMaterial", ModulusMaterial);
		material.put("HardnessMaterial", HardnessMaterial);
		material.put("ConductivityMaterial", ConductivityMaterial);
		material.put("SpecificheatMaterial", SpecificheatMaterial);
		material.put("StrengthMaterial", StrengthMaterial);
		material.put("ThermalExpansionMaterial", ThermalExpansionMaterial);
		material.put("JCMaterial", JCMaterial);
		material.put("StrainRate", StrainRate);
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map ApplicationMaterialMap = new HashMap(); 
		
		String OriginalFilename = ApplicationMaterial.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/applicationMaterial/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			ApplicationMaterial.transferTo(materials_big_img_file); 
			ApplicationMaterialMap.put("url_ApplicationMaterial", "/applicationMaterial/" + big_url + "." + fileSuffix);
			ApplicationMaterialMap.put("id_Material", id_Material);
			array_ApplicationMaterial = array_ApplicationMaterial + "/applicationMaterial/" + big_url + "." + fileSuffix + ",";
			array_ApplicationMaterial_name = array_ApplicationMaterial_name + OriginalFilename + ",";

		}else{

		}
		//查询材料主要成分列表
		String ConstituentsMaterial_str = (String) ConstituentsMaterial;
		List<Map> ConstituentsMaterialList = new ArrayList();
		if(ConstituentsMaterial_str != null && !"".equals(ConstituentsMaterial_str)){
			String ConstituentsMaterials[] = ConstituentsMaterial_str.split(",");
			for(int i=0;i<ConstituentsMaterials.length;i++){
				if(ConstituentsMaterials[i] != null && !"".equals(ConstituentsMaterials[i])){
					String yuansu = ConstituentsMaterials[i].split("-")[0];
					String baifenbi = ConstituentsMaterials[i].split("-")[1];
					Map temp1 = new HashMap();
					temp1.put("yuansu", yuansu);
					temp1.put("baifenbi", baifenbi);
					ConstituentsMaterialList.add(temp1);
				}
			}
			material.put("ConstituentsMaterialList", ConstituentsMaterialList);
			
		}
		//查询材料类别列表
		List<Map> categoryMaterialList = materialService.queryCategoryMaterialList();
				
		mv.addObject("array_PictureMaterial", array_PictureMaterial);
		mv.addObject("array_InformDetailMaterial", array_InformDetailMaterial);
		mv.addObject("array_InformDetailMaterial_name", array_InformDetailMaterial_name);
		mv.addObject("array_ApplicationMaterial", array_ApplicationMaterial);
		mv.addObject("array_ApplicationMaterial_name", array_ApplicationMaterial_name);
		mv.addObject("array_SimulationMaterial", array_SimulationMaterial);
		mv.addObject("array_SimulationMaterial_name", array_SimulationMaterial_name);
		mv.addObject("categoryMaterialList", categoryMaterialList);
		
		mv.addObject("material", material);
		
		mv.setViewName("/WEB-INF/material/material/material_edit");

		return mv;
		
	}
	
	/**
	 * 保存仿真参数
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveSimulationMaterial")
	public ModelAndView saveSimulationMaterial(
			int id_Material, 
			String array_PictureMaterial, 
			String array_InformDetailMaterial, String array_InformDetailMaterial_name,
			String array_ApplicationMaterial, String array_ApplicationMaterial_name, 
			String array_SimulationMaterial, String array_SimulationMaterial_name, 
			String NameMaterial, String NumberMaterial, String id_CategoryMaterial, String ISOCuttingMaterial, String CategoryMaterial,
			String CompanyMaterial, String ConstituentsMaterial, String MachineableMaterial, String DensityMaterial, String ModulusMaterial,
			String HardnessMaterial, String ConductivityMaterial,	String SpecificheatMaterial, String StrengthMaterial,	String ThermalExpansionMaterial,
			String JCMaterial,	String StrainRate,
			@RequestParam(value="SimulationMaterial",required=false)CommonsMultipartFile SimulationMaterial ,
			HttpServletRequest request ) throws Exception{
		
		Map material = new HashMap();
		
		material.put("NameMaterial", NameMaterial);
		material.put("NumberMaterial", NumberMaterial);
		Map temp = new HashMap();
		temp.put("name_CategoryMaterial", id_CategoryMaterial);
		//根据名称查询材料类别
		Map categoryMaterial = materialService.queryCategoryMaterialById(temp);
	
		material.put("id_CategoryMaterial", categoryMaterial.get("id_CategoryMaterial"));
		material.put("ISOCuttingMaterial", ISOCuttingMaterial);
		material.put("CategoryMaterial", CategoryMaterial);
		material.put("CompanyMaterial", CompanyMaterial);
		material.put("ConstituentsMaterial", ConstituentsMaterial);
		material.put("MachineableMaterial", MachineableMaterial);
		material.put("DensityMaterial", DensityMaterial);
		material.put("ModulusMaterial", ModulusMaterial);
		material.put("HardnessMaterial", HardnessMaterial);
		material.put("ConductivityMaterial", ConductivityMaterial);
		material.put("SpecificheatMaterial", SpecificheatMaterial);
		material.put("StrengthMaterial", StrengthMaterial);
		material.put("ThermalExpansionMaterial", ThermalExpansionMaterial);
		material.put("JCMaterial", JCMaterial);
		material.put("StrainRate", StrainRate);
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map SimulationMaterialMap = new HashMap(); 
		
		String OriginalFilename = SimulationMaterial.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/simulationMaterial/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			SimulationMaterial.transferTo(materials_big_img_file); 
			SimulationMaterialMap.put("url_SimulationMaterial", "/simulationMaterial/" + big_url + "." + fileSuffix);
			SimulationMaterialMap.put("id_Material", id_Material);
			array_SimulationMaterial = array_SimulationMaterial + "/simulationMaterial/" + big_url + "." + fileSuffix + ",";
			array_SimulationMaterial_name = array_SimulationMaterial_name + OriginalFilename + ",";

		}else{

		}
	
		//查询材料类别列表
		List<Map> categoryMaterialList = materialService.queryCategoryMaterialList();
					
		mv.addObject("array_PictureMaterial", array_PictureMaterial);
		mv.addObject("array_InformDetailMaterial", array_InformDetailMaterial);
		mv.addObject("array_InformDetailMaterial_name", array_InformDetailMaterial_name);
		mv.addObject("array_ApplicationMaterial", array_ApplicationMaterial);
		mv.addObject("array_ApplicationMaterial_name", array_ApplicationMaterial_name);
		mv.addObject("array_SimulationMaterial", array_SimulationMaterial);
		mv.addObject("array_SimulationMaterial_name", array_SimulationMaterial_name);
		mv.addObject("categoryMaterialList", categoryMaterialList);
		
		mv.addObject("material", material);
		
		mv.setViewName("/WEB-INF/material/material/material_edit");

		return mv;
		
	}
	
	
	
	/**
	 * 删除工件材料
	 * @param id_BTADrill
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteTurningBlade")
	public String deleteMaterial(String id_Material) {
		Map para = new HashMap();
		para.put("id_Material", id_Material);
		try {
			//清空材料图片路径 PictureMaterial
			materialService.clearPictureMaterialByIdMaterial(para);
			//清空详细信息路径
			materialService.clearInformDetailMaterialByIdMaterial(para);
			//清空应用实例路径
			materialService.clearApplicationMaterialByIdMaterial(para);
			//清空仿真参数路径
			materialService.clearSimulationMaterialByIdMaterial(para);
			
			//删除工件材料
			materialService.deleteMaterial(para);
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
	
	@RequestMapping(value="/queryWDXG")
	public ModelAndView queryWDXG(String id, String str, HttpServletRequest request ) throws Exception{
		
		ModelAndView mv = this.getModelAndView();
		List list = new ArrayList();
		if(str != null && !"".equals(str)){
			
			String strs[] = str.split(",");
			for(int i=0;i<strs.length;i++){
				String wendu = strs[i].split("-")[0];
				String canshu = strs[i].split("-")[1];
				Map map = new HashMap();
				map.put("wendu", wendu);
				map.put("canshu", canshu);
				list.add(map);
			}
			
		}
		mv.addObject("id", id);
		mv.addObject("list", list);
		
		mv.setViewName("/WEB-INF/material/material/temperature");

		return mv;
		
	}
	
	@RequestMapping(value="/queryWDXG_copy")
	public ModelAndView queryWDXG_copy(String id, String str, HttpServletRequest request ) throws Exception{
		
		ModelAndView mv = this.getModelAndView();
		List list = new ArrayList();
		if(str != null && !"".equals(str)){
			
			String strs[] = str.split(",");
			for(int i=0;i<strs.length;i++){
				String wendu = strs[i].split("-")[0];
				String canshu = strs[i].split("-")[1];
				Map map = new HashMap();
				map.put("wendu", wendu);
				map.put("canshu", canshu);
				list.add(map);
			}
			
		}
		mv.addObject("id", id);
		mv.addObject("list", list);
		
		mv.setViewName("/WEB-INF/material/material/temperature_list");

		return mv;
		
	}
	
	@RequestMapping(value="/queryPicture")
	public ModelAndView queryPicture(String id, HttpServletRequest request ) throws Exception{
		
		ModelAndView mv = this.getModelAndView();
		List list = new ArrayList();
		
		Map para = new HashMap();
		para.put("id_Material", id);
		Map material = materialService.queryMaterialById(para);//查询工件材料数据
		
		//查询应变 应变率列表
		String StrainRate_str = (String) material.get("StrainRate");
		List<Map> StrainRateList = new ArrayList();
		if(StrainRate_str != null && !"".equals(StrainRate_str)){
			String StrainRates[] = StrainRate_str.split(",");
			for(int j=0;j<StrainRates.length;j++){
				if(StrainRates[j] != null && !"".equals(StrainRates[j])){
					String shujudian = StrainRates[j].split("-")[0];
					String wendu = StrainRates[j].split("-")[1];
					String yingbian = StrainRates[j].split("-")[2];
					String yingbianlv = StrainRates[j].split("-")[3];
					Map temp = new HashMap();
					temp.put("shujudian", shujudian);
					temp.put("wendu", wendu);
					temp.put("yingbian", yingbian);
					temp.put("yingbianlv", yingbianlv);
					StrainRateList.add(temp);
				}
			}
			material.put("StrainRateList", StrainRateList);
			
		}
		mv.addObject("material",material);
		
		mv.setViewName("/WEB-INF/material/material/material_picture");

		return mv;
		
	}
	
	
		
}
