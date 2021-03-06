package com.qf.cuttingSimulation.cuttingSimulationResult.controller;

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
import com.qf.cuttingSimulation.cuttingSimulationResult.service.CuttingSimulationResultService;
import com.qf.material.material.service.MaterialService;
import com.qf.tool.toolBTAdrill.service.ToolBTAdrillService;
import com.qf.tool.turningBlade.service.TurningBladeService;
import com.qf.util.PageData;
import com.qf.util.common.JackJson;
import com.qf.util.file.ByteToFile;
import com.qf.util.page.Page;


@Controller
@RequestMapping("/CuttingSimulationResultApp")
public class CuttingSimulationResultAppController {


	//工件材料
	@Resource(name="materialService")
	private MaterialService materialService;  
		
	//刀具-->刀片
	@Resource(name="turningBladeService")
	private TurningBladeService turningBladeService;
		
	//刀具-->深孔钻
	@Resource(name="toolBTAdrillService")
	private ToolBTAdrillService toolBTAdrillService; 
	
	@Resource(name = "cuttingSimulationResultService")
	private CuttingSimulationResultService cuttingSimulationService;
	
	
	
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
					
					List<Map> file = cuttingSimulationService.queryFileList(para);
					
					List<Map> PictureFileCutSim = new ArrayList<Map>();
					List<Map> ResultFileCutSim = new ArrayList<Map>();
					List<Map> ForceFileCutSim = new ArrayList<Map>();
					List<Map> TemperatureFileCutSim = new ArrayList<Map>();
					List<Map> ChipShapePicCutSim = new ArrayList<Map>();
					List<Map> SurfaceStressFileCutSim = new ArrayList<Map>();
					List<Map> ExReWearFile = new ArrayList<Map>();
					List<Map> ExReWearPicture = new ArrayList<Map>();
					List<Map> Defined1File = new ArrayList<Map>();
					List<Map> Defined2File = new ArrayList<Map>();
					List<Map> Defined3File = new ArrayList<Map>();
					for(int j = 0;j<file.size();j++){
						Map partMap = file.get(j);
						if("PictureFileCutSim".equals(partMap.get("ascription"))){
							PictureFileCutSim.add(partMap);
						}
						if(partMap.get("ascription").equals("ResultFileCutSim")){
							ResultFileCutSim.add(partMap);
						}
						if(partMap.get("ascription").equals("ForceFileCutSim")){
							ForceFileCutSim.add(partMap);
						}
						if(partMap.get("ascription").equals("TemperatureFileCutSim")){
							TemperatureFileCutSim.add(partMap);
						}
						if(partMap.get("ascription").equals("ChipShapePicCutSim")){
							ChipShapePicCutSim.add(partMap);
						}
						if(partMap.get("ascription").equals("SurfaceStressFileCutSim")){
							SurfaceStressFileCutSim.add(partMap);
						}
						if(partMap.get("ascription").equals("ExReWearFile")){
							ExReWearFile.add(partMap);
						}
						if(partMap.get("ascription").equals("ExReWearPicture")){
							ExReWearPicture.add(partMap);
						}
						if(partMap.get("ascription").equals("Defined1File")){
							Defined1File.add(partMap);
						}
						if(partMap.get("ascription").equals("Defined2File")){
							Defined2File.add(partMap);
						}
						if(partMap.get("ascription").equals("Defined3File")){
							Defined3File.add(partMap);
						}
					}
					CuttingSimulation.put("PictureFileCutSim", PictureFileCutSim);
					CuttingSimulation.put("ResultFileCutSim", ResultFileCutSim);
					CuttingSimulation.put("ForceFileCutSim", ForceFileCutSim);
					CuttingSimulation.put("TemperatureFileCutSim", TemperatureFileCutSim);
					CuttingSimulation.put("ChipShapePicCutSim", ChipShapePicCutSim);
					CuttingSimulation.put("SurfaceStressFileCutSim", SurfaceStressFileCutSim);
					CuttingSimulation.put("ExReWearFile", ExReWearFile);
					CuttingSimulation.put("ExReWearPicture", ExReWearPicture);
					CuttingSimulation.put("Defined1File", Defined1File);
					CuttingSimulation.put("Defined2File", Defined2File);
					CuttingSimulation.put("Defined3File", Defined3File);
					
					
					String ExReWearTimeAndValue_str = (String) CuttingSimulation.get("ExReWearTimeAndValue");
					List<Map> ExReWearTimeAndValueList = new ArrayList();
					if(ExReWearTimeAndValue_str != null && !"".equals(ExReWearTimeAndValue_str)){
						String ExReWearTimeAndValues[] = ExReWearTimeAndValue_str.split(",");
						for(int j=0;j<ExReWearTimeAndValues.length;j++){
							if(ExReWearTimeAndValues[j] != null && !"".equals(ExReWearTimeAndValues[j])){
								String shijian = ExReWearTimeAndValues[j].split("-")[0];
								String mosundu = ExReWearTimeAndValues[j].split("-")[1];
								Map temp = new HashMap();
								temp.put("shijian", shijian);
								temp.put("mosundu", mosundu);
								ExReWearTimeAndValueList.add(temp);
							}
						}
						CuttingSimulation.put("ExReWearTimeAndValueList", ExReWearTimeAndValueList);
						
					}
					
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
    @RequestMapping(value="/goAddCuttingSimulationResult", produces = "application/json; charset=utf-8")
	public String goAddCuttingSimulationResult(String id, String turn_url)throws Exception{
    	String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
			
		Map para = new HashMap();
		para.put("id_CuttingSimulation", id);
		
		Map CuttingSimulation = cuttingSimulationService.queryCuttingSimulationById(para);
		if(CuttingSimulation != null){
			List<Map> file = cuttingSimulationService.queryFileList(para);
			
			List<Map> PictureFileCutSim = new ArrayList<Map>();
			List<Map> ResultFileCutSim = new ArrayList<Map>();
			List<Map> ForceFileCutSim = new ArrayList<Map>();
			List<Map> TemperatureFileCutSim = new ArrayList<Map>();
			List<Map> ChipShapePicCutSim = new ArrayList<Map>();
			List<Map> SurfaceStressFileCutSim = new ArrayList<Map>();
			List<Map> ExReWearFile = new ArrayList<Map>();
			List<Map> ExReWearPicture = new ArrayList<Map>();
			List<Map> Defined1File = new ArrayList<Map>();
			List<Map> Defined2File = new ArrayList<Map>();
			List<Map> Defined3File = new ArrayList<Map>();
			for(int j = 0;j<file.size();j++){
				Map partMap = file.get(j);
				if("PictureFileCutSim".equals(partMap.get("ascription"))){
					PictureFileCutSim.add(partMap);
				}
				if(partMap.get("ascription").equals("ResultFileCutSim")){
					ResultFileCutSim.add(partMap);
				}
				if(partMap.get("ascription").equals("ForceFileCutSim")){
					ForceFileCutSim.add(partMap);
				}
				if(partMap.get("ascription").equals("TemperatureFileCutSim")){
					TemperatureFileCutSim.add(partMap);
				}
				if(partMap.get("ascription").equals("ChipShapePicCutSim")){
					ChipShapePicCutSim.add(partMap);
				}
				if(partMap.get("ascription").equals("SurfaceStressFileCutSim")){
					SurfaceStressFileCutSim.add(partMap);
				}
				if(partMap.get("ascription").equals("ExReWearFile")){
					ExReWearFile.add(partMap);
				}
				if(partMap.get("ascription").equals("ExReWearPicture")){
					ExReWearPicture.add(partMap);
				}
				if(partMap.get("ascription").equals("Defined1File")){
					Defined1File.add(partMap);
				}
				if(partMap.get("ascription").equals("Defined2File")){
					Defined2File.add(partMap);
				}
				if(partMap.get("ascription").equals("Defined3File")){
					Defined3File.add(partMap);
				}
			}
			CuttingSimulation.put("PictureFileCutSim", PictureFileCutSim);
			CuttingSimulation.put("ResultFileCutSim", ResultFileCutSim);
			CuttingSimulation.put("ForceFileCutSim", ForceFileCutSim);
			CuttingSimulation.put("TemperatureFileCutSim", TemperatureFileCutSim);
			CuttingSimulation.put("ChipShapePicCutSim", ChipShapePicCutSim);
			CuttingSimulation.put("SurfaceStressFileCutSim", SurfaceStressFileCutSim);
			CuttingSimulation.put("ExReWearFile", ExReWearFile);
			CuttingSimulation.put("ExReWearPicture", ExReWearPicture);
			CuttingSimulation.put("Defined1File", Defined1File);
			CuttingSimulation.put("Defined2File", Defined2File);
			CuttingSimulation.put("Defined3File", Defined3File);
			
			String ExReWearTimeAndValue_str = (String) CuttingSimulation.get("ExReWearTimeAndValue");
			List<Map> ExReWearTimeAndValueList = new ArrayList();
			if(ExReWearTimeAndValue_str != null && !"".equals(ExReWearTimeAndValue_str)){
				String ExReWearTimeAndValues[] = ExReWearTimeAndValue_str.split(",");
				for(int j=0;j<ExReWearTimeAndValues.length;j++){
					if(ExReWearTimeAndValues[j] != null && !"".equals(ExReWearTimeAndValues[j])){
						String shijian = ExReWearTimeAndValues[j].split("-")[0];
						String mosundu = ExReWearTimeAndValues[j].split("-")[1];
						Map temp = new HashMap();
						temp.put("shijian", shijian);
						temp.put("mosundu", mosundu);
						ExReWearTimeAndValueList.add(temp);
					}
				}
				CuttingSimulation.put("ExReWearTimeAndValueList", ExReWearTimeAndValueList);
				
			}
			
			String array_PictureFileCutSim = "";
			if(PictureFileCutSim != null && PictureFileCutSim.size() > 0){
				for(int i = 0; i < PictureFileCutSim.size(); i++){
					array_PictureFileCutSim = array_PictureFileCutSim + PictureFileCutSim.get(i).get("url_CuttingSimulationResultFile") + ",";
				}
			}
			
			String array_ResultFileCutSim = "";
			String array_ResultFileCutSim_name = "";
			if(ResultFileCutSim != null && ResultFileCutSim.size() > 0){
				for(int i = 0; i < ResultFileCutSim.size(); i++){
					array_ResultFileCutSim = array_ResultFileCutSim + ResultFileCutSim.get(i).get("url_CuttingSimulationResultFile") + ",";
					array_ResultFileCutSim_name = array_ResultFileCutSim_name + ResultFileCutSim.get(i).get("name_CuttingSimulationResultFile") + ",";
				}
			}
			
			String array_ForceFileCutSim = "";
			String array_ForceFileCutSim_name = "";
			if(ForceFileCutSim != null && ForceFileCutSim.size() > 0){
				for(int i = 0; i < ForceFileCutSim.size(); i++){
					array_ForceFileCutSim = array_ForceFileCutSim + ForceFileCutSim.get(i).get("url_CuttingSimulationResultFile") + ",";
					array_ForceFileCutSim_name = array_ForceFileCutSim_name + ForceFileCutSim.get(i).get("name_CuttingSimulationResultFile") + ",";
				}
			}
			
			String array_TemperatureFileCutSim = "";
			String array_TemperatureFileCutSim_name = "";
			if(TemperatureFileCutSim != null && TemperatureFileCutSim.size() > 0){
				for(int i = 0; i < TemperatureFileCutSim.size(); i++){
					array_TemperatureFileCutSim = array_TemperatureFileCutSim + TemperatureFileCutSim.get(i).get("url_CuttingSimulationResultFile") + ",";
					array_TemperatureFileCutSim_name = array_TemperatureFileCutSim_name + TemperatureFileCutSim.get(i).get("name_CuttingSimulationResultFile") + ",";
				}
			}
			
			String array_ChipShapePicCutSim = "";
			if(ChipShapePicCutSim != null && ChipShapePicCutSim.size() > 0){
				for(int i = 0; i < ChipShapePicCutSim.size(); i++){
					array_ChipShapePicCutSim = array_ChipShapePicCutSim + ChipShapePicCutSim.get(i).get("url_CuttingSimulationResultFile") + ",";
				}
			}
			
			String array_SurfaceStressFileCutSim = "";
			String array_SurfaceStressFileCutSim_name = "";
			if(SurfaceStressFileCutSim != null && SurfaceStressFileCutSim.size() > 0){
				for(int i = 0; i < SurfaceStressFileCutSim.size(); i++){
					array_SurfaceStressFileCutSim = array_SurfaceStressFileCutSim + SurfaceStressFileCutSim.get(i).get("url_CuttingSimulationResultFile") + ",";
					array_SurfaceStressFileCutSim_name = array_SurfaceStressFileCutSim_name + SurfaceStressFileCutSim.get(i).get("name_CuttingSimulationResultFile") + ",";
				}
			}
			
			String array_ExReWearFile = "";
			String array_ExReWearFile_name = "";
			if(ExReWearFile != null && ExReWearFile.size() > 0){
				for(int i = 0; i < ExReWearFile.size(); i++){
					array_ExReWearFile = array_ExReWearFile + ExReWearFile.get(i).get("url_CuttingSimulationResultFile") + ",";
					array_ExReWearFile_name = array_ExReWearFile_name + ExReWearFile.get(i).get("name_CuttingSimulationResultFile") + ",";
				}
			}
			
			String array_ExReWearPicture = "";
			if(ExReWearPicture != null && ExReWearPicture.size() > 0){
				for(int i = 0; i < ExReWearPicture.size(); i++){
					array_ExReWearPicture = array_ExReWearPicture + ExReWearPicture.get(i).get("url_CuttingSimulationResultFile") + ",";
				}
			}
			
			String array_Defined1File = "";
			String array_Defined1File_name = "";
			if(Defined1File != null && Defined1File.size() > 0){
				for(int i = 0; i < Defined1File.size(); i++){
					array_Defined1File = array_Defined1File + Defined1File.get(i).get("url_CuttingSimulationResultFile") + ",";
					array_Defined1File_name = array_Defined1File_name + Defined1File.get(i).get("name_CuttingSimulationResultFile") + ",";
				}
			}
			
			String array_Defined2File = "";
			String array_Defined2File_name = "";
			if(Defined2File != null && Defined2File.size() > 0){
				for(int i = 0; i < Defined2File.size(); i++){
					array_Defined2File = array_Defined2File + Defined2File.get(i).get("url_CuttingSimulationResultFile") + ",";
					array_Defined2File_name = array_Defined2File_name + Defined2File.get(i).get("name_CuttingSimulationResultFile") + ",";
				}
			}
			
			String array_Defined3File = "";
			String array_Defined3File_name = "";
			if(Defined3File != null && Defined3File.size() > 0){
				for(int i = 0; i < Defined3File.size(); i++){
					array_Defined3File = array_Defined3File + Defined3File.get(i).get("url_CuttingSimulationResultFile") + ",";
					array_Defined3File_name = array_Defined3File_name + Defined3File.get(i).get("name_CuttingSimulationResultFile") + ",";
				}
			}
			
			resultmap.put("array_PictureFileCutSim", array_PictureFileCutSim);
			resultmap.put("array_ResultFileCutSim", array_ResultFileCutSim);
			resultmap.put("array_ResultFileCutSim_name", array_ResultFileCutSim_name);
			resultmap.put("array_ForceFileCutSim", array_ForceFileCutSim);
			resultmap.put("array_ForceFileCutSim_name", array_ForceFileCutSim_name);
			resultmap.put("array_TemperatureFileCutSim", array_TemperatureFileCutSim);
			resultmap.put("array_TemperatureFileCutSim_name", array_TemperatureFileCutSim_name);
			resultmap.put("array_ChipShapePicCutSim", array_ChipShapePicCutSim);
			resultmap.put("array_SurfaceStressFileCutSim", array_SurfaceStressFileCutSim);
			resultmap.put("array_SurfaceStressFileCutSim_name", array_SurfaceStressFileCutSim_name);
			resultmap.put("array_ExReWearFile", array_ExReWearFile);
			resultmap.put("array_ExReWearFile_name", array_ExReWearFile_name);
			resultmap.put("array_ExReWearPicture", array_ExReWearPicture);
			resultmap.put("array_Defined1File", array_Defined1File);
			resultmap.put("array_Defined1File_name", array_Defined1File_name);
			resultmap.put("array_Defined2File", array_Defined2File);
			resultmap.put("array_Defined2File_name", array_Defined2File_name);
			resultmap.put("array_Defined3File", array_Defined3File);
			resultmap.put("array_Defined3File_name", array_Defined3File_name);
			
			resultmap.put("result", "1");
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

	
	@ResponseBody
	@RequestMapping(value="/saveResultFile", produces = "application/json; charset=utf-8")
	public String saveResultFile(
			String file ,String fileSuffix, String filename) throws Exception{
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		String json  = "";  
		Map resultmap = new HashMap();
		String url = null;
		String name = null;
		if(file != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/resultFile/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/resultFile/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(file,  filepath2);
			url =  "/resultFile/" + big_url + "." + fileSuffix;
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
			String array_PictureFileCutSim, String array_ChipShapePicCutSim, String array_ExReWearPicture, 
			String array_ResultFileCutSim, String array_ResultFileCutSim_name,String array_ForceFileCutSim, String array_ForceFileCutSim_name,
			String array_TemperatureFileCutSim, String array_TemperatureFileCutSim_name,String array_SurfaceStressFileCutSim, String array_SurfaceStressFileCutSim_name,
			String array_ExReWearFile, String array_ExReWearFile_name,String array_Defined1File, String array_Defined1File_name,
			String array_Defined2File, String array_Defined2File_name,String array_Defined3File, String array_Defined3File_name,
			String ForceXCutSim, String ForceYCutSim, String ForceZCutSim, String TorqueCutSim, String TemperatureCutSim,
			String ChipShapeCutSim, String SurfaceStressCutSim,String ExReToolLife, String ExReWearTimeAndValue, 
			String CutSimDefined1, String CutSimDefined1Value, String CutSimDefined2,
			String CutSimDefined2Value, String CutSimDefined3, String CutSimDefined3Value) {
	
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		
		para.put("id_CuttingSimulation", id_CuttingSimulation);
		para.put("ForceXCutSim", ForceXCutSim);
		para.put("ForceYCutSim", ForceYCutSim);
		para.put("ForceZCutSim", ForceZCutSim);
		para.put("TorqueCutSim", TorqueCutSim);
		para.put("TemperatureCutSim", TemperatureCutSim);
		para.put("ChipShapeCutSim", ChipShapeCutSim);
		para.put("SurfaceStressCutSim", SurfaceStressCutSim);
		para.put("ExReToolLife", ExReToolLife);
		para.put("ExReWearTimeAndValue", ExReWearTimeAndValue);
		para.put("CutSimDefined1", CutSimDefined1);
		para.put("CutSimDefined1Value", CutSimDefined1Value);
		para.put("CutSimDefined2", CutSimDefined2);
		para.put("CutSimDefined2Value", CutSimDefined2Value);
		para.put("CutSimDefined3", CutSimDefined3);
		para.put("CutSimDefined3Value", CutSimDefined3Value);
		
		try {
			if(id_CuttingSimulation != 0){//修改
				cuttingSimulationService.updateCuttingSimulation(para);
			}else{//新增
				
				cuttingSimulationService.saveCuttingSimulation(para);
			}
			
			//清空文件
			cuttingSimulationService.cleanCuttingSimulationResultFileById(para);
			
			
			Map PictureFileCutSim = new HashMap();
			PictureFileCutSim.put("id_CuttingSimulation", id_CuttingSimulation);
			PictureFileCutSim.put("ascription", "PictureFileCutSim");
			
			//保存刀柄图片
			if(array_PictureFileCutSim != null && !"".equals(array_PictureFileCutSim)){
				String array_PictureFileCutSims[] = array_PictureFileCutSim.split(",");
				for(int i=0; i<array_PictureFileCutSims.length; i++){
					if(array_PictureFileCutSims[i] != null && !"".equals(array_PictureFileCutSims[i])){
						PictureFileCutSim.put("url_CuttingSimulationResultFile", array_PictureFileCutSims[i]);
						cuttingSimulationService.saveCuttingSimulationResultFile(PictureFileCutSim);
					}
				}
			}
			
			Map ChipShapePicCutSim = new HashMap();
			ChipShapePicCutSim.put("id_CuttingSimulation", id_CuttingSimulation);
			ChipShapePicCutSim.put("ascription", "ChipShapePicCutSim");
			
			//保存刀柄图片
			if(array_ChipShapePicCutSim != null && !"".equals(array_ChipShapePicCutSim)){
				String array_ChipShapePicCutSims[] = array_ChipShapePicCutSim.split(",");
				for(int i=0; i<array_ChipShapePicCutSims.length; i++){
					if(array_ChipShapePicCutSims[i] != null && !"".equals(array_ChipShapePicCutSims[i])){
						ChipShapePicCutSim.put("url_CuttingSimulationResultFile", array_ChipShapePicCutSims[i]);
						cuttingSimulationService.saveCuttingSimulationResultFile(ChipShapePicCutSim);
					}
				}
			}
			
			Map ExReWearPicture = new HashMap();
			ExReWearPicture.put("id_CuttingSimulation", id_CuttingSimulation);
			ExReWearPicture.put("ascription", "ExReWearPicture");
			
			//保存刀柄图片
			if(array_ExReWearPicture != null && !"".equals(array_ExReWearPicture)){
				String array_ExReWearPictures[] = array_ExReWearPicture.split(",");
				for(int i=0; i<array_ExReWearPictures.length; i++){
					if(array_ExReWearPictures[i] != null && !"".equals(array_ExReWearPictures[i])){
						ExReWearPicture.put("url_CuttingSimulationResultFile", array_ExReWearPictures[i]);
						cuttingSimulationService.saveCuttingSimulationResultFile(ExReWearPicture);
					}
				}
			}
			
			Map ResultFileCutSim = new HashMap();
			ResultFileCutSim.put("id_CuttingSimulation", id_CuttingSimulation);
			ResultFileCutSim.put("ascription", "ResultFileCutSim");
			//保存刀柄图片
			if(array_ResultFileCutSim != null && !"".equals(array_ResultFileCutSim)){
				String array_ResultFileCutSims[] = array_ResultFileCutSim.split(",");
				String array_ResultFileCutSims_name[] = array_ResultFileCutSim_name.split(",");
				for(int i=0; i<array_ResultFileCutSims.length; i++){
					if(array_ResultFileCutSims[i] != null && !"".equals(array_ResultFileCutSims[i])){
						ResultFileCutSim.put("url_CuttingSimulationResultFile", array_ResultFileCutSims[i]);
						ResultFileCutSim.put("name_CuttingSimulationResultFile", array_ResultFileCutSims_name[i]);
						cuttingSimulationService.saveCuttingSimulationResultFile(ResultFileCutSim);
					}
				}
			}
			
			Map ForceFileCutSim = new HashMap();
			ForceFileCutSim.put("id_CuttingSimulation", id_CuttingSimulation);
			ForceFileCutSim.put("ascription", "ForceFileCutSim");
			//保存刀柄图片
			if(array_ForceFileCutSim != null && !"".equals(array_ForceFileCutSim)){
				String array_ForceFileCutSims[] = array_ForceFileCutSim.split(",");
				String array_ForceFileCutSims_name[] = array_ForceFileCutSim_name.split(",");
				for(int i=0; i<array_ForceFileCutSims.length; i++){
					if(array_ForceFileCutSims[i] != null && !"".equals(array_ForceFileCutSims[i])){
						ForceFileCutSim.put("url_CuttingSimulationResultFile", array_ForceFileCutSims[i]);
						ForceFileCutSim.put("name_CuttingSimulationResultFile", array_ForceFileCutSims_name[i]);
						cuttingSimulationService.saveCuttingSimulationResultFile(ForceFileCutSim);
					}
				}
			}
			
			Map TemperatureFileCutSim = new HashMap();
			TemperatureFileCutSim.put("id_CuttingSimulation", id_CuttingSimulation);
			TemperatureFileCutSim.put("ascription", "TemperatureFileCutSim");
			//保存刀柄图片
			if(array_TemperatureFileCutSim != null && !"".equals(array_TemperatureFileCutSim)){
				String array_TemperatureFileCutSims[] = array_TemperatureFileCutSim.split(",");
				String array_TemperatureFileCutSims_name[] = array_TemperatureFileCutSim_name.split(",");
				for(int i=0; i<array_TemperatureFileCutSims.length; i++){
					if(array_TemperatureFileCutSims[i] != null && !"".equals(array_TemperatureFileCutSims[i])){
						TemperatureFileCutSim.put("url_CuttingSimulationResultFile", array_TemperatureFileCutSims[i]);
						TemperatureFileCutSim.put("name_CuttingSimulationResultFile", array_TemperatureFileCutSims_name[i]);
						cuttingSimulationService.saveCuttingSimulationResultFile(TemperatureFileCutSim);
					}
				}
			}
			
			Map SurfaceStressFileCutSim = new HashMap();
			SurfaceStressFileCutSim.put("id_CuttingSimulation", id_CuttingSimulation);
			SurfaceStressFileCutSim.put("ascription", "SurfaceStressFileCutSim");
			//保存刀柄图片
			if(array_SurfaceStressFileCutSim != null && !"".equals(array_SurfaceStressFileCutSim)){
				String array_SurfaceStressFileCutSims[] = array_SurfaceStressFileCutSim.split(",");
				String array_SurfaceStressFileCutSims_name[] = array_SurfaceStressFileCutSim_name.split(",");
				for(int i=0; i<array_SurfaceStressFileCutSims.length; i++){
					if(array_SurfaceStressFileCutSims[i] != null && !"".equals(array_SurfaceStressFileCutSims[i])){
						SurfaceStressFileCutSim.put("url_CuttingSimulationResultFile", array_SurfaceStressFileCutSims[i]);
						SurfaceStressFileCutSim.put("name_CuttingSimulationResultFile", array_SurfaceStressFileCutSims_name[i]);
						cuttingSimulationService.saveCuttingSimulationResultFile(SurfaceStressFileCutSim);
					}
				}
			}
			
			Map ExReWearFile = new HashMap();
			ExReWearFile.put("id_CuttingSimulation", id_CuttingSimulation);
			ExReWearFile.put("ascription", "ExReWearFile");
			//保存刀柄图片
			if(array_ExReWearFile != null && !"".equals(array_ExReWearFile)){
				String array_ExReWearFiles[] = array_ExReWearFile.split(",");
				String array_ExReWearFiles_name[] = array_ExReWearFile_name.split(",");
				for(int i=0; i<array_ExReWearFiles.length; i++){
					if(array_ExReWearFiles[i] != null && !"".equals(array_ExReWearFiles[i])){
						ExReWearFile.put("url_CuttingSimulationResultFile", array_ExReWearFiles[i]);
						ExReWearFile.put("name_CuttingSimulationResultFile", array_ExReWearFiles_name[i]);
						cuttingSimulationService.saveCuttingSimulationResultFile(ExReWearFile);
					}
				}
			}
			
			Map Defined1File = new HashMap();
			Defined1File.put("id_CuttingSimulation", id_CuttingSimulation);
			Defined1File.put("ascription", "Defined1File");
			//保存刀柄图片
			if(array_Defined1File != null && !"".equals(array_Defined1File)){
				String array_Defined1Files[] = array_Defined1File.split(",");
				String array_Defined1Files_name[] = array_Defined1File_name.split(",");
				for(int i=0; i<array_Defined1Files.length; i++){
					if(array_Defined1Files[i] != null && !"".equals(array_Defined1Files[i])){
						Defined1File.put("url_CuttingSimulationResultFile", array_Defined1Files[i]);
						Defined1File.put("name_CuttingSimulationResultFile", array_Defined1Files_name[i]);
						cuttingSimulationService.saveCuttingSimulationResultFile(Defined1File);
					}
				}
			}
			
			Map Defined2File = new HashMap();
			Defined2File.put("id_CuttingSimulation", id_CuttingSimulation);
			Defined2File.put("ascription", "Defined2File");
			//保存刀柄图片
			if(array_Defined2File != null && !"".equals(array_Defined2File)){
				String array_Defined2Files[] = array_Defined2File.split(",");
				String array_Defined2Files_name[] = array_Defined2File_name.split(",");
				for(int i=0; i<array_Defined2Files.length; i++){
					if(array_Defined2Files[i] != null && !"".equals(array_Defined2Files[i])){
						Defined2File.put("url_CuttingSimulationResultFile", array_Defined2Files[i]);
						Defined2File.put("name_CuttingSimulationResultFile", array_Defined2Files_name[i]);
						cuttingSimulationService.saveCuttingSimulationResultFile(Defined2File);
					}
				}
			}
			
			Map Defined3File = new HashMap();
			Defined3File.put("id_CuttingSimulation", id_CuttingSimulation);
			Defined3File.put("ascription", "Defined3File");
			//保存刀柄图片
			if(array_Defined3File != null && !"".equals(array_Defined3File)){
				String array_Defined3Files[] = array_Defined3File.split(",");
				String array_Defined3Files_name[] = array_Defined3File_name.split(",");
				for(int i=0; i<array_Defined3Files.length; i++){
					if(array_Defined3Files[i] != null && !"".equals(array_Defined3Files[i])){
						Defined3File.put("url_CuttingSimulationResultFile", array_Defined3Files[i]);
						Defined3File.put("name_CuttingSimulationResultFile", array_Defined3Files_name[i]);
						cuttingSimulationService.saveCuttingSimulationResultFile(Defined3File);
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
	
	
}
