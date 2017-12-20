package com.qf.cuttingSimulation.cuttingSimulation.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.qf.cuttingSimulation.cuttingSimulation.service.CuttingSimulationService;
import com.qf.material.material.service.MaterialService;
import com.qf.tool.toolBTAdrill.service.ToolBTAdrillService;
import com.qf.tool.turningBlade.service.TurningBladeService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/CuttingSimulation")
public class CuttingSimulationController extends BaseController{
	
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
	
	
	@RequestMapping("queryCuttingSimulationList")
	public ModelAndView queryCuttingSimulationList(Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= cuttingSimulationService.queryCuttingSimulationList(page);//查询工件材料列表
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
			}
			
			List<Map> CategoryTypeCutSimList = cuttingSimulationService.queryCategoryTypeCutSimList();
			mv.addObject("CategoryTypeCutSimList", CategoryTypeCutSimList);
			//查询材料类别列表
			List<Map> CategorySoftwareCutSimList = cuttingSimulationService.queryCategorySoftwareCutSimList();
			mv.addObject("CategorySoftwareCutSimList", CategorySoftwareCutSimList);
			
			mv.addObject("CuttingSimulation", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/cuttingSimulation/cuttingSimulation/CuttingSimulation_list");
		return mv;
	}
	
	
	@RequestMapping(value="/goAddCuttingSimulation")
	public ModelAndView goAddCuttingSimulation(String id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
			
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
			
			
			mv.addObject("array_ModelPictureCutSim", array_ModelPictureCutSim);
			mv.addObject("array_FileCutSim", array_FileCutSim);
			mv.addObject("array_FileCutSim_name", array_FileCutSim_name);
		}
		//查询材料类别列表
		List<Map> CategoryTypeCutSimList = cuttingSimulationService.queryCategoryTypeCutSimList();
		mv.addObject("CategoryTypeCutSimList", CategoryTypeCutSimList);
		//查询材料类别列表
		List<Map> CategorySoftwareCutSimList = cuttingSimulationService.queryCategorySoftwareCutSimList();
		mv.addObject("CategorySoftwareCutSimList", CategorySoftwareCutSimList);
		
		mv.addObject("msg", "goAddCuttingSimulation");
		mv.addObject("turn_url", turn_url);
		mv.addObject("CuttingSimulation", CuttingSimulation);
		
