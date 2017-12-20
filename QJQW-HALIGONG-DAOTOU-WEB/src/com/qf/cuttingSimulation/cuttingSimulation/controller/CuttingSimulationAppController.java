package com.qf.cuttingSimulation.cuttingSimulation.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.qf.cuttingSimulation.cuttingSimulation.service.CuttingSimulationService;
import com.qf.material.material.service.MaterialService;
import com.qf.tool.toolBTAdrill.service.ToolBTAdrillService;
import com.qf.tool.turningBlade.service.TurningBladeService;
import com.qf.util.PageData;
import com.qf.util.common.JackJson;
import com.qf.util.file.ByteToFile;
import com.qf.util.page.Page;

@Controller
@RequestMapping("CuttingSimulationApp")
public class CuttingSimulationAppController {
	
	//工件材料
	@Resource(name="materialService")
	private MaterialService materialService;  
			
	//刀具-->刀片
	@Resource(name="turningBladeService")
	private TurningBladeService turningBladeService;
			
	//刀具-->深孔钻
	@Resource(name="toolBTAdrillService")
	private ToolBTAdrillService toolBTAdrillService; 
		
	@Resource(name = "cuttingSimulationService")
	private CuttingSimulationService cuttingSimulationService;
	
	
	@ResponseBody
    @RequestMapping(value = "/queryCuttingSimulationList", produces = "application/json; charset=utf-8")
	public String queryCuttingSimulationList(int pageNo, int pageSize, 
			String IDCutSim, String NameCutSim,String TypeCutSim, 
			String MaterialWorkpieceCutSim, String ToolType,String MaterialToolCutSim, 
			String MaterialToolCutSimNum, String SoftwareCutSim){
		
    	String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		try {
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("IDCutSim", IDCutSim);
			pd.put("NameCutSim", NameCutSim);
			pd.put("TypeCutSim", TypeCutSim);
			pd.put("MaterialWorkpieceCutSim", MaterialWorkpieceCutSim);
			pd.put("ToolType", ToolType);
			pd.put("MaterialToolCutSim", MaterialToolCutSim);
			pd.put("MaterialToolCutSimNum", MaterialToolCutSimNum);
			pd.put("SoftwareCutSim", SoftwareCutSim);
			
			page.setPd(pd);
			map	= cuttingSimulationService.queryCuttingSimulationList(page);//查询工件材料列表
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			if(list != null && list.size() > 0){
				for(int i = 0; i < list.size(); i++){
					Map CuttingSimulation = list.get(i);
					int id_CuttingSimulation = (int) CuttingSimulation.get("id_CuttingSimulation");
					
					Map para = new HashMap();
					para.put("id_CuttingSimulation", id_CuttingSimulation);
					para.put("ascription", "ModelPictureCutSim");
					
					Map pare = new HashMap();
					pare.put("id_CuttingSimulation", id_CuttingSimulation);
					pare.put("ascription", "FileCutSim");
					
					
					List<Map> ModelPictureCutSim = cuttingSimulationService.queryModelPictureCutSimList(para);
					List<Map> FileCutSim = cuttingSimulationService.queryFileCutSimList(pare);
					
					CuttingSimulation.put("ModelPictureCutSim", ModelPictureCutSim);
					CuttingSimulation.put("FileCutSim", FileCutSim);
					
					list.set(i, CuttingSimulation);
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
			
			List<Map> CategoryTypeCutSimList = cuttingSimulationService.queryCategoryTypeCutSimList();
			//查询材料类别列表
			List<Map> CategorySoftwareCutSimList = cuttingSimulationService.queryCategorySoftwareCutSimList();
			
			resultmap.put("result", "1");
			resultmap.put("list", list);
			resultmap.put("CategoryTypeCutSimList", CategoryTypeCutSimList);
			resultmap.put("CategorySoftwareCutSimList", CategorySoftwareCutSimList);
		} catch (Exception e) {
			e.printStackTrace();
			resultmap.put("result", "0");
		}
		Map para = new HashMap();
		para.put("IDCutSim", IDCutSim);
		para.put("NameCutSim", NameCutSim);
		para.put("TypeCutSim", TypeCutSim);
		para.put("MaterialWorkpieceCutSim", MaterialWorkpieceCutSim);
		para.put("ToolType", ToolType);
		para.put("MaterialToolCutSim", MaterialToolCutSim);
		para.put("MaterialToolCutSimNum", MaterialToolCutSimNum);
		para.put("SoftwareCutSim", SoftwareCutSim);
		resultmap.put("para", para);
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}

	
	
	//进入添加试验页
	@ResponseBody
    @RequestMapping(value="/goAddCuttingSimulation", produces = "application/json; charset=utf-8")
	public String goAddCuttingSimulation(String id, String turn_url)throws Exception{
    	String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
			
		Map para = new HashMap();
		para.put("id_CuttingSimulation", id);
		
		Map CuttingSimulation = cuttingSimulationService.queryCuttingSimulationById(para);
		
			if(CuttingSimulation != null){
			
			para.put("ascription", "ModelPictureCutSim");
			
			List<Map> ModelPictureCutSimList = cuttingSimulationService.queryModelPictureCutSimList(para);
			String array_ModelPictureCutSim = "";
			if(ModelPictureCutSimList != null && ModelPictureCutSimList.size() > 0){
				for(int i = 0; i < ModelPictureCutSimList.size(); i++){
					array_ModelPictureCutSim = array_ModelPictureCutSim + ModelPictureCutSimList.get(i).get("url_CuttingSimulationFile") + ",";
				}
			}
			
			Map pare = new HashMap();
			pare.put("id_CuttingSimulation", id);
			pare.put("ascription", "FileCutSim");
			List<Map> FileCutSimList = cuttingSimulationService.queryFileCutSimList(pare);
			String array_FileCutSim = "";
			String array_FileCutSim_name = "";
			if(FileCutSimList != null && FileCutSimList.size() > 0){
				for(int i = 0; i < FileCutSimList.size(); i++){
					array_FileCutSim = array_FileCutSim + FileCutSimList.get(i).get("url_CuttingSimulationFile") + ",";
					array_FileCutSim_name = array_FileCutSim_name + FileCutSimList.get(i).get("name_CuttingSimulationFile") + ",";
				}
			}
			
			CuttingSimulation.put("ModelPictureCutSimList", ModelPictureCutSimList);
			CuttingSimulation.put("FileCutSimList", FileCutSimList);
			
			
			resultmap.put("result", "1");
			resultmap.put("array_ModelPictureCutSim", array_ModelPictureCutSim);
			resultmap.put("array_FileCutSim", array_FileCutSim);
			resultmap.put("array_FileCutSim_name", array_FileCutSim_name);
		}
		//查询材料类别列表
		List<Map> CategoryTypeCutSimList = cuttingSimulationService.queryCategoryTypeCutSimList();
		
		//查询材料类别列表
		List<Map> CategorySoftwareCutSimList = cuttingSimulationService.queryCategorySoftwareCutSimList();
		
		resultmap.put("CategoryTypeCutSimList", CategoryTypeCutSimList);
		resultmap.put("CategorySoftwareCutSimList", CategorySoftwareCutSimList);
		
		resultmap.put("msg", "goAddCuttingSimulation");
		resultmap.put("turn_url", turn_url);
		resultmap.put("CuttingSimulation", CuttingSimulation);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}

	
	//加载各种
	@ResponseBody
	@RequestMapping(value = "jzAll", produces = "application/json; charset=utf-8")
	public String jzAll(@RequestParam(value="deputy") int deputy, int pageNo, int pageSize, 
			String NameMaterial, String	NumberMaterial, String id_CategoryMaterial,String ISOCuttingMaterial, String CategoryMaterial, 
			String CompanyMaterial,String NumberTurningBlade, String TypeBTADrill, String ISOBladeTurning, String ToolCoatBladeTurning, 
			String ToolMaterialBladeTurning,String MachiningTypeBladeTurning, String ToolBladeFeatureTurning,String CompanyTurningBlade, 
			String MateriaBladeTurning,String NumberBTADrill, String TypeBTADrill1, String NameBTADrill, String DiameterBTADrill, 
			String MateriaBTAlDrill, String ToolMaterialBTADrill, String ToolCoatBTADrill, String BreakerBTADrill, String CompanyBTADrill
			){
		
		String json  = "";  
		Map resultmap = new HashMap();
		Page page = new Page(pageNo, pageSize);
		PageData pd = new PageData();
		
		List<Map> list = new ArrayList<Map>();
		//1为查询加载机床节点
		if(deputy==1){
			pd.put("NameMaterial", NameMaterial);
			pd.put("NumberMaterial", NumberMaterial);
			pd.put("id_CategoryMaterial", id_CategoryMaterial);
			pd.put("ISOCuttingMaterial", ISOCuttingMaterial);
			pd.put("CategoryMaterial", CategoryMaterial);
			pd.put("CompanyMaterial", CompanyMaterial);
			page.setPd(pd);
			Map map	= materialService.queryMaterialList(page);//查询工件材料列表
			page = (Page)map.get("page");
			list = (List<Map>)map.get("list");
			if(list != null && list.size() > 0){
				Map pageMap = new HashMap();
				int pageCount = page.getPageCount();
				pageMap.put("pageCount", pageCount);
				resultmap.put("page", pageMap);
			}else{
				Map pageMap = new HashMap();
				pageMap.put("pageCount", 0);
				resultmap.put("page", pageMap);
			}
			resultmap.put("list", list);
			//查询材料类别列表
			List<Map> categoryMaterialList = materialService.queryCategoryMaterialList();
			resultmap.put("categoryMaterialList", categoryMaterialList);
			
			Map para = new HashMap();
			para.put("NameMaterial", NameMaterial);
			para.put("NumberMaterial", NumberMaterial);
			para.put("id_CategoryMaterial", id_CategoryMaterial);
			para.put("ISOCuttingMaterial", ISOCuttingMaterial);
			para.put("CategoryMaterial", CategoryMaterial);
			para.put("CompanyMaterial", CompanyMaterial);
			resultmap.put("para",para);
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		if(deputy==2){
			pd.put("NumberTurningBlade", NumberTurningBlade);
			pd.put("TypeBTADrill", TypeBTADrill);
			pd.put("ISOBladeTurning", ISOBladeTurning);
			pd.put("ToolCoatBladeTurning", ToolCoatBladeTurning);
			pd.put("ToolMaterialBladeTurning", ToolMaterialBladeTurning);
			pd.put("MachiningTypeBladeTurning", MachiningTypeBladeTurning);
			pd.put("ToolBladeFeatureTurning", ToolBladeFeatureTurning);
			pd.put("CompanyTurningBlade", CompanyTurningBlade);
			pd.put("MateriaBladeTurning", MateriaBladeTurning);
			page.setPd(pd);
			Map map	= turningBladeService.queryTurningBladeList(page);//查询刀片列表
			page = (Page)map.get("page");
			list = (List<Map>)map.get("list");
			if(list != null && list.size() > 0){
				Map pageMap = new HashMap();
				int pageCount = page.getPageCount();
				pageMap.put("pageCount", pageCount);
				resultmap.put("page", pageMap);
			}else{
				Map pageMap = new HashMap();
				pageMap.put("pageCount", 0);
				resultmap.put("page", pageMap);
			}
			resultmap.put("list", list);
			
			Map para = new HashMap();
			para.put("NumberTurningBlade", NumberTurningBlade);
			para.put("TypeBTADrill", TypeBTADrill);
			para.put("ISOBladeTurning", ISOBladeTurning);
			para.put("ToolCoatBladeTurning", ToolCoatBladeTurning);
			para.put("ToolMaterialBladeTurning", ToolMaterialBladeTurning);
			para.put("MachiningTypeBladeTurning", MachiningTypeBladeTurning);
			para.put("ToolBladeFeatureTurning", ToolBladeFeatureTurning);
			para.put("CompanyTurningBlade", CompanyTurningBlade);
			para.put("MateriaBladeTurning", MateriaBladeTurning);
			resultmap.put("para",para);
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		if(deputy==3){
			pd.put("NumberBTADrill", NumberBTADrill);
			pd.put("TypeBTADrill", TypeBTADrill1);
			pd.put("NameBTADrill", NameBTADrill);
			pd.put("DiameterBTADrill", DiameterBTADrill);
			pd.put("MateriaBTAlDrill", MateriaBTAlDrill);
			pd.put("ToolMaterialBTADrill", ToolMaterialBTADrill);
			pd.put("ToolCoatBTADrill", ToolCoatBTADrill);
			pd.put("BreakerBTADrill", BreakerBTADrill);
			pd.put("CompanyBTADrill", CompanyBTADrill);
			page.setPd(pd);
			Map map	= toolBTAdrillService.queryToolBTAdrillList(page);//查询深孔钻列表
			page = (Page)map.get("page");
			list = (List<Map>)map.get("list");
			if(list != null && list.size() > 0){
				Map pageMap = new HashMap();
				int pageCount = page.getPageCount();
				pageMap.put("pageCount", pageCount);
				resultmap.put("page", pageMap);
			}else{
				Map pageMap = new HashMap();
				pageMap.put("pageCount", 0);
				resultmap.put("page", pageMap);
			}
			resultmap.put("list", list);
			
			Map para = new HashMap();
			para.put("NumberBTADrill", NumberBTADrill);
			para.put("TypeBTADrill", TypeBTADrill1);
			para.put("NameBTADrill", NameBTADrill);
			para.put("DiameterBTADrill", DiameterBTADrill);
			para.put("MateriaBTAlDrill", MateriaBTAlDrill);
			para.put("ToolMaterialBTADrill", ToolMaterialBTADrill);
			para.put("ToolCoatBTADrill", ToolCoatBTADrill);
			para.put("BreakerBTADrill", BreakerBTADrill);
			para.put("CompanyBTADrill", CompanyBTADrill);
			resultmap.put("para",para);
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		
		return null;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/saveModelPictureCutSim", produces = "application/json; charset=utf-8")
	public String saveModelPictureCutSim(
			String file ,String fileSuffix, String filename) throws Exception{
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		String json  = "";  
		Map resultmap = new HashMap();
		String url = null;
		if(file != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/cuttingSimulationFile/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/cuttingSimulationFile/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(file,  filepath2);
			url =  "/cuttingSimulationFile/" + big_url + "." + fileSuffix;
		}
		
				
		resultmap.put("result", "1");
		
		resultmap.put("url", url);
		
		json = JackJson.fromObjectToJson(resultmap);
		
		return json;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/saveFileCutSim", produces = "application/json; charset=utf-8")
	public String saveFileCutSim(
			String file ,String fileSuffix, String filename) throws Exception{
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		String json  = "";  
		Map resultmap = new HashMap();
		String url = null;
		String name = null;
		if(file != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/cuttingSimulationFile/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/cuttingSimulationFile/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(file,  filepath2);
			url =  "/cuttingSimulationFile/" + big_url + "." + fileSuffix;
			name = filename;
		}
		
				
		resultmap.put("result", "1");
		
		resultmap.put("url", url);
		resultmap.put("name", name);
		
		json = JackJson.fromObjectToJson(resultmap);
		
		return json;
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "/saveCuttingSimulation", produces = "application/json; charset=utf-8")
	public String saveCuttingSimulation(String user_id, 
			int id_CuttingSimulation, 
			String array_ModelPictureCutSim, 
			String array_FileCutSim, String array_FileCutSim_name,
			String IDCutSim, String NameCutSim, String TypeCutSim, String MaterialWorkpieceCutSim, String ToolType,
			String MaterialToolCutSim, String MaterialToolCutSimNum, String QianjiaoCutSim,
			String HoujiaoCutSim, String RenqingCutSim, String NoseRadiusCutSim, String BreakerBladeCutSim, String CuttingSpeedCutSim,
			String RoatingSpeedCutSim, String FeedCutSim, String FeedSpeedCutSim,
			String CuttingDepthCutSim, String CuttingWidthCutSim, String SoftwareCutSim,String ForceXCutSim,
			String ForceYCutSim, String ForceZCutSim, String TorqueCutSim,String TemperatureCutSim) {
	
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		
		para.put("id_CuttingSimulation", id_CuttingSimulation);
		para.put("IDCutSim", IDCutSim);
		para.put("NameCutSim", NameCutSim);
		
		Map temp = new HashMap();
		temp.put("name_CategoryTypeCutSim", TypeCutSim);
		Map CategoryTypeCutSim = cuttingSimulationService.queryCategoryTypeCutSimByName(temp);
		if(CategoryTypeCutSim!=null || "".equals(CategoryTypeCutSim)){
			para.put("TypeCutSim", CategoryTypeCutSim.get("id_CategoryTypeCutSim"));
		}else{
			//保存新的材料类别
			cuttingSimulationService.saveCategoryTypeCutSim(temp);
			para.put("TypeCutSim", temp.get("id_CategoryTypeCutSim"));
		}
		
		para.put("MaterialWorkpieceCutSim", MaterialWorkpieceCutSim);
		para.put("ToolType", ToolType);
		para.put("MaterialToolCutSim", MaterialToolCutSim);
		para.put("MaterialToolCutSimNum", MaterialToolCutSimNum);
		para.put("QianjiaoCutSim", QianjiaoCutSim);
		para.put("HoujiaoCutSim", HoujiaoCutSim);
		para.put("RenqingCutSim", RenqingCutSim);
		para.put("NoseRadiusCutSim", NoseRadiusCutSim);
		para.put("BreakerBladeCutSim", BreakerBladeCutSim);
		para.put("CuttingSpeedCutSim", CuttingSpeedCutSim);
		para.put("RoatingSpeedCutSim", RoatingSpeedCutSim);
		para.put("FeedCutSim", FeedCutSim);
		para.put("FeedSpeedCutSim", FeedSpeedCutSim);
		para.put("CuttingDepthCutSim", CuttingDepthCutSim);
		para.put("CuttingWidthCutSim", CuttingWidthCutSim);
		para.put("ForceXCutSim", ForceXCutSim);
		para.put("ForceYCutSim", ForceYCutSim);
		para.put("ForceZCutSim", ForceZCutSim);
		para.put("TorqueCutSim", TorqueCutSim);
		para.put("TemperatureCutSim", TemperatureCutSim);
		Map temp1 = new HashMap();
		temp1.put("name_CategorySoftwareCutSim", SoftwareCutSim);
		Map CategorySoftwareCutSim = cuttingSimulationService.queryCategorySoftwareCutSimByName(temp1);
		if(CategorySoftwareCutSim!=null || "".equals(CategorySoftwareCutSim)){
			para.put("SoftwareCutSim", CategorySoftwareCutSim.get("id_CategorySoftwareCutSim"));
		}else{
			//保存新的材料类别
			cuttingSimulationService.saveCategorySoftwareCutSim(temp1);
			para.put("SoftwareCutSim", temp1.get("id_CategorySoftwareCutSim"));
		}
		
		
		try {
			if(id_CuttingSimulation != 0){//修改
				cuttingSimulationService.updateCuttingSimulation(para);
			}else{//新增
				
				cuttingSimulationService.saveCuttingSimulation(para);
			}
			
			//清空文件
			cuttingSimulationService.cleanCuttingSimulationFileById(para);
			
			
			Map pere = new HashMap();
			pere.put("id_CuttingSimulation", id_CuttingSimulation);
			pere.put("ascription", "ModelPictureCutSim");
			
			//保存刀柄图片
			if(array_ModelPictureCutSim != null && !"".equals(array_ModelPictureCutSim)){
				String array_ModelPictureCutSims[] = array_ModelPictureCutSim.split(",");
				for(int i=0; i<array_ModelPictureCutSims.length; i++){
					if(array_ModelPictureCutSims[i] != null && !"".equals(array_ModelPictureCutSims[i])){
						pere.put("url_CuttingSimulationFile", array_ModelPictureCutSims[i]);
						cuttingSimulationService.saveModelPictureCutSim(pere);
					}
				}
			}
			
			Map pare = new HashMap();
			pare.put("id_CuttingSimulation", id_CuttingSimulation);
			pare.put("ascription", "FileCutSim");
			//保存刀柄图片
			if(array_FileCutSim != null && !"".equals(array_FileCutSim)){
				String array_FileCutSims[] = array_FileCutSim.split(",");
				String array_FileCutSims_name[] = array_FileCutSim_name.split(",");
				for(int i=0; i<array_FileCutSims.length; i++){
					if(array_FileCutSims[i] != null && !"".equals(array_FileCutSims[i])){
						pare.put("url_CuttingSimulationFile", array_FileCutSims[i]);
						pare.put("name_CuttingSimulationFile", array_FileCutSims_name[i]);
						System.out.println(pare);
						cuttingSimulationService.saveFileCutSim(pare);
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
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "/deleteCuttingSimulation", produces = "application/json; charset=utf-8")
	public String deleteCuttingSimulation(String id_CuttingSimulation) {
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		para.put("id_CuttingSimulation", id_CuttingSimulation);
		try {

			cuttingSimulationService.cleanCuttingSimulationFileById(para);
			
			cuttingSimulationService.deleteCuttingSimulationById(para);
			
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
