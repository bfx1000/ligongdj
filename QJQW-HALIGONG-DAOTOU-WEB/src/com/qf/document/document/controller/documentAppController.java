package com.qf.document.document.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qf.document.document.service.documentService;
import com.qf.util.PageData;
import com.qf.util.common.JackJson;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/documentApp")
public class documentAppController {

	@Resource(name = "documentService")
	private documentService documentService;
	
	//列表
	@ResponseBody
	@RequestMapping(value = "/documentList",produces = "application/json; charset=utf-8")
	public String documentList(int pageNo, int pageSize,
			 String title){
		ModelAndView mv=new ModelAndView();
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		try{
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("title", title);
			
			page.setPd(pd);
			map	= documentService.queryDocumentList(page);//查询
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
		para.put("title", title);
		resultmap.put("para",para);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	/** 
	 * 去添加
	 */
	@ResponseBody
	@RequestMapping(value="/goAddDocument" ,produces = "application/json; charset=utf-8")
	public String goAddDocument(String id)throws Exception{
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		Map para = new HashMap();
		para.put("id_Document", id);
		Map document = documentService.queryDocumentListById(para);//查询
		if(document != null){
			resultmap.put("result", "1");
		}
		
		resultmap.put("document", document);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	/**
	 * 添加/修改
	 */
	@ResponseBody
	@RequestMapping(value = "/saveDocument", produces = "application/json; charset=utf-8")
	public String saveDocument(String user_id, 
			int id_Document, String title, String text
			) {
	
		String json  = "";  
		Map resultmap = new HashMap();
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
	@RequestMapping(value = "/deleteDocumentList", produces = "application/json; charset=utf-8")
	public String deleteDocumentList(String id_Document) {
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		para.put("id_Document", id_Document);
		try {
			documentService.deleteDocumentList(para);
			
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
