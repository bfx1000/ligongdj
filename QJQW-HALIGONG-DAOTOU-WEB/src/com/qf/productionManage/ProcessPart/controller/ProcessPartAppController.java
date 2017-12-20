package com.qf.productionManage.ProcessPart.controller;

import java.util.ArrayList;
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

import com.qf.material.material.service.MaterialService;
import com.qf.productionManage.ProcessPart.service.ProcessPartService;
import com.qf.util.PageData;
import com.qf.util.common.JackJson;
import com.qf.util.file.ByteToFile;
import com.qf.util.page.Page;


@Controller
@RequestMapping("/ProcessPartApp")
public class ProcessPartAppController {
	
	
	
	//工件材料实例
	@Resource(name="materialService")
	private MaterialService materialService;  
		
	@Resource(name = "processPartService")
	private ProcessPartService processPartService;
		
	
	//列表
	@ResponseBody
	@RequestMapping(value = "/ProcessPartList",produces = "application/json; charset=utf-8")
	public String ProcessPartList(int pageNo, int pageSize,
			 String NameProcessPart, String NumberProcessPart, String TypeProcessPart,
			 String AssemblyProcessPart,String NoAssemblyProcessPart){
		ModelAndView mv=new ModelAndView();
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		try{
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("NameProcessPart", NameProcessPart);
			pd.put("NumberProcessPart", NumberProcessPart);
			pd.put("TypeProcessPart", TypeProcessPart);
			pd.put("AssemblyProcessPart", AssemblyProcessPart);
			pd.put("NoAssemblyProcessPart", NoAssemblyProcessPart);
			
			page.setPd(pd);
			map	= processPartService.queryProcessPartList(page);//查询零件页面
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			if(list != null && list.size() > 0){
				for(int i = 0; i < list.size(); i++){
					Map ProcessPart = list.get(i);
					int id_ProcessPart = (int) ProcessPart.get("id_ProcessPart");
					
					Map para = new HashMap();
					para.put("id_ProcessPart", id_ProcessPart);
					
					//查询图片列表 
					para.put("ascription", "PictureProcessPart");
					List<Map> PictureProcessPart = processPartService.queryPictureProcessPartList(para);
					//查询详细信息列表
					para.put("ascription", "InformProcessPart");
					List<Map> InformProcessPart = processPartService.queryInformProcessPartList(para);
					//part文件
					para.put("ascription", "PartProcessPart");
					List<Map> PartProcessPart = processPartService.queryPartProcessPartList(para);
					
					ProcessPart.put("PictureProcessPart", PictureProcessPart);
					ProcessPart.put("InformProcessPart", InformProcessPart);
					ProcessPart.put("PartProcessPart", PartProcessPart);
					list.set(i, ProcessPart);
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
			
			List<Map> CategoryTypeProcessPart = processPartService.queryCategoryTypeProcessPartList();
			
			List<Map> CategoryIndustryProcessPart = processPartService.queryCategoryIndustryProcessPartList();
			
			resultmap.put("CategoryTypeProcessPart", CategoryTypeProcessPart);
			resultmap.put("CategoryIndustryProcessPart", CategoryIndustryProcessPart);
			resultmap.put("result", "1");
			resultmap.put("list", list);
		}catch (Exception e) {
			e.printStackTrace();
			resultmap.put("result", "0");
		}
		Map para = new HashMap();
		para.put("NameProcessPart", NameProcessPart);
		para.put("NumberProcessPart", NumberProcessPart);
		para.put("TypeProcessPart", TypeProcessPart);
		para.put("AssemblyProcessPart", AssemblyProcessPart);
		para.put("NoAssemblyProcessPart", NoAssemblyProcessPart);
		resultmap.put("para",para);
		
		json = JackJson.fromObjectToJson(resultmap);
		System.out.println(json);
		return json;
	}
	
	
	/** 
	 * 去添加
	 */
	
	@ResponseBody
	@RequestMapping(value="/goAddProcessPartt" ,produces = "application/json; charset=utf-8")
	public String goAddProcessPartt(String id)throws Exception{
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		Map para = new HashMap();
		para.put("id_ProcessPart", id);
		Map ProcessPart = processPartService.queryProcessPartListById(para);//查询标准机床
		if(ProcessPart != null){
			
			//查询材料图片列表 PictureMaterial
			para.put("ascription", "PictureProcessPart");
			List<Map> PictureProcessPart = processPartService.queryPictureProcessPartList(para);
			String array_PictureProcessPart = "";
			if(PictureProcessPart != null && PictureProcessPart.size() > 0){
				for(int i = 0; i < PictureProcessPart.size(); i++){
					array_PictureProcessPart = array_PictureProcessPart + PictureProcessPart.get(i).get("url_ProcessPartFile") + ",";
				}
			}
			
			//查询机床节点详细信息列表 
			para.put("ascription", "InformProcessPart");
			List<Map> InformProcessPart = processPartService.queryInformProcessPartList(para);
			String array_InformProcessPart = "";
			String array_InformProcessPart_name = "";
			if(InformProcessPart != null && InformProcessPart.size() > 0){
				for(int i = 0; i < InformProcessPart.size(); i++){
					array_InformProcessPart = array_InformProcessPart + InformProcessPart.get(i).get("url_ProcessPartFile") + ",";
					array_InformProcessPart_name = array_InformProcessPart_name + InformProcessPart.get(i).get("name_ProcessPartFile") + ",";
				}
			}
			
			//part
			para.put("ascription", "PartProcessPart");
			List<Map> PartProcessPart = processPartService.queryPartProcessPartList(para);
			String array_PartProcessPart = "";
			String array_PartProcessPart_name = "";
			if(PartProcessPart != null && PartProcessPart.size() > 0){
				for(int i = 0; i < PartProcessPart.size(); i++){
					array_PartProcessPart = array_PartProcessPart + PartProcessPart.get(i).get("url_ProcessPartFile") + ",";
					array_PartProcessPart_name = array_PartProcessPart_name + PartProcessPart.get(i).get("name_ProcessPartFile") + ",";
				}
			}
			
			ProcessPart.put("PictureProcessPart", PictureProcessPart);
			ProcessPart.put("InformProcessPart", InformProcessPart);
			ProcessPart.put("PartProcessPart", PartProcessPart);
			
			resultmap.put("result", "1");
			resultmap.put("array_PictureProcessPart", array_PictureProcessPart);
			resultmap.put("array_InformProcessPart", array_InformProcessPart);
			resultmap.put("array_InformProcessPart_name", array_InformProcessPart_name);
			resultmap.put("array_PartProcessPart", array_PartProcessPart);
			resultmap.put("array_PartProcessPart_name", array_PartProcessPart_name);
			
		}
		
		//查询类别列表
		List<Map> CategoryTypeProcessPart = processPartService.queryCategoryTypeProcessPartList();
		resultmap.put("CategoryTypeProcessPart", CategoryTypeProcessPart);
		
		List<Map> CategoryIndustryProcessPart = processPartService.queryCategoryIndustryProcessPartList();
		resultmap.put("CategoryIndustryProcessPart", CategoryIndustryProcessPart);
		
		resultmap.put("ProcessPart", ProcessPart);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	/**
	 * 添加/修改
	 */
	
	@ResponseBody
	@RequestMapping(value = "/saveProcessPart", produces = "application/json; charset=utf-8")
	public String saveProcessPart(String user_id, 
			int id_ProcessPart, 
			String array_PictureProcessPart, 
			String array_InformProcessPart,
			String array_InformProcessPart_name,  
			String array_PartProcessPart,String array_PartProcessPart_name,
			String NameProcessPart, String NumberProcessPart, String TypeProcessPart, 
			String AssemblyProcessPart, String NoAssemblyProcessPart, String CompanyProcessPart, 
			String IndustryProcessPart, String NumberMaterialProcessPart, String CategoryMaterialProcessPart, String RemarkProcessPart) {
	
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		
		para.put("id_ProcessPart", id_ProcessPart);
		para.put("NameProcessPart", NameProcessPart);
		para.put("NumberProcessPart", NumberProcessPart);
		
		Map temp = new HashMap();
		temp.put("name_CategoryTypeProcessPart", TypeProcessPart);
		Map CategoryTypeProcessPart = processPartService.queryCategoryTypeProcessPartByName(temp);
		if(CategoryTypeProcessPart!=null || "".equals(CategoryTypeProcessPart)){
			para.put("TypeProcessPart", CategoryTypeProcessPart.get("id_CategoryTypeProcessPart"));
		}else{
			//保存新的材料类别
			processPartService.saveCategoryTypeProcessPart(temp);
			para.put("TypeProcessPart", temp.get("id_CategoryTypeProcessPart"));
		}
		
		para.put("AssemblyProcessPart", AssemblyProcessPart);
		
		Map temp1 = new HashMap();
		temp1.put("name_CategoryIndustryProcessPart", IndustryProcessPart);
		Map CategoryIndustryProcessPart = processPartService.queryCategoryIndustryProcessPartByName(temp1);
		if(CategoryIndustryProcessPart!=null || "".equals(CategoryIndustryProcessPart)){
			para.put("IndustryProcessPart", CategoryIndustryProcessPart.get("id_CategoryIndustryProcessPart"));
		}else{
			//保存新的材料类别
			processPartService.saveCategoryIndustryProcessPart(temp1);
			para.put("IndustryProcessPart", temp1.get("id_CategoryIndustryProcessPart"));
		}
		
		para.put("NoAssemblyProcessPart", NoAssemblyProcessPart);
		para.put("CompanyProcessPart", CompanyProcessPart);
		para.put("NumberMaterialProcessPart", NumberMaterialProcessPart);
		para.put("CategoryMaterialProcessPart", CategoryMaterialProcessPart);
		para.put("RemarkProcessPart", RemarkProcessPart);
		
		try {
			if(id_ProcessPart != 0){//修改
				processPartService.updateProcessPart(para);
			}else{//新增
				processPartService.saveProcessPart(para);
			}
			
			
			
			//先清空文件表中该ID的文件
			processPartService.clearProcessPartFileById(para);
			//保存详细信息
			para.put("ascription", "PictureProcessPart");
			if(array_PictureProcessPart != null && !"".equals(array_PictureProcessPart)){
				String array_PictureProcessParts[] = array_PictureProcessPart.split(",");
				
				for(int i=0; i<array_PictureProcessParts.length; i++){
					if(array_PictureProcessParts[i] != null && !"".equals(array_PictureProcessParts[i])){
						para.put("url_ProcessPartFile", array_PictureProcessParts[i]);
						processPartService.savePictureProcessPart(para);
					}
				}
			}
			
			
			
			
			//保存详细信息
			para.put("ascription", "InformProcessPart");
			if(array_InformProcessPart != null && !"".equals(array_InformProcessPart)){
				String array_InformProcessParts[] = array_InformProcessPart.split(",");
				String array_InformProcessParts_name[] = array_InformProcessPart_name.split(",");
				for(int i=0; i<array_InformProcessParts.length; i++){
					if(array_InformProcessParts[i] != null && !"".equals(array_InformProcessParts[i])){
						para.put("url_ProcessPartFile", array_InformProcessParts[i]);
						para.put("name_ProcessPartFile", array_InformProcessParts_name[i]);
						processPartService.saveInformProcessPart(para);
					}
				}
			}
			
			
			
			//保存详细信息
			para.put("ascription", "PartProcessPart");
			if(array_PartProcessPart != null && !"".equals(array_PartProcessPart)){
				String array_PartProcessParts[] = array_PartProcessPart.split(",");
				String array_PartProcessParts_name[] = array_PartProcessPart_name.split(",");
				for(int i=0; i<array_PartProcessParts.length; i++){
					if(array_PartProcessParts[i] != null && !"".equals(array_PartProcessParts[i])){
						para.put("url_ProcessPartFile", array_PartProcessParts[i]);
						para.put("name_ProcessPartFile", array_PartProcessParts_name[i]);
						processPartService.savePartProcessPart(para);
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
	@RequestMapping(value="/savePictureProcessPart", produces = "application/json; charset=utf-8")
	public String savePictureProcessPart(
			String PictureProcessPart ,String fileSuffix, String filename) throws Exception{
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		String json  = "";  
		Map resultmap = new HashMap();
		String url = null;
		if(PictureProcessPart != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/PictureProcessPart/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/PictureProcessPart/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PictureProcessPart,  filepath2);
			url = "/PictureProcessPart/" + big_url + "." + fileSuffix;
		}
				
		resultmap.put("result", "1");
		
		resultmap.put("url", url);
		
		json = JackJson.fromObjectToJson(resultmap);
		
		return json;
	}
	
	@ResponseBody
	@RequestMapping(value="/savePartProcessPart", produces = "application/json; charset=utf-8")
	public String savePartProcessPart(
			String PartProcessPart ,String fileSuffix, String filename) throws Exception{
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		String json  = "";  
		Map resultmap = new HashMap();
		String url = null;
		String name = null;
		if(PartProcessPart != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/PartProcessPart/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/PartProcessPart/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PartProcessPart,  filepath2);
			url =  "/PartProcessPart/" + big_url + "." + fileSuffix;
			name = filename;
		}
		
				
		resultmap.put("result", "1");
		
		resultmap.put("url", url);
		resultmap.put("name", name);
		
		json = JackJson.fromObjectToJson(resultmap);
		
		return json;
	}
	
	@ResponseBody
	@RequestMapping(value="/saveInformProcessPart", produces = "application/json; charset=utf-8")
	public String saveInformProcessPart(
			String InformProcessPart ,String fileSuffix, String filename) throws Exception{
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		String json  = "";  
		Map resultmap = new HashMap();
		String url = null;
		String name = null;
		if(InformProcessPart != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/InformProcessPart/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/InformProcessPart/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(InformProcessPart,  filepath2);
			url = "/InformProcessPart/" + big_url + "." + fileSuffix ;
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
	@RequestMapping(value = "/deleteProcessPartList", produces = "application/json; charset=utf-8")
	public String deleteProcessPartList(String id_ProcessPart) {
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		para.put("id_ProcessPart", id_ProcessPart);
		try {
			processPartService.deleteProcessPartList(para);
			
			processPartService.clearProcessPartFileById(para);
			
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
	@RequestMapping(value= "loadingMaterial", produces = "application/json; charset=utf-8")
	public String loadingMaterial(int pageNo, int pageSize, String NumberMachineNode, 
			String NameMaterial, String	NumberMaterial, String id_CategoryMaterial,String ISOCuttingMaterial, String CategoryMaterial, 
			String CompanyMaterial){
		
		String json  = "";  
		Map resultmap = new HashMap();
		Page page = new Page(pageNo, pageSize);
		PageData pd = new PageData();
		
		List<Map> list = new ArrayList<Map>();
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
	
	
}
