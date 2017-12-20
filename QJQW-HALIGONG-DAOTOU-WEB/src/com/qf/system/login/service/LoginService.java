package com.qf.system.login.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.transaction.annotation.Transactional;





@SuppressWarnings("all")
public interface LoginService {
	
	//获得菜单
	public List<Map> listAllMenu(Map u); 
	
	public Map getUserByNameAndPwd(Map<String, String> us);
	
	//修改用户密码
	public void updatePwdByUserId(Map m);
	
	//审核
	public void updateUserForUserPartnerStatus(Map m);
	
	//删除用户
	public void deleteUserById(Map m);
	
	//根据user_id查询一级菜单
	public List<Map> queryTopMenuListByUserId(Map para);
	
	//根据用户角色id查询一级菜单
	public List<Map> queryTopMenuListByUserTypeId(Map para);
	
	//根据一级菜单查询二级菜单
	public List<Map> querySecondMenuListById(Map para);

}
