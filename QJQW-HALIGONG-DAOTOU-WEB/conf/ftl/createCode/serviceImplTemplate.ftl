package com.qf.${packageName}.${objectNameLower}.service;






import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.stereotype.Service;

import com.qf.${packageName}.${objectNameLower}.dao.${objectName}Mapper;
import com.qf.${packageName}.${objectNameLower}.model.${objectName};
import com.qf.util.interceptor.PageHelper;
import com.qf.util.page.Page;
import com.qf.util.PageData;


@Service("${objectNameLower}Service")
public class ${objectName}ServiceImpl implements ${objectName}Service {
	
	private ${objectName}Mapper dao;

	public ${objectName}Mapper getDao() {
		return dao;
	}
    @Autowired
	public void setDao(${objectName}Mapper dao) {
		this.dao = dao;
	}
    /*
	* 新增
	*/
	@Override
	public int save(PageData pd){
			return dao.save(pd);
	}
	
	/*
	* 删除
	*/
	@Override
	public int delete(PageData pd){
		return dao.delete(pd);
	}
	
	/*
	* 修改
	*/
	@Override
	public int edit(PageData pd){
		return dao.edit(pd);
	}
	
	/*
	*列表
	*/
	@Override
	public  Map<String,Object> list(Page page,PageData pd){
			Map<String,Object> map = new HashMap<String,Object>();
			PageHelper.startPage(page); //起始位置，长度
			dao.datalistPage(pd);
			Page p  = PageHelper.endPage();
			page.setRowCount(p.getRowCount());
			page.setPageCount(p.getPageCount());
			map.put("page", page);
			map.put("list", p.getResult());
			return map;
	}
	
	
	/*
	* 通过id获取数据
	*/
	@Override
	public ${objectName} findById(PageData pd){
		return dao.findById(pd);
	}
	
	/*
	* 批量删除
	*/
	@Override
	public void deleteAll(String [] ArrayDATA_IDS){
		dao.deleteAll(ArrayDATA_IDS);
	}
	
}
