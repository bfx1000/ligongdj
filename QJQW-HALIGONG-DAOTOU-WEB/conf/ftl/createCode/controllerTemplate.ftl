package com.qf.${packageName}.${objectNameLower}.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotNull;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qf.system.menu.model.Menu;
import com.qf.${packageName}.${objectNameLower}.model.${objectName};
import com.qf.${packageName}.${objectNameLower}.service.${objectName}Service;
import com.qf.util.AppUtil;
import com.qf.util.ObjectExcelView;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;
/** 
 * 类名称：${objectName}Controller
 * 创建人：周广文
 * 创建时间：${nowDate?string("yyyy-MM-dd")}
 */
@Controller
@RequestMapping(value="/qjqwmain/${objectNameLower}")
public class ${objectName}Controller extends BaseController{
	@Resource(name="${objectNameLower}Service")
	private ${objectName}Service ${objectNameLower}Service;
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增${objectName}");
		ModelAndView mv = this.getModelAndView();
				    PageData pd=new PageData();
				pd=this.getPageData();
			int i=${objectNameLower}Service.save(pd);
			if(i>0){
				mv.addObject("msg","success");
				mv.setViewName("save_result");
				return mv;
			}else{
				mv.addObject("msg","error");
				mv.setViewName("save_result");
				return mv;
			}
	}
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete( PrintWriter out){
		logBefore(logger, "删除${objectName}");
		try{
				    PageData pd=new PageData();
				pd=this.getPageData();
		   int i=${objectNameLower}Service.delete(pd);
		   if(i>0){
			out.write("success");
			out.close();
		   }else{
			   out.write("error");
				out.close();
		   }
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, "修改${objectName}");
		ModelAndView mv = this.getModelAndView();
				    PageData pd=new PageData();
				pd=this.getPageData();
		   int i= ${objectNameLower}Service.edit(pd);
		   if(i>0){
		   mv.addObject("msg","success");
		   mv.setViewName("save_result");
		   return mv;
		   }else{
			   mv.addObject("msg","error");
			   mv.setViewName("save_result");
			   return mv;
		   }
	}
	
	/**
	 * 列表
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表${objectName}");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			
		   this.getHC(); //调用权限
			//////////////////////////////
			Map<String,Object> map = ${objectNameLower}Service.list(page);
			page = (Page)map.get("page");
			List<Map<String,Object>> list = (List<Map<String,Object>>)map.get("list");
			mv.addObject("varList", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
			mv.setViewName("/WEB-INF/${packageName}/${objectNameLower}/${objectNameLower}_list");
			
			
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		logBefore(logger, "去新增${objectName}页面");
		ModelAndView mv = this.getModelAndView();
		try {
			mv.setViewName("/WEB-INF/${packageName}/${objectNameLower}/${objectNameLower}_edit");
			mv.addObject("msg", "save");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		logBefore(logger, "去修改${objectName}页面");
		ModelAndView mv = this.getModelAndView();
		try {
				    PageData pd=new PageData();
				pd=this.getPageData();
			${objectName} ${objectNameLower} =${objectNameLower}Service.findById(pd);	//根据ID读取
			mv.setViewName("/WEB-INF/${packageName}/${objectNameLower}/${objectNameLower}_edit");
			mv.addObject("msg", "edit");
			mv.addObject("${objectNameLower}", ${objectNameLower});
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		logBefore(logger, "批量删除${objectName}");
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				${objectNameLower}Service.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	
	/* ===============================权限================================== */
	@SuppressWarnings("unchecked")
	public void getHC(){
		ModelAndView mv = this.getModelAndView();
		HttpSession session = this.getRequest().getSession();
		Map<String, String> map = (Map<String, String>)session.getAttribute(Const.SESSION_QX);
		mv.addObject(Const.SESSION_QX,map);	//按钮权限
		List<Menu> menuList = (List<Menu>)session.getAttribute(Const.SESSION_menuList);
		mv.addObject(Const.SESSION_menuList, menuList);//菜单权限
	}
	/* ===============================权限================================== */
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
