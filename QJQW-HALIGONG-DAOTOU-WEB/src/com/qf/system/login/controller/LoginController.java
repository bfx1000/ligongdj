package com.qf.system.login.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotNull;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itextpdf.text.log.SysoCounter;
import com.qf.system.login.service.LoginService;
import com.qf.tool.turningBlade.service.TurningBladeService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.common.MD5;
import com.qf.util.common.Tools;
import com.qf.util.page.Page;




/**
*
* 项目名称：qf
* 类名称：AppUserController
* 类描述：手机用户管理
* 创建人：郭桦
* 创建时间：2015年5月18日  
* @version
*
*/
@SuppressWarnings("all")
@Controller
@RequestMapping("/index")
public class LoginController {

	@Resource(name="loginService")
	private LoginService loginService;
	
	@Resource(name="turningBladeService")
	private TurningBladeService turningBladeService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/index")
	public ModelAndView login_index(HttpServletRequest request){
		System.out.println("----------------");
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		ModelAndView mv = this.getModelAndView();
		try{
				
	        List<Map> topMenuList = new ArrayList<Map>();
	        Map para = new HashMap();
	        if(user != null){//用户登录
	        	para.put("user_id", user.get("user_id"));
	        	mv.addObject("userName",user.get("user_nick_name"));
	        }else{//未登录状态
	        	para.put("user_id", 0);
//	        	topMenuList = loginService.queryTopMenuListByUserTypeId(para);//根据用户角色id查询一级菜单
	        	System.out.println(session.getAttribute("errInfo"));
	        }
	        topMenuList = loginService.queryTopMenuListByUserId(para);//根据user_id查询一级菜单
			
			
		 	
			mv.setViewName("/index");
			mv.addObject("topMenuList", topMenuList);
			
		} catch(Exception e){
			e.printStackTrace();
			mv.setViewName("/WEB-INF/system/admin/login");
		}
		return mv;
	}
	
	/**
	 * 得到ModelAndView
	 */
	public ModelAndView getModelAndView(){
		return new ModelAndView();
	}
	
	
	/**
	* toLogin(跳转到登录页面)
	* @param name
	* @param @return 设定文件
	* @return ModelAndView
	* @Exception 异常对象
	* @since  CodingExample　Ver(编码范例查看) 1.1
	*/
	@RequestMapping(value="/eb61f5097ea96a579a0c470752ef9bbb")
	public ModelAndView toLogin(HttpServletRequest request)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData(request);
//		pd = this.getPageData();
//		setParam(request);
		
