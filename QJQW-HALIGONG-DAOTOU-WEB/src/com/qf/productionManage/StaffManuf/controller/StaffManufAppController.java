package com.qf.productionManage.StaffManuf.controller;

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
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.qf.productionManage.StaffManuf.service.StaffManufService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.common.JackJson;
import com.qf.util.controller.BaseController;
import com.qf.util.file.ByteToFile;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/StaffManufApp")
public class StaffManufAppController extends BaseController{

	@Resource(name = "StaffManufService")
	private StaffManufService staffManufService;
	
	//列表
	@ResponseBody
	@RequestMapping(value = "/StaffManufList",produces = "application/json; charset=utf-8")
	public String StaffManufList(int pageNo, int pageSize,
			 String NameStaffManuf, String DepartStaffManuf, String NoStaffManuf,String JobStaffManuf){
		ModelAndView mv=new ModelAndView();
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		try{
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("NameStaffManuf", NameStaffManuf);
			pd.put("DepartStaffManuf", DepartStaffManuf);
			pd.put("NoStaffManuf", NoStaffManuf);
			pd.put("JobStaffManuf", JobStaffManuf);
			
			page.setPd(pd);
			map	= staffManufService.queryStaffManufList(page);//查询
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			
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
			
			List<Map> CategoryTitlesStaffManuf = staffManufService.queryCategoryTitlesStaffManufList();
			resultmap.put("CategoryTitlesStaffManuf", CategoryTitlesStaffManuf);
			
			resultmap.put("result", "1");
			resultmap.put("list", list);
		}catch (Exception e) {
			e.printStackTrace();
			resultmap.put("result", "0");
		}
		Map para = new HashMap();
		para.put("NameStaffManuf", NameStaffManuf);
		para.put("DepartStaffManuf", DepartStaffManuf);
		para.put("NoStaffManuf", NoStaffManuf);
		para.put("JobStaffManuf", JobStaffManuf);
		resultmap.put("para",para);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	/** 
	 * 去添加
	 */
	@ResponseBody
	@RequestMapping(value="/goAddStaffManuf" ,produces = "application/json; charset=utf-8")
	public String goAddStaffManuf(String id)throws Exception{
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		Map para = new HashMap();
		para.put("id_StaffManuf", id);
		Map StaffManuf = staffManufService.queryStaffManufListById(para);//查询标准机床
		if(StaffManuf != null){
			resultmap.put("result", "1");
		}
		//查询类别列表
		List<Map> CategoryTitlesStaffManuf = staffManufService.queryCategoryTitlesStaffManufList();
		resultmap.put("CategoryTitlesStaffManuf", CategoryTitlesStaffManuf);
		
		resultmap.put("StaffManuf", StaffManuf);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	/**
	 * 添加/修改
	 */
	@ResponseBody
	@RequestMapping(value = "/saveStaffManuf", produces = "application/json; charset=utf-8")
	public String saveStaffManuf(String user_id, 
			int id_StaffManuf, String NameStaffManuf, String DepartStaffManuf, String NoStaffManuf,  
			String BirthStaffManuf,String JobStaffManuf, String TitlesStaffManuf, String StatusStaffManuf, String RemarkStaffManuf
			) {
	
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		
		para.put("id_StaffManuf", id_StaffManuf);
		para.put("NameStaffManuf", NameStaffManuf);
		para.put("DepartStaffManuf", DepartStaffManuf);
		para.put("NoStaffManuf", NoStaffManuf);
		para.put("BirthStaffManuf", BirthStaffManuf);
		para.put("JobStaffManuf", JobStaffManuf);
		
		Map temp = new HashMap();
		temp.put("name_TitlesStaffManuf", TitlesStaffManuf);
		Map CategoryTitlesStaffManuf = staffManufService.queryCategoryTitlesStaffManufByName(temp);
		if(CategoryTitlesStaffManuf!=null || "".equals(CategoryTitlesStaffManuf)){
			para.put("TitlesStaffManuf", CategoryTitlesStaffManuf.get("id_TitlesStaffManuf"));
		}else{
			//保存新的材料类别
			staffManufService.saveCategoryTitlesStaffManuf(temp);
			para.put("TitlesStaffManuf", temp.get("id_TitlesStaffManuf"));
		}
		
		para.put("StatusStaffManuf", StatusStaffManuf);
		para.put("RemarkStaffManuf", RemarkStaffManuf);

		try {
			if(id_StaffManuf != 0){//修改
				staffManufService.updateStaffManuf(para);
			}else{//新增
				staffManufService.saveStaffManuf(para);
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
	 * 删除标准机床信息
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteStaffManufList", produces = "application/json; charset=utf-8")
	public String deleteStaffManufList(String id_StaffManuf) {
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		para.put("id_StaffManuf", id_StaffManuf);
		try {
			staffManufService.deleteStaffManufList(para);
			
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
