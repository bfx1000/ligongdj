package com.qf.system.login.dao;

import java.util.List;
import java.util.Map;




public interface LoginMapper {
    
	List<Map> listAllMenu(Map u);
	
	Map getUserInfo(Map<String, String> us);
	
	//修改用户密码
	public void updatePwdByUserId(Map m);
	
	//审核
	public void updateUserForUserPartnerStatus(Map m);
	
	public void deleteAdviceByUserId(Map m);
	public void deleteCommentByUserId(Map m);
	public void deleteMsgByUserId(Map m);
	public void deleteUserByUserId(Map m);
	public void deleteUserInfoByUserId(Map m);
	
	//根据user_id查询一级菜单
	public List<Map> queryTopMenuListByUserId(Map para);
	
	//根据用户角色id查询一级菜单
	public List<Map> queryTopMenuListByUserTypeId(Map para);
	
	//根据一级菜单查询二级菜单
	public List<Map> querySecondMenuListById(Map para);
}