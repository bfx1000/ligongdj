package com.qf.system.user.dao;

import java.util.List;
import java.util.Map;

import com.qf.util.PageData;
import com.qf.util.entity.Page;



public interface SystemUserMapper {
	
	List<Map<String, Object>> findMonUser(long time);
	
	//查询用户列表
	List<Map> queryUserList(PageData pd);
	
	List<Map> findByUId(Map para);
	
	public void saveUser(Map user);
	
	public Map queryUserById(Map user);
	
	public void editU(Map user);
	
	public List<Map> queryMenuListForUser(Map para);
	
	//保存此用户的授权信息
	public void saveMenuListForUser(Map para);
	
	//清空此用户的授权信息
	public void clearMenuListForUser(Map para);
}