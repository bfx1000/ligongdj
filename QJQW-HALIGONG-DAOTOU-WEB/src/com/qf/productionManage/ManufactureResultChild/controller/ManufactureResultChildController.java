package com.qf.productionManage.ManufactureResultChild.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
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

import com.qf.productionManage.ManufacturePlan.service.ManufacturePlanService;
import com.qf.productionManage.ManufactureResultChild.service.ManufactureResultChildService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/ManufactureResultChild")
public class ManufactureResultChildController extends BaseController{

	
	//生产结果
	@Resource(name = "ManufactureResultChildService")
	private ManufactureResultChildService manufactureResultChildService;
	
	//生产计划
	@Resource(name = "ManufacturePlanService")
	private ManufacturePlanService manufacturePlanService;
	
	
	//列表
	@RequestMapping("/ManufactureResultChildList")
	public ModelAndView ManufactureResultChildList(Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= manufactureResultChildService.queryManufactureResultChildList(page);//查询零件页面
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			if(list != null && list.size() > 0){
				for(int i = 0; i < list.size(); i++){
					Map ManufactureResultChild = list.get(i);
					int id_ManufactureResultChild = (int) ManufactureResultChild.get("id_ManufactureResultChild");
					
					Map para = new HashMap();
					para.put("id_ManufactureResultChild", id_ManufactureResultChild);
					
					List<Map> file = manufactureResultChildService.queryFileList(para);
					
					List<Map> PictureManufRS = new ArrayList<Map>();
					List<Map> PictureToolWearManufRS = new ArrayList<Map>();
					List<Map> SurfaceRoughnessFileManufRS = new ArrayList<Map>();
					List<Map> SurfaceHardnessFileManufRS = new ArrayList<Map>();
					List<Map> SurfaceStressFileManufRS = new ArrayList<Map>();
					List<Map> SurfaceMorphologyFileManufRS = new ArrayList<Map>();
					List<Map> ChipShapeFileManufRS = new ArrayList<Map>();
					List<Map> ManufRSDefined1File = new ArrayList<Map>();
					List<Map> ManufRSDefined2File = new ArrayList<Map>();
					List<Map> ManufRSDefined3File = new ArrayList<Map>();
					for(int j = 0;j<file.size();j++){
						Map partMap = file.get(j);
						if("PictureManufRS".equals(partMap.get("ascription"))){
							PictureManufRS.add(partMap);
						}
						if(partMap.get("ascription").equals("PictureToolWearManufRS")){
							PictureToolWearManufRS.add(partMap);
						}
						if(partMap.get("ascription").equals("SurfaceRoughnessFileManufRS")){
							SurfaceRoughnessFileManufRS.add(partMap);
						}
						if(partMap.get("ascription").equals("SurfaceHardnessFileManufRS")){
							SurfaceHardnessFileManufRS.add(partMap);
						}
						if(partMap.get("ascription").equals("SurfaceStressFileManufRS")){
							SurfaceStressFileManufRS.add(partMap);
						}
						if(partMap.get("ascription").equals("SurfaceMorphologyFileManufRS")){
							SurfaceMorphologyFileManufRS.add(partMap);
						}
						if(partMap.get("ascription").equals("ChipShapeFileManufRS")){
							ChipShapeFileManufRS.add(partMap);
						}
						if(partMap.get("ascription").equals("ManufRSDefined1File")){
							ManufRSDefined1File.add(partMap);
						}
						if(partMap.get("ascription").equals("ManufRSDefined2File")){
							ManufRSDefined2File.add(partMap);
						}
						if(partMap.get("ascription").equals("ManufRSDefined3File")){
							ManufRSDefined3File.add(partMap);
						}
					}
					ManufactureResultChild.put("PictureManufRS", PictureManufRS);
					ManufactureResultChild.put("PictureToolWearManufRS", PictureToolWearManufRS);
					ManufactureResultChild.put("SurfaceRoughnessFileManufRS", SurfaceRoughnessFileManufRS);
					ManufactureResultChild.put("SurfaceHardnessFileManufRS", SurfaceHardnessFileManufRS);
					ManufactureResultChild.put("SurfaceStressFileManufRS", SurfaceStressFileManufRS);
					ManufactureResultChild.put("SurfaceMorphologyFileManufRS", SurfaceMorphologyFileManufRS);
					ManufactureResultChild.put("ChipShapeFileManufRS", ChipShapeFileManufRS);
					ManufactureResultChild.put("ManufRSDefined1File", ManufRSDefined1File);
					ManufactureResultChild.put("ManufRSDefined2File", ManufRSDefined2File);
					ManufactureResultChild.put("ManufRSDefined3File", ManufRSDefined3File);
					
					list.set(i, ManufactureResultChild);
				}
			}
			
			mv.addObject("ManufactureResultChild", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/productionManage/ManufactureResultChild/ManufactureResultChild_list");
		return mv;
	}
	
	
	
	
	//去添加页面
	@RequestMapping(value="/goAddManufactureResultChild")
	public ModelAndView goAddManufactureResultChild(String id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
			
		Map para = new HashMap();
		para.put("id_ManufactureResultChild", id);
		
		Map ManufactureResultChild = manufactureResultChildService.queryManufactureResultChildById(para);//查询标准机床
		if(ManufactureResultChild != null){
			List<Map> file = manufactureResultChildService.queryFileList(para);
			
			List<Map> PictureManufRS = new ArrayList<Map>();
			List<Map> PictureToolWearManufRS = new ArrayList<Map>();
			List<Map> SurfaceRoughnessFileManufRS = new ArrayList<Map>();
			List<Map> SurfaceHardnessFileManufRS = new ArrayList<Map>();
			List<Map> SurfaceStressFileManufRS = new ArrayList<Map>();
			List<Map> SurfaceMorphologyFileManufRS = new ArrayList<Map>();
			List<Map> ChipShapeFileManufRS = new ArrayList<Map>();
			List<Map> ManufRSDefined1File = new ArrayList<Map>();
			List<Map> ManufRSDefined2File = new ArrayList<Map>();
			List<Map> ManufRSDefined3File = new ArrayList<Map>();
			for(int j = 0;j<file.size();j++){
				Map partMap = file.get(j);
				if("PictureManufRS".equals(partMap.get("ascription"))){
					PictureManufRS.add(partMap);
				}
				if(partMap.get("ascription").equals("PictureToolWearManufRS")){
					PictureToolWearManufRS.add(partMap);
				}
				if(partMap.get("ascription").equals("SurfaceRoughnessFileManufRS")){
					SurfaceRoughnessFileManufRS.add(partMap);
				}
				if(partMap.get("ascription").equals("SurfaceHardnessFileManufRS")){
					SurfaceHardnessFileManufRS.add(partMap);
				}
				if(partMap.get("ascription").equals("SurfaceStressFileManufRS")){
					SurfaceStressFileManufRS.add(partMap);
				}
				if(partMap.get("ascription").equals("SurfaceMorphologyFileManufRS")){
					SurfaceMorphologyFileManufRS.add(partMap);
				}
				if(partMap.get("ascription").equals("ChipShapeFileManufRS")){
					ChipShapeFileManufRS.add(partMap);
				}
				if(partMap.get("ascription").equals("ManufRSDefined1File")){
					ManufRSDefined1File.add(partMap);
				}
				if(partMap.get("ascription").equals("ManufRSDefined2File")){
					ManufRSDefined2File.add(partMap);
				}
				if(partMap.get("ascription").equals("ManufRSDefined3File")){
					ManufRSDefined3File.add(partMap);
				}
			}
			ManufactureResultChild.put("PictureManufRS", PictureManufRS);
			ManufactureResultChild.put("PictureToolWearManufRS", PictureToolWearManufRS);
			ManufactureResultChild.put("SurfaceRoughnessFileManufRS", SurfaceRoughnessFileManufRS);
			ManufactureResultChild.put("SurfaceHardnessFileManufRS", SurfaceHardnessFileManufRS);
			ManufactureResultChild.put("SurfaceStressFileManufRS", SurfaceStressFileManufRS);
			ManufactureResultChild.put("SurfaceMorphologyFileManufRS", SurfaceMorphologyFileManufRS);
			ManufactureResultChild.put("ChipShapeFileManufRS", ChipShapeFileManufRS);
			ManufactureResultChild.put("ManufRSDefined1File", ManufRSDefined1File);
			ManufactureResultChild.put("ManufRSDefined2File", ManufRSDefined2File);
			ManufactureResultChild.put("ManufRSDefined3File", ManufRSDefined3File);
			
			String array_PictureManufRS = "";
			if(PictureManufRS != null && PictureManufRS.size() > 0){
				for(int i = 0; i < PictureManufRS.size(); i++){
					array_PictureManufRS = array_PictureManufRS + PictureManufRS.get(i).get("url_FileManufactureResultChild") + ",";
				}
			}
			
			String array_PictureToolWearManufRS = "";
			if(PictureToolWearManufRS != null && PictureToolWearManufRS.size() > 0){
				for(int i = 0; i < PictureToolWearManufRS.size(); i++){
					array_PictureToolWearManufRS = array_PictureToolWearManufRS + PictureToolWearManufRS.get(i).get("url_FileManufactureResultChild") + ",";
				}
			}
			
			
			String array_SurfaceRoughnessFileManufRS = "";
			String array_SurfaceRoughnessFileManufRS_name = "";
			if(SurfaceRoughnessFileManufRS != null && SurfaceRoughnessFileManufRS.size() > 0){
				for(int i = 0; i < SurfaceRoughnessFileManufRS.size(); i++){
					array_SurfaceRoughnessFileManufRS = array_SurfaceRoughnessFileManufRS + SurfaceRoughnessFileManufRS.get(i).get("url_FileManufactureResultChild") + ",";
					array_SurfaceRoughnessFileManufRS_name = array_SurfaceRoughnessFileManufRS_name + SurfaceRoughnessFileManufRS.get(i).get("name_FileManufactureResultChild") + ",";
				}
			}
			
			String array_SurfaceHardnessFileManufRS = "";
			String array_SurfaceHardnessFileManufRS_name = "";
			if(SurfaceHardnessFileManufRS != null && SurfaceHardnessFileManufRS.size() > 0){
				for(int i = 0; i < SurfaceHardnessFileManufRS.size(); i++){
					array_SurfaceHardnessFileManufRS = array_SurfaceHardnessFileManufRS + SurfaceHardnessFileManufRS.get(i).get("url_FileManufactureResultChild") + ",";
					array_SurfaceHardnessFileManufRS_name = array_SurfaceHardnessFileManufRS_name + SurfaceHardnessFileManufRS.get(i).get("name_FileManufactureResultChild") + ",";
				}
			}
			
			String array_SurfaceStressFileManufRS = "";
			String array_SurfaceStressFileManufRS_name = "";
			if(SurfaceStressFileManufRS != null && SurfaceStressFileManufRS.size() > 0){
				for(int i = 0; i < SurfaceStressFileManufRS.size(); i++){
					array_SurfaceStressFileManufRS = array_SurfaceStressFileManufRS + SurfaceStressFileManufRS.get(i).get("url_FileManufactureResultChild") + ",";
					array_SurfaceStressFileManufRS_name = array_SurfaceStressFileManufRS_name + SurfaceStressFileManufRS.get(i).get("name_FileManufactureResultChild") + ",";
				}
			}
			
			String array_SurfaceMorphologyFileManufRS = "";
			String array_SurfaceMorphologyFileManufRS_name = "";
			if(SurfaceMorphologyFileManufRS != null && SurfaceMorphologyFileManufRS.size() > 0){
				for(int i = 0; i < SurfaceMorphologyFileManufRS.size(); i++){
					array_SurfaceMorphologyFileManufRS = array_SurfaceMorphologyFileManufRS + SurfaceMorphologyFileManufRS.get(i).get("url_FileManufactureResultChild") + ",";
					array_SurfaceMorphologyFileManufRS_name = array_SurfaceMorphologyFileManufRS_name + SurfaceMorphologyFileManufRS.get(i).get("name_FileManufactureResultChild") + ",";
				}
			}
			
			String array_ChipShapeFileManufRS = "";
			String array_ChipShapeFileManufRS_name = "";
			if(ChipShapeFileManufRS != null && ChipShapeFileManufRS.size() > 0){
				for(int i = 0; i < ChipShapeFileManufRS.size(); i++){
					array_ChipShapeFileManufRS = array_ChipShapeFileManufRS + ChipShapeFileManufRS.get(i).get("url_FileManufactureResultChild") + ",";
					array_ChipShapeFileManufRS_name = array_ChipShapeFileManufRS_name + ChipShapeFileManufRS.get(i).get("name_FileManufactureResultChild") + ",";
				}
			}
			
			String array_ManufRSDefined1File = "";
			String array_ManufRSDefined1File_name = "";
			if(ManufRSDefined1File != null && ManufRSDefined1File.size() > 0){
				for(int i = 0; i < ManufRSDefined1File.size(); i++){
					array_ManufRSDefined1File = array_ManufRSDefined1File + ManufRSDefined1File.get(i).get("url_FileManufactureResultChild") + ",";
					array_ManufRSDefined1File_name = array_ManufRSDefined1File_name + ManufRSDefined1File.get(i).get("name_FileManufactureResultChild") + ",";
				}
			}
			
			String array_ManufRSDefined2File = "";
			String array_ManufRSDefined2File_name = "";
			if(ManufRSDefined2File != null && ManufRSDefined2File.size() > 0){
				for(int i = 0; i < ManufRSDefined2File.size(); i++){
					array_ManufRSDefined2File = array_ManufRSDefined2File + ManufRSDefined2File.get(i).get("url_FileManufactureResultChild") + ",";
					array_ManufRSDefined2File_name = array_ManufRSDefined2File_name + ManufRSDefined2File.get(i).get("name_FileManufactureResultChild") + ",";
				}
			}
			
			String array_ManufRSDefined3File = "";
			String array_ManufRSDefined3File_name = "";
			if(ManufRSDefined3File != null && ManufRSDefined3File.size() > 0){
				for(int i = 0; i < ManufRSDefined3File.size(); i++){
					array_ManufRSDefined3File = array_ManufRSDefined3File + ManufRSDefined3File.get(i).get("url_FileManufactureResultChild") + ",";
					array_ManufRSDefined3File_name = array_ManufRSDefined3File_name + ManufRSDefined3File.get(i).get("name_FileManufactureResultChild") + ",";
				}
			}
			
			mv.addObject("array_PictureManufRS", array_PictureManufRS);
			mv.addObject("array_PictureToolWearManufRS", array_PictureToolWearManufRS);
			mv.addObject("array_SurfaceRoughnessFileManufRS", array_SurfaceRoughnessFileManufRS);
			mv.addObject("array_SurfaceRoughnessFileManufRS_name", array_SurfaceRoughnessFileManufRS_name);
			mv.addObject("array_SurfaceHardnessFileManufRS", array_SurfaceHardnessFileManufRS);
			mv.addObject("array_SurfaceHardnessFileManufRS_name", array_SurfaceHardnessFileManufRS_name);
			mv.addObject("array_SurfaceStressFileManufRS", array_SurfaceStressFileManufRS);
			mv.addObject("array_SurfaceStressFileManufRS_name", array_SurfaceStressFileManufRS_name);
			mv.addObject("array_SurfaceMorphologyFileManufRS", array_SurfaceMorphologyFileManufRS);
			mv.addObject("array_SurfaceMorphologyFileManufRS_name", array_SurfaceMorphologyFileManufRS_name);
			mv.addObject("array_ChipShapeFileManufRS", array_ChipShapeFileManufRS);
			mv.addObject("array_ChipShapeFileManufRS_name", array_ChipShapeFileManufRS_name);
			mv.addObject("array_ManufRSDefined1File", array_ManufRSDefined1File);
			mv.addObject("array_ManufRSDefined1File_name", array_ManufRSDefined1File_name);
			mv.addObject("array_ManufRSDefined2File", array_ManufRSDefined2File);
			mv.addObject("array_ManufRSDefined2File_name", array_ManufRSDefined2File_name);
			mv.addObject("array_ManufRSDefined3File", array_ManufRSDefined3File);
			mv.addObject("array_ManufRSDefined3File_name", array_ManufRSDefined3File_name);
		}
		
		
		
		mv.setViewName("/WEB-INF/productionManage/ManufactureResultChild/ManufactureResultChild_edit");
		mv.addObject("turn_url", turn_url);
		mv.addObject("ManufactureResultChild", ManufactureResultChild);
		
		mv.addObject("pd", pd);
		return mv;
	}
		
	
	
		
	 /**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/saveManufactureResultChild")
	public String saveManufactureResultChild(HttpServletRequest request, 
			String array_PictureManufRS , String array_PictureToolWearManufRS,String array_SurfaceRoughnessFileManufRS,String array_SurfaceRoughnessFileManufRS_name,
			String array_SurfaceHardnessFileManufRS,String array_SurfaceHardnessFileManufRS_name,String array_SurfaceStressFileManufRS,String array_SurfaceStressFileManufRS_name,
			String array_SurfaceMorphologyFileManufRS,String array_SurfaceMorphologyFileManufRS_name,String array_ChipShapeFileManufRS,String array_ChipShapeFileManufRS_name,
			String array_ManufRSDefined1File,String array_ManufRSDefined1File_name,String array_ManufRSDefined2File,String array_ManufRSDefined2File_name,
			String array_ManufRSDefined3File,String array_ManufRSDefined3File_name,
			int id_ManufactureResultChild, String NoManufRS, String QuantityManufRS,String DateStartManufRS, String DateFinishManufRS,
			String RemarkManufRS,String PartNoManufRS, String NameManufRS, String NumberMaterialManufRS, String CategoryMaterialManufRS, 
			String DeviceManufRS, String IDDeviceManufRS, String NoProcessManufRS, String NameProcessManufRS, String NoProcessStepManufRS, 
			String NameProcessStepManufRS,String MachiningTypeManufRS, String MachiningLevelManufRS, String CuttingFluidManufRS, 
			String CutterSpeedManufRS, String SpindleSpeedManufRS, String FeedManufRS, String CuttingDepthManufRS, String CuttingWidthManufRS,
			String FeedSpeedManufRS,String ToolHolderManufRS, String ToolbladeManufRS, String ToolMaterialManufRS, String CutterManufRS, 
			String ToollifeManufRS, String ToolWearManufRS, String RemovalRateManufRS,String MachiningSize , String SizePrecision, String MachiningTime,
			String SurfaceRoughnessManufRS, String SurfaceHardnessManufRS, String SurfaceStressManufRS, String SurfaceMorphologyManufRS,
			String ChipShapeManufRS ,String ManufRSDefined1 ,String ManufRSDefined1Value, String ManufRSDefined2,String ManufRSDefined2Value,
			String ManufRSDefined3 ,String ManufRSDefined3Value
			) {
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		Map para = new HashMap();
		
		
		para.put("id_ManufactureResultChild", id_ManufactureResultChild);
		para.put("NoManufRS", NoManufRS);
		para.put("QuantityManufRS", QuantityManufRS);
		para.put("DateStartManufRS", DateStartManufRS);
		para.put("DateFinishManufRS", DateFinishManufRS);
		para.put("RemarkManufRS", RemarkManufRS);
		para.put("PartNoManufRS", PartNoManufRS);
		para.put("NameManufRS", NameManufRS);
		para.put("NumberMaterialManufRS", NumberMaterialManufRS);
		para.put("CategoryMaterialManufRS", CategoryMaterialManufRS);
		para.put("DeviceManufRS", DeviceManufRS);
		para.put("IDDeviceManufRS", IDDeviceManufRS);
		para.put("NoProcessManufRS", NoProcessManufRS);
		para.put("NameProcessManufRS", NameProcessManufRS);
		para.put("NoProcessStepManufRS", NoProcessStepManufRS);
		para.put("NameProcessStepManufRS", NameProcessStepManufRS);
		para.put("MachiningTypeManufRS", MachiningTypeManufRS);
		para.put("MachiningLevelManufRS", MachiningLevelManufRS);
		para.put("CuttingFluidManufRS", CuttingFluidManufRS);
		para.put("CutterSpeedManufRS", CutterSpeedManufRS);
		para.put("SpindleSpeedManufRS", SpindleSpeedManufRS);
		para.put("FeedManufRS", FeedManufRS);
		para.put("CuttingDepthManufRS", CuttingDepthManufRS);
		para.put("CuttingWidthManufRS", CuttingWidthManufRS);
		para.put("FeedSpeedManufRS", FeedSpeedManufRS);
		para.put("ToolHolderManufRS", ToolHolderManufRS);
		para.put("ToolbladeManufRS", ToolbladeManufRS);
		para.put("ToolMaterialManufRS", ToolMaterialManufRS);
		para.put("CutterManufRS", CutterManufRS);
		para.put("ToollifeManufRS", ToollifeManufRS);
		para.put("ToolWearManufRS", ToolWearManufRS);
		para.put("RemovalRateManufRS", RemovalRateManufRS);
		para.put("MachiningSize", MachiningSize);
		para.put("SizePrecision", SizePrecision);
		para.put("MachiningTime", MachiningTime);
		para.put("SurfaceRoughnessManufRS", SurfaceRoughnessManufRS);
		para.put("SurfaceHardnessManufRS", SurfaceHardnessManufRS);
		para.put("SurfaceStressManufRS", SurfaceStressManufRS);
		para.put("SurfaceMorphologyManufRS", SurfaceMorphologyManufRS);
		para.put("ChipShapeManufRS", ChipShapeManufRS);
		para.put("ManufRSDefined1", ManufRSDefined1);
		para.put("ManufRSDefined1Value", ManufRSDefined1Value);
		para.put("ManufRSDefined2", ManufRSDefined2);
		para.put("ManufRSDefined2Value", ManufRSDefined2Value);
		para.put("ManufRSDefined3", ManufRSDefined3);
		para.put("ManufRSDefined3Value", ManufRSDefined3Value);
		
		try {
			if(id_ManufactureResultChild != 0){//修改
				manufactureResultChildService.updateManufactureResultChild(para);
			}else{//新增
				manufactureResultChildService.saveManufactureResultChild(para);
			}
			//清空文件
			manufactureResultChildService.cleanFileManufactureResultChildById(para);
			
			
			Map PictureManufRS = new HashMap();
			PictureManufRS.put("id_ManufactureResultChild", id_ManufactureResultChild);
			PictureManufRS.put("ascription", "PictureManufRS");
			
			//保存刀柄图片
			if(array_PictureManufRS != null && !"".equals(array_PictureManufRS)){
				String array_PictureManufRSs[] = array_PictureManufRS.split(",");
				for(int i=0; i<array_PictureManufRSs.length; i++){
					if(array_PictureManufRSs[i] != null && !"".equals(array_PictureManufRSs[i])){
						PictureManufRS.put("url_FileManufactureResultChild", array_PictureManufRSs[i]);
						manufactureResultChildService.saveFileManufactureResultChild(PictureManufRS);
					}
				}
			}
			
			Map PictureToolWearManufRS = new HashMap();
			PictureToolWearManufRS.put("id_ManufactureResultChild", id_ManufactureResultChild);
			PictureToolWearManufRS.put("ascription", "PictureToolWearManufRS");
			
			//保存刀柄图片
			if(array_PictureToolWearManufRS != null && !"".equals(array_PictureToolWearManufRS)){
				String array_PictureToolWearManufRSs[] = array_PictureToolWearManufRS.split(",");
				for(int i=0; i<array_PictureToolWearManufRSs.length; i++){
					if(array_PictureToolWearManufRSs[i] != null && !"".equals(array_PictureToolWearManufRSs[i])){
						PictureToolWearManufRS.put("url_FileManufactureResultChild", array_PictureToolWearManufRSs[i]);
						manufactureResultChildService.saveFileManufactureResultChild(PictureToolWearManufRS);
					}
				}
			}
			
			
			Map SurfaceRoughnessFileManufRS = new HashMap();
			SurfaceRoughnessFileManufRS.put("id_ManufactureResultChild", id_ManufactureResultChild);
			SurfaceRoughnessFileManufRS.put("ascription", "SurfaceRoughnessFileManufRS");
			//保存刀柄图片
			if(array_SurfaceRoughnessFileManufRS != null && !"".equals(array_SurfaceRoughnessFileManufRS)){
				String array_SurfaceRoughnessFileManufRSs[] = array_SurfaceRoughnessFileManufRS.split(",");
				String array_SurfaceRoughnessFileManufRSs_name[] = array_SurfaceRoughnessFileManufRS_name.split(",");
				for(int i=0; i<array_SurfaceRoughnessFileManufRSs.length; i++){
					if(array_SurfaceRoughnessFileManufRSs[i] != null && !"".equals(array_SurfaceRoughnessFileManufRSs[i])){
						SurfaceRoughnessFileManufRS.put("url_FileManufactureResultChild", array_SurfaceRoughnessFileManufRSs[i]);
						SurfaceRoughnessFileManufRS.put("name_FileManufactureResultChild", array_SurfaceRoughnessFileManufRSs_name[i]);
						manufactureResultChildService.saveFileManufactureResultChild(SurfaceRoughnessFileManufRS);
					}
				}
			}
			
			
			Map SurfaceHardnessFileManufRS = new HashMap();
			SurfaceHardnessFileManufRS.put("id_ManufactureResultChild", id_ManufactureResultChild);
			SurfaceHardnessFileManufRS.put("ascription", "SurfaceHardnessFileManufRS");
			//保存刀柄图片
			if(array_SurfaceHardnessFileManufRS != null && !"".equals(array_SurfaceHardnessFileManufRS)){
				String array_SurfaceHardnessFileManufRSs[] = array_SurfaceHardnessFileManufRS.split(",");
				String array_SurfaceHardnessFileManufRSs_name[] = array_SurfaceHardnessFileManufRS_name.split(",");
				for(int i=0; i<array_SurfaceHardnessFileManufRSs.length; i++){
					if(array_SurfaceHardnessFileManufRSs[i] != null && !"".equals(array_SurfaceHardnessFileManufRSs[i])){
						SurfaceHardnessFileManufRS.put("url_FileManufactureResultChild", array_SurfaceHardnessFileManufRSs[i]);
						SurfaceHardnessFileManufRS.put("name_FileManufactureResultChild", array_SurfaceHardnessFileManufRSs_name[i]);
						manufactureResultChildService.saveFileManufactureResultChild(SurfaceHardnessFileManufRS);
					}
				}
			}
			
			Map SurfaceStressFileManufRS = new HashMap();
			SurfaceStressFileManufRS.put("id_ManufactureResultChild", id_ManufactureResultChild);
			SurfaceStressFileManufRS.put("ascription", "SurfaceStressFileManufRS");
			//保存刀柄图片
			if(array_SurfaceStressFileManufRS != null && !"".equals(array_SurfaceStressFileManufRS)){
				String array_SurfaceStressFileManufRSs[] = array_SurfaceStressFileManufRS.split(",");
				String array_SurfaceStressFileManufRSs_name[] = array_SurfaceStressFileManufRS_name.split(",");
				for(int i=0; i<array_SurfaceStressFileManufRSs.length; i++){
					if(array_SurfaceStressFileManufRSs[i] != null && !"".equals(array_SurfaceStressFileManufRSs[i])){
						SurfaceStressFileManufRS.put("url_FileManufactureResultChild", array_SurfaceStressFileManufRSs[i]);
						SurfaceStressFileManufRS.put("name_FileManufactureResultChild", array_SurfaceStressFileManufRSs_name[i]);
						manufactureResultChildService.saveFileManufactureResultChild(SurfaceStressFileManufRS);
					}
				}
			}
			
			Map SurfaceMorphologyFileManufRS = new HashMap();
			SurfaceMorphologyFileManufRS.put("id_ManufactureResultChild", id_ManufactureResultChild);
			SurfaceMorphologyFileManufRS.put("ascription", "SurfaceMorphologyFileManufRS");
			//保存刀柄图片
			if(array_SurfaceMorphologyFileManufRS != null && !"".equals(array_SurfaceMorphologyFileManufRS)){
				String array_SurfaceMorphologyFileManufRSs[] = array_SurfaceMorphologyFileManufRS.split(",");
				String array_SurfaceMorphologyFileManufRSs_name[] = array_SurfaceMorphologyFileManufRS_name.split(",");
				for(int i=0; i<array_SurfaceMorphologyFileManufRSs.length; i++){
					if(array_SurfaceMorphologyFileManufRSs[i] != null && !"".equals(array_SurfaceMorphologyFileManufRSs[i])){
						SurfaceMorphologyFileManufRS.put("url_FileManufactureResultChild", array_SurfaceMorphologyFileManufRSs[i]);
						SurfaceMorphologyFileManufRS.put("name_FileManufactureResultChild", array_SurfaceMorphologyFileManufRSs_name[i]);
						manufactureResultChildService.saveFileManufactureResultChild(SurfaceMorphologyFileManufRS);
					}
				}
			}
			
			Map ChipShapeFileManufRS = new HashMap();
			ChipShapeFileManufRS.put("id_ManufactureResultChild", id_ManufactureResultChild);
			ChipShapeFileManufRS.put("ascription", "ChipShapeFileManufRS");
			//保存刀柄图片
			if(array_ChipShapeFileManufRS != null && !"".equals(array_ChipShapeFileManufRS)){
				String array_ChipShapeFileManufRSs[] = array_ChipShapeFileManufRS.split(",");
				String array_ChipShapeFileManufRSs_name[] = array_ChipShapeFileManufRS_name.split(",");
				for(int i=0; i<array_ChipShapeFileManufRSs.length; i++){
					if(array_ChipShapeFileManufRSs[i] != null && !"".equals(array_ChipShapeFileManufRSs[i])){
						ChipShapeFileManufRS.put("url_FileManufactureResultChild", array_ChipShapeFileManufRSs[i]);
						ChipShapeFileManufRS.put("name_FileManufactureResultChild", array_ChipShapeFileManufRSs_name[i]);
						manufactureResultChildService.saveFileManufactureResultChild(ChipShapeFileManufRS);
					}
				}
			}
			
			Map ManufRSDefined1File = new HashMap();
			ManufRSDefined1File.put("id_ManufactureResultChild", id_ManufactureResultChild);
			ManufRSDefined1File.put("ascription", "ManufRSDefined1File");
			//保存刀柄图片
			if(array_ManufRSDefined1File != null && !"".equals(array_ManufRSDefined1File)){
				String array_ManufRSDefined1Files[] = array_ManufRSDefined1File.split(",");
				String array_ManufRSDefined1Files_name[] = array_ManufRSDefined1File_name.split(",");
				for(int i=0; i<array_ManufRSDefined1Files.length; i++){
					if(array_ManufRSDefined1Files[i] != null && !"".equals(array_ManufRSDefined1Files[i])){
						ManufRSDefined1File.put("url_FileManufactureResultChild", array_ManufRSDefined1Files[i]);
						ManufRSDefined1File.put("name_FileManufactureResultChild", array_ManufRSDefined1Files_name[i]);
						manufactureResultChildService.saveFileManufactureResultChild(ManufRSDefined1File);
					}
				}
			}
			
			Map ManufRSDefined2File = new HashMap();
			ManufRSDefined2File.put("id_ManufactureResultChild", id_ManufactureResultChild);
			ManufRSDefined2File.put("ascription", "ManufRSDefined2File");
			//保存刀柄图片
			if(array_ManufRSDefined2File != null && !"".equals(array_ManufRSDefined2File)){
				String array_ManufRSDefined2Files[] = array_ManufRSDefined2File.split(",");
				String array_ManufRSDefined2Files_name[] = array_ManufRSDefined2File_name.split(",");
				for(int i=0; i<array_ManufRSDefined2Files.length; i++){
					if(array_ManufRSDefined2Files[i] != null && !"".equals(array_ManufRSDefined2Files[i])){
						ManufRSDefined2File.put("url_FileManufactureResultChild", array_ManufRSDefined2Files[i]);
						ManufRSDefined2File.put("name_FileManufactureResultChild", array_ManufRSDefined2Files_name[i]);
						manufactureResultChildService.saveFileManufactureResultChild(ManufRSDefined2File);
					}
				}
			}
			
			Map ManufRSDefined3File = new HashMap();
			ManufRSDefined3File.put("id_ManufactureResultChild", id_ManufactureResultChild);
			ManufRSDefined3File.put("ascription", "ManufRSDefined3File");
			//保存刀柄图片
			if(array_ManufRSDefined3File != null && !"".equals(array_ManufRSDefined3File)){
				String array_ManufRSDefined3Files[] = array_ManufRSDefined3File.split(",");
				String array_ManufRSDefined3Files_name[] = array_ManufRSDefined3File_name.split(",");
				for(int i=0; i<array_ManufRSDefined3Files.length; i++){
					if(array_ManufRSDefined3Files[i] != null && !"".equals(array_ManufRSDefined3Files[i])){
						ManufRSDefined3File.put("url_FileManufactureResultChild", array_ManufRSDefined3Files[i]);
						ManufRSDefined3File.put("name_FileManufactureResultChild", array_ManufRSDefined3Files_name[i]);
						manufactureResultChildService.saveFileManufactureResultChild(ManufRSDefined3File);
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
	
	
	
	
	//保存文件
	@ResponseBody
    @RequestMapping(value="/saveFileManufactureResultChild")
	public Object saveFileManufactureResult(
			@RequestParam(value="FileManufactureResultChild",required=false)MultipartFile FileManufactureResultChild ,
			String ascription , HttpServletRequest request ) throws Exception{
		Map<String,String> data = new HashMap<String, String>();
		String OriginalFilename = FileManufactureResultChild.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/fileManufactureResultChild/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			FileManufactureResultChild.transferTo(materials_big_img_file); 
			data.put("url", "/fileManufactureResultChild/" + big_url + "." + fileSuffix);
			data.put("fileName", OriginalFilename);
			data.put("ascription", ascription);
		}else{

		}
		return data;
		
	}
	
	
	//保存文件
	@ResponseBody
    @RequestMapping(value="/savePictureManufactureResultChild")
	public Object savePictureManufactureResult(
			@RequestParam(value="PictureManufactureResultChild",required=false)MultipartFile PictureManufactureResultChild ,
			String ascription , HttpServletRequest request ) throws Exception{
		String url = "";
		String OriginalFilename = PictureManufactureResultChild.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/PictureManufactureResultChild/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			PictureManufactureResultChild.transferTo(materials_big_img_file); 
			url = "/PictureManufactureResultChild/" + big_url + "." + fileSuffix ;
		}else{

		}
		return url;
		
	}
	
	
	//删除
	@ResponseBody
	@RequestMapping("deleteManufactureResultChildList")
	public String deleteManufactureResultChildList(String id_ManufactureResultChild){
		Map para = new HashMap();
		para.put("id_ManufactureResultChild", id_ManufactureResultChild);
		try {
			manufactureResultChildService.deleteManufactureResultChildList(para);
			
			manufactureResultChildService.cleanFileManufactureResultChildById(para);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}	
		return "1";
	}
	
	
	//加载生产计划
	@RequestMapping("loading")
	public ModelAndView loading(Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		page.setPd(pd);
		List<Map> list = new ArrayList<Map>();
		//1为查询加载机床节点
		Map map	= manufacturePlanService.queryManufacturePlanList(page);//查询零件页面
		page = (Page)map.get("page");
		list = (List<Map>)map.get("list");
		
		mv.addObject("ManufacturePlan", list);
		mv.addObject("pd", pd);
		mv.addObject("page", page);
		mv.setViewName("/WEB-INF/productionManage/ManufactureResultChild/ManufactureResultChild_loadingManufacturePlan");
		return mv;
	}
	
	
	
	//去定制添加页面	
	@RequestMapping("Customization")
	public ModelAndView Customization(Page page){
		
		Map Mapped = new HashMap<>();
		Mapped.put("PartNoManufRS","零件编号");
		Mapped.put("NameManufRS","零件名称");
		Mapped.put("NumberMaterialManufRS","材料牌号");
		Mapped.put("CategoryMaterialManufRS","材料类别");
		Mapped.put("DeviceManufRS","设备编号");
		Mapped.put("IDDeviceManufRS","节点设备编号");
		Mapped.put("NoProcessManufRS","工序编号");
		Mapped.put("NameProcessManufRS","工序名称");
		Mapped.put("NoProcessStepManufRS","工步编号");
		Mapped.put("NameProcessStepManufRS","工步名称");
		Mapped.put("MachiningTypeManufRS","加工类别");
		Mapped.put("MachiningLevelManufRS","加工级别");
		Mapped.put("CuttingFluidManufRS","切削液");
		Mapped.put("CutterSpeedManufRS","切削速度");
		Mapped.put("SpindleSpeedManufRS","主轴转速");
		Mapped.put("FeedManufRS","每齿进给量");
		Mapped.put("CuttingDepthManufRS","切削深度");
		Mapped.put("CuttingWidthManufRS","切削宽度");
		Mapped.put("FeedSpeedManufRS","进给速度");
		Mapped.put("ToolHolderManufRS","刀柄");
		Mapped.put("ToolbladeManufRS","刀片");
		Mapped.put("ToolMaterialManufRS","刀片/刀具材料");
		Mapped.put("CutterManufRS","刀具");
		Mapped.put("ToollifeManufRS","刀具寿命");
		Mapped.put("ToolWearManufRS","刀具磨损量");
		Mapped.put("RemovalRateManufRS","材料去除率");
		Mapped.put("MachiningSize","加工尺寸");
		Mapped.put("SizePrecision","尺寸精度");
		Mapped.put("MachiningTime","加工时间");
		Mapped.put("SurfaceRoughnessManufRS","表面粗糙度");
		Mapped.put("SurfaceHardnessManufRS","表面硬度");
		Mapped.put("SurfaceStressManufRS","表面残余应力");
		Mapped.put("SurfaceMorphologyManufRS","加工表面形态");
		Mapped.put("ChipShapeManufRS","切屑形态");
		Mapped.put("ManufRSDefined1","参数名称1");
		Mapped.put("ManufRSDefined1Value","结果1");
		Mapped.put("ManufRSDefined2","参数名称2");
		Mapped.put("ManufRSDefined2Value","结果2");
		Mapped.put("ManufRSDefined3","参数名称3");
		Mapped.put("ManufRSDefined3Value","结果3");

		ModelAndView mv=new ModelAndView();
		
		Map map	= manufactureResultChildService.queryCustomizationList(page);//查询零件页面
		page = (Page)map.get("page");
		List<Map> list = (List<Map>)map.get("list");
		if(list!=null && list.size()>0){
			for(int i = 0;i<list.size(); i++){
				Map Customization =  list.get(i);
				String Customization_String = ""+Customization.get("name_Customization");
				String Customizations_String[] = Customization_String.split(",");
				/*List names_Customization = Arrays.asList(Customizations_String);
				Customization.put("names_Customization",names_Customization);*/
				List<String> names_Chinese = new ArrayList();
				for(int j=0;j<Customizations_String.length;j++){
					names_Chinese.add((String) Mapped.get(Customizations_String[j]));
				}
				Customization.put("names_Chinese",names_Chinese);
				list.set(i,Customization);
			}
		}
		mv.addObject("Customization", list);
		System.out.println(list);
		mv.setViewName("/WEB-INF/productionManage/ManufactureResultChild/ManufactureResultChild_Customization");
		
		
		return mv;
	}
	
	
	//删除
	@ResponseBody
	@RequestMapping("deleteCustomization")
	public String deleteCustomization(String id_Customization){
		Map para = new HashMap();
		para.put("id_Customization", id_Customization);
		try {
			manufactureResultChildService.deleteCustomization(para);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}	
		return "1";
	}
	
	

	//去添加页面
	@RequestMapping(value="/goAddCustomization")
	public ModelAndView goAddCustomization()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("/WEB-INF/productionManage/ManufactureResultChild/ManufactureResultChild_AddCustomization");
		return mv;
	}
		
	
	
	
		
	 /**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/saveCustomization")
	public String saveCustomization(HttpServletRequest request ,
			String[] field, String name
			) {
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		Map para = new HashMap();
		
		String name_Customization = "";
		for(int i =0 ;i<field.length;i++){
			name_Customization = name_Customization + field[i] + ","  ;
		}
		System.out.println(name_Customization);
		para.put("name_Customization", name_Customization);
		para.put("name", name);
		
		try {
			manufactureResultChildService.saveCustomization(para);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
		
	
	//利用某定制
	@RequestMapping(value="/useCustomization")
	public ModelAndView useCustomization(String id_Customization)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		Map para = new HashMap();
		para.put("id_Customization", id_Customization);
		Map Customization = manufactureResultChildService.queryCustomizationById(para);
		System.out.println(Customization);
		String Customization_String = ""+Customization.get("name_Customization");
		String Customizations_String[] = Customization_String.split(",");
		List names_Customization = Arrays.asList(Customizations_String);
		Customization.put("names_Customization",names_Customization);
		
		mv.addObject("Customization",Customization);
		mv.setViewName("/WEB-INF/productionManage/ManufactureResultChild/ManufactureResultChild_useCustomizationAdd");
		return mv;
	}
	
	
	
	
	
	
}