		mv.setViewName("/WEB-INF/system/admin/login");
		mv.addObject("pd",pd);
		return mv;
	}
	
	
	
	/**
	* login(请求登录，验证用户)
	* TODO(接收前台传入的用户名,密码,验证码)
	* TODO(获取shiro管理的session)
	* TODO(读取session中的验证码)
	* TODO(判断前台传入验证码是否为空)
	* TODO(判断session中的验证码是否为空,并比较前台传入的验证码和session中的验证码)
	* TODO(判断错误则返回登录页面)
	* TODO(判断用户名密码是否正确)
	* TODO(正确则在session中放置用户信息,并跳转到后台)
	* TODO(错误返回错误信息)
	* @param name
	* @param @return 设定文件
	* @return ModelAndView
	* @Exception 异常对象
	* @since  CodingExample　Ver(编码范例查看) 1.1
	*/
	@RequestMapping(value="/login_login"  , method= RequestMethod.POST)
	public ModelAndView login(String loginname,String password,String code, HttpServletRequest request)throws Exception{
		System.out.println(loginname+","+password+","+code);
		ModelAndView mv = this.getModelAndView();
		HttpSession session = request.getSession();
		String sessionCode = (String)session.getAttribute(Const.SESSION_SECURITY_CODE);		//获取session中的验证码
		String errInfo = "";
		Map u = null;
		
		String USERNAME = loginname;
		String PASSWORD  = password;
		String codes = code;
		if(null == codes || "".equals(codes)){
			mv.setViewName("redirect:/login_login");
		}else{
			if(Tools.notEmpty(sessionCode) && sessionCode.equalsIgnoreCase(codes)){
				
				
				 
				MD5 md5 = new MD5();
				String passwd =md5.getMD5ofStr(PASSWORD);
				Map<String,String> us=new HashMap<String, String>();
				us.put("user_name", USERNAME);
				us.put("password",passwd);
				 u = loginService.getUserByNameAndPwd(us);
				if(u != null){
					session.setAttribute("USER_ID",u.get("user_id"));
					session.setAttribute(Const.SESSION_USERNAME, u.get("user_name"));//用户名
					session.setAttribute(Const.SESSION_ADMIN, u);
					session.setAttribute("user_type", u.get("user_type"));
				}else{
					errInfo = "用户名或密码有误！";
				}
				
			}else{
				errInfo = "验证码输入有误！";
			}
			
		}
		if(Tools.isEmpty(errInfo)){
			mv.setViewName("redirect:/index/index");
		}else{
			/*mv.addObject("errInfo", errInfo);
			mv.addObject("loginname",USERNAME);
			mv.addObject("password",PASSWORD);*/
			session.setAttribute("errInfo", errInfo);
			session.setAttribute("loginname", USERNAME);
			session.setAttribute("password", PASSWORD);
			mv.setViewName("redirect:/index/index");
		}
		mv.addObject("user",u);
		return mv;
	}
	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goEditPwd")
	public ModelAndView goEditPwd(@NotNull String user_id, String turn_url){
		
		ModelAndView mv = this.getModelAndView();
		try {
			
			mv.addObject("user_id", user_id);
			mv.addObject("msg", "editPwd");
			mv.addObject("turn_url", turn_url);
			mv.setViewName("/WEB-INF/system/user/pwd_edit");
			
		} catch (Exception e) {
			e.printStackTrace();
		}						
		return mv;
	}	
	
	

	@ResponseBody
	@RequestMapping(value="/editPwd")
	public String editPwd(String user_id, String pwd){
		try {
			Map m = new HashMap();
			m.put("user_id", user_id);
			MD5 md5 = new MD5();
			String passwd =md5.getMD5ofStr(pwd);
			m.put("pwd", passwd);
			loginService.updatePwdByUserId(m);//修改用户密码
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}	
	
	
	
	
	
	
	/**
	 * 跳转审核页面
	 * @param user_id
	 * @return
	 */
	@RequestMapping(value="/goCheckUser")
	public ModelAndView goCheckUser(@NotNull String user_id){
		
		ModelAndView mv = this.getModelAndView();
		try {
			
			mv.addObject("user_id", user_id);
			mv.addObject("msg", "editPwd");
			mv.setViewName("/WEB-INF/system/user/check_user");
			
		} catch (Exception e) {
			e.printStackTrace();
		}						
		return mv;
	}	
	

	/**
	 * 审核
	 * @param user_id
	 * @param pwd
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/checkUser")
	public String checkUser(String user_id, String user_partner_status){
		try {
			Map m = new HashMap();
			m.put("user_id", user_id);
			m.put("user_partner_status", user_partner_status);
			loginService.updateUserForUserPartnerStatus(m);//审核
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}	
	
	/**
	 * 删除用户
	 * @param user_id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deleteUser")
	public String deleteUser(String user_id){
		try {
			Map m = new HashMap();
			m.put("user_id", user_id);
			loginService.deleteUserById(m);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}	
	
	
	/**
	* logout(用户注销方法)
    * TODO(清除session中的用户信息)
    * TODO(注销shiro Subject)
    * TODO(跳转到登录页)
	* @param name
	* @param @return 设定文件
	* @return String DOM对象
	* @Exception 异常对象
	* @since  CodingExample　Ver(编码范例查看) 1.1
	*/
	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		session.removeAttribute(Const.SESSION_ADMIN);
		
//		try {
//			response.sendRedirect(request.getContextPath() + "/index/eb61f5097ea96a579a0c470752ef9bbb");
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
		
		
		mv.setViewName("redirect:/index/index");
		mv.addObject("pd",pd);
		return mv;
	}
	
	
	
	/**
	 * 根据一级菜单查询二级菜单
	 * @param request
	 * @param response
	 * @param menu_id
	 * @return
	 */
	@RequestMapping(value="/querySecondMenuListById")
	public ModelAndView querySecondMenuListById(HttpServletRequest request, HttpServletResponse response, String parent_id){
		ModelAndView mv = this.getModelAndView();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		
		Map para = new HashMap();
		para.put("parent_id", parent_id);
		
		if(user != null){//已登录
			para.put("user_id", user.get("user_id"));
		}else{
			para.put("user_id", "0");
		}
		List<Map> menuList = loginService.querySecondMenuListById(para);//根据一级菜单查询二级菜单
		if(menuList != null && menuList.size() > 0){
			Map secondMenu = menuList.get(0);
			int second_menu_id = (int) secondMenu.get("menu_id");
			Map m = new HashMap();
			m.put("parent_id", second_menu_id);
			if(user != null){//已登录
				m.put("user_id", user.get("user_id"));
			}else{
				m.put("user_id", "0");
			}
			System.out.println(menuList);
			List<Map> thirdMenuList = loginService.querySecondMenuListById(m);//根据二级菜单查询三级菜单
			System.out.println(thirdMenuList);
			System.out.println(secondMenu);
			secondMenu.put("thirdMenuList", thirdMenuList);
			System.out.println(secondMenu);
			menuList.set(0, secondMenu);
			if(thirdMenuList != null && thirdMenuList.size() > 0){//有三级菜单
				//Map fourthMenu = thirdMenuList.get(0);
				Map thirdMenu = thirdMenuList.get(0);
				mv.addObject("menu_id", thirdMenu.get("menu_id"));
				mv.addObject("menu_name", thirdMenu.get("menu_name"));
				mv.addObject("menu_url", thirdMenu.get("menu_url"));
				mv.addObject("parent_menu_name", secondMenu.get("menu_name"));
				mv.addObject("menu_flag", "3");
				
			}else{//只有两层菜单
				mv.addObject("menu_id", secondMenu.get("menu_id"));
				mv.addObject("menu_name", secondMenu.get("menu_name"));
				mv.addObject("menu_url", secondMenu.get("menu_url"));
				mv.addObject("menu_flag", "2");
			}
			
			
		}
		mv.addObject("menuList",menuList);
		System.out.println(menuList);
		mv.setViewName("/WEB-INF/system/common/menu");
		return mv;
	}
	
	
	
	
	
	@RequestMapping(value="/goIndex")
	public ModelAndView goIndex(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = this.getModelAndView();
		
		
		
		
		mv.setViewName("/WEB-INF/system/common/default");
		return mv;
	}
	
	
	
	
	@RequestMapping(value="/goContent")
	public ModelAndView goContent(HttpServletRequest request, HttpServletResponse response, String menu_id, String menu_name){
		
		ModelAndView mv = this.getModelAndView();
		mv.addObject("menu_id", menu_id);
		mv.addObject("menu_name", menu_name);
		
		mv.setViewName("/WEB-INF/system/common/content");
		return mv;
	}
	
	
	@RequestMapping(value="/goTable")
	public ModelAndView goTable(HttpServletRequest request, HttpServletResponse response, String menu_id){
		
		ModelAndView mv = this.getModelAndView();
		
//		mv.addObject("menu_id",menu_id);
		
		mv.setViewName("/table");
		return mv;
	}
	
	
	/**
	 * 查询三级菜单
	 * @param menu_id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/queryThirdMenuList")
	public List<Map> queryThirdMenuList(HttpServletRequest request, String menu_id){
		
		Map para = new HashMap();
		List<Map> list = null;
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		
		
		if(user != null){//已登录
			para.put("user_id", user.get("user_id"));
		}else{
			para.put("user_id", "0");
		}
		
		try {
			
			para.put("parent_id", menu_id);
			list = loginService.querySecondMenuListById(para);
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}						
		return list;
	}	
	
	
	/**
	 * 搜索
	 */
	@RequestMapping(value="/search")
	public ModelAndView search(Page page, HttpServletRequest request,String NumberTurningBlade){
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		
		if(user != null){
			//已登录
		}else{
			//未登录
		}
		
		Map map	= null;
		ModelAndView mv = new ModelAndView();
		
		PageData pd = new PageData();
		
		pd.put("NumberTurningBlade", NumberTurningBlade);
		
		page.setPd(pd);
		
		map	= turningBladeService.queryTurningBladeList(page);//查询刀片列表
		page = (Page)map.get("page");
		List<Map> list = (List<Map>)map.get("list");
		
		System.out.println(list);
		mv.addObject("turningBladeList",list);
		mv.addObject("pd",pd);
		mv.addObject("page",page);
		mv.setViewName("/WEB-INF/system/search");
		return mv;
		
	}
	
	
	
	
	
	
	
	
	
}










