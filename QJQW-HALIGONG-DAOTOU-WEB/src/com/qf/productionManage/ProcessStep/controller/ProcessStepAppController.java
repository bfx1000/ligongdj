package com.qf.productionManage.ProcessStep.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.qf.productionManage.ProcessStep.service.ProcessStepService;
import com.qf.util.PageData;
import com.qf.util.common.JackJson;
import com.qf.util.file.ByteToFile;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/ProcessStepApp")
public class ProcessStepAppController {

	@Resource(name = "ProcessStepService")
	private ProcessStepService processStepService;
	
	
	//列表
	@ResponseBody
	@RequestMapping(value = "/ProcessStepList",produces = "application/json; charset=utf-8")
	public String ProcessStepList(int pageNo, int pageSize, String NoProcedureProcessFlow,
			 String NoProcessStep, String MachiningTypeProcessStep, String MachiningLevelProcessStep,
			 String NameProcessStep,String ContentProcessStep){
		ModelAndView mv=new ModelAndView();
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		try{
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("NoProcedureProcessFlow", NoProcedureProcessFlow);
			pd.put("NoProcessStep", NoProcessStep);
			pd.put("MachiningTypeProcessStep", MachiningTypeProcessStep);
			pd.put("MachiningLevelProcessStep", MachiningLevelProcessStep);
			pd.put("NameProcessStep", NameProcessStep);
			pd.put("ContentProcessStep", ContentProcessStep);
			
			if(NoProcedureProcessFlow!=null && !"".equals(NoProcedureProcessFlow)){
				/*
				 * 此if用来判断编号是否为空，不为空继续、为空直接返回页面，并提示用户输入编号
				 */
				Map WorkingProcedure = processStepService.queryWorkingProcedureList(NoProcedureProcessFlow);   //通过工序编号查找工序记录
				
				if(WorkingProcedure!=null && WorkingProcedure.size()>0){
					/*
					 * 此if用来判断编号是否正确。正确继续。不正确返回页面并提示。
					 */
					String id_ProcessFlow = ""+WorkingProcedure.get("id_ProcessFlow");	//通过工序记录获得工序ID
					Map ProcessFlow = processStepService.queryProcessFlowList(id_ProcessFlow);	//通过工序ID查找工艺流程记录
					
					String id_WorkingProcedure = ""+WorkingProcedure.get("id_WorkingProcedure");	//通过工序记录获得工序ID
					pd.put("id_WorkingProcedure", id_WorkingProcedure);	//将工序ID存入pageData中
					
					page.setPd(pd);
					map	= processStepService.queryProcessStepList(page);//查询工步信息
					page = (Page)map.get("page");
					List<Map> list = (List<Map>)map.get("list");	//工步List<Map>
					if(list != null && list.size() > 0){
						for(int i = 0; i < list.size(); i++){
							Map ProcessStep = list.get(i);
							int id_ProcessStep = (int) ProcessStep.get("id_ProcessStep");
							
							Map para = new HashMap();
							para.put("id_ProcessStep", id_ProcessStep);
							
							//查询图片列表 
							List<Map> PictureProcessStep = processStepService.queryPictureProcessStepList(para);
							
							ProcessStep.put("PictureProcessStep", PictureProcessStep);
							list.set(i, ProcessStep);
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
					
					resultmap.put("result", "1");
					resultmap.put("erro", "查询成功！");
					resultmap.put("ProcessFlow", ProcessFlow);
					resultmap.put("WorkingProcedure", WorkingProcedure);
					resultmap.put("ProcessStep", list);
				}
				else{  //编号不正确时！
					System.out.println("输入的编号有误");
					resultmap.put("result", "1");
					resultmap.put("erro", "输入的工序编号不存在！请重新输入！");
				}
			}
			else{   //编号为空时！
				System.out.println("请输入编号！");
				resultmap.put("result", "1");
				resultmap.put("erro","请输入编号！");
			}
		}catch (Exception e) {
			e.printStackTrace();
			resultmap.put("result", "0");
			resultmap.put("erro", "查询失败！");
		}
		
		Map para = new HashMap();
		para.put("NoProcedureProcessFlow", NoProcedureProcessFlow);
		para.put("NoProcessStep", NoProcessStep);
		para.put("MachiningTypeProcessStep", MachiningTypeProcessStep);
		para.put("MachiningLevelProcessStep", MachiningLevelProcessStep);
		para.put("NameProcessStep", NameProcessStep);
		para.put("ContentProcessStep", ContentProcessStep);
		
		resultmap.put("para",para);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
		
		
		
		
	}
	
	
	/** 
	 * 去添加
	 */
	
	@ResponseBody
	@RequestMapping(value="/goAddProcessStep" ,produces = "application/json; charset=utf-8")
	public String goAddProcessStep(String id, String NoProcedureProcessFlow)throws Exception{
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		if(NoProcedureProcessFlow!=null && !"".equals(NoProcedureProcessFlow)){
			
			Map WorkingProcedure = processStepService.queryWorkingProcedureList(NoProcedureProcessFlow);  	 //通过工序编号查找工序记录
			resultmap.put("WorkingProcedure", WorkingProcedure);
			
			if(WorkingProcedure!=null && WorkingProcedure.size()>0){
				String id_ProcessFlow = ""+WorkingProcedure.get("id_ProcessFlow");	//通过工序记录获得工序ID
				
				Map ProcessFlow = processStepService.queryProcessFlowList(id_ProcessFlow);					//通过工序ID查找工艺流程记录
				resultmap.put("ProcessFlow", ProcessFlow);
			}
		}
		Map para = new HashMap();
		para.put("id_ProcessStep", id);
		Map ProcessStep = processStepService.queryProcessStepListById(para);//查询标准机床
		if(ProcessStep != null){
			
			//查询材料图片列表 PictureMaterial
			List<Map> PictureProcessStep = processStepService.queryPictureProcessStepList(para);
			String array_PictureProcessStep = "";
			if(PictureProcessStep != null && PictureProcessStep.size() > 0){
				for(int i = 0; i < PictureProcessStep.size(); i++){
					array_PictureProcessStep = array_PictureProcessStep + PictureProcessStep.get(i).get("url_PictureProcessStep") + ",";
				}
			}
			ProcessStep.put("PictureProcessStep", PictureProcessStep);
			
			resultmap.put("result", "1");
			resultmap.put("array_PictureProcessStep", array_PictureProcessStep);
			
		}
		resultmap.put("ProcessStep", ProcessStep);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	/**
	 * 添加/修改
	 */
	
	@ResponseBody
	@RequestMapping(value = "/saveProcessStep", produces = "application/json; charset=utf-8")
	public String saveProcessStep(String user_id, 
			String array_PictureProcessStep, 
			int id_ProcessStep, int id_WorkingProcedure, String NoProcessStep, String MachiningTypeProcessStep, String MachiningLevelProcessStep, 
			String NameProcessStep, String ContentProcessStep, String MeasureProcessStep, String ToolHolderProcessStep, String ToolbladeProcessStep,
			String ToolMaterialProcessStep, String CutterProcessStep, String CutterSpeedProcessStep, String SpindlespeedProcessStep, String FeedProcessStep,
			String FeedSpeedProcessStep, String CuttingDepthProcessStep, String CuttingWidthProcessStep, String TimeMachiningProcessStep, String TimeAssistProcessStep,
			String RemarkProcessStep, String DeviceProcessStep, String FixtureProcessStep, String CuttingFluidProcessStep
			) {
	
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		
		para.put("id_ProcessStep", id_ProcessStep);
		para.put("id_WorkingProcedure", id_WorkingProcedure);
		para.put("NoProcessStep", NoProcessStep);
		para.put("MachiningTypeProcessStep", MachiningTypeProcessStep);
		para.put("MachiningLevelProcessStep", MachiningLevelProcessStep);
		para.put("NameProcessStep", NameProcessStep);
		para.put("ContentProcessStep", ContentProcessStep);
		para.put("MeasureProcessStep", MeasureProcessStep);
		para.put("ToolHolderProcessStep", ToolHolderProcessStep);
		para.put("ToolbladeProcessStep", ToolbladeProcessStep);
		para.put("ToolMaterialProcessStep", ToolMaterialProcessStep);
		para.put("CutterProcessStep", CutterProcessStep);
		para.put("CutterSpeedProcessStep", CutterSpeedProcessStep);
		para.put("SpindlespeedProcessStep", SpindlespeedProcessStep);
		para.put("FeedProcessStep", FeedProcessStep);
		para.put("FeedSpeedProcessStep", FeedSpeedProcessStep);
		para.put("CuttingDepthProcessStep", CuttingDepthProcessStep);
		para.put("CuttingWidthProcessStep", CuttingWidthProcessStep);
		para.put("TimeMachiningProcessStep", TimeMachiningProcessStep);
		para.put("TimeAssistProcessStep", TimeAssistProcessStep);
		para.put("RemarkProcessStep", RemarkProcessStep);
		para.put("DeviceProcessStep", DeviceProcessStep);
		para.put("FixtureProcessStep", FixtureProcessStep);
		para.put("CuttingFluidProcessStep", CuttingFluidProcessStep);
		
		try {
			if(id_ProcessStep != 0){//修改
				processStepService.updateProcessStep(para);
			}else{//新增
				processStepService.saveProcessStep(para);
			}
			//先清空文件表中该ID的文件
			processStepService.clearPictureProcessStep(para);
			//保存详细信息
			if(array_PictureProcessStep != null && !"".equals(array_PictureProcessStep)){
				String array_PictureProcessSteps[] = array_PictureProcessStep.split(",");
				
				for(int i=0; i<array_PictureProcessSteps.length; i++){
					if(array_PictureProcessSteps[i] != null && !"".equals(array_PictureProcessSteps[i])){
						para.put("url_PictureProcessStep", array_PictureProcessSteps[i]);
						processStepService.savePictureProcessStep(para);
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
	
	
	/**
	 * 保存图片
	 */
	
	@ResponseBody
	@RequestMapping(value="/savePictureProcessStep", produces = "application/json; charset=utf-8")
	public String savePictureProcessStep(
			String PictureProcessStep ,String fileSuffix, String filename) throws Exception{
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		String json  = "";  
		Map resultmap = new HashMap();
		String url = null;
		if(PictureProcessStep != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/PictureProcessStep/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/PictureProcessStep/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PictureProcessStep,  filepath2);
			url = "/PictureProcessStep/" + big_url + "." + fileSuffix;
		}
		resultmap.put("result", "1");
		
		resultmap.put("url", url);
		
		json = JackJson.fromObjectToJson(resultmap);
		
		return json;
	}
	
	/**
	 * 删除标准机床信息
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteProcessStepList", produces = "application/json; charset=utf-8")
	public String deleteProcessStepList(String id_ProcessStep) {
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		para.put("id_ProcessStep", id_ProcessStep);
		try {
			processStepService.deleteProcessStepList(para);
			
			processStepService.clearPictureProcessStep(para);
			
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