		mv.addObject("pd", pd);

		
		mv.setViewName("/WEB-INF/cuttingSimulation/cuttingSimulation/CuttingSimulation_edit");
		return mv;
	}
	
	
	
	
	@ResponseBody
	@RequestMapping("/saveCuttingSimulation")
	public String saveCuttingSimulation(HttpServletRequest request, 
			int id_CuttingSimulation, 
			String array_ModelPictureCutSim, 
			String array_FileCutSim, String array_FileCutSim_name,
			String IDCutSim, String NameCutSim, String TypeCutSim, String MaterialWorkpieceCutSim, String ToolType,
			String MaterialToolCutSim, String MaterialToolCutSimNum, String QianjiaoCutSim,
			String HoujiaoCutSim, String RenqingCutSim, String NoseRadiusCutSim, String BreakerBladeCutSim, String CuttingSpeedCutSim,
			String RoatingSpeedCutSim, String FeedCutSim, String FeedSpeedCutSim,
			String CuttingDepthCutSim, String CuttingWidthCutSim, String SoftwareCutSim,String ForceXCutSim,
			String ForceYCutSim, String ForceZCutSim, String TorqueCutSim,String TemperatureCutSim
			) {
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
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
		para.put("QianjiaoCutSim", "".equals(QianjiaoCutSim)?"0":QianjiaoCutSim);
		para.put("HoujiaoCutSim", "".equals(HoujiaoCutSim)?"0":HoujiaoCutSim);
		para.put("RenqingCutSim", "".equals(RenqingCutSim)?"0":RenqingCutSim);
		para.put("NoseRadiusCutSim", "".equals(NoseRadiusCutSim)?"0":NoseRadiusCutSim);
		para.put("BreakerBladeCutSim", BreakerBladeCutSim);
		para.put("CuttingSpeedCutSim", "".equals(CuttingSpeedCutSim)?"0":CuttingSpeedCutSim);
		para.put("RoatingSpeedCutSim", "".equals(RoatingSpeedCutSim)?"0":RoatingSpeedCutSim);
		para.put("FeedCutSim", "".equals(FeedCutSim)?"0":FeedCutSim);
		para.put("FeedSpeedCutSim", "".equals(FeedSpeedCutSim)?"0":FeedSpeedCutSim);
		para.put("CuttingDepthCutSim", "".equals(CuttingDepthCutSim)?"0":CuttingDepthCutSim);
		para.put("CuttingWidthCutSim", "".equals(CuttingWidthCutSim)?"0":CuttingWidthCutSim);
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
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}

	@ResponseBody
	@RequestMapping(value="/saveModelPictureCutSim")
	public Object saveModelPictureCutSim(
			@RequestParam("ModelPictureCutSim") MultipartFile ModelPictureCutSim,
			HttpServletRequest request ) throws Exception{
		String url = null;
		String OriginalFilename = ModelPictureCutSim.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/cuttingSimulationFile/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			ModelPictureCutSim.transferTo(materials_big_img_file); 
			url = "/pictureDesignToolBTAdrill/" + big_url + "." + fileSuffix;
		}else{

		}
		return url;
		
	}

    
    
    @ResponseBody
	@RequestMapping(value="/saveFileCutSim")
	public Object saveFileCutSim(
			@RequestParam(value="FileCutSim",required=false)MultipartFile FileCutSim ,
			HttpServletRequest request ) throws Exception{
		
		Map<String,String> data = new HashMap<String, String>();
		String OriginalFilename = FileCutSim.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/cuttingSimulationFile/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			FileCutSim.transferTo(materials_big_img_file); 
			data.put("url", "/partDesignToolBTAdrill/" + big_url + "." + fileSuffix);
			data.put("fileName", OriginalFilename);

		}else{

		}

		return data;
		
	}
	
	@ResponseBody
	@RequestMapping("/deleteCuttingSimulation")
	public String deleteCuttingSimulation(String id_CuttingSimulation) {
		Map para = new HashMap();
		para.put("id_CuttingSimulation", id_CuttingSimulation);
		try {
		
			cuttingSimulationService.cleanCuttingSimulationFileById(para);
			
			cuttingSimulationService.deleteCuttingSimulationById(para);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
	
	//加载各种
	@RequestMapping("jzAll")
	public ModelAndView jzAll(@RequestParam(value="deputy") int deputy, Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		page.setPd(pd);
		List<Map> list = new ArrayList<Map>();
		if(deputy==1){
			Map map	= materialService.queryMaterialList(page);//查询工件材料列表
			list = (List<Map>)map.get("list");
			mv.addObject("materialList", list);
			//查询材料类别列表
			List<Map> categoryMaterialList = materialService.queryCategoryMaterialList();
			mv.addObject("categoryMaterialList", categoryMaterialList);
			
			mv.addObject("pd", pd);
			mv.setViewName("/WEB-INF/cuttingSimulation/cuttingSimulation/CuttingSimulation_loadingMaterial");
		}
		if(deputy==2){
			Map map	= turningBladeService.queryTurningBladeList(page);//查询刀片列表
			list = (List<Map>)map.get("list");
			mv.addObject("turningBladeList", list);
			
			mv.addObject("pd", pd);
			mv.setViewName("/WEB-INF/cuttingSimulation/cuttingSimulation/CuttingSimulation_loadingturningBlade");
		}
		if(deputy==3){
			Map map	= toolBTAdrillService.queryToolBTAdrillList(page);//查询深孔钻列表
			list = (List<Map>)map.get("list");
			mv.addObject("toolBTAdrillList", list);
			
			mv.addObject("pd", pd);
			mv.setViewName("/WEB-INF/cuttingSimulation/cuttingSimulation/CuttingSimulation_loadingToolBTAdrillList");
		}
		
		return mv;
	}
		
	
	
	
	
	
	
	
	
}




