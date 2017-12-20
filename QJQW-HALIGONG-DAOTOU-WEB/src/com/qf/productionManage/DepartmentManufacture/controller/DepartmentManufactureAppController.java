package com.qf.productionManage.DepartmentManufacture.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qf.productionManage.DepartmentManufacture.service.DepartmentManufactureService;
import com.qf.util.PageData;
import com.qf.util.common.JackJson;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/DepartmentManufactureApp")
public class DepartmentManufactureAppController {

	@Resource(name = "DepartmentManufactureService")
	private DepartmentManufactureService departmentManufactureService;
	
	
	//列表
	@ResponseBody
	@RequestMapping(value = "/DepartmentManufactureList",produces = "application/json; charset=utf-8")
	public String DepartmentManufactureList(int pageNo, int pageSize,
			 String SuperiorDepartmentManuf, String NameDepartmentManuf, String NoDepartmentManuf,String AddressDepartmentManuf){
		ModelAndView mv=new ModelAndView();
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		try{
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("SuperiorDepartmentManuf", SuperiorDepartmentManuf);
			pd.put("NameDepartmentManuf", NameDepartmentManuf);
			pd.put("NoDepartmentManuf", NoDepartmentManuf);
			pd.put("AddressDepartmentManuf", AddressDepartmentManuf);
			
			page.setPd(pd);
			map	= departmentManufactureService.queryDepartmentManufactureList(page);//查询零件页面
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
			
			resultmap.put("result", "1");
			resultmap.put("list", list);
		}catch (Exception e) {
			e.printStackTrace();
			resultmap.put("result", "0");
		}
		Map para = new HashMap();
		para.put("SuperiorDepartmentManuf", SuperiorDepartmentManuf);
		para.put("NameDepartmentManuf", NameDepartmentManuf);
		para.put("NoDepartmentManuf", NoDepartmentManuf);
		para.put("AddressDepartmentManuf", AddressDepartmentManuf);
		resultmap.put("para",para);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	/** 
	 * 去添加
	 */
	@ResponseBody
	@RequestMapping(value="/goAddDepartmentManufacture" ,produces = "application/json; charset=utf-8")
	public String goAddDepartmentManufacture(String id)throws Exception{
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		Map para = new HashMap();
		para.put("id_DepartmentManufacture", id);
		Map DepartmentManufacture = departmentManufactureService.queryDepartmentManufactureListById(para);//查询标准机床
		if(DepartmentManufacture != null){
			resultmap.put("result", "1");
		}
		
		resultmap.put("DepartmentManufacture", DepartmentManufacture);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	/**
	 * 添加/修改
	 */
	@ResponseBody
	@RequestMapping(value = "/saveDepartmentManufacture", produces = "application/json; charset=utf-8")
	public String saveDepartmentManufacture(String user_id, 
			int id_DepartmentManufacture, String SuperiorDepartmentManuf, String NameDepartmentManuf, String NoDepartmentManuf,  
			String AddressDepartmentManuf,String TeleNoDepartmentManuf, String PrincipalDepartmentManuf, String RemarkDepartmentManuf
			) {
	
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		
		para.put("id_DepartmentManufacture", id_DepartmentManufacture);
		para.put("SuperiorDepartmentManuf", SuperiorDepartmentManuf);
		para.put("NameDepartmentManuf", NameDepartmentManuf);
		para.put("NoDepartmentManuf", NoDepartmentManuf);
		para.put("AddressDepartmentManuf", AddressDepartmentManuf);
		para.put("TeleNoDepartmentManuf", TeleNoDepartmentManuf);
		para.put("PrincipalDepartmentManuf", PrincipalDepartmentManuf);
		para.put("RemarkDepartmentManuf", RemarkDepartmentManuf);
		
		try {
			if(id_DepartmentManufacture != 0){//修改
				departmentManufactureService.updateDepartmentManufacture(para);
			}else{//新增
				departmentManufactureService.saveDepartmentManufacture(para);
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
	@RequestMapping(value = "/deleteDepartmentManufactureList", produces = "application/json; charset=utf-8")
	public String deleteDepartmentManufactureList(String id_DepartmentManufacture) {
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		para.put("id_DepartmentManufacture", id_DepartmentManufacture);
		try {
			departmentManufactureService.deleteDepartmentManufactureList(para);
			
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
	
	
	
	
	//加载部门
	@ResponseBody
	@RequestMapping(value ="loading", produces = "application/json; charset=utf-8")
	public Object loading(){
		String json  = "";  
		Map resultmap = new HashMap();
		List<Map> DepartmentManufacture = null;
		
		DepartmentManufacture = departmentManufactureService.loadingDepartmentManufacture();
			
		resultmap.put("result", "1");
		resultmap.put("DepartmentManufacture", DepartmentManufacture);
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	
}
