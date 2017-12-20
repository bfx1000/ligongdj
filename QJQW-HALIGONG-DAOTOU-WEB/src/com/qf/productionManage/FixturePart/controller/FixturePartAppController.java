package com.qf.productionManage.FixturePart.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.qf.machineTool.machineNodeInform.sercice.machineNodeInformService;
import com.qf.productionManage.FixturePart.service.FixturePartService;
import com.qf.productionManage.ProcessPart.service.ProcessPartService;
import com.qf.util.PageData;
import com.qf.util.common.JackJson;
import com.qf.util.file.ByteToFile;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/FixturePartApp")
public class FixturePartAppController {

	@Resource(name = "FixturePartService")
	private FixturePartService fixturePartService;
	
	//加工零件
	@Resource(name = "processPartService")
	private ProcessPartService processPartService;
	
	//机床节点
	@Resource(name = "machineNodeInformService")
	private machineNodeInformService machineNodeInformService;
	
	
	//列表
	@ResponseBody
	@RequestMapping(value = "/FixturePartList",produces = "application/json; charset=utf-8")
	public String FixturePartList(int pageNo, int pageSize,
			 String NameFixturePart, String NumberFixturePart, String TypeFixturePart,
			 String MachineFixturePart,String ProcessPartFixturePart){
		ModelAndView mv=new ModelAndView();
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		try{
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("NameFixturePart", NameFixturePart);
			pd.put("NumberFixturePart", NumberFixturePart);
			pd.put("TypeFixturePart", TypeFixturePart);
			pd.put("MachineFixturePart", MachineFixturePart);
			pd.put("ProcessPartFixturePart", ProcessPartFixturePart);
			
			page.setPd(pd);
			map	= fixturePartService.queryFixturePartList(page);//查询零件页面
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			if(list != null && list.size() > 0){
				for(int i = 0; i < list.size(); i++){
					Map FixturePart = list.get(i);
					int id_FixturePart = (int) FixturePart.get("id_FixturePart");
					
					Map para = new HashMap();
					para.put("id_FixturePart", id_FixturePart);
					
					//查询图片列表 
					para.put("ascription", "PictureFixturePart");
					List<Map> PictureFixturePart = fixturePartService.queryPictureFixturePartList(para);
					//查询详细信息列表
					para.put("ascription", "InformFixturePart");
					List<Map> InformFixturePart = fixturePartService.queryInformFixturePartList(para);
					//part文件
					para.put("ascription", "PartFixturePart");
					List<Map> PartFixturePart = fixturePartService.queryPartFixturePartList(para);
					
					FixturePart.put("PictureFixturePart", PictureFixturePart);
					FixturePart.put("InformFixturePart", InformFixturePart);
					FixturePart.put("PartFixturePart", PartFixturePart);
					list.set(i, FixturePart);
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
			
			List<Map> CategoryTypeFixturePart = fixturePartService.queryCategoryTypeFixturePartList();
			resultmap.put("CategoryTypeFixturePart", CategoryTypeFixturePart);
			
			resultmap.put("result", "1");
			resultmap.put("list", list);
		}catch (Exception e) {
			e.printStackTrace();
			resultmap.put("result", "0");
		}
		Map para = new HashMap();
		para.put("NameFixturePart", NameFixturePart);
		para.put("NumberFixturePart", NumberFixturePart);
		para.put("TypeFixturePart", TypeFixturePart);
		para.put("MachineFixturePart", MachineFixturePart);
		para.put("ProcessPartFixturePart", ProcessPartFixturePart);
		resultmap.put("para",para);
		
		json = JackJson.fromObjectToJson(resultmap);
		System.out.println(json);
		return json;
	}
	
	
	/** 
	 * 去添加
	 */
	
	@ResponseBody
	@RequestMapping(value="/goAddFixturePart" ,produces = "application/json; charset=utf-8")
	public String goAddFixturePart(String id)throws Exception{
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		Map para = new HashMap();
		para.put("id_FixturePart", id);
		Map FixturePart = fixturePartService.queryFixturePartListById(para);//查询标准机床
		if(FixturePart != null){
			
			//查询材料图片列表 PictureMaterial
			para.put("ascription", "PictureFixturePart");
			List<Map> PictureFixturePart = fixturePartService.queryPictureFixturePartList(para);
			String array_PictureFixturePart = "";
			if(PictureFixturePart != null && PictureFixturePart.size() > 0){
				for(int i = 0; i < PictureFixturePart.size(); i++){
					array_PictureFixturePart = array_PictureFixturePart + PictureFixturePart.get(i).get("url_FixturePartFile") + ",";
				}
			}
			
			//查询机床节点详细信息列表 
			para.put("ascription", "InformFixturePart");
			List<Map> InformFixturePart = fixturePartService.queryInformFixturePartList(para);
			String array_InformFixturePart = "";
			String array_InformFixturePart_name = "";
			if(InformFixturePart != null && InformFixturePart.size() > 0){
				for(int i = 0; i < InformFixturePart.size(); i++){
					array_InformFixturePart = array_InformFixturePart + InformFixturePart.get(i).get("url_FixturePartFile") + ",";
					array_InformFixturePart_name = array_InformFixturePart_name + InformFixturePart.get(i).get("name_FixturePartFile") + ",";
				}
			}
			
			//part
			para.put("ascription", "PartFixturePart");
			List<Map> PartFixturePart = fixturePartService.queryPartFixturePartList(para);
			String array_PartFixturePart = "";
			String array_PartFixturePart_name = "";
			if(PartFixturePart != null && PartFixturePart.size() > 0){
				for(int i = 0; i < PartFixturePart.size(); i++){
					array_PartFixturePart = array_PartFixturePart + PartFixturePart.get(i).get("url_FixturePartFile") + ",";
					array_PartFixturePart_name = array_PartFixturePart_name + PartFixturePart.get(i).get("name_FixturePartFile") + ",";
				}
			}
			
			FixturePart.put("PictureFixturePart", PictureFixturePart);
			FixturePart.put("InformFixturePart", InformFixturePart);
			FixturePart.put("PartFixturePart", PartFixturePart);
			
			resultmap.put("result", "1");
			resultmap.put("array_PictureFixturePart", array_PictureFixturePart);
			resultmap.put("array_InformFixturePart", array_InformFixturePart);
			resultmap.put("array_InformFixturePart_name", array_InformFixturePart_name);
			resultmap.put("array_PartFixturePart", array_PartFixturePart);
			resultmap.put("array_PartFixturePart_name", array_PartFixturePart_name);
			
		}
		
		//查询类别列表
		List<Map> CategoryTypeFixturePart = fixturePartService.queryCategoryTypeFixturePartList();
		resultmap.put("CategoryTypeFixturePart", CategoryTypeFixturePart);
		
		resultmap.put("FixturePart", FixturePart);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	/**
	 * 添加/修改
	 */
	
	@ResponseBody
	@RequestMapping(value = "/saveFixturePart", produces = "application/json; charset=utf-8")
	public String saveFixturePart(String user_id, 
			int id_FixturePart, 
			String array_PictureFixturePart, 
			String array_PartFixturePart,
			String array_PartFixturePart_name,  
			String array_InformFixturePart,String array_InformFixturePart_name,
			String NameFixturePart, String NumberFixturePart, String TypeFixturePart, 
			String MachineFixturePart, String ProcessPartFixturePart, String AppCo, 
			String LocationFixturePart, String RemarkFixturePart
			) {
	
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		
		para.put("id_FixturePart", id_FixturePart);
		para.put("NameFixturePart", NameFixturePart);
		para.put("NumberFixturePart", NumberFixturePart);
		
		Map temp = new HashMap();
		temp.put("name_CategoryTypeFixturePart", TypeFixturePart);
		Map CategoryTypeFixturePart = fixturePartService.queryCategoryTypeFixturePartByName(temp);
		if(CategoryTypeFixturePart!=null || "".equals(CategoryTypeFixturePart)){
			para.put("TypeFixturePart", CategoryTypeFixturePart.get("id_CategoryTypeFixturePart"));
		}else{
			//保存新的材料类别
			fixturePartService.saveCategoryTypeFixturePart(temp);
			para.put("TypeFixturePart", temp.get("id_CategoryTypeFixturePart"));
		}
		
		para.put("MachineFixturePart", MachineFixturePart);
		
		para.put("ProcessPartFixturePart", ProcessPartFixturePart);
		para.put("AppCo", AppCo);
		para.put("LocationFixturePart", LocationFixturePart);
		para.put("RemarkFixturePart", RemarkFixturePart);
		
		try {
			if(id_FixturePart != 0){//修改
				fixturePartService.updateFixturePart(para);
			}else{//新增
				fixturePartService.saveFixturePart(para);
			}
			//先清空文件表中该ID的文件
			fixturePartService.clearFixturePartFileById(para);
			//保存详细信息
			para.put("ascription", "PictureFixturePart");
			if(array_PictureFixturePart != null && !"".equals(array_PictureFixturePart)){
				String array_PictureFixtureParts[] = array_PictureFixturePart.split(",");
				
				for(int i=0; i<array_PictureFixtureParts.length; i++){
					if(array_PictureFixtureParts[i] != null && !"".equals(array_PictureFixtureParts[i])){
						para.put("url_FixturePartFile", array_PictureFixtureParts[i]);
						fixturePartService.savePictureFixturePart(para);
					}
				}
			}
			
			//保存详细信息
			para.put("ascription", "InformFixturePart");
			if(array_InformFixturePart != null && !"".equals(array_InformFixturePart)){
				String array_InformFixtureParts[] = array_InformFixturePart.split(",");
				String array_InformFixtureParts_name[] = array_InformFixturePart_name.split(",");
				for(int i=0; i<array_InformFixtureParts.length; i++){
					if(array_InformFixtureParts[i] != null && !"".equals(array_InformFixtureParts[i])){
						para.put("url_FixturePartFile", array_InformFixtureParts[i]);
						para.put("name_FixturePartFile", array_InformFixtureParts_name[i]);
						fixturePartService.saveInformFixturePart(para);
					}
				}
			}
			
			//保存详细信息
			para.put("ascription", "PartFixturePart ");
			if(array_PartFixturePart != null && !"".equals(array_PartFixturePart)){
				String array_PartFixtureParts[] = array_PartFixturePart.split(",");
				String array_PartFixtureParts_name[] = array_PartFixturePart_name.split(",");
				for(int i=0; i<array_PartFixtureParts.length; i++){
					if(array_PartFixtureParts[i] != null && !"".equals(array_PartFixtureParts[i])){
						para.put("url_FixturePartFile", array_PartFixtureParts[i]);
						para.put("name_FixturePartFile", array_PartFixtureParts_name[i]);
						fixturePartService.savePartFixturePart(para);
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
	@RequestMapping(value="/savePictureFixturePart", produces = "application/json; charset=utf-8")
	public String savePictureFixturePart(
			String PictureFixturePart ,String fileSuffix, String filename) throws Exception{
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		String json  = "";  
		Map resultmap = new HashMap();
		String url = null;
		if(PictureFixturePart != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/PictureFixturePart/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/PictureFixturePart/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PictureFixturePart,  filepath2);
			url = "/PictureFixturePart/" + big_url + "." + fileSuffix;
		}
				
		resultmap.put("result", "1");
		
		resultmap.put("url", url);
		
		json = JackJson.fromObjectToJson(resultmap);
		
		return json;
	}
	
	@ResponseBody
	@RequestMapping(value="/savePartFixturePart", produces = "application/json; charset=utf-8")
	public String savePartFixturePart(
			String PartFixturePart ,String fileSuffix, String filename) throws Exception{
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		String json  = "";  
		Map resultmap = new HashMap();
		String url = null;
		String name = null;
		if(PartFixturePart != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/PartFixturePart/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/PartFixturePart/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PartFixturePart,  filepath2);
			url =  "/PartFixturePart/" + big_url + "." + fileSuffix;
			name = filename;
		}
		
				
		resultmap.put("result", "1");
		
		resultmap.put("url", url);
		resultmap.put("name", name);
		
		json = JackJson.fromObjectToJson(resultmap);
		
		return json;
	}
	
	@ResponseBody
	@RequestMapping(value="/saveInformFixturePart", produces = "application/json; charset=utf-8")
	public String saveInformFixturePart(
			String InformFixturePart ,String fileSuffix, String filename) throws Exception{
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		String json  = "";  
		Map resultmap = new HashMap();
		String url = null;
		String name = null;
		if(InformFixturePart != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/InformFixturePart/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/InformFixturePart/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(InformFixturePart,  filepath2);
			url = "/InformFixturePart/" + big_url + "." + fileSuffix ;
			name = filename ;
		}
		resultmap.put("result", "1");
		resultmap.put("url", url);
		resultmap.put("name", name);
		
		json = JackJson.fromObjectToJson(resultmap);
		
		return json;
	}
	
	
	/**
	 * 删除标准机床信息
	 */
	
	@ResponseBody
	@RequestMapping(value = "/deleteFixturePartList", produces = "application/json; charset=utf-8")
	public String deleteFixturePartList(String id_FixturePart) {
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		para.put("id_FixturePart", id_FixturePart);
		try {
			fixturePartService.deleteFixturePartList(para);
			
			fixturePartService.clearFixturePartFileById(para);
			
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
	@RequestMapping(value= "loading", produces = "application/json; charset=utf-8")
	public String loadingMaterial(@RequestParam(value="deputy") int deputy, int pageNo, int pageSize, String NumberMachineNode, 
			String NumberMachine, String TypeMachineNode,String DepartmentMachineNode,String WorkshopMachineNode,String NameProcessPart, 
			String NumberProcessPart, String TypeProcessPart, String AssemblyProcessPart,String NoAssemblyProcessPart){
		
		String json  = "";  
		Map resultmap = new HashMap();
		Page page = new Page(pageNo, pageSize);
		PageData pd = new PageData();
		
		List<Map> list = new ArrayList<Map>();
		if(deputy==1){
			pd.put("NumberMachineNode", NumberMachineNode);
			pd.put("NumberMachine", NumberMachine);
			pd.put("TypeMachineNode", TypeMachineNode);
			pd.put("DepartmentMachineNode", DepartmentMachineNode);
			pd.put("WorkshopMachineNode", WorkshopMachineNode);
			page.setPd(pd);
			Map map	= machineNodeInformService.queryMachineNodeInformList(page);//查询机床节点信息页面
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
			
			//查询类别列表
			List<Map> categoryMachineNodeInform = machineNodeInformService.queryCategoryMachineNodeInformList();
			resultmap.put("categoryMachineNodeInform", categoryMachineNodeInform);
			
			Map para = new HashMap();
			para.put("NumberMachineNode", NumberMachineNode);
			para.put("NumberMachine", NumberMachine);
			para.put("TypeMachineNode", TypeMachineNode);
			para.put("DepartmentMachineNode", DepartmentMachineNode);
			para.put("WorkshopMachineNode", WorkshopMachineNode);
			resultmap.put("para",para);
			
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		if(deputy==2){
			pd.put("NameProcessPart", NameProcessPart);
			pd.put("NumberProcessPart", NumberProcessPart);
			pd.put("TypeProcessPart", TypeProcessPart);
			pd.put("AssemblyProcessPart", AssemblyProcessPart);
			pd.put("NoAssemblyProcessPart", NoAssemblyProcessPart);
			page.setPd(pd);
			Map map	= processPartService.queryProcessPartList(page);//查询零件页面
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
			
			List<Map> CategoryTypeProcessPart = processPartService.queryCategoryTypeProcessPartList();
			resultmap.put("CategoryTypeProcessPart", CategoryTypeProcessPart);
			
			List<Map> CategoryIndustryProcessPart = processPartService.queryCategoryIndustryProcessPartList();
			resultmap.put("CategoryIndustryProcessPart", CategoryIndustryProcessPart);
			
			Map para = new HashMap();
			resultmap.put("NameProcessPart", NameProcessPart);
			resultmap.put("NumberProcessPart", NumberProcessPart);
			resultmap.put("TypeProcessPart", TypeProcessPart);
			resultmap.put("AssemblyProcessPart", AssemblyProcessPart);
			resultmap.put("NoAssemblyProcessPart", NoAssemblyProcessPart);
			resultmap.put("para",para);
			
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		
		return null;
	}
	

	
	
	
	
	
}
