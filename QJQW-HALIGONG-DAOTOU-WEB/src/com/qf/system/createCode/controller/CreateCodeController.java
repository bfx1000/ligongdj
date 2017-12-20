package com.qf.system.createCode.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qf.util.DelAllFile;
import com.qf.util.FileDownload;
import com.qf.util.FileZip;
import com.qf.util.Freemarker;
import com.qf.util.PageData;
import com.qf.util.PathUtil;
import com.qf.util.controller.BaseController;




/**
*
* 项目名称：qf
* 类名称：CreateCodeController
* 类描述：生成代码
* 创建人：周广文
* 创建时间：2015年6月19日 上午10:41:12
* 修改人：周广文
* 修改时间：2015年6月19日 上午10:41:12
* 修改备注：
* @version
*
*/
@Controller
@RequestMapping(value="/createCode")
public class CreateCodeController extends BaseController {
	
	
	/**
	* proCode(生成代码方法)
	* TODO(接收包名,类名,属性集合)
	* TODO(转换类名大小写)
	* TODO(使用freemark依次生成controller,service,mapping)
	* @param name
	* @param @return 设定文件
	* @return String DOM对象
	* @Exception 异常对象
	* @since  CodingExample　Ver(编码范例查看) 1.1
	*/
	@RequestMapping(value="/proCode")
	public void proCode(HttpServletResponse response) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		
		/* ============================================================================================= */
		String packageName = pd.getString("packageName");  			//包名				========1
		String objectName = pd.getString("objectName");	   			//类名				========2
		String zindext = pd.getString("zindex");	   	   			//属性总数
		int zindex = 0;
		if(null != zindext && !"".equals(zindext)){
			zindex = Integer.parseInt(zindext);
		}
		List<String[]> fieldList = new ArrayList<String[]>();   	//属性集合			========3
		for(int i=0; i< zindex; i++){
			fieldList.add(pd.getString("field"+i).split(",fh,"));	//属性放到集合里面
		}
		
		Map<String,Object> root = new HashMap<String,Object>();		//创建数据模型
		root.put("fieldList", fieldList);
		root.put("packageName", packageName);						//报名
		root.put("objectName", objectName);							//类名
		root.put("objectNameLower", objectName.toLowerCase());		//类名(全小写)
		root.put("objectNameUpper", objectName.toUpperCase());		//类名(全大写)
		root.put("nowDate", new Date());							//当前日期
		
		DelAllFile.delFolder(PathUtil.getClasspath()+"admin00/ftl"); //生成代码前,先清空之前生成的代码
		/* ============================================================================================= */
		
		String filePath = "admin00/ftl/code/";						//存放路径
		String ftlPath = "createCode";								//ftl路径
		
		/*生成controller*/
		Freemarker.printFile("controllerTemplate.ftl", root,packageName+"/"+objectName.toLowerCase()+"/controller/"+objectName+"Controller.java", filePath, ftlPath);
		
		/*生成service*/
		Freemarker.printFile("serviceTemplate.ftl", root, packageName+"/"+objectName.toLowerCase()+"/service/"+objectName+"Service.java", filePath, ftlPath);
		Freemarker.printFile("serviceImplTemplate.ftl", root, packageName+"/"+objectName.toLowerCase()+"/service/"+objectName+"ServiceImpl.java", filePath, ftlPath);
		/*生成mybatis xml*/
		Freemarker.printFile("mapperMysqlTemplate.ftl", root, packageName+"/"+objectName.toLowerCase()+"/mapping/"+objectName+"Mapper.xml", filePath, ftlPath);
//		Freemarker.printFile("mapperOracleTemplate.ftl", root, "mybatis_oracle/"+packageName+"/"+objectName+"Mapper.xml", filePath, ftlPath);
		
		/*生成SQL脚本*/
    	Freemarker.printFile("mysql_SQL_Template.ftl", root, packageName+"/"+objectName.toLowerCase()+"/model/"+objectName+"Mapper.sql", filePath, ftlPath);
//		Freemarker.printFile("oracle_SQL_Template.ftl", root, "oracle数据库脚本/TB_"+objectName.toUpperCase()+".sql", filePath, ftlPath);
		//生成dao
    	Freemarker.printFile("dao_Template.ftl", root, packageName+"/"+objectName.toLowerCase()+"/dao/"+objectName+"Mapper.java", filePath, ftlPath);
    	
	// 生成model
     	Freemarker.printFile("model_Template.ftl", root, packageName+"/"+objectName.toLowerCase()+"/model/"+objectName+".java",filePath, ftlPath);
	
		/*生成jsp页面*/
		Freemarker.printFile("jsp_list_Template.ftl", root, "jsp/"+packageName+"/"+objectName.toLowerCase()+"/"+objectName.toLowerCase()+"_list.jsp", filePath, ftlPath);
		Freemarker.printFile("jsp_edit_Template.ftl", root, "jsp/"+packageName+"/"+objectName.toLowerCase()+"/"+objectName.toLowerCase()+"_edit.jsp", filePath, ftlPath);
		
		/*生成说明文档*/
//		Freemarker.printFile("docTemplate.ftl", root, "说明c", filePath, ftlPath);
		
		//this.print("oracle_SQL_Template.ftl", root);  控制台打印
		
		/*生成的全部代码压缩成zip文件*/
		FileZip.zip(PathUtil.getClasspath()+"admin00/ftl/code", PathUtil.getClasspath()+"admin00/ftl/code.zip");
		
		/*下载代码*/
		FileDownload.fileDownload(response, PathUtil.getClasspath()+"admin00/ftl/code.zip", "code.zip");
		
	}
	
}
