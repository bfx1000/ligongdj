package com.qf.system.user.controller;




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
@RequestMapping("/qjqwmain/systemuser")
public class SystemUserController  extends BaseController{
    @Resource(name="systemuserService")
    private SystemUserServiceI systemuserService;  // 系统用户管理service
  
    

    
	protected Logger logger = Logger.getLogger(this.getClass()); //log4j	
	String menuUrl = "/qjqwmain/systemuser/listUsers"; //菜单地址(权限用)


	
	
	


	@RequestMapping("view")
	public ModelAndView view(){
//		ModelAndView mv=new ModelAndView();
//		List<Map<String, Object>> user=systemuserService.findMonUser();
//		String [] users=new String[user.size()];
//		String [] times=new String[user.size()];
//		for(int i=0;i<user.size();i++){
//			users[i]=user.get(i).get("users").toString();
//			times[i]=user.get(i).get("times").toString();
//		}
//		mv.addObject("user",user);
//		mv.addObject("users",users);
//		mv.addObject("times",times);
//		mv.setViewName("/WEB-INF/system/admin/default");
		return null;
	}
	
	
	/**
	 * 查询用户列表
	 * @return
	 */
	@RequestMapping("queryUserList")
	public ModelAndView queryUserList(Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		
		try {
			
			pd = this.getPageData();
			
			if(user != null){
				pd.put("user_id", user.get("user_id"));
				pd.put("user_type", user.get("user_type"));
			}else{
				pd.put("user_type", 9);
			}
			page.setPd(pd);
			Map map	= systemuserService.queryUserList(page);
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			
			mv.addObject("userList", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/system/user/userList");
		return mv;
	}
	
	/**
	 * 去新增用户页面
	 */
	@RequestMapping(value="/goAddU")
	public ModelAndView goAddU(String user_id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		mv.setViewName("/WEB-INF/system/user/user_edit");
		mv.addObject("msg", "saveU");
		mv.addObject("pd", pd);
		mv.addObject("user_id", user_id);
		mv.addObject("turn_url", turn_url);

		return mv;
	}
	
	/**
	 * 判断用户名是否存在
	 */
	@ResponseBody
	@RequestMapping(value="/hasU")
	public Object hasU(String user_id, String user_name){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			Map para = new HashMap();
			para.put("user_id", user_id);
			para.put("user_account", user_name);
			System.out.println(systemuserService.findByUId(para));
			if(systemuserService.findByUId(para) != null && ((List<Map>)systemuserService.findByUId(para)).size() > 0){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	
	
	/**
	* saveU(新增用户)
	* TODO(接收前台传入的用户对象)
	* TODO(验证用户对象,如有错误返回Errors)
	* TODO(设置用户最新登录时间为当前时间)
	* TODO(加密用户密码,后台用户密码使用shiro的加密方式)
	* TODO(添加完成返回到用户管理)
	* @param SystemUser
	* @param @return 设定文件
	* @return ModelAndView
	* @Exception 异常对象
	* @since  CodingExample　Ver(编码范例查看) 1.1
	*/
	@ResponseBody
	@RequestMapping("/saveU")
	public String saveU(String user_id, String user_name, String user_nick_name, String password, String user_activation, String user_type ) {
		try {
			Map user = new HashMap();
			MD5 m = new MD5();
			String passwd = m.getMD5ofStr(password); //密码加密
			user.put("user_pwd", passwd);
			user.put("user_account", user_name);
			user.put("user_nick_name", user_nick_name);
			user.put("user_activation", user_activation);
			user.put("user_type", user_type);
			long add_time = System.currentTimeMillis() / 1000;
			user.put("user_add_time", add_time);
			systemuserService.saveUser(user);
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
	
	
	@RequestMapping(value="/goEditU")
	public ModelAndView goEditU(String user_id, String turn_url) {
		ModelAndView mv = this.getModelAndView();
		Map para = new HashMap();
		para.put("user_id", user_id);
		Map user = systemuserService.queryUserById(para);							//根据ID读取
		mv.setViewName("/WEB-INF/system/user/user_edit");
		mv.addObject("msg", "editU");
		mv.addObject("user", user);
		mv.addObject("turn_url", turn_url);
		
		return mv;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/editU")
	public String editU(String user_id, String user_name, String user_nick_name, String name, String user_activation, String user_type) {
		try {
			Map user = new HashMap();
			user.put("user_account", user_name);
			user.put("user_nick_name", user_nick_name);
			user.put("user_activation", user_activation);
			user.put("user_id", user_id);
			user.put("user_type", user_type);
			systemuserService.editU(user);
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
	
	
	@RequestMapping("queryMenuListForUser")
	public ModelAndView queryMenuListForUser(HttpServletRequest request, String user_id, String user_type){
		ModelAndView mv=new ModelAndView();
		
//		HttpSession session = request.getSession();
//		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
//	
//		if(user != null){//已登录
//			mv.addObject("user_id", user.get("user_id"));
//		}else{//未登录
//			mv.addObject("user_id", 0);
//		}
//		
		Map para = new HashMap();
		para.put("user_id", user_id);
		para.put("user_type", user_type);
		
		
		// 读取层次数据结果集列表 
		List dataList = systemuserService.queryMenuListForUser(para);  

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
				System.out.println(node);
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
		mv.addObject("user_id", user_id);
		mv.addObject("user_type", user_type);

		mv.setViewName("/WEB-INF/system/user/treeFileListForUser");
		return mv;
	}
	
	
	
	/**
	 * 保存用户授权
	 * @param ids
	 * @param user_id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/saveMenuListForUser")
	public String saveMenuListForUser(String ids, String user_id) {
		Map para = new HashMap();
		para.put("user_id", user_id);
		try {
			//将此用户所有可下载文件清空
			systemuserService.clearMenuListForUser(para);
			System.out.println("1111111111111");
			if(ids != null && !"".equals(ids)){
				String id[] = ids.split(",");
				if(id != null && id.length > 0){
					for(int i=0;i<id.length;i++){
						String menu_id = id[i];
						if(menu_id != null && !"".equals(menu_id)){//授权
							para.put("menu_id", menu_id);
							systemuserService.saveMenuListForUser(para);
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
