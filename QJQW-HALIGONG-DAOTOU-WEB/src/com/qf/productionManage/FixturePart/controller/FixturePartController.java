package com.qf.productionManage.FixturePart.controller;

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

import com.qf.machineTool.machineNodeInform.sercice.machineNodeInformService;
import com.qf.productionManage.FixturePart.service.FixturePartService;
import com.qf.productionManage.ProcessPart.service.ProcessPartService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/FixturePart")
public class FixturePartController extends BaseController{

	@Resource(name = "FixturePartService")
	private FixturePartService fixturePartService;
	
	//加工零件
	@Resource(name = "processPartService")
	private ProcessPartService processPartService;
	
	//机床节点
	@Resource(name = "machineNodeInformService")
	private machineNodeInformService machineNodeInformService;
	
	//列表
	@RequestMapping("/FixturePartList")
	public ModelAndView FixturePartList(Page page, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= fixturePartService.queryFixturePartList(page);//查询零件页面
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
			}
			
			List<Map> CategoryTypeFixturePart = fixturePartService.queryCategoryTypeFixturePartList();
			mv.addObject("CategoryTypeFixturePart", CategoryTypeFixturePart);
			
			mv.addObject("FixturePart", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/productionManage/FixturePart/FixturePart_List");
		return mv;
	}
	
	
	
	
	//去添加页面
	@RequestMapping(value="/goAddFixturePart")
	public ModelAndView goAddFixturePart(String id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
			
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
			
			mv.addObject("array_PictureFixturePart", array_PictureFixturePart);
			mv.addObject("array_InformFixturePart", array_InformFixturePart);
			mv.addObject("array_InformFixturePart_name", array_InformFixturePart_name);
			mv.addObject("array_PartFixturePart", array_PartFixturePart);
			mv.addObject("array_PartFixturePart_name", array_PartFixturePart_name);
			
			
		}
		
		//查询类别列表
		List<Map> CategoryTypeFixturePart = fixturePartService.queryCategoryTypeFixturePartList();
		mv.addObject("CategoryTypeFixturePart", CategoryTypeFixturePart);
		
		mv.setViewName("/WEB-INF/productionManage/FixturePart/FixturePart_edit");
		mv.addObject("turn_url", turn_url);
		mv.addObject("FixturePart", FixturePart);
		
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	
	
	
	//保存图片
	
	@ResponseBody
	@RequestMapping(value="/savePictureFixturePart")
	public Object savePictureFixturePart(
			@RequestParam("PictureFixturePart") MultipartFile PictureFixturePart,
			HttpServletRequest request ) throws Exception{
		String url = null;
		String OriginalFilename = PictureFixturePart.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/PictureFixturePart/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			PictureFixturePart.transferTo(materials_big_img_file); 
			url = "/PictureFixturePart/" + big_url + "." + fileSuffix;
		}else{

		}
		return url;
		
	}
	/**
	 * 保存图案文件
	 */
    @ResponseBody
	@RequestMapping(value="/savePartFixturePart")
	public Object savePartFixturePart(
			@RequestParam(value="PartFixturePart",required=false)MultipartFile PartFixturePart ,
			HttpServletRequest request ) throws Exception{
		
		Map<String,String> data = new HashMap<String, String>();
		String OriginalFilename = PartFixturePart.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/PartFixturePart/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			PartFixturePart.transferTo(materials_big_img_file); 
			data.put("url", "/PartFixturePart/" + big_url + "." + fileSuffix);
			data.put("fileName", OriginalFilename);

		}else{

		}

		return data;
		
	}
	
	
	/**
	 * 保存详细信息文件
	 */
    @ResponseBody
    @RequestMapping(value="/saveInformFixturePart")
	public Object saveInformFixturePart(
			@RequestParam(value="InformFixturePart",required=false)MultipartFile InformFixturePart ,
			HttpServletRequest request ) throws Exception{
		Map<String,String> data = new HashMap<String, String>();
		String OriginalFilename = InformFixturePart.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/InformFixturePart/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			InformFixturePart.transferTo(materials_big_img_file); 
			data.put("url", "/InformFixturePart/" + big_url + "." + fileSuffix);
			data.put("fileName", OriginalFilename);
		}else{

		}
		return data;
		
	}
    
    
    
    
    /**
	 * 保存
	 */
	
	@ResponseBody
	@RequestMapping("/saveFixturePart")
	public String saveFixturePart(HttpServletRequest request, 
			int id_FixturePart, 
			String array_PictureFixturePart, 
			String array_PartFixturePart,
			String array_PartFixturePart_name,  
			String array_InformFixturePart,String array_InformFixturePart_name,
			String NameFixturePart, String NumberFixturePart, String TypeFixturePart, 
			String MachineFixturePart, String ProcessPartFixturePart, String AppCo, 
			String LocationFixturePart, String RemarkFixturePart
			) {
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
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
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
	
	
	//删除
	@ResponseBody
	@RequestMapping("deleteFixturePartList")
	public String deleteFixturePartList(String id_FixturePart){
		Map para = new HashMap();
		para.put("id_FixturePart", id_FixturePart);
		try {
			fixturePartService.deleteFixturePartList(para);
			
			fixturePartService.clearFixturePartFileById(para);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}	
		return "1";
	}
	
		
		

	//加载工件材料
	@RequestMapping("loading")
	public ModelAndView loading(@RequestParam(value="deputy") int deputy,Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		page.setPd(pd);
		List<Map> list = new ArrayList<Map>();
		//1为查询加载机床节点
		if(deputy==1){
			Map map	= machineNodeInformService.queryMachineNodeInformList(page);//查询机床节点信息页面
			list = (List<Map>)map.get("list");
			mv.addObject("machineNodeInformList", list);
			mv.addObject("pd", pd);
			//查询类别列表
			List<Map> categoryMachineNodeInform = machineNodeInformService.queryCategoryMachineNodeInformList();
			mv.addObject("categoryMachineNodeInform", categoryMachineNodeInform);
			mv.setViewName("/WEB-INF/productionManage/FixturePart/FixturePart_loadingMachineNode");
		}
		if(deputy==2){
			Map map	= processPartService.queryProcessPartList(page);//查询零件页面
			list = (List<Map>)map.get("list");
			mv.addObject("ProcessPart", list);
			mv.addObject("pd", pd);
			
			List<Map> CategoryTypeProcessPart = processPartService.queryCategoryTypeProcessPartList();
			mv.addObject("CategoryTypeProcessPart", CategoryTypeProcessPart);
			
			List<Map> CategoryIndustryProcessPart = processPartService.queryCategoryIndustryProcessPartList();
			mv.addObject("CategoryIndustryProcessPart", CategoryIndustryProcessPart);
			mv.setViewName("/WEB-INF/productionManage/FixturePart/FixturePart_loadingProcessPart");
		}
		
		return mv;
	}
	
	
	
	
	
}
