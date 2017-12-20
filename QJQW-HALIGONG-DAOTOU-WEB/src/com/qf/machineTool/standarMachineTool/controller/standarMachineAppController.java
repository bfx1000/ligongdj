package com.qf.machineTool.standarMachineTool.controller;

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

import com.qf.machineTool.standarMachineTool.service.standarMachineService;
import com.qf.util.PageData;
import com.qf.util.common.JackJson;
import com.qf.util.controller.BaseController;
import com.qf.util.file.ByteToFile;
import com.qf.util.page.Page;


@Controller
@RequestMapping("/standarMachineApp")
public class standarMachineAppController extends BaseController{
	
	@Resource(name="standarMachineService")
	private standarMachineService standarMachineService;
	
	/**
	 * 查询机床列表
	 * @param pageNo
	 * @param pageSize
	 * @param NameMachine
	 * @param NumberMachine
	 * @param TypeMachine
	 * @param ControlSystemMachine
	 * @param SpindleSpeedMachine
	 * @param CompanyMachine
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "queryStandarMachineList",produces = "application/json; charset=utf-8")
	public String queryStandarMachineList(int pageNo, int pageSize,
			 String NameMachine, String NumberMachine, String TypeMachine,
			 String ControlSystemMachine,String SpindleSpeedMachine,String CompanyMachine){
		ModelAndView mv=new ModelAndView();
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		try{
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("NameMachine", NameMachine);
			pd.put("NumberMachine", NumberMachine);
			pd.put("TypeMachine", TypeMachine);
			pd.put("ControlSystemMachine", ControlSystemMachine);
			pd.put("SpindleSpeedMachine", SpindleSpeedMachine);
			pd.put("CompanyMachine", CompanyMachine);
			
			page.setPd(pd);
			map = standarMachineService.queryStandarMachineList(page);
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			System.out.println(list);
			if(list != null && list.size() > 0){
				for(int i = 0; i < list.size(); i++){
					Map MachineInform = list.get(i);
					int id_MachineInform = (int)MachineInform.get("id_MachineInform");
					
					Map para = new HashMap();
					para.put("id_MachineInform", id_MachineInform);
					
					//查询刀柄图片列表 PictureTurningHolder
					List<Map> pictureMachineInformList = standarMachineService.queryPictureMachineInformList(para);
					//查询详细信息列表 InformDetailTurningHolder
					List<Map> informDetailMachineInformList = standarMachineService.queryInformDetailMachineInformList(para);
					
					
					MachineInform.put("pictureMachineInformList", pictureMachineInformList);
					MachineInform.put("informDetailMachineInformList", informDetailMachineInformList);
					list.set(i, MachineInform);
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
			
			//查询类别列表
			List<Map> categoryMachineInform = standarMachineService.queryCategoryMachineInformList();
			
			resultmap.put("categoryMachineInform", categoryMachineInform);
			resultmap.put("result", "1");
			resultmap.put("list", list);
		}catch (Exception e) {
			e.printStackTrace();
			resultmap.put("result", "0");
		}
		Map para = new HashMap();
		para.put("NameMachine", NameMachine);
		para.put("NumberMachine", NumberMachine);
		para.put("TypeMachine", TypeMachine);
		para.put("ControlSystemMachine", ControlSystemMachine);
		para.put("SpindleSpeedMachine", SpindleSpeedMachine);
		para.put("CompanyMachine", CompanyMachine);
		resultmap.put("para",para);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	/** 
	 * 去添加
	 */
	
