package com.qf.toolPlan.designToolBTAdrill.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.qf.util.PageData;

@Repository
public interface DesignToolBTAdrillMapper {

	//查询刀片设计
	public List<Map> queryDesignToolBTAdrillList(PageData pd);
			
	//查询刀片设计图片列表 
	public List<Map> queryPictureDesignToolBTAdrillList(Map para);
		
	//查询详细信息列表 
	public List<Map> queryInformDetailDesignToolBTAdrillList(Map para);
		
	//part 
	public List<Map> queryPartDesignToolBTAdrillList(Map para);
	
	//partAll 
	public List<Map> queryPartAllList(Map para);
	
	//清空图片路径
	public void clearPictureDesignToolBTAdrillById(Map para);
	
	//清空part路径
	public void clearPartDesignToolBTAdrillById(Map para);
	
	//清空详细路径
	public void clearInformDetailDesignToolBTAdrillById(Map para);
	
	//清空所有刀片P、C等Part文件
	public void clearPartAllById(Map para);
	
	//删除深孔钻设计基本信息（包括刀片P、C等信息）
	public void deleteDesignToolBTAdrill(Map para);
	
	//查询深孔钻设计（用于go添加页面）
	public Map queryDesignToolBTAdrillById(Map para);
	
	//修改
	public void updateDesignToolBTAdrill(Map para);
					
	//新增
	public void saveDesignToolBTAdrill(Map para);
			
	//保存图片
	public void savePictureDesignToolBTAdrill(Map para);
		
	//保存详细信息
	public void saveInformDetailDesignToolBTAdrill(Map para);
	
	//保存part
	public void savePartDesignToolBTAdrill(Map para);
	
	//保存partAll
	public void savePartAll(Map para);
	
	//清空partAll(通过ID)
	public void cleanPartAllDesignToolBTAdrillById(Map para);
}







