package com.qf.document.document.controller;

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

import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;
import com.qf.document.document.service.documentService;
@Controller
@RequestMapping("/document")
public class documentController extends BaseController{

	@Resource(name = "documentService")
	private documentService documentService;
	
	//列表
	@RequestMapping("/documentList")
	public ModelAndView documentList(Page page, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= documentService.queryDocumentList(page);//查询
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			
			mv.addObject("document", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/document/document/document_list");
		return mv;
	}
	
	//去添加页面
	@RequestMapping(value="/goAddDocument")
	public ModelAndView goAddDocument(String id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
			
		Map para = new HashMap();
		para.put("id_Document", id);
		Map document = documentService.queryDocumentListById(para);//查询标准机床

		mv.setViewName("/WEB-INF/document/document/document_edit");
		mv.addObject("turn_url", turn_url);
		mv.addObject("document", document);
		
		mv.addObject("pd", pd);
		
		return mv;
	}
    
	
    /**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/saveDocument")
	public String saveDocument(HttpServletRequest request, 
			int id_Document, String title, String text
			) {
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		Map para = new HashMap();
		
		para.put("id_Document", id_Document);
		para.put("title", title);
		para.put("text", text);
		
		try {
			if(id_Document != 0){//修改
				documentService.updateDocument(para);
			}else{//新增
				documentService.saveDocument(para);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
	//删除
	@ResponseBody
	@RequestMapping("deleteDocumentList")
	public String deleteDocumentList(String id_Document){
		Map para = new HashMap();
		para.put("id_Document", id_Document);
		try {
			documentService.deleteDocumentList(para);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}	
		return "1";
	}
	
	//帮助页
	@RequestMapping(value="/help")
	public ModelAndView help()throws Exception{
		ModelAndView mv = this.getModelAndView();

		mv.setViewName("/WEB-INF/document/document/help");
		
		return mv;
	}
	
	
	
	
}