	@ResponseBody
	@RequestMapping(value="/goAddMachineInform" ,produces = "application/json; charset=utf-8")
	public String goAddTurningHolder(String id)throws Exception{
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		Map para = new HashMap();
		para.put("id_MachineInform", id);
		Map MachineInform = standarMachineService.queryMachineInformById(para);//查询机床数据
		System.out.println(MachineInform);
		if(MachineInform != null){
			
			//查询标准机床图片列表 PictureMachineInform
			List<Map> pictureMachineInformList = standarMachineService.queryPictureMachineInformList(para);
			String array_PictureMachineInform = "";
			if(pictureMachineInformList != null && pictureMachineInformList.size() > 0){
				for(int i = 0; i < pictureMachineInformList.size(); i++){
					array_PictureMachineInform = array_PictureMachineInform + pictureMachineInformList.get(i).get("url_PictureMachineInform") + ",";
				}
			}

			//查询标准机床详细信息列表 InformDetailMachineInform
			List<Map> informDetailMachineInformList = standarMachineService.queryInformDetailMachineInformList(para);
			String array_InformDetailMachineInform = "";
			String array_InformDetailMachineInform_name = "";
			if(informDetailMachineInformList != null && informDetailMachineInformList.size() > 0){
				for(int i = 0; i < informDetailMachineInformList.size(); i++){
					array_InformDetailMachineInform = array_InformDetailMachineInform + informDetailMachineInformList.get(i).get("url_InformDetailMachineInform") + ",";
					array_InformDetailMachineInform_name = array_InformDetailMachineInform_name + informDetailMachineInformList.get(i).get("name_InformDetailMachineInform") + ",";
				}
			}
			
			MachineInform.put("pictureMachineInformList", pictureMachineInformList);
			MachineInform.put("informDetailMachineInformList", informDetailMachineInformList);
			
			resultmap.put("result", "1");
			resultmap.put("array_PictureMachineInform", array_PictureMachineInform);
			resultmap.put("array_InformDetailMachineInform", array_InformDetailMachineInform);
			resultmap.put("array_InformDetailMachineInform_name", array_InformDetailMachineInform_name);
		}
		
		//查询类别列表
		List<Map> categoryMachineInform = standarMachineService.queryCategoryMachineInformList();
		
		resultmap.put("MachineInform", MachineInform);
		resultmap.put("categoryMachineInform", categoryMachineInform);
		json = JackJson.fromObjectToJson(resultmap);
		System.out.println(json);
		return json;
	}
	
	
	/**
	 * 添加/修改
	 */
	
