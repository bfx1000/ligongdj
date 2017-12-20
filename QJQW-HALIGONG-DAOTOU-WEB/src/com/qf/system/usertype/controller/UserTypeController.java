package com.qf.system.usertype.controller;




import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
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

import com.qf.system.user.service.SystemUserServiceI;
import com.qf.system.usertype.service.UserTypeService;
import com.qf.util.AppUtil;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.common.MD5;
import com.qf.util.controller.BaseController;
import com.qf.util.nodemodel.ReadNode;
import com.qf.util.page.Page;




/**
*
* 项目名称：qf
* 类名称：SystemUserController
* 类描述：用户管理
* 创建人：周广文
* 创建时间：2015年5月13日 下午2:02:00
* 修改人：周广文
* 修改时间：2015年5月13日 下午2:02:00
* 修改备注：
* @version
*
*/
@Controller
@RequestMapping("/usertype")
public class UserTypeController  extends BaseController{
    @Resource(name="userTypeService")
    private UserTypeService userTypeService;  // 系统用户管理service
  
    @RequestMapping("queryUserTypeList")
	public ModelAndView queryUserTypeList(Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= userTypeService.queryUserTypeList(page);//用户角色列表
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			
			mv.addObject("userTypeList", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/system/usertype/userTypeList");
		return mv;
	}
    
    
    
    
    /**
	 * 去新增角色页面
	 */
	@RequestMapping(value="/goAddUserType")
	public ModelAndView goAddUserType(String id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		Map para = new HashMap();
		para.put("id", id);
		Map userType = userTypeService.queryUserTypeById(para);//查询用户角色
		 
		mv.setViewName("/WEB-INF/system/usertype/user_type_edit");
		mv.addObject("msg", "saveUserType");
		mv.addObject("turn_url", turn_url);
		mv.addObject("usertype", userType);
		mv.addObject("pd", pd);

		return mv;
	}
    
	
	
	@ResponseBody
	@RequestMapping("/saveUserType")
	public String saveUserType(String id, String name ) {
		try {
			Map usertype = new HashMap();
			usertype.put("id", id);
			usertype.put("name", name);
			if(id == null || "".equals(id)){//新增角色
				userTypeService.saveUserType(usertype);
			}else{//修改角色
				userTypeService.updateUserType(usertype);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
	
	
	/**
	 * 删除角色
	 * @param user_id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deleteUserType")
	public String deleteUserType(String id){
		try {
			Map m = new HashMap();
			m.put("id", id);
			userTypeService.deleteUserType(m);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
	
	/**
	 * 查询菜单
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping("queryMenuListForUserType")
	public ModelAndView queryMenuListForUserType(HttpServletRequest request, String id){
		ModelAndView mv=new ModelAndView();
		
//		HttpSession session = request.getSession();
//		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
//	
//		if(user != null){//已登录
//			mv.addObject("user_id", user.get("user_id"));
//		}else{//未登录
//			mv.addObject("user_id", 0);
//		}
		
		Map para = new HashMap();
		para.put("user_type_id", id);
		
		
		// 读取层次数据结果集列表 
		List dataList = userTypeService.queryMenuListForUserType(para);  

		// 节点列表（散列表，用于临时存储节点对象）
		HashMap nodeList = new HashMap();
		// 根节点
		ReadNode root = null;
		// 根据结果集构造节点列表（存入散列表）
		for (Iterator it = dataList.iterator(); it.hasNext();) {
			Map dataRecord = (Map) it.next();
			ReadNode node = new ReadNode();
			node.menu_id = (int) dataRecord.get("menu_id");
			node.menu_name = (String) dataRecord.get("menu_name");
			node.menu_url = (String) dataRecord.get("menu_url");
			node.parent_id = (int) dataRecord.get("parent_id");
			node.menu_order = (int) dataRecord.get("menu_order");
			node.menu_type = (int) dataRecord.get("menu_type");
			node.user_type = (int) dataRecord.get("user_type");
			node.ismenu = (int) dataRecord.get("ismenu");
			node.level = (int) dataRecord.get("level");
			
			nodeList.put(node.menu_id, node);
		}
		// 构造无序的多叉树
		Set entrySet = nodeList.entrySet();
		for (Iterator it = entrySet.iterator(); it.hasNext();) {
			ReadNode node = (ReadNode) ((Map.Entry) it.next()).getValue();
		    System.out.println("node.parent_id === " + node.parent_id);
			if (node.parent_id == 0 ) {
			    root = node;
			} else {
			    ((ReadNode) nodeList.get(node.parent_id)).addChild(node);
			}
		}
		// 输出无序的树形菜单的JSON字符串
		System.out.println(root.toString());   
		// 对多叉树进行横向排序
		root.sortChildren();
		// 输出有序的树形菜单的JSON字符串
		System.out.println(root.toString()); 
		JSONObject jsonObjectFromMap = JSONObject.fromObject(root.toString()); 
		mv.addObject("json_tree", "["+jsonObjectFromMap+"]");
		mv.addObject("user_type_id", id);

		mv.setViewName("/WEB-INF/system/usertype/treeFileListForUserType");
		return mv;
	}
	
	/**
	 * 保存角色授权
	 * @param ids
	 * @param user_id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/saveMenuListForUserType")
	public String saveMenuListForUserType(String ids, String user_type_id) {
		Map para = new HashMap();
		para.put("user_type_id", user_type_id);
		try {
			//将此用户所有可下载文件清空
			userTypeService.clearMenuListForUserType(para);
			System.out.println("1111111111111");
			if(ids != null && !"".equals(ids)){
				String id[] = ids.split(",");
				if(id != null && id.length > 0){
					for(int i=0;i<id.length;i++){
						String menu_id = id[i];
						if(menu_id != null && !"".equals(menu_id)){//授权
							para.put("menu_id", menu_id);
							userTypeService.saveMenuListForUserType(para);
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
}
