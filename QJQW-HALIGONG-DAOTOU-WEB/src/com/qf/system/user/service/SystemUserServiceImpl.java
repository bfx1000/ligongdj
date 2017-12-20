package com.qf.system.user.service;




import java.util.HashMap;
import java.util.List;
import java.util.Map;




import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

import com.qf.system.login.dao.LoginMapper;
import com.qf.system.user.dao.SystemUserMapper;
import com.qf.util.PageData;
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;



@Service("systemuserService")
public class SystemUserServiceImpl implements SystemUserServiceI {
	private SystemUserMapper mapper;
	
	public SystemUserMapper getMapper() {
		return mapper;
	}
	@Autowired
	public void setMapper(SystemUserMapper mapper) {
		this.mapper = mapper;
	}

	public List<Map<String, Object>> findMonUser(){
		long time =System.currentTimeMillis()/1000-24*30*60*60;
		return mapper.findMonUser(time);
	}
	
	//查询用户列表
	public Map<String, Object> queryUserList(Page page){
//		mapper.queryUserList();
		
		 Map<String, Object> map = new HashMap<String, Object>();
	     PageHelper.startPage(page); // 起始位置，长度
	     List<Map> list =  mapper.queryUserList(page.getPd());
	     Page p = PageHelper.endPage();
	     page.setRowCount(p.getRowCount());
	     page.setPageCount(p.getPageCount());
	     map.put("page", page);
	     map.put("list", p.getResult());
	     return map;
	        
	        
	}
	
	public List<Map> findByUId(Map para)throws Exception{
		return (List<Map>) mapper.findByUId(para);
	}
	
	public void saveUser(Map user){
		mapper.saveUser(user);
	}
	
	public Map queryUserById(Map user){
		return (Map) mapper.queryUserById(user);
	}
	
	@Override
	public void editU(Map user){
		mapper.editU(user);
	}
	
	public List<Map> queryMenuListForUser(Map para){
		return mapper.queryMenuListForUser(para);
	}
	
	
	//保存此用户的授权信息
	public void saveMenuListForUser(Map para){
		mapper.saveMenuListForUser(para);
	}
	
	//清空此用户的授权信息
	public void clearMenuListForUser(Map para){
		mapper.clearMenuListForUser(para);
	}

}
