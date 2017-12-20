package com.qf.productionManage.ProcessFlow.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.qf.CuttingFluid.CuttingFluidMaterial.service.CuttingFluidMaterialService;
import com.qf.productionManage.FixturePart.service.FixturePartService;
import com.qf.productionManage.ProcessFlow.service.ProcessFlowService;
import com.qf.productionManage.ProcessPart.service.ProcessPartService;
import com.qf.util.PageData;
import com.qf.util.common.JackJson;
import com.qf.util.file.ByteToFile;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/ProcessFlowApp")
public class ProcessFlowAppController {

	@Resource(name="ProcessFlowService")
	private ProcessFlowService ProcessFlowService;
	
	@Resource(name = "CuttingFluidMaterialService")
	private CuttingFluidMaterialService cuttingFluidMaterialService;
	
	@Resource(name = "FixturePartService")
	private FixturePartService fixturePartService;
	
	@Resource(name = "processPartService")
	private ProcessPartService processPartService;
	
	//列表
	@ResponseBody
	@RequestMapping(value = "/ProcessFlowList",produces = "application/json; charset=utf-8")
	public String FixturePartList(int pageNo, int pageSize,
			 String NoProcessFlow, String CompanyProcessFlow, String NameProcessFlow,
			 String PartNameProcessFlow,String PartNumberProcessFlow){
		ModelAndView mv=new ModelAndView();
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		try{
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("NoProcessFlow", NoProcessFlow);
			pd.put("CompanyProcessFlow", CompanyProcessFlow);
			pd.put("NameProcessFlow", NameProcessFlow);
			pd.put("PartNameProcessFlow", PartNameProcessFlow);
			pd.put("PartNumberProcessFlow", PartNumberProcessFlow);
			
			page.setPd(pd);
			map	= ProcessFlowService.queryProcessFlowList(page);//查询零件页面
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			if(list != null && list.size() > 0){
				for(int i = 0; i < list.size(); i++){
					Map ProcessFlow = list.get(i);
					int id_ProcessFlow = (int) ProcessFlow.get("id_ProcessFlow");
					
					Map para = new HashMap();
					para.put("id_ProcessFlow", id_ProcessFlow);
					
					//查询图片列表 
					List<Map> PicturePartProcessFlow = ProcessFlowService.queryPicturePartProcessFlowList(para);
					ProcessFlow.put("PicturePartProcessFlow", PicturePartProcessFlow);
					
					//查询工序
					List<Map> WorkingProcedureList = ProcessFlowService.queryWorkingProcedureList(para);
					if(WorkingProcedureList!=null && WorkingProcedureList.size()>0){
						for(int j = 0;j<WorkingProcedureList.size();j++){
							Map WorkingProcedure = WorkingProcedureList.get(j);
							int id_WorkingProcedure = (int) WorkingProcedure.get("id_WorkingProcedure");
							Map para1 = new HashMap();
							para1.put("id_WorkingProcedure", id_WorkingProcedure);
							
							//查询工序图片列表 
							List<Map> PictureProcessFlow = ProcessFlowService.queryProcessFlowServiceList(para1);
							WorkingProcedure.put("PictureProcessFlow", PictureProcessFlow);
							
							WorkingProcedureList.set(j, WorkingProcedure);
						}
					}
					
					ProcessFlow.put("WorkingProcedureList", WorkingProcedureList);
					
					list.set(i, ProcessFlow);
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
			resultmap.put("list", list);
		}catch (Exception e) {
			e.printStackTrace();
			resultmap.put("result", "0");
		}
		Map para = new HashMap();
		para.put("NoProcessFlow", NoProcessFlow);
		para.put("CompanyProcessFlow", CompanyProcessFlow);
		para.put("NameProcessFlow", NameProcessFlow);
		para.put("PartNameProcessFlow", PartNameProcessFlow);
		para.put("PartNumberProcessFlow", PartNumberProcessFlow);
		resultmap.put("para",para);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	/** 
	 * 去添加
	 */
	@ResponseBody
	@RequestMapping(value="/goAddProcessFlow" ,produces = "application/json; charset=utf-8")
	public String goAddProcessFlow(String id)throws Exception{
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		Map para = new HashMap();
		para.put("id_ProcessFlow", id);
		Map ProcessFlow = ProcessFlowService.queryProcessFlowListById(para);//查询标准机床
		if(ProcessFlow != null){
			
			//查询材料图片列表 PictureMaterial
			List<Map> PicturePartProcessFlow = ProcessFlowService.queryPicturePartProcessFlowList(para);
			String array_PicturePartProcessFlow = "";
			if(PicturePartProcessFlow != null && PicturePartProcessFlow.size() > 0){
				for(int i = 0; i < PicturePartProcessFlow.size(); i++){
					array_PicturePartProcessFlow = array_PicturePartProcessFlow + PicturePartProcessFlow.get(i).get("url_PicturePartProcessFlow") + ",";
				}
			}
			
			//查询工序
			List<Map> WorkingProcedureList = ProcessFlowService.queryWorkingProcedureList(para);
			int j = 0 ;
			if(WorkingProcedureList!=null && WorkingProcedureList.size()>0){
				for(j = 0;j<WorkingProcedureList.size();j++){
					Map WorkingProcedure = WorkingProcedureList.get(j);
					int id_WorkingProcedure = (int) WorkingProcedure.get("id_WorkingProcedure");
					Map para1 = new HashMap();
					para1.put("id_WorkingProcedure", id_WorkingProcedure);
					
					//查询工序图片列表 
					List<Map> PictureProcessFlow = ProcessFlowService.queryProcessFlowServiceList(para1);
					WorkingProcedure.put("PictureProcessFlow", PictureProcessFlow);
					
					WorkingProcedureList.set(j, WorkingProcedure);
				}
			}
			
			ProcessFlow.put("WorkingProcedureList", WorkingProcedureList);
			ProcessFlow.put("PicturePartProcessFlow", PicturePartProcessFlow);
			
			resultmap.put("result", "1");
			resultmap.put("WorkingProcedureNum", j);
			resultmap.put("array_PicturePartProcessFlow", array_PicturePartProcessFlow);
			
		}
		
		resultmap.put("ProcessFlow", ProcessFlow);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	/**
	 * 添加/修改
	 */
	
	@ResponseBody
	@RequestMapping(value = "/saveProcessFlow", produces = "application/json; charset=utf-8")
	public String saveProcessFlow(@RequestBody Map form) {
	
		String json  = "";  
		Map resultmap = new HashMap();
		
		int id_ProcessFlow = 0;
		
		try{
			if(form!=null){
				id_ProcessFlow = Integer.parseInt(""+form.get("id_ProcessFlow"));
				if(id_ProcessFlow!=0){
					ProcessFlowService.updataProcessFlow(form);			//修改基本信息
				}else{
					ProcessFlowService.saveProcessFlow(form);			//保存基本信息
				}
				
				//清空图片
				ProcessFlowService.clearPicturePartProcessFlow(form);
				//保存详细信息
				String array_PicturePartProcessFlow = ""+form.get("array_PicturePartProcessFlow");
				if(array_PicturePartProcessFlow != null && !"".equals(array_PicturePartProcessFlow)){
					String array_PicturePartProcessFlows[] = array_PicturePartProcessFlow.split(",");
					
					for(int i=0; i<array_PicturePartProcessFlows.length; i++){
						if(array_PicturePartProcessFlows[i] != null && !"".equals(array_PicturePartProcessFlows[i])){
							form.put("url_PicturePartProcessFlow", array_PicturePartProcessFlows[i]);
							ProcessFlowService.savePicturePartProcessFlow(form);
						}
					}
				}
				
				String WorkingProcedure_json = (String) form.get("WorkingProcedure");   //取到工序的json
				
				List<Map> WorkingProcedure = new ArrayList<Map>();
				WorkingProcedure = JSONObject.parseArray(WorkingProcedure_json, Map.class);   //将Json转换成List<map>
				
				ProcessFlowService.cleanWorkingProcedure(Integer.parseInt(""+form.get("id_ProcessFlow")));	
				
				ProcessFlowService.saveWorkingProcedure(WorkingProcedure,Integer.parseInt(""+form.get("id_ProcessFlow")));	
			}
			else{
				resultmap.put("result", "0");
				resultmap.put("msg", "操作失败");
				json = JackJson.fromObjectToJson(resultmap);
				return json;
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
	@RequestMapping(value="/savePictureProcessFlow", produces = "application/json; charset=utf-8")
	public String savePictureProcessFlow(
			String PictureProcessFlow ,String fileSuffix, String filename) throws Exception{
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		String json  = "";  
		Map resultmap = new HashMap();
		String url = null;
		if(PictureProcessFlow != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/PictureProcessFlow/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/PictureProcessFlow/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PictureProcessFlow,  filepath2);
			url = "/PictureProcessFlow/" + big_url + "." + fileSuffix;
		}
				
		resultmap.put("result", "1");
		
		resultmap.put("url", url);
		
		json = JackJson.fromObjectToJson(resultmap);
		
		return json;
	}
	
	/**
	 * 保存图片
	 */
	
	@ResponseBody
	@RequestMapping(value="/savePicturePartProcessFlow", produces = "application/json; charset=utf-8")
	public String savePicturePartProcessFlow(
			String PicturePartProcessFlow ,String fileSuffix, String filename) throws Exception{
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		String json  = "";  
		Map resultmap = new HashMap();
		String url = null;
		if(PicturePartProcessFlow != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/PicturePartProcessFlow/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/PicturePartProcessFlow/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PicturePartProcessFlow,  filepath2);
			url = "/PicturePartProcessFlow/" + big_url + "." + fileSuffix;
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
	@RequestMapping(value = "/deleteProcessFlowList", produces = "application/json; charset=utf-8")
	public String deleteProcessFlowList(String id_ProcessFlow) {
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		para.put("id_ProcessFlow", id_ProcessFlow);
		try {
			ProcessFlowService.deleteProcessFlowList(para);
			
			ProcessFlowService.cleanPicturePartProcessFlow(para);
			
			List<Map> WorkingProcedureList = ProcessFlowService.queryWorkingProcedureList(para);
			if(WorkingProcedureList!=null && WorkingProcedureList.size()>0){
				for(int j = 0;j<WorkingProcedureList.size();j++){
					Map WorkingProcedure = WorkingProcedureList.get(j);
					int id_WorkingProcedure = (int) WorkingProcedure.get("id_WorkingProcedure");
					Map para1 = new HashMap();
					para1.put("id_WorkingProcedure", id_WorkingProcedure);
					
					ProcessFlowService.cleanPictureProcessFlow(para1);
				}
			}
			ProcessFlowService.deleteWorkingProcedure(para);
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
	
	//加载各种
	@ResponseBody
	@RequestMapping(value= "jzAll", produces = "application/json; charset=utf-8")
	public String jzAll(@RequestParam(value="deputy") int deputy, int pageNo, int pageSize, String NameCuttingFluid, String NumberCuttingFluid, 
			String CategoryCuttingFluid, String CompanyCuttingFluid, String NameFixturePart, String NumberFixturePart, String TypeFixturePart,
			 String MachineFixturePart, String ProcessPartFixturePart, String NameProcessPart, String NumberProcessPart, String TypeProcessPart,
			 String AssemblyProcessPart,String NoAssemblyProcessPart){
		
		String json  = "";  
		Map resultmap = new HashMap();
		Page page = new Page(pageNo, pageSize);
		PageData pd = new PageData();
		
		List<Map> list = new ArrayList<Map>();
		if(deputy==1){
			pd.put("NameCuttingFluid", NameCuttingFluid);
			pd.put("NumberCuttingFluid", NumberCuttingFluid);
			pd.put("CategoryCuttingFluid", CategoryCuttingFluid);
			pd.put("CompanyCuttingFluid", CompanyCuttingFluid);
			page.setPd(pd);
			Map map	= cuttingFluidMaterialService.queryCuttingFluidMaterialList(page);//查询切削液
			list = (List<Map>)map.get("list");
			page = (Page)map.get("page");
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
			resultmap.put("result", "1");
			resultmap.put("list", list);
			//查询类别列表
			List<Map> CategoryCuttingFluidMaterialList = cuttingFluidMaterialService.queryCategoryCuttingFluidMaterialList();
			resultmap.put("CategoryCuttingFluidMaterialList", CategoryCuttingFluidMaterialList);
			
			Map para = new HashMap();
			para.put("NameCuttingFluid", NameCuttingFluid);
			para.put("NumberCuttingFluid", NumberCuttingFluid);
			para.put("CategoryCuttingFluid", CategoryCuttingFluid);
			para.put("CompanyCuttingFluid", CompanyCuttingFluid);
			resultmap.put("para",para);
			
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		if(deputy==2){
			pd.put("NameFixturePart", NameFixturePart);
			pd.put("NumberFixturePart", NumberFixturePart);
			pd.put("TypeFixturePart", TypeFixturePart);
			pd.put("MachineFixturePart", MachineFixturePart);
			pd.put("ProcessPartFixturePart", ProcessPartFixturePart);
			page.setPd(pd);
			Map map	= fixturePartService.queryFixturePartList(page);//查询零件页面
			list = (List<Map>)map.get("list");
			page = (Page)map.get("page");
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
			resultmap.put("result", "1");
			resultmap.put("list", list);
			
			List<Map> CategoryCuttingFluidMaterialList = cuttingFluidMaterialService.queryCategoryCuttingFluidMaterialList();
			resultmap.put("CategoryCuttingFluidMaterialList", CategoryCuttingFluidMaterialList);
			
			Map para = new HashMap();
			para.put("NameFixturePart", NameFixturePart);
			para.put("NumberFixturePart", NumberFixturePart);
			para.put("TypeFixturePart", TypeFixturePart);
			para.put("MachineFixturePart", MachineFixturePart);
			para.put("ProcessPartFixturePart", ProcessPartFixturePart);
			resultmap.put("para",para);
			
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		if(deputy==3){
			pd.put("NameProcessPart", NameProcessPart);
			pd.put("NumberProcessPart", NumberProcessPart);
			pd.put("TypeProcessPart", TypeProcessPart);
			pd.put("AssemblyProcessPart", AssemblyProcessPart);
			pd.put("NoAssemblyProcessPart", NoAssemblyProcessPart);
			page.setPd(pd);
			Map map	= processPartService.queryProcessPartList(page);//查询工件材料列表
			list = (List<Map>)map.get("list");
			page = (Page)map.get("page");
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
			resultmap.put("result", "1");
			resultmap.put("list", list);
			
			List<Map> CategoryTypeProcessPart = processPartService.queryCategoryTypeProcessPartList();
			resultmap.put("CategoryTypeProcessPart", CategoryTypeProcessPart);
			
			List<Map> CategoryIndustryProcessPart = processPartService.queryCategoryIndustryProcessPartList();
			resultmap.put("CategoryIndustryProcessPart", CategoryIndustryProcessPart);
			
			Map para = new HashMap();
			para.put("NameProcessPart", NameProcessPart);
			para.put("NumberProcessPart", NumberProcessPart);
			para.put("TypeProcessPart", TypeProcessPart);
			para.put("AssemblyProcessPart", AssemblyProcessPart);
			para.put("NoAssemblyProcessPart", NoAssemblyProcessPart);
			resultmap.put("para",para);
			
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		
		return null;
	}
	
}