	@ResponseBody
	@RequestMapping(value = "/saveMachineInform", produces = "application/json; charset=utf-8")
	public String saveMachineInform(String user_id, 
			int id_MachineInform, 
			String array_PictureMachineInform, 
			String array_InformDetailMachineInform, 
			String array_InformDetailMachineInform_name,  
			String NumberMachine, String NameMachine, String TypeMachine, 
			String TypeCustomMachineInform, String ControlSystemMachine, String SpindleSpeedMachine, 
			String CompanyMachine, String CuttingDiameterMachine, String MaxweightMachine, String TypeTurningHolderMachine) {
	
	
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		
		
		
		para.put("id_MachineInform", id_MachineInform);
		para.put("NumberMachine", NumberMachine);
		para.put("NameMachine", NameMachine);
		
		Map temp = new HashMap();
		temp.put("name_CategoryMachineInform", TypeMachine);
		Map categoryMachineInform = standarMachineService.queryCategoryMachineInformByName(temp);
		if(categoryMachineInform!=null || "".equals(categoryMachineInform)){
			para.put("TypeMachine", categoryMachineInform.get("id_CategoryMachineInform"));
		}else{
			//保存新的材料类别
			standarMachineService.saveCategoryMachineInform(temp);
			para.put("TypeMachine", temp.get("id_CategoryMachineInform"));
		}
		
		para.put("TypeCustomMachineInform", TypeCustomMachineInform);
		para.put("ControlSystemMachine", ControlSystemMachine);
		//由于SpindleSpeedMachine为整型，所以加入判断
		if(SpindleSpeedMachine == null || "".equals(SpindleSpeedMachine)){
			para.put("SpindleSpeedMachine", "0");
		}else{
			para.put("SpindleSpeedMachine", SpindleSpeedMachine);
		}
		para.put("CompanyMachine", CompanyMachine);
		para.put("CuttingDiameterMachine", CuttingDiameterMachine);
		para.put("MaxweightMachine", MaxweightMachine);
		para.put("TypeTurningHolderMachine", TypeTurningHolderMachine);
		
		para.put("add_time", System.currentTimeMillis() / 1000);
		para.put("user_id", user_id);
		
		try {
			if(id_MachineInform != 0){//修改
				standarMachineService.updateMachineInform(para);
			}else{//新增
				
				standarMachineService.saveMachineInform(para);
			}
			//清空刀柄图片路径
			standarMachineService.clearPictureMachineInformByIdMachineInform(para);
			//保存刀柄图片
			if(array_PictureMachineInform != null && !"".equals(array_PictureMachineInform)){
				String array_PictureMachineInforms[] = array_PictureMachineInform.split(",");
				for(int i=0; i<array_PictureMachineInforms.length; i++){
					if(array_PictureMachineInforms[i] != null && !"".equals(array_PictureMachineInforms[i])){
						para.put("url_PictureMachineInform", array_PictureMachineInforms[i]);
						standarMachineService.savePictureMachineInform(para);
					}
				}
			}
			
			//清空详细信息路径
			standarMachineService.clearInformDetailMachineInformByIdMachineInform(para);
			//保存详细信息
			if(array_InformDetailMachineInform != null && !"".equals(array_InformDetailMachineInform)){
				String array_InformDetailMachineInforms[] = array_InformDetailMachineInform.split(",");
				String array_InformDetailMachineInforms_name[] = array_InformDetailMachineInform_name.split(",");
				
				for(int i=0; i<array_InformDetailMachineInforms.length; i++){
					if(array_InformDetailMachineInforms[i] != null && !"".equals(array_InformDetailMachineInforms[i])){
						para.put("url_InformDetailMachineInform", array_InformDetailMachineInforms[i]);
						para.put("name_InformDetailMachineInform", array_InformDetailMachineInforms_name[i]);
						standarMachineService.saveInformDetailMachineInform(para);
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
	 * 保存机床图片
	 */
	
	@ResponseBody
	@RequestMapping(value="/savePictureMachineInform", produces = "application/json; charset=utf-8")
	public String savePictureMachineInform(String id_MachineInform, 
			String array_PictureMachineInform, 
			String array_InformDetailMachineInform, 
			String array_InformDetailMachineInform_name,  
			String PictureMachineInform ,String fileSuffix, String filename) throws Exception{
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		String json  = "";  
		Map resultmap = new HashMap();
	
		if(PictureMachineInform != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureMachineInform/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/pictureMachineInform/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PictureMachineInform,  filepath2);
			array_PictureMachineInform = array_PictureMachineInform + "/pictureMachineInform/" + big_url + "." + fileSuffix + ",";
		}
		
		//查询类别列表
		List<Map> categoryMachineInform = standarMachineService.queryCategoryMachineInformList();
		
		resultmap.put("result", "1");
		resultmap.put("array_PictureMachineInform", array_PictureMachineInform);
		resultmap.put("array_InformDetailMachineInform", array_InformDetailMachineInform);
		resultmap.put("array_InformDetailMachineInform_name", array_InformDetailMachineInform_name);
		
		resultmap.put("categoryMachineInform", categoryMachineInform);
		
		json = JackJson.fromObjectToJson(resultmap);
		
		return json;
	}
	
	
	/**
	 * 保存详细信息
	 */
	
	@ResponseBody
	@RequestMapping(value="/saveInformDetailMachineInform", produces = "application/json; charset=utf-8")
	public String saveInformDetailMachineInform(String id_MachineInform, 
			String array_PictureMachineInform, 
			String array_InformDetailMachineInform, 
			String array_InformDetailMachineInform_name,  
			String InformDetailMachineInform ,String fileSuffix, String filename) throws Exception{
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		String json  = "";  
		Map resultmap = new HashMap();
	
		if(InformDetailMachineInform != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureMachineInform/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/pictureMachineInform/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(InformDetailMachineInform,  filepath2);
			array_InformDetailMachineInform = array_InformDetailMachineInform + "/pictureMachineInform/" + big_url + "." + fileSuffix + ",";
			array_InformDetailMachineInform_name = array_InformDetailMachineInform_name + filename + ",";
		}
		
		//查询类别列表
		List<Map> categoryMachineInform = standarMachineService.queryCategoryMachineInformList();
				
		resultmap.put("result", "1");
		resultmap.put("array_PictureMachineInform", array_PictureMachineInform);
		resultmap.put("array_InformDetailMachineInform", array_InformDetailMachineInform);
		resultmap.put("array_InformDetailMachineInform_name", array_InformDetailMachineInform_name);
		
		resultmap.put("categoryMachineInform", categoryMachineInform);
		
		json = JackJson.fromObjectToJson(resultmap);
		
		return json;
	}
	
	
	/**
	 * 删除标准机床信息
	 */
	
	@ResponseBody
	@RequestMapping("/deleteMachineInform")
	public String deleteTurningHolder(String id_MachineInform) {
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		para.put("id_MachineInform", id_MachineInform);
		try {
			//清空标准图片路径
			standarMachineService.clearPictureMachineInformByIdMachineInform(para);
			//清空标准机床详细信息路径
			standarMachineService.clearInformDetailMachineInformByIdMachineInform(para);
			//删除标准机床数据
			standarMachineService.deleteMachineInform(para);
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









