package com.qf.system.usertype.service;




import java.util.HashMap;
import java.util.List;
import java.util.Map;




import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

import com.qf.system.login.dao.LoginMapper;
import com.qf.system.user.dao.SystemUserMapper;
import com.qf.system.usertype.dao.UserTypeMapper;
import com.qf.util.PageData;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;



@Service("userTypeService")
public class UserTypeServiceImpl implements UserTypeService {
	private UserTypeMapper mapper;
	
	public UserTypeMapper getMapper() {
		return mapper;
	}
	
	@Autowired
	public void setMapper(UserTypeMapper mapper) {
		this.mapper = mapper;
	}

	//用户角色列表
	public Map queryUserTypeList(Page page){
		Map<String, Object> map = new HashMap<String, Object>();
	     PageHelper.startPage(page); // 起始位置，长度
	     List<Map> list =  mapper.queryUserTypeList(page.getPd());
	     Page p = PageHelper.endPage();
	     page.setRowCount(p.getRowCount());
	     page.setPageCount(p.getPageCount());
	     map.put("page", page);
	     map.put("list", p.getResult());
	     return map;
	}
	
	//新增角色
	public void saveUserType(Map usertype){
		mapper.saveUserType(usertype);
	}
	
	//修改角色
	public void updateUserType(Map usertype){
		mapper.updateUserType(usertype);
	}
	
	//删除角色
	public void deleteUserType(Map m){
		mapper.deleteUserType(m);
	}
	
	//角色菜单授权列表
	public List<Map> queryMenuListForUserType(Map para){
		return mapper.queryMenuListForUserType(para);
	}
	
	
	//清空此角色的授权信息
	public void clearMenuListForUserType(Map para){
		mapper.clearMenuListForUserType(para);
	}
	
	//保存此角色的授权信息
	public void saveMenuListForUserType(Map para){
		mapper.saveMenuListForUserType(para);
	}
	
	//查询用户角色
	public Map queryUserTypeById(Map para){
		return mapper.queryUserTypeById(para);
	}
}
