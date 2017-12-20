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
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
@RequestMapping("/materialApp")
public class MaterialAppController  extends BaseController{
	
    @Resource(name="materialService")
    private MaterialService materialService;  
    
    /**
	 * 查询工件材料列表
	 * @param page
	 * @param request
	 * @return
	 */
    
    
    
    @ResponseBody
    @RequestMapping(value = "/queryMaterialList", produces = "application/json; charset=utf-8")
	public String queryMaterialList(int pageNo, int pageSize, 
			String NameMaterial, String	NumberMaterial, String id_CategoryMaterial,
			String ISOCuttingMaterial, String CategoryMaterial, String CompanyMaterial){
		
		
    	String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		
		try {
			
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("NameMaterial", NameMaterial);
			pd.put("NumberMaterial", NumberMaterial);
			pd.put("id_CategoryMaterial", id_CategoryMaterial);
			pd.put("ISOCuttingMaterial", ISOCuttingMaterial);
			pd.put("CategoryMaterial", CategoryMaterial);
			pd.put("CompanyMaterial", CompanyMaterial);
			page.setPd(pd);
			
			map	= materialService.queryMaterialList(page);//查询工件材料列表
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
			List<Map> categoryMaterialList = materialService.queryCategoryMaterialList();
			
			resultmap.put("result", "1");
			resultmap.put("list", list);
			resultmap.put("categoryMaterialList", categoryMaterialList);
		} catch (Exception e) {
			e.printStackTrace();
			resultmap.put("result", "0");
		}
		Map para = new HashMap();
		para.put("NameMaterial", NameMaterial);
		para.put("NumberMaterial", NumberMaterial);
		para.put("id_CategoryMaterial", id_CategoryMaterial);
		para.put("ISOCuttingMaterial", ISOCuttingMaterial);
		para.put("CategoryMaterial", CategoryMaterial);
		para.put("CompanyMaterial", CompanyMaterial);
		resultmap.put("para", para);
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}


    @ResponseBody
    @RequestMapping(value="/goAddMaterial", produces = "application/json; charset=utf-8")
	public String goAddMaterial(String id)throws Exception{
    	String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
			
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
			
			
			resultmap.put("result", "1");
			resultmap.put("array_PictureMaterial", array_PictureMaterial);
			resultmap.put("array_InformDetailMaterial", array_InformDetailMaterial);
			resultmap.put("array_InformDetailMaterial_name", array_InformDetailMaterial_name);
			resultmap.put("array_ApplicationMaterial", array_ApplicationMaterial);
			resultmap.put("array_ApplicationMaterial_name", array_ApplicationMaterial_name);
			resultmap.put("array_SimulationMaterial", array_SimulationMaterial);
			resultmap.put("array_SimulationMaterial_name", array_SimulationMaterial_name);
			
		}
		
