package com.qf.system.user.service;

import java.util.List;
import java.util.Map;

import com.qf.util.PageData;
import com.qf.util.page.Page;






public interface SystemUserServiceI {

	List<Map<String, Object>> findMonUser();
	
	//查询用户列表
	Map<String, Object> queryUserList(Page page);
	
	public List<Map> findByUId(Map para) throws Exception;
	
	public void saveUser(Map user);
	
	public Map queryUserById(Map user);
	
	public void editU(Map user);
	
	public List<Map> queryMenuListForUser(Map para);
	
	//保存此用户的授权信息
	public void saveMenuListForUser(Map para);
	
	
	
	//清空此用户的授权信息
	public void clearMenuListForUser(Map para);
}
