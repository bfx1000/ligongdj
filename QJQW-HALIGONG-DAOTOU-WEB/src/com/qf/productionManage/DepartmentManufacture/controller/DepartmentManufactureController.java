package com.qf.productionManage.DepartmentManufacture.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qf.productionManage.DepartmentManufacture.service.DepartmentManufactureService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.common.JackJson;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/DepartmentManufacture")
public class DepartmentManufactureController extends BaseController{

	
	@Resource(name = "DepartmentManufactureService")
	private DepartmentManufactureService departmentManufactureService;
	
	
	
	//列表
	@RequestMapping("/DepartmentManufactureList")
	public ModelAndView DepartmentManufactureList(Page page, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= departmentManufactureService.queryDepartmentManufactureList(page);//查询零件页面
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			
			mv.addObject("DepartmentManufacture", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/productionManage/DepartmentManufacture/DepartmentManufacture_list");
		return mv;
	}
	
	
	
	
	//去添加页面
	@RequestMapping(value="/goAddDepartmentManufacture")
	public ModelAndView goAddDepartmentManufacture(String id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
			
		Map para = new HashMap();
		para.put("id_DepartmentManufacture", id);
		Map DepartmentManufacture = departmentManufactureService.queryDepartmentManufactureListById(para);//查询标准机床

		mv.setViewName("/WEB-INF/productionManage/DepartmentManufacture/DepartmentManufacture_edit");
		mv.addObject("turn_url", turn_url);
		mv.addObject("DepartmentManufacture", DepartmentManufacture);
		
		mv.addObject("pd", pd);
		
		return mv;
	}
    
	
	
    /**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/saveDepartmentManufacture")
	public String saveDepartmentManufacture(HttpServletRequest request, 
			int id_DepartmentManufacture, String SuperiorDepartmentManuf, String NameDepartmentManuf, String NoDepartmentManuf,  
			String AddressDepartmentManuf,String TeleNoDepartmentManuf, String PrincipalDepartmentManuf, String RemarkDepartmentManuf,
			String LevelDepartmentManuf
			) {
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		Map para = new HashMap();
		
		List<Map> DepartmentManufacture = null;
		
		DepartmentManufacture = departmentManufactureService.loadingDepartmentManufacture();
		for(int i = 0;i<DepartmentManufacture.size();i++){
			String name = ""+DepartmentManufacture.get(i).get("NameDepartmentManuf");
			if(NameDepartmentManuf.equals(name)){
				return "-1";
			}
		}
		
		para.put("id_DepartmentManufacture", id_DepartmentManufacture);
		
		if(SuperiorDepartmentManuf==null || "".equals(SuperiorDepartmentManuf)){
			para.put("SuperiorDepartmentManuf", "无");
		}else{
			para.put("SuperiorDepartmentManuf", SuperiorDepartmentManuf);
		}
		
		para.put("NameDepartmentManuf", NameDepartmentManuf);
		para.put("NoDepartmentManuf", NoDepartmentManuf);
		para.put("AddressDepartmentManuf", AddressDepartmentManuf);
		para.put("TeleNoDepartmentManuf", TeleNoDepartmentManuf);
		para.put("PrincipalDepartmentManuf", PrincipalDepartmentManuf);
		para.put("RemarkDepartmentManuf", RemarkDepartmentManuf);
		if(LevelDepartmentManuf==null || "".equals(LevelDepartmentManuf)){
			para.put("LevelDepartmentManuf", "1");
		}else{
			para.put("LevelDepartmentManuf", LevelDepartmentManuf);
		}
		
		
		try {
			if(id_DepartmentManufacture != 0){//修改
				departmentManufactureService.updateDepartmentManufacture(para);
			}else{//新增
				departmentManufactureService.saveDepartmentManufacture(para);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
	
	
	
	//删除
	@ResponseBody
	@RequestMapping("deleteDepartmentManufactureList")
	public String deleteDepartmentManufactureList(String id_DepartmentManufacture){
		Map para = new HashMap();
		para.put("id_DepartmentManufacture", id_DepartmentManufacture);
		try {
			departmentManufactureService.deleteDepartmentManufactureList(para);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}	
		return "1";
	}
	
	
	//加载部门
	@RequestMapping("loading")
	public ModelAndView loading(){
		ModelAndView mv = new ModelAndView();
		List<Map> DepartmentManufacture = null;
		
		DepartmentManufacture = departmentManufactureService.loadingDepartmentManufacture();
			
		mv.addObject("DepartmentManufacture",DepartmentManufacture);	
		mv.setViewName("/WEB-INF/productionManage/DepartmentManufacture/DepartmentManufacture_loading");
		return mv;
	}
	
	
}