		//查询材料类别列表
		List<Map> categoryMaterialList = materialService.queryCategoryMaterialList();
		
	
		resultmap.put("material", material);
		resultmap.put("categoryMaterialList", categoryMaterialList);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}

    
    
    
    
    
    @ResponseBody
	@RequestMapping(value = "/saveMaterial", produces = "application/json; charset=utf-8")
	public String saveMaterial(String user_id, 
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
		
    	String json  = "";  
		Map resultmap = new HashMap();
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
		para.put("user_id", user_id);
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
	 * 保存材料图片
	 * @param request
	 * @return
	 * @throws Exception
	 */
    @ResponseBody
	@RequestMapping(value="/savePictureMaterial", produces = "application/json; charset=utf-8")
	public String savePictureMaterial(
			
			String array_PictureMaterial, 
			String array_InformDetailMaterial, String array_InformDetailMaterial_name,
			String array_ApplicationMaterial, String array_ApplicationMaterial_name, 
			String array_SimulationMaterial, String array_SimulationMaterial_name, 
			String PictureMaterial ,String fileSuffix, String filename
			) throws Exception{
		
    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		
		
		
		
		
		
		Map PictureMaterialMap = new HashMap(); 
		
		if(PictureMaterial != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureMaterial/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/pictureMaterial/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PictureMaterial,  filepath2);
			array_PictureMaterial = array_PictureMaterial + "/pictureMaterial/" + big_url + "." + fileSuffix + ",";
		}
		
		
		
		
		//查询材料类别列表
		List<Map> categoryMaterialList = materialService.queryCategoryMaterialList();
	
		resultmap.put("result", "1");
		resultmap.put("array_PictureMaterial", array_PictureMaterial);
		resultmap.put("array_InformDetailMaterial", array_InformDetailMaterial);
		resultmap.put("array_InformDetailMaterial_name", array_InformDetailMaterial_name);
		resultmap.put("array_ApplicationMaterial", array_ApplicationMaterial);
		resultmap.put("array_ApplicationMaterial_name", array_ApplicationMaterial_name);
		resultmap.put("array_SimulationMaterial", array_SimulationMaterial);
		resultmap.put("array_SimulationMaterial_name", array_SimulationMaterial_name);
		
		resultmap.put("categoryMaterialList", categoryMaterialList);
		
		json = JackJson.fromObjectToJson(resultmap);

		return json;
		
	}
    
    
    
    /**
	 * 保存详细信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
    @ResponseBody
	@RequestMapping(value="/saveInformDetailMaterial", produces = "application/json; charset=utf-8")
	public String saveInformDetailMaterial(
			String array_PictureMaterial, 
			String array_InformDetailMaterial, String array_InformDetailMaterial_name,
			String array_ApplicationMaterial, String array_ApplicationMaterial_name, 
			String array_SimulationMaterial, String array_SimulationMaterial_name, 
			String InformDetailMaterial ,String fileSuffix, String filename
			) throws Exception{
		
    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
    	Map resultmap = new HashMap();
    	
		
		
		Map resultMap = new HashMap();
		Map InformDetailMaterialMap = new HashMap(); 
		
		
		
		if(InformDetailMaterial != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informDetailMaterial/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/informDetailMaterial/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(InformDetailMaterial,  filepath2);
			array_InformDetailMaterial = array_InformDetailMaterial + "/informDetailMaterial/" + big_url + "." + fileSuffix + ",";
			array_InformDetailMaterial_name = array_InformDetailMaterial_name + filename + ",";
		}
		
		
		//查询材料类别列表
		List<Map> categoryMaterialList = materialService.queryCategoryMaterialList();
			
		resultmap.put("result", "1");
		resultmap.put("array_PictureMaterial", array_PictureMaterial);
		resultmap.put("array_InformDetailMaterial", array_InformDetailMaterial);
		resultmap.put("array_InformDetailMaterial_name", array_InformDetailMaterial_name);
		resultmap.put("array_ApplicationMaterial", array_ApplicationMaterial);
		resultmap.put("array_ApplicationMaterial_name", array_ApplicationMaterial_name);
		resultmap.put("array_SimulationMaterial", array_SimulationMaterial);
		resultmap.put("array_SimulationMaterial_name", array_SimulationMaterial_name);
		resultmap.put("categoryMaterialList", categoryMaterialList);
		
		json = JackJson.fromObjectToJson(resultmap);

		return json;
		
	}
    
    
    
    
    /**
	 * 保存应用实例
	 * @param request
	 * @return
	 * @throws Exception
	 */
    @ResponseBody
	@RequestMapping(value="/saveApplicationMaterial", produces = "application/json; charset=utf-8")
	public String saveApplicationMaterial(
			
			String array_PictureMaterial, 
			String array_InformDetailMaterial, String array_InformDetailMaterial_name,
			String array_ApplicationMaterial, String array_ApplicationMaterial_name, 
			String array_SimulationMaterial, String array_SimulationMaterial_name, 
			String ApplicationMaterial ,String fileSuffix, String filename
			) throws Exception{
		
    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		Map resultMap = new HashMap();
		
		Map ApplicationMaterialMap = new HashMap(); 
		
		
		if(ApplicationMaterial != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/applicationMaterial/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/applicationMaterial/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(ApplicationMaterial,  filepath2);
			array_ApplicationMaterial = array_ApplicationMaterial + "/applicationMaterial/" + big_url + "." + fileSuffix + ",";
			array_ApplicationMaterial_name = array_ApplicationMaterial_name + filename + ",";
		}
		
		
		
		//查询材料类别列表
		List<Map> categoryMaterialList = materialService.queryCategoryMaterialList();
			
		resultmap.put("result", "1");
		resultmap.put("array_PictureMaterial", array_PictureMaterial);
		resultmap.put("array_InformDetailMaterial", array_InformDetailMaterial);
		resultmap.put("array_InformDetailMaterial_name", array_InformDetailMaterial_name);
		resultmap.put("array_ApplicationMaterial", array_ApplicationMaterial);
		resultmap.put("array_ApplicationMaterial_name", array_ApplicationMaterial_name);
		resultmap.put("array_SimulationMaterial", array_SimulationMaterial);
		resultmap.put("array_SimulationMaterial_name", array_SimulationMaterial_name);
		resultmap.put("categoryMaterialList", categoryMaterialList);
		
		
		json = JackJson.fromObjectToJson(resultmap);

		return json;
	}
    
    
    
    /**
	 * 保存仿真参数
	 * @param request
	 * @return
	 * @throws Exception
	 */
    @ResponseBody
	@RequestMapping(value="/saveSimulationMaterial")
	public String saveSimulationMaterial(
			
			String array_PictureMaterial, 
			String array_InformDetailMaterial, String array_InformDetailMaterial_name,
			String array_ApplicationMaterial, String array_ApplicationMaterial_name, 
			String array_SimulationMaterial, String array_SimulationMaterial_name, 
			String SimulationMaterial ,String fileSuffix, String filename
			) throws Exception{
		
    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map SimulationMaterialMap = new HashMap(); 
		
		
		if(SimulationMaterial != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/simulationMaterial/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/simulationMaterial/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(SimulationMaterial,  filepath2);
			array_SimulationMaterial = array_SimulationMaterial + "/simulationMaterial/" + big_url + "." + fileSuffix + ",";
			array_SimulationMaterial_name = array_SimulationMaterial_name + filename + ",";
		}
		
		
		
	
		//查询材料类别列表
		List<Map> categoryMaterialList = materialService.queryCategoryMaterialList();
				
		resultmap.put("result", "1");
		resultmap.put("array_PictureMaterial", array_PictureMaterial);
		resultmap.put("array_InformDetailMaterial", array_InformDetailMaterial);
		resultmap.put("array_InformDetailMaterial_name", array_InformDetailMaterial_name);
		resultmap.put("array_ApplicationMaterial", array_ApplicationMaterial);
		resultmap.put("array_ApplicationMaterial_name", array_ApplicationMaterial_name);
		resultmap.put("array_SimulationMaterial", array_SimulationMaterial);
		resultmap.put("array_SimulationMaterial_name", array_SimulationMaterial_name);
		resultmap.put("categoryMaterialList", categoryMaterialList);
		
		json = JackJson.fromObjectToJson(resultmap);

		return json;
		
	}
    
    
    
    /**
	 * 删除工件材料
	 * @param id_BTADrill
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteTurningBlade")
	public String deleteMaterial(String id_Material) {
		String json  = "";  
		Map resultmap = new HashMap();
		
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
	@RequestMapping(value="/queryWDXG")
	public String queryWDXG(String id, String str, HttpServletRequest request ) throws Exception{
		
		String json  = "";  
		Map resultmap = new HashMap();
		
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
		resultmap.put("id", id);
		resultmap.put("list", list);
		resultmap.put("result", "1");
		resultmap.put("msg", "操作成功");
		json = JackJson.fromObjectToJson(resultmap);
		return json;
		
	}
}
