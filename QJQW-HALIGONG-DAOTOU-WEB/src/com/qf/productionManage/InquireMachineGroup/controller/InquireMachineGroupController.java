package com.qf.productionManage.InquireMachineGroup.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.servlet.ModelAndView;

import com.qf.machineTool.machineNodeInform.sercice.machineNodeInformService;
import com.qf.productionManage.InquireMachineGroup.service.InquireMachineGroupService;
import com.qf.productionManage.MachineGroup.service.MachineGroupService;
import com.qf.productionManage.ManufacturePlan.service.ManufacturePlanService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/InquireMachineGroup")
public class InquireMachineGroupController extends BaseController{

	@Resource(name = "ManufacturePlanService")
	private ManufacturePlanService manufacturePlanService;
	
	@Resource(name = "InquireMachineGroupService")
	private InquireMachineGroupService inquireMachineGroupService;
	
	@Resource(name = "machineNodeInformService")
	private machineNodeInformService machineNodeInformService;
	
	@Resource(name = "MachineGroupService")
	private MachineGroupService machineGroupService;
	
	//列表
	@RequestMapping("/InquireMachineGroupList")
	public ModelAndView InquireMachineGroupList(Page page, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= inquireMachineGroupService.queryInquireMachineGroupList(page);//查询
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			
			mv.addObject("InquireMachineGroup", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName("/WEB-INF/productionManage/InquireMachineGroup/InquireMachineGroup_list");
		return mv;
	}
	
	
	
	
	//去添加页面
	@RequestMapping(value="/goAddInquireMachineGroup")
	public ModelAndView goAddInquireMachineGroup(String id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
			
		Map para = new HashMap();
		para.put("id_InquireMachineGroup", id);
		Map InquireMachineGroup = inquireMachineGroupService.queryInquireMachineGroupById(para);//查询标准机床
		
		mv.setViewName("/WEB-INF/productionManage/InquireMachineGroup/InquireMachineGroup_edit");
		mv.addObject("turn_url", turn_url);
		mv.addObject("InquireMachineGroup", InquireMachineGroup);
		
		mv.addObject("pd", pd);
		
		return mv;
	}
    
	
	
	
    /**
	 * 保存
	 */
	
	@ResponseBody
	@RequestMapping("/saveInquireMachineGroup")
	public String saveInquireMachineGroup(HttpServletRequest request, 
			int id_InquireMachineGroup, String NumberMachGrNode, String ModelMachGrNode, String TypeMachGrNode,  
			String DepartmentMachGrNode,String WorkshopMachGrNode, String PositionMachGrNode, String NameMachineGroup, String PartNoMachGr,
			String PartNameMachGr,String SetMachGrStatus,String InquireMachGrStatus,String displayMachGrStatus,int id_ManufacturePlan
			) {
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		Map para = new HashMap();
		
		
		para.put("id_InquireMachineGroup", id_InquireMachineGroup);
		para.put("NumberMachGrNode", NumberMachGrNode);
		para.put("ModelMachGrNode", ModelMachGrNode);
		para.put("TypeMachGrNode", TypeMachGrNode);
		para.put("DepartmentMachGrNode", DepartmentMachGrNode);
		para.put("WorkshopMachGrNode", WorkshopMachGrNode);
		para.put("PositionMachGrNode", PositionMachGrNode);
		para.put("NameMachineGroup", NameMachineGroup);
		para.put("PartNoMachGr", PartNoMachGr);
		para.put("PartNameMachGr", PartNameMachGr);
		para.put("SetMachGrStatus", SetMachGrStatus);
		para.put("InquireMachGrStatus", InquireMachGrStatus);
		para.put("displayMachGrStatus", displayMachGrStatus);
		para.put("id_ManufacturePlan", id_ManufacturePlan);
		
		try {
			if(id_InquireMachineGroup != 0){//修改
				inquireMachineGroupService.updateInquireMachineGroup(para);
			}else{//新增
				inquireMachineGroupService.saveInquireMachineGroup(para);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
	
	//删除
	@ResponseBody
	@RequestMapping("deleteInquireMachineGroupList")
	public String deleteInquireMachineGroupList(String id_InquireMachineGroup){
		Map para = new HashMap();
		para.put("id_InquireMachineGroup", id_InquireMachineGroup);
		try {
			inquireMachineGroupService.deleteInquireMachineGroupList(para);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}	
		return "1";
	}
	
	
	//加载各种信息
	@RequestMapping("loading")
	public ModelAndView loading(@RequestParam(value="deputy") int deputy,Page page, String IDDeviceManufPlan,HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		page.setPd(pd);
		List<Map> list = new ArrayList<Map>();
		
		//1为查询加载机床节点
		if(deputy==1){
			Map map	= machineNodeInformService.queryMachineNodeInformList(page);//查询机床节点信息页面
			page = (Page)map.get("page");
			list = (List<Map>)map.get("list");
			
			List<Map> categoryMachineNodeInform = machineNodeInformService.queryCategoryMachineNodeInformList();
			mv.addObject("categoryMachineNodeInform", categoryMachineNodeInform);
			
			mv.addObject("machineNodeInformList", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
			
			mv.setViewName("/WEB-INF/productionManage/InquireMachineGroup/InquireMachineGroup_loadingMachineNodeInform");
		}
		if(deputy==2){
			Map map	= machineGroupService.queryMachineGroupList(page);//查询零件页面
			page = (Page)map.get("page");
			list = (List<Map>)map.get("list");
			
			mv.addObject("MachineGroup", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
			
			mv.setViewName("/WEB-INF/productionManage/InquireMachineGroup/InquireMachineGroup_loadingMachineGroup");
		}
		if(deputy==3){
			if(IDDeviceManufPlan==null||"".equals(IDDeviceManufPlan)){
				mv.addObject("result","请输入设备");
				mv.setViewName("/WEB-INF/productionManage/InquireMachineGroup/InquireMachineGroup_loadingManufacturePlan");
				return mv;
			}
			pd.put("IDDeviceManufPlan", IDDeviceManufPlan);
			page.setPd(pd);
			Map map	= inquireMachineGroupService.queryManufacturePlanListByNum(page);//查询零件页面
			page = (Page)map.get("page");
			list = (List<Map>)map.get("list");
			
			mv.addObject("ManufacturePlan", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
			
			mv.setViewName("/WEB-INF/productionManage/InquireMachineGroup/InquireMachineGroup_loadingManufacturePlan");
		}
		
		return mv;
	}
	
	
	//查看是否为使用状态
	@ResponseBody
	@RequestMapping("judgingState")
	public String judgingState(String startDate,String endDate){
	    Date Sdate = null;
	    Date Edate = null;
	    
	    Date NowDate = new Date();
	    long NowDate_Num = NowDate.getTime();//获取当前时间
	    
	    SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //时间格式     eg: 2017-04-14 10:19:33
	    
	    if(startDate!=null&&endDate!=null&&!"".equals(startDate)&&!"".equals(endDate)){   
		    try {
				Sdate = simpleDateFormat .parse(startDate); //将字符串转换成时间类型
				Edate = simpleDateFormat .parse(endDate);
				long Sdate_Num =  Sdate.getTime();	//转换成时间戳
				long Edate_Num =  Edate.getTime();
				
				if(NowDate_Num>Sdate_Num && NowDate_Num<Edate_Num){
					System.out.println("当前时间正在使用");
					return "1";
				}
				else{
					System.out.println("当前时间未使用");
					return "0";
				}
			} catch (ParseException e) {//格式错误异常
				e.printStackTrace();
				System.out.println("时间格式错误，导致转换失败！");
			}
	    }
		
		return "0";
	}
	
	
	
	
	//查看状态页面
	@RequestMapping("/MachineStatus")
	public ModelAndView MachineStatus(Page page, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		try {
			
			pd = this.getPageData();
			String NameMachineGroup = (String) pd.get("NameMachineGroup");
			System.out.println("工作组为："+NameMachineGroup);
			if(NameMachineGroup!=null && !"".equals(NameMachineGroup)){
				List<Map> SuperiorMachineGroup = new ArrayList<>();
				SuperiorMachineGroup = querySuperiorMachineGroupList(NameMachineGroup,SuperiorMachineGroup);
				System.out.println("工作组有值");
				List<String> name = new ArrayList<>();
				if(SuperiorMachineGroup!=null && !SuperiorMachineGroup.isEmpty()){
					System.out.println(SuperiorMachineGroup);
					for(int i = 0;i<SuperiorMachineGroup.size();i++){
						name.add(""+SuperiorMachineGroup.get(i).get("NameMachineGroup"));
					}
				}
				System.out.println(name.toString());
				pd.put("name", name);
			}
			page.setPd(pd);
			Map map	= inquireMachineGroupService.queryInquireMachineGroupList(page);//查询
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			
			mv.addObject("InquireMachineGroup", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName("/WEB-INF/productionManage/MachineStatus/MachineStatus_list");
		return mv;
	}

	//加载组所需方法
	private List<Map> querySuperiorMachineGroupList(String NameMachineGroup,List<Map> SuperiorMachineGroup){
		List<Map> SuperiorMachineGroupList = inquireMachineGroupService.querySuperiorMachineGroupList(NameMachineGroup);
		if(SuperiorMachineGroupList!=null && !"".equals(SuperiorMachineGroupList)){
			SuperiorMachineGroup.addAll(SuperiorMachineGroupList);
			for(int i = 0;i<SuperiorMachineGroupList.size();i++){
				if(Integer.valueOf(""+SuperiorMachineGroupList.get(i).get("LevelMachineGroup"))<4){
					querySuperiorMachineGroupList(""+SuperiorMachineGroupList.get(i).get("NameMachineGroup"),SuperiorMachineGroup);
				}
				
			}
		}
		return SuperiorMachineGroup;
	}
	
	
	//刷新状态方法
	@ResponseBody
	@RequestMapping("renovateState")
	public String renovateState(){
		
		List<Map> InquireMachineGroupAll = inquireMachineGroupService.queryInquireMachineGroupAllList();
		
		if(InquireMachineGroupAll!=null && !InquireMachineGroupAll.isEmpty()){
			for(int i=0;i<InquireMachineGroupAll.size();i++){
				int SetMachGrStatus = Integer.valueOf((String) InquireMachineGroupAll.get(i).get("SetMachGrStatus"));
				if(SetMachGrStatus!=1){
					continue;
				}else{
					int id_ManufacturePlan = Integer.valueOf(""+InquireMachineGroupAll.get(i).get("id_ManufacturePlan"));
					Map para = new HashMap<>();
					para.put("id_ManufacturePlan", id_ManufacturePlan);
					Map ManufacturePlan = manufacturePlanService.queryManufacturePlanById(para);
					String startDate = ""+ManufacturePlan.get("DateStartManufPlan");
					String endDate = ""+ManufacturePlan.get("DateFinishManufPlan");
					
					Date Sdate = null;
				    Date Edate = null;
					
					Date NowDate = new Date();
				    long NowDate_Num = NowDate.getTime();//获取当前时间
				    
				    SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //时间格式     eg: 2017-04-14 10:19:33
				    
				    if(startDate!=null&&endDate!=null&&!"".equals(startDate)&&!"".equals(endDate)){   
					    try {
							Sdate = simpleDateFormat .parse(startDate); //将字符串转换成时间类型
							Edate = simpleDateFormat .parse(endDate);
							long Sdate_Num =  Sdate.getTime();	//转换成时间戳
							long Edate_Num =  Edate.getTime();
							
							if(NowDate_Num>Sdate_Num && NowDate_Num<Edate_Num){
								InquireMachineGroupAll.get(i).put("InquireMachGrStatus", "2");
								InquireMachineGroupAll.get(i).put("displayMachGrStatus", "2");
								inquireMachineGroupService.updataStatus(InquireMachineGroupAll.get(i));
							}
							else{
								InquireMachineGroupAll.get(i).put("InquireMachGrStatus", "3");
								InquireMachineGroupAll.get(i).put("displayMachGrStatus", "3");
								inquireMachineGroupService.updataStatus(InquireMachineGroupAll.get(i));
							}
						} catch (ParseException e) {//格式错误异常
							e.printStackTrace();
							System.out.println("时间格式错误，导致转换失败！");
						}
				    }
				    
				    
				}
			}
		}
		return "1";
	
	}
	
	
	
	
	
}







