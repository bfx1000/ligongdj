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
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
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
@RequestMapping("/cuttingToolMaterialApp")
public class CuttingToolMaterialAppController  extends BaseController{
	
	@Resource(name="cuttingToolMaterialService")
    private CuttingToolMaterialService cuttingToolMaterialService;
    
    /**
	 * 查询刀具材料列表
	 * @param page
	 * @param request
	 * @return
	 */
    
    
    
    @ResponseBody
    @RequestMapping(value = "/queryCuttingToolMaterialList", produces = "application/json; charset=utf-8")
	public String queryMaterialList(int pageNo, int pageSize, 
			String NameToolMaterial, String	NumberToolMaterial, String CategoryToolMaterial,
			String CompanyToolMaterial){
		
		
    	String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		
		try {
			
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("NameToolMaterial", NameToolMaterial);
			pd.put("NumberToolMaterial", NumberToolMaterial);
			pd.put("CategoryToolMaterial", CategoryToolMaterial);
			pd.put("CompanyToolMaterial", CompanyToolMaterial);
			
			page.setPd(pd);
			map	= cuttingToolMaterialService.queryCuttingToolMaterialList(page);//查询工件材料列表
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
			List<Map> categoryToolMaterialList = cuttingToolMaterialService.queryCategoryToolMaterialList();
			
			resultmap.put("result", "1");
			resultmap.put("list", list);
			resultmap.put("categoryToolMaterialList", categoryToolMaterialList);
		} catch (Exception e) {
			e.printStackTrace();
			resultmap.put("result", "0");
		}
		Map para = new HashMap();
		para.put("NameToolMaterial", NameToolMaterial);
		para.put("NumberToolMaterial", NumberToolMaterial);
		para.put("CategoryToolMaterial", CategoryToolMaterial);
		para.put("CompanyToolMaterial", CompanyToolMaterial);
		resultmap.put("para", para);
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}


