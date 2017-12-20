package com.qf.system.login.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.qf.system.login.dao.LoginMapper;
import com.qf.util.IPutil;
import com.qf.util.common.DateUtil;


@SuppressWarnings("all")
@Service("loginService")
public class LoginServiceImpl implements LoginService {
	 
	private LoginMapper mapper;

	public LoginMapper getMapper() {
		return mapper;
	}
	
	@Autowired
	public void setMapper(LoginMapper mapper) {
		this.mapper = mapper;
	}
	
	//获得菜单
	public List<Map> listAllMenu(Map u){
		List<Map> rl = mapper.listAllMenu(u);
		return rl;
	}
	
	public Map getUserByNameAndPwd(Map<String, String> us){
		return (Map)mapper.getUserInfo( us);
	}
	
	//修改用户密码
	public void updatePwdByUserId(Map m){
		mapper.updatePwdByUserId(m);
	}
	
	//审核
	public void updateUserForUserPartnerStatus(Map m){
		mapper.updateUserForUserPartnerStatus(m);
	}

	//删除用户
	public void deleteUserById(Map m){
//		mapper.deleteAdviceByUserId(m);
//		mapper.deleteCommentByUserId(m);
//		mapper.deleteMsgByUserId(m);
		mapper.deleteUserByUserId(m);
//		mapper.deleteUserInfoByUserId(m);
	}
	
	//根据user_id查询一级菜单
	public List<Map> queryTopMenuListByUserId(Map para){
		return mapper.queryTopMenuListByUserId(para);
	}
	
	//根据用户角色id查询一级菜单
	public List<Map> queryTopMenuListByUserTypeId(Map para){
		return mapper.queryTopMenuListByUserTypeId(para);
	}
	
	//根据一级菜单查询二级菜单
	public List<Map> querySecondMenuListById(Map para){
		return mapper.querySecondMenuListById(para);
	}
	
}
