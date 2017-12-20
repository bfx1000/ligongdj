package com.qf.productionManage.ProcessPart.controller;

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

import com.qf.material.material.service.MaterialService;
import com.qf.productionManage.ProcessPart.service.ProcessPartService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;

//加工材料页面
@Controller
@RequestMapping("/ProcessPart")
public class ProcessPartController extends BaseController{
	
	
	//工件材料实例
	@Resource(name="materialService")
    private MaterialService materialService;  
	
	@Resource(name = "processPartService")
	private ProcessPartService processPartService;
	
	
	//列表
	@RequestMapping("/ProcessPartList")
	public ModelAndView ProcessPartList(Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= processPartService.queryProcessPartList(page);//查询零件页面
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
			}
			
			List<Map> CategoryTypeProcessPart = processPartService.queryCategoryTypeProcessPartList();
			mv.addObject("CategoryTypeProcessPart", CategoryTypeProcessPart);
			
			List<Map> CategoryIndustryProcessPart = processPartService.queryCategoryIndustryProcessPartList();
			mv.addObject("CategoryIndustryProcessPart", CategoryIndustryProcessPart);
			
			mv.addObject("ProcessPart", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/productionManage/ProcessPart/ProcessPart_List");
		return mv;
	}
	
	
	
	
	//去添加页面
	@RequestMapping(value="/goAddProcessPartt")
	public ModelAndView goAddProcessPartt(String id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
			
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
			
			mv.addObject("array_PictureProcessPart", array_PictureProcessPart);
			mv.addObject("array_InformProcessPart", array_InformProcessPart);
			mv.addObject("array_InformProcessPart_name", array_InformProcessPart_name);
			mv.addObject("array_PartProcessPart", array_PartProcessPart);
			mv.addObject("array_PartProcessPart_name", array_PartProcessPart_name);
			
			
		}
		
		//查询类别列表
		List<Map> CategoryTypeProcessPart = processPartService.queryCategoryTypeProcessPartList();
		mv.addObject("CategoryTypeProcessPart", CategoryTypeProcessPart);
		
		List<Map> CategoryIndustryProcessPart = processPartService.queryCategoryIndustryProcessPartList();
		mv.addObject("CategoryIndustryProcessPart", CategoryIndustryProcessPart);
		
		mv.setViewName("/WEB-INF/productionManage/ProcessPart/ProcessPart_edit");
		mv.addObject("turn_url", turn_url);
		mv.addObject("ProcessPart", ProcessPart);
		
		mv.addObject("pd", pd);
		System.out.println(ProcessPart);
		
		return mv;
	}
	
	
	
	
	//保存图片
	
	@ResponseBody
	@RequestMapping(value="/savePictureProcessPart")
	public Object savePictureDesignToolBTAdrill(
			@RequestParam("PictureProcessPart") MultipartFile PictureProcessPart,
			HttpServletRequest request ) throws Exception{
		String url = null;
		String OriginalFilename = PictureProcessPart.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/PictureProcessPart/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			PictureProcessPart.transferTo(materials_big_img_file); 
			url = "/PictureProcessPart/" + big_url + "." + fileSuffix;
		}else{

		}
		return url;
		
	}
	/**
	 * 保存图案文件
	 */
    @ResponseBody
	@RequestMapping(value="/savePartProcessPart")
	public Object savePartDesignToolBTAdrill(
			@RequestParam(value="PartProcessPart",required=false)MultipartFile PartProcessPart ,
			HttpServletRequest request ) throws Exception{
		
		Map<String,String> data = new HashMap<String, String>();
		String OriginalFilename = PartProcessPart.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/PartProcessPart/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			PartProcessPart.transferTo(materials_big_img_file); 
			data.put("url", "/PartProcessPart/" + big_url + "." + fileSuffix);
			data.put("fileName", OriginalFilename);

		}else{

		}

		return data;
		
	}
	
	
	
	
	
	/**
	 * 保存详细信息文件
	 */
    @ResponseBody
    @RequestMapping(value="/saveInformProcessPart")
	public Object saveInformDetailDesignToolBTAdrill(
			@RequestParam(value="InformProcessPart",required=false)MultipartFile InformProcessPart ,
			HttpServletRequest request ) throws Exception{
		Map<String,String> data = new HashMap<String, String>();
		String OriginalFilename = InformProcessPart.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/InformProcessPart/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			InformProcessPart.transferTo(materials_big_img_file); 
			data.put("url", "/InformProcessPart/" + big_url + "." + fileSuffix);
			data.put("fileName", OriginalFilename);
		}else{

		}
		return data;
		
	}
    
    
    
    
    /**
	 * 保存
	 */
	
	@ResponseBody
	@RequestMapping("/saveProcessPart")
	public String saveProcessPart(HttpServletRequest request, 
			int id_ProcessPart, 
			String array_PictureProcessPart, 
			String array_InformProcessPart,
			String array_InformProcessPart_name,  
			String array_PartProcessPart,String array_PartProcessPart_name,
			String NameProcessPart, String NumberProcessPart, String TypeProcessPart, 
			String AssemblyProcessPart, String NoAssemblyProcessPart, String CompanyProcessPart, 
			String IndustryProcessPart, String NumberMaterialProcessPart, String CategoryMaterialProcessPart, String RemarkProcessPart
			) {
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
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
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
	
	//加载工件材料
	@RequestMapping("loadingMaterial")
	public ModelAndView jzExperimentMachine(Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		page.setPd(pd);
		List<Map> list = new ArrayList<Map>();
		//1为查询加载机床节点
		Map map	= materialService.queryMaterialList(page);//查询工件材料列表
		list = (List<Map>)map.get("list");
		mv.addObject("materialList", list);
		//查询材料类别列表
		List<Map> categoryMaterialList = materialService.queryCategoryMaterialList();
		mv.addObject("categoryMaterialList", categoryMaterialList);
		
		mv.addObject("pd", pd);
		mv.setViewName("/WEB-INF/productionManage/ProcessPart/ProcessPart_loading");
		
		
		return mv;
	}
	
	
	//删除
	@ResponseBody
	@RequestMapping("deleteProcessPartList")
	public String deleteProcessPartList(String id_ProcessPart){
		Map para = new HashMap();
		para.put("id_ProcessPart", id_ProcessPart);
		try {
			processPartService.deleteProcessPartList(para);
			
			processPartService.clearProcessPartFileById(para);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}	
		return "1";
	}
	
	
	
	
	
	
	
	
	
	
	
}