    @ResponseBody
    @RequestMapping(value="/goAddCuttingToolMaterial", produces = "application/json; charset=utf-8")
	public String goAddMaterial(String id)throws Exception{
    	String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
			
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
			
			
			resultmap.put("result", "1");
			resultmap.put("array_PictureToolMaterial", array_PictureToolMaterial);
			resultmap.put("array_InformToolMaterial", array_InformToolMaterial);
			resultmap.put("array_InformToolMaterial_name", array_InformToolMaterial_name);
			resultmap.put("array_ApplicationToolMaterial", array_ApplicationToolMaterial);
			resultmap.put("array_ApplicationToolMaterial_name", array_ApplicationToolMaterial_name);
		}
		//查询材料类别列表
		List<Map> categoryToolMaterialList = cuttingToolMaterialService.queryCategoryToolMaterialList();
		
	
		resultmap.put("cuttingToolMaterial", cuttingToolMaterial);
		resultmap.put("categoryToolMaterialList", categoryToolMaterialList);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}

    
    
    
    
    
    @ResponseBody
	@RequestMapping(value = "/saveCuttingToolMaterial", produces = "application/json; charset=utf-8")
	public String saveMaterial(String user_id, 
			int id_CuttingToolMaterialD, 
			String array_PictureToolMaterial, 
			String array_InformToolMaterial, String array_InformToolMaterial_name,
			String array_ApplicationToolMaterial, String array_ApplicationToolMaterial_name, 
			String NameToolMaterial, String NumberToolMaterial, String CategoryToolMaterial, String CompanyToolMaterial, String ISOCuttingMaterial,
			String MachineableMaterial, String DensityToolMaterial, String HardnessToolMaterial, String BendingStrengthToolMaterial, String ImpactToughnessToolMaterial,
			String ModulusToolMaterial, String HeatResistanceToolMaterial,	String ConductivityToolMaterial, String ThermalexpansionToolMaterial){
		
    	String json  = "";  
		Map resultmap = new HashMap();
		Map para = new HashMap();
		
		para.put("id_CuttingToolMaterialD", id_CuttingToolMaterialD);
		para.put("NameToolMaterial", NameToolMaterial);
		para.put("NumberToolMaterial", NumberToolMaterial);
		
		Map temp = new HashMap();
		temp.put("name_CategoryToolMaterial", CategoryToolMaterial);
		Map categoryToolMaterial = cuttingToolMaterialService.queryCategoryToolMaterialByName(temp);
		if(categoryToolMaterial!=null && !"".equals(categoryToolMaterial)){
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
		para.put("user_id", user_id);
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
	@RequestMapping(value="/savePictureMaterial", produces = "application/json; charset=utf-8")
	public String savePictureMaterial(
			int id_CuttingToolMaterialD, 
			String array_PictureToolMaterial, 
			String array_InformToolMaterial, String array_InformToolMaterial_name,
			String array_ApplicationToolMaterial, String array_ApplicationToolMaterial_name, 
			String PictureToolMaterial ,String fileSuffix, String filename
			) throws Exception{
		
    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		
		Map PictureMaterialMap = new HashMap(); 
		
		if(PictureToolMaterial != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureToolMaterial/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/pictureToolMaterial/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PictureToolMaterial,  filepath2);
			array_PictureToolMaterial = array_PictureToolMaterial + "/pictureToolMaterial/" + big_url + "." + fileSuffix + ",";
		}
		
		//查询材料类别列表
		List<Map> categoryToolMaterialList = cuttingToolMaterialService.queryCategoryToolMaterialList();
	
		resultmap.put("result", "1");
		resultmap.put("array_PictureToolMaterial", array_PictureToolMaterial);
		resultmap.put("array_InformToolMaterial", array_InformToolMaterial);
		resultmap.put("array_InformToolMaterial_name", array_InformToolMaterial_name);
		resultmap.put("array_ApplicationToolMaterial", array_ApplicationToolMaterial);
		resultmap.put("array_ApplicationToolMaterial_name", array_ApplicationToolMaterial_name);
		
		resultmap.put("categoryToolMaterialList", categoryToolMaterialList);
		
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
	@RequestMapping(value="/saveInformToolMaterial", produces = "application/json; charset=utf-8")
	public String saveInformDetailMaterial(
			int id_CuttingToolMaterialD, 
			String array_PictureToolMaterial, 
			String array_InformToolMaterial, String array_InformToolMaterial_name,
			String array_ApplicationToolMaterial, String array_ApplicationToolMaterial_name, 
			String InformToolMaterial ,String fileSuffix, String filename
			) throws Exception{
		
    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
    	Map resultmap = new HashMap();
		Map InformDetailMaterialMap = new HashMap(); 
		
		
		
		if(InformToolMaterial != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informToolMaterial/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/informToolMaterial/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(InformToolMaterial,  filepath2);
			array_InformToolMaterial = array_InformToolMaterial + "/informToolMaterial/" + big_url + "." + fileSuffix + ",";
			array_InformToolMaterial_name = array_InformToolMaterial_name + filename + ",";
		}
		
		
		//查询材料类别列表
		List<Map> categoryToolMaterialList = cuttingToolMaterialService.queryCategoryToolMaterialList();
	
		resultmap.put("result", "1");
		resultmap.put("array_PictureToolMaterial", array_PictureToolMaterial);
		resultmap.put("array_InformToolMaterial", array_InformToolMaterial);
		resultmap.put("array_InformToolMaterial_name", array_InformToolMaterial_name);
		resultmap.put("array_ApplicationToolMaterial", array_ApplicationToolMaterial);
		resultmap.put("array_ApplicationToolMaterial_name", array_ApplicationToolMaterial_name);
		
		resultmap.put("categoryToolMaterialList", categoryToolMaterialList);
		
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
	@RequestMapping(value="/saveApplicationToolMaterial", produces = "application/json; charset=utf-8")
	public String saveApplicationMaterial(
			int id_CuttingToolMaterialD, 
			String array_PictureToolMaterial, 
			String array_InformToolMaterial, String array_InformToolMaterial_name,
			String array_ApplicationToolMaterial, String array_ApplicationToolMaterial_name, 
			String ApplicationToolMaterial ,String fileSuffix, String filename
			) throws Exception{
		
    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		Map ApplicationMaterialMap = new HashMap(); 
		
		if(ApplicationToolMaterial != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/applicationToolMaterial/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/applicationToolMaterial/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(ApplicationToolMaterial,  filepath2);
			array_ApplicationToolMaterial = array_ApplicationToolMaterial + "/applicationToolMaterial/" + big_url + "." + fileSuffix + ",";
			array_ApplicationToolMaterial_name = array_ApplicationToolMaterial_name + filename + ",";
		}
		
		
		
		//查询材料类别列表
		List<Map> categoryToolMaterialList = cuttingToolMaterialService.queryCategoryToolMaterialList();
	
		resultmap.put("result", "1");
		resultmap.put("array_PictureToolMaterial", array_PictureToolMaterial);
		resultmap.put("array_InformToolMaterial", array_InformToolMaterial);
		resultmap.put("array_InformToolMaterial_name", array_InformToolMaterial_name);
		resultmap.put("array_ApplicationToolMaterial", array_ApplicationToolMaterial);
		resultmap.put("array_ApplicationToolMaterial_name", array_ApplicationToolMaterial_name);
		
		resultmap.put("categoryToolMaterialList", categoryToolMaterialList);
		
		json = JackJson.fromObjectToJson(resultmap);

		return json;
	}
    
    
    
    
    
    /**
	 * 删除工件材料
	 * @param id_BTADrill
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteCuttingToolMaterial", produces = "application/json; charset=utf-8")
	public String deleteMaterial(String id_CuttingToolMaterialD) {
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		para.put("id_CuttingToolMaterialD", id_CuttingToolMaterialD);
		try {
			cuttingToolMaterialService.clearPictureToolMaterialByIdCuttingToolMaterial(para);
			
			cuttingToolMaterialService.clearInformToolMaterialByIdCuttingToolMaterial(para);
			
			cuttingToolMaterialService.clearApplicationToolMaterialByIdCuttingToolMaterial(para);
			
			cuttingToolMaterialService.deleteCuttingToolMaterial(para);
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
