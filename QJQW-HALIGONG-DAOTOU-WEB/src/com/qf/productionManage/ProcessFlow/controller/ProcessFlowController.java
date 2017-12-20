package com.qf.productionManage.ProcessFlow.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.qf.productionManage.ProcessPart.service.ProcessPartService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;
import com.alibaba.fastjson.JSONObject;
import com.qf.CuttingFluid.CuttingFluidMaterial.service.CuttingFluidMaterialService;
import com.qf.productionManage.FixturePart.service.FixturePartService;
import com.qf.productionManage.ProcessFlow.service.ProcessFlowService;

@Controller
@RequestMapping("/ProcessFlow")
public class ProcessFlowController extends BaseController {

	
	@Resource(name="ProcessFlowService")
	private ProcessFlowService ProcessFlowService;
	
	@Resource(name = "CuttingFluidMaterialService")
	private CuttingFluidMaterialService cuttingFluidMaterialService;
	
	@Resource(name = "FixturePartService")
	private FixturePartService fixturePartService;
	
	@Resource(name = "processPartService")
	private ProcessPartService processPartService;
	
	//列表
	@RequestMapping("/ProcessFlowList")
	public ModelAndView ProcessFlowList(Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= ProcessFlowService.queryProcessFlowList(page);//查询零件页面
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
			}
			mv.addObject("ProcessFlow", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName("/WEB-INF/productionManage/ProcessFlow/ProcessFlow_List");
		return mv;
	}
	
	//去添加页面
	@RequestMapping(value="/goAddProcessFlow")
	public ModelAndView goAddProcessFlow(String id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
			
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
			
			ProcessFlow.put("PicturePartProcessFlow", PicturePartProcessFlow);
			mv.addObject("array_PicturePartProcessFlow", array_PicturePartProcessFlow);
			
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
			mv.addObject("WorkingProcedureNum", j);
			ProcessFlow.put("WorkingProcedureList", WorkingProcedureList);
			
		}
		
		mv.setViewName("/WEB-INF/productionManage/ProcessFlow/ProcessFlow_edit");
		mv.addObject("turn_url", turn_url);
		mv.addObject("ProcessFlow", ProcessFlow);
		
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	
	/*
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("saveProcessFlow")
	public Object saveProcessFlow(@RequestBody Map form){
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		
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
			System.out.println("工序："+WorkingProcedure);
			ProcessFlowService.cleanWorkingProcedure(Integer.parseInt(""+form.get("id_ProcessFlow")));	
			
			ProcessFlowService.saveWorkingProcedure(WorkingProcedure,Integer.parseInt(""+form.get("id_ProcessFlow")));	
			}else{
				return 0;
			}
		}catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 1;
	}
	
	
	
	//保存图片
	@ResponseBody
	@RequestMapping(value="/savePictureProcessFlow")
	public Object savePictureProcessFlow(
			@RequestParam("PictureProcessFlow") MultipartFile PictureProcessFlow,
			HttpServletRequest request ) throws Exception{
		
		Map<String,String> data = new HashMap<String, String>();
		String url = null;
		String OriginalFilename = PictureProcessFlow.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/PictureProcessFlow/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			PictureProcessFlow.transferTo(materials_big_img_file); 
			url = "/PictureProcessFlow/" + big_url + "." + fileSuffix;
			data.put("url", url);
		}else{
			
		}
		return data;
		
	}
	
	//保存图片
	@ResponseBody
	@RequestMapping(value="/savePicturePartProcessFlow")
	public Object savePicturePartProcessFlow(
			@RequestParam("PicturePartProcessFlow") MultipartFile PicturePartProcessFlow,
			HttpServletRequest request ) throws Exception{
		
		String url = null;
		String OriginalFilename = PicturePartProcessFlow.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/PicturePartProcessFlow/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			PicturePartProcessFlow.transferTo(materials_big_img_file); 
			url = "/PicturePartProcessFlow/" + big_url + "." + fileSuffix;
		}else{

		}
		return url;
		
	}
	
	//删除
	@ResponseBody
	@RequestMapping("deleteProcessFlowList")
	public String deleteProcessFlowList(String id_ProcessFlow){
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
			return "0";
		}	
		return "1";
	}
	
	
	//加载各种
	@RequestMapping("jzAll")
	public ModelAndView jzAll(@RequestParam(value="deputy") int deputy, int gxId, Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		page.setPd(pd);
		List<Map> list = new ArrayList<Map>();
		System.out.println(gxId);
		mv.addObject("gxId", gxId);
		if(deputy==1){
			Map map	= cuttingFluidMaterialService.queryCuttingFluidMaterialList(page);//查询机床节点信息页面
			list = (List<Map>)map.get("list");
			page = (Page)map.get("page");
			mv.addObject("cuttingFluidMaterialList", list);
			mv.addObject("pd", pd);
			//查询材料类别列表
			List<Map> CategoryCuttingFluidMaterialList = cuttingFluidMaterialService.queryCategoryCuttingFluidMaterialList();
			mv.addObject("CategoryCuttingFluidMaterialList", CategoryCuttingFluidMaterialList);
			mv.setViewName("/WEB-INF/productionManage/ProcessFlow/CuttingFluidMaterial_loading");
			mv.addObject("page", page);
		}
		if(deputy==2){
			Map map	= fixturePartService.queryFixturePartList(page);//查询零件页面
			list = (List<Map>)map.get("list");
			page = (Page)map.get("page");
			mv.addObject("FixturePart", list);
			
			List<Map> CategoryTypeFixturePart = fixturePartService.queryCategoryTypeFixturePartList();
			mv.addObject("CategoryTypeFixturePart", CategoryTypeFixturePart);
			
			mv.addObject("pd", pd);
			mv.addObject("page", page);
			mv.setViewName("/WEB-INF/productionManage/ProcessFlow/FixturePart_loading");
		}
		if(deputy==3){
			Map map	= processPartService.queryProcessPartList(page);//查询工件材料列表
			list = (List<Map>)map.get("list");
			page = (Page)map.get("page");
			mv.addObject("ProcessPart", list);
			
			//查询材料类别列表
			List<Map> CategoryTypeProcessPart = processPartService.queryCategoryTypeProcessPartList();
			mv.addObject("CategoryTypeProcessPart", CategoryTypeProcessPart);
			
			List<Map> CategoryIndustryProcessPart = processPartService.queryCategoryIndustryProcessPartList();
			mv.addObject("CategoryIndustryProcessPart", CategoryIndustryProcessPart);
			
			mv.addObject("pd", pd);
			mv.addObject("page", page);
			mv.setViewName("/WEB-INF/productionManage/ProcessFlow/ProcessPart_loading");
		}
		return mv;
	}
		
	
}
