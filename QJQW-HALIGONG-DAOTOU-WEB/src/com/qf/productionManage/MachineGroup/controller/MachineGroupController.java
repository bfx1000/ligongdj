package com.qf.productionManage.MachineGroup.controller;

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

import com.qf.productionManage.MachineGroup.service.MachineGroupService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/MachineGroup")
public class MachineGroupController extends BaseController{
	
	@Resource(name = "MachineGroupService")
	private MachineGroupService machineGroupService;
	
	
	//列表
	@RequestMapping("/MachineGroupList")
	public ModelAndView MachineGroupList(Page page, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= machineGroupService.queryMachineGroupList(page);//查询零件页面
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			
			mv.addObject("MachineGroup", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/productionManage/MachineGroup/MachineGroup_list");
		return mv;
	}
	
	
	
	
	//去添加页面
	@RequestMapping(value="/goAddMachineGroup")
	public ModelAndView goAddMachineGroup(String id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
			
		Map para = new HashMap();
		para.put("id_MachineGroup", id);
		Map MachineGroup = machineGroupService.queryMachineGroupListById(para);//查询标准机床

		mv.setViewName("/WEB-INF/productionManage/MachineGroup/MachineGroup_edit");
		mv.addObject("turn_url", turn_url);
		mv.addObject("MachineGroup", MachineGroup);
		
		mv.addObject("pd", pd);
		
		return mv;
	}
    
	
	
    /**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/saveMachineGroup")
	public String saveMachineGroup(HttpServletRequest request, 
			int id_MachineGroup, String SuperiorMachineGroup, String NameMachineGroup, String NoMachineGroup,  
			String AddressMachineGroup,String PrincipalMachineGroup, String RemarkMachineGroup,String LevelMachineGroup
			) {
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		Map para = new HashMap();
		
		List<Map> MachineGroup = null;
		
		MachineGroup = machineGroupService.loadingMachineGroup();
		for(int i = 0;i<MachineGroup.size();i++){
			String name = ""+MachineGroup.get(i).get("NameMachineGroup");
			if(NameMachineGroup.equals(name)&&id_MachineGroup==0){
				return "-1";
			}
		}
		
		para.put("id_MachineGroup", id_MachineGroup);
		
		if(SuperiorMachineGroup==null || "".equals(SuperiorMachineGroup)){
			para.put("SuperiorMachineGroup", "无");
		}else{
			para.put("SuperiorMachineGroup", SuperiorMachineGroup);
		}
		
		para.put("NameMachineGroup", NameMachineGroup);
		para.put("NoMachineGroup", NoMachineGroup);
		para.put("AddressMachineGroup", AddressMachineGroup);
		para.put("PrincipalMachineGroup", PrincipalMachineGroup);
		para.put("RemarkMachineGroup", RemarkMachineGroup);
		if(LevelMachineGroup==null || "".equals(LevelMachineGroup)){
			para.put("LevelMachineGroup", "1");
		}else{
			para.put("LevelMachineGroup", LevelMachineGroup);
		}
		
		
		try {
			if(id_MachineGroup != 0){//修改
				machineGroupService.updateMachineGroup(para);
			}else{//新增
				machineGroupService.saveMachineGroup(para);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
	
	
	
	//删除
	@ResponseBody
	@RequestMapping("deleteMachineGroupList")
	public String deleteMachineGroupList(String id_MachineGroup){
		Map para = new HashMap();
		para.put("id_MachineGroup", id_MachineGroup);
		try {
			machineGroupService.deleteMachineGroupList(para);
			
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
		List<Map> MachineGroup = null;
		
		MachineGroup = machineGroupService.loadingMachineGroup();
			
		mv.addObject("MachineGroup",MachineGroup);	
		mv.setViewName("/WEB-INF/productionManage/MachineGroup/MachineGroup_loading");
		return mv;
	}
	
}
