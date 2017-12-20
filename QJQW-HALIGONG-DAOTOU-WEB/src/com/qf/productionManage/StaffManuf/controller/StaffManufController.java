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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.qf.productionManage.StaffManuf.service.StaffManufService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;


@Controller
@RequestMapping("/StaffManuf")
public class StaffManufController extends BaseController{
	
	@Resource(name = "StaffManufService")
	private StaffManufService staffManufService;
	
	//列表
	@RequestMapping("/StaffManufList")
	public ModelAndView StaffManufList(Page page, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= staffManufService.queryStaffManufList(page);//查询零件页面
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			
			List<Map> CategoryTitlesStaffManuf = staffManufService.queryCategoryTitlesStaffManufList();
			mv.addObject("CategoryTitlesStaffManuf", CategoryTitlesStaffManuf);
			
			mv.addObject("StaffManuf", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/productionManage/StaffManuf/StaffManuf_list");
		return mv;
	}
	
	//去添加页面
	@RequestMapping(value="/goAddStaffManuf")
	public ModelAndView goAddStaffManuf(String id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
			
		Map para = new HashMap();
		para.put("id_StaffManuf", id);
		Map StaffManuf = staffManufService.queryStaffManufListById(para);//查询标准机床
		//查询类别列表
		List<Map> CategoryTitlesStaffManuf = staffManufService.queryCategoryTitlesStaffManufList();
		mv.addObject("CategoryTitlesStaffManuf", CategoryTitlesStaffManuf);
		
		mv.setViewName("/WEB-INF/productionManage/StaffManuf/StaffManuf_edit");
		mv.addObject("turn_url", turn_url);
		mv.addObject("StaffManuf", StaffManuf);
		
		mv.addObject("pd", pd);
		
		return mv;
	}
    
    /**
	 * 保存
	 */
	
	@ResponseBody
	@RequestMapping("/saveStaffManuf")
	public String saveStaffManuf(HttpServletRequest request, 
			int id_StaffManuf, String NameStaffManuf, String DepartStaffManuf, String NoStaffManuf,  
			String BirthStaffManuf,String JobStaffManuf, String TitlesStaffManuf, String StatusStaffManuf, String RemarkStaffManuf
			) {
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
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
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
	//删除
	@ResponseBody
	@RequestMapping("deleteStaffManufList")
	public String deleteStaffManufList(String id_StaffManuf){
		Map para = new HashMap();
		para.put("id_StaffManuf", id_StaffManuf);
		try {
			staffManufService.deleteStaffManufList(para);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}	
		return "1";
	}
		
}
