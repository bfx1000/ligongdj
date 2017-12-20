package com.qf.productionManage.MachineUseRecord.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.qf.productionManage.MachineUseRecord.service.MachineUseRecordService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/MachineUseRecord")
public class MachineUseRecordController extends BaseController{

	@Resource(name = "MachineUseRecordService")
	private MachineUseRecordService machineUseRecordService;
	
	
	//列表
	@RequestMapping("/MachineUseRecordList")
	public ModelAndView MachineUseRecordList(Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= machineUseRecordService.queryMachineUseRecordList(page);//查询
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			
			mv.addObject("MachineUseRecord", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/productionManage/MachineUseRecord/MachineUseRecord_list");
		return mv;
	}
	
	
}
