package com.qf.system.usertype.service;

import java.util.List;
import java.util.Map;

import com.qf.util.PageData;
import com.qf.util.page.Page;






public interface UserTypeService {
	
	//用户角色列表
	public Map queryUserTypeList(Page page);
	
	//新增角色
	public void saveUserType(Map usertype);
	
	//修改角色
	public void updateUserType(Map usertype);
	
	//删除角色
	public void deleteUserType(Map m);
	
	//角色菜单授权列表
	public List<Map> queryMenuListForUserType(Map para);
	
	//清空此角色的授权信息
	public void clearMenuListForUserType(Map para);
	
	//保存此角色的授权信息
	public void saveMenuListForUserType(Map para);
	
	//查询用户角色
	public Map queryUserTypeById(Map para);
}
