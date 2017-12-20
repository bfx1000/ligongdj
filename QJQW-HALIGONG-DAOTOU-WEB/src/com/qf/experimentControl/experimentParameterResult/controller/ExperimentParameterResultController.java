package com.qf.experimentControl.experimentParameterResult.controller;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.qf.experimentControl.experimentManage.service.experimentManageService;
import com.qf.experimentControl.experimentParameterResult.service.ExperimentParameterResultService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

@Controller
@RequestMapping("experimentParameterResult")
public class ExperimentParameterResultController extends BaseController{
	
	@Resource(name="experimentParameterResultService")
	private ExperimentParameterResultService experimentParameterResultService;
	
	//试验
	@Resource(name="experimentManageService")
	private experimentManageService experimentManageService;
	
	/**
	 * 添加参数页面
	 * @param ExperimentNo
	 * @return
	 */
	@RequestMapping("goExperimentParameterResult")
	public ModelAndView goExperimentParameterResult(String ExperimentNo){
		
		ModelAndView mv = new ModelAndView();
		
		if(ExperimentNo!=null&&!"".equals(ExperimentNo)){
			Map<String,String> para = new HashMap();
			
			para.put("ExperimentNo", ExperimentNo);
			
			Map ExperimentManage = experimentParameterResultService.ByExperimentNo(para);	//通过编号查询出实验基本数据的名字和类型值
			mv.addObject("ExperimentManage",ExperimentManage);
			
			List<Map> CategoryExperimentType = experimentManageService.CategoryExperimentType(); //用于和类型值对应。
			mv.addObject("CategoryExperimentType",CategoryExperimentType);
			if(ExperimentManage!=null&&ExperimentManage.size()>0){
				String keys = experimentParameterResultService.selectKeys(""+ExperimentManage.get("id_ExperimentManage"));  //查询该实验都有哪些参数字段
				if(keys!=null&&!"".equals(keys)){
					String parameter[] = keys.split(",");    
					List<String> parameters = new ArrayList(Arrays.asList(parameter));//将这些字段转成List查询
					List<Map> ExperimentParameterResult = experimentParameterResultService.ExperimentParameterResult(parameters,""+ExperimentManage.get("id_ExperimentManage")); //用于和类型值对应。
					logger.info(ExperimentParameterResult.toString());
					
					mv.addObject("ExperimentParameterResult",ExperimentParameterResult);
					mv.addObject("parameters",parameters);
				}
			}
		}
		
		mv.setViewName("/WEB-INF/experimentControl/experimentParameterResult/experimentParameterResult_edit");
		return mv;
	}
	
	
	@RequestMapping("importExcel")
	public ModelAndView importExcel(@RequestParam(value="excel",required=false)MultipartFile excelFile,String ExperimentNo1){
		
		ModelAndView mv = this.getModelAndView();
		
		if(ExperimentNo1!=null&&!"".equals(ExperimentNo1)){
			Map<String,String> para = new HashMap();
			
			para.put("ExperimentNo", ExperimentNo1);
			
			Map ExperimentManage = experimentParameterResultService.ByExperimentNo(para);	//通过编号查询出实验基本数据的名字和类型值
			mv.addObject("ExperimentManage",ExperimentManage);
			
			List<Map> CategoryExperimentType = experimentManageService.CategoryExperimentType(); //用于和类型值对应。
			mv.addObject("CategoryExperimentType",CategoryExperimentType);
		
		}
		
		mv.setViewName("/WEB-INF/experimentControl/experimentParameterResult/experimentParameterResult_edit");
		
		String suffix = excelFile.getOriginalFilename().substring(excelFile.getOriginalFilename().lastIndexOf("."));
		try {
			Workbook wb = null;
			if (suffix.equals(".xls")) {  //判断接收到的文件是什么类型的Excel
	           	wb = (Workbook) new HSSFWorkbook(excelFile.getInputStream());  
	        }  
	        else if (suffix.equals(".xlsx")) {  
	            wb = new XSSFWorkbook(excelFile.getInputStream());  
	        }  
	        else {  
	            mv.addObject("error","您上传的不是excel文件！");     //上传的不是excel返回错误信息
            	return mv;
	        }
			Sheet sheet1 = wb.getSheetAt(0);
			Row row = sheet1.getRow(0);
			int coloumNum = row.getPhysicalNumberOfCells();
            
            List<String> list = new ArrayList<>();	//将列头存入List
            for(int i = 0;i<coloumNum;i++){
            	list.add(""+row.getCell(i));
            }
            
            
            
            int rowNum=sheet1.getLastRowNum();//获得总行数
            List<Map> ExperimentParameterResult = new ArrayList<Map>();			//将除列头外的数据存入List<Map>
            for(int i = 1;i<rowNum+1;i++){
            	Row rowI = sheet1.getRow(i);
            	Map map = new HashMap<>();
            	for(int j = 0;j<coloumNum;j++){
                	map.put(list.get(j), rowI.getCell(j));
            	}
            	ExperimentParameterResult.add(map);
            }
            mv.addObject("ExperimentParameterResult",ExperimentParameterResult);
			mv.addObject("parameters",list);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			
		}
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("saveExperimentParameterResult")
	public Object saveExperimentParameterResult(String json, String id){
		 
		 try{
			 
			 List<Map> list = new ArrayList<Map>();  
		     list = JSONObject.parseArray(json, Map.class);   //将Json转换成List<map>
		     System.out.println(json);
		     //--------------------------分割----------------------------
		     Set set = list.get(0).keySet();
		     Iterator iter = set.iterator();  
		     String keys = "";
		     while (iter.hasNext()) {  						 //将Key保存下来，为了以后回显时用。
		     String key = (String) iter.next(); 
		     keys= keys + key + ",";
		     } 
		     //--------------------------分割-----------------------------
		     
		     for(int i = 0 ;i<list.size();i++){
		    	 list.get(i).put("id_ExperimentManage",id);		//添加基本属性所属的ID
		     }
		     experimentParameterResultService.cleansaveExperimentParameterResult(id);
		     experimentParameterResultService.saveExperimentParameterResult(list);//保存参数
		     
		     Map keyAndId = new HashMap();
		     keyAndId.put("parameter", keys);
		     keyAndId.put("id_ExperimentManage", id);
		     experimentParameterResultService.cleanKey(keyAndId);	//清空key
		     experimentParameterResultService.saveKey(keyAndId);  	//保存Key
		     
			 return 1;
			 
		 }catch (Exception e) {
			 e.printStackTrace();
			 return "0";
			 
		}
	}
	
	/**
	 * 导出ex表
	 * @param json
	 * @param id
	 * @return
	 */
	@RequestMapping("exportExperimentParameterResult")
	public ModelAndView exportExperimentParameterResult(String json, String id,HttpServletResponse res){
		ModelAndView mv = new ModelAndView();
		 try{
			 
			 List<Map> list = new ArrayList<Map>();  
		     list = JSONObject.parseArray(json, Map.class);   //将Json转换成List<map>
		     
		     //--------------------------分割----------------------------
		     // 第一步，创建workbook
		     HSSFWorkbook wb = new HSSFWorkbook();  
		     // 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet  
		     HSSFSheet sheet = wb.createSheet("表");  
		     // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short  
		     HSSFRow row = sheet.createRow((int) 0);  
		     // 第四步，创建单元格，并设置值表头 设置表头居中  
		     HSSFCellStyle style = wb.createCellStyle();  
		     style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式  
		     
		     Set set = list.get(0).keySet();
		     List keyList = new ArrayList(set);
		     for(int i=0;i<keyList.size();i++){
		    	 HSSFCell cell = row.createCell((short) i);  
			        cell.setCellValue(keyList.get(i)+"");  
			        cell.setCellStyle(style);  
		     }
		     for (int i = 0; i < list.size(); i++)  
		        {  
		            row = sheet.createRow((int) i + 1);  
		            Map map = list.get(i);  
		            // 第四步，创建单元格，并设置值 
		            for(int j= 0;j<map.size();j++){
		            	row.createCell((short) j).setCellValue((String)map.get(keyList.get(j)));  
		            }
		        }  
		     String fileName = "参数信息表";
		     ByteArrayOutputStream os = new ByteArrayOutputStream();
		     wb.write(os);
		     byte[] content = os.toByteArray();
		     InputStream is = new ByteArrayInputStream(content);
		     // 设置response参数，可以打开下载页面
		     res.reset();
		     res.setContentType("application/vnd.ms-excel;charset=utf-8");
		     res.setHeader("Content-Disposition", "attachment;filename=" + new String((fileName + ".xls").getBytes(), "iso-8859-1"));
		     ServletOutputStream out = res.getOutputStream();
		     BufferedInputStream bis = null;
		     BufferedOutputStream bos = null;
		     try {
			     bis = new BufferedInputStream(is);
			     bos = new BufferedOutputStream(out);
			     byte[] buff = new byte[2048];
			     int bytesRead;
			     while(-1 != (bytesRead = bis.read(buff, 0, buff.length))){
			    	 bos.write(buff, 0, bytesRead);
			    	 }
		     } 
		     catch (Exception e) {
		    	 e.printStackTrace();
		     } finally {
			     if (bis != null)
			     bis.close();
			     if (bos != null)
			     bos.close();
		     }
		     //--------------------------分割-----------------------------
		 }catch (Exception e) {
			 e.printStackTrace();
		}
		 return null;
	}
	
	
	
	/**
	 * 添加结果页面
	 */
	@RequestMapping("goExperimentResult")
	public ModelAndView goExperimentResult(String ExperimentNo,int zT){
		ModelAndView mv = new ModelAndView();
		
		if(ExperimentNo!=null&&!"".equals(ExperimentNo)){
			Map<String,String> para = new HashMap();
			
			para.put("ExperimentNo", ExperimentNo);
			
			Map ExperimentManage = experimentParameterResultService.ByExperimentNo(para);	//通过编号查询出实验基本数据的名字和类型值
			mv.addObject("ExperimentManage",ExperimentManage);
			
			List<Map> CategoryExperimentType = experimentManageService.CategoryExperimentType(); //用于和类型值对应。
			mv.addObject("CategoryExperimentType",CategoryExperimentType);
			if(ExperimentManage!=null&&ExperimentManage.size()>0){
				String keys = experimentParameterResultService.selectKeys(""+ExperimentManage.get("id_ExperimentManage"));  //查询该实验都有哪些参数字段
				if(keys!=null&&!"".equals(keys)){
					String parameter[] = keys.split(",");    
					List<String> parameters = new ArrayList(Arrays.asList(parameter));//将这些字段转成List查询
					List<Map> ExperimentParameterResult = experimentParameterResultService.ExperimentParameterResult(parameters,""+ExperimentManage.get("id_ExperimentManage")); //用于和类型值对应。
					logger.info(ExperimentParameterResult.toString());
					
					mv.addObject("ExperimentParameterResult",ExperimentParameterResult);
					mv.addObject("parameters",parameters);
				}
			}
		}
		System.out.println(zT);
		if(1==zT){
			mv.setViewName("/WEB-INF/experimentControl/experimentParameterResult/experimentResult_list");
		}else{
			mv.setViewName("/WEB-INF/experimentControl/experimentParameterResult/experimentResult_edit");
		}
		return mv;
	}
	
	
	/**
	 * 通过ID返回实验结果
	 */
	@RequestMapping("CheckExperimentResultList")
	public Object CheckExperimentResultList(String id_ExperimentParameterResult,int WhetherVariable){
		
		ModelAndView mv = new ModelAndView();
		
		Map ExperimentResult = experimentParameterResultService.CheckExperimentResultById(id_ExperimentParameterResult);
		
		String ExReSectionHardness_str = (String) ExperimentResult.get("ExReSectionHardness");
		List<Map> ExReSectionHardnessList = new ArrayList();
		if(ExReSectionHardness_str != null && !"".equals(ExReSectionHardness_str)){
			String ConstituentsMaterials[] = ExReSectionHardness_str.split(",");
			for(int j=0;j<ConstituentsMaterials.length;j++){
				if(ConstituentsMaterials[j] != null && !"".equals(ConstituentsMaterials[j])){
					String yuansu = ConstituentsMaterials[j].split("-")[0];
					String baifenbi = ConstituentsMaterials[j].split("-")[1];
					Map temp = new HashMap();
					temp.put("yuansu", yuansu);
					temp.put("baifenbi", baifenbi);
					ExReSectionHardnessList.add(temp);
				}
			}
			ExperimentResult.put("ExReSectionHardnessList", ExReSectionHardnessList);	
		}
		
		String ExReSectionStress_str = (String) ExperimentResult.get("ExReSectionStress");
		List<Map> ExReSectionStressList = new ArrayList();
		if(ExReSectionStress_str != null && !"".equals(ExReSectionStress_str)){
			String ConstituentsMaterials[] = ExReSectionStress_str.split(",");
			for(int j=0;j<ConstituentsMaterials.length;j++){
				if(ConstituentsMaterials[j] != null && !"".equals(ConstituentsMaterials[j])){
					String yuansu = ConstituentsMaterials[j].split("-")[0];
					String baifenbi = ConstituentsMaterials[j].split("-")[1];
					Map temp = new HashMap();
					temp.put("yuansu", yuansu);
					temp.put("baifenbi", baifenbi);
					ExReSectionStressList.add(temp);
				}
			}
			ExperimentResult.put("ExReSectionStressList", ExReSectionStressList);	
		}
		
		List<Map> ExperimentResultFile = experimentParameterResultService.CheckExperimentResultFile(id_ExperimentParameterResult);
			
		if(ExperimentResultFile!=null&&ExperimentResultFile.size()>0){
			List<Map> ExReForceFile = new ArrayList();
			List<Map> ExReTemperatureFile = new ArrayList();
			List<Map> SurfaceFile = new ArrayList();
			List<Map> ShapeFile = new ArrayList();
			List<Map> SurfaceRoughnessFile = new ArrayList();
			List<Map> SurfaceHardnessFile = new ArrayList();
			List<Map> ExReSectionHardnessFile = new ArrayList();
			List<Map> ExReSurfaceStressFile = new ArrayList();
			List<Map> ExReSectionStressFile = new ArrayList();
			List<Map> ExReDefined1File = new ArrayList();
			List<Map> ExReDefined2File = new ArrayList();
			List<Map> ExReDefined3File = new ArrayList();
			List<Map> ExReDefined4File = new ArrayList();
			List<Map> ExReDefined5File = new ArrayList();
			List<Map> ExReWearFile = new ArrayList();
			
			for(int i = 0; i<ExperimentResultFile.size();i++){
				String ascription = (String) ExperimentResultFile.get(i).get("ascription");
				if("ExReForceFile".equals(ascription)){
					ExReForceFile.add(ExperimentResultFile.get(i));
				}
				if("ExReTemperatureFile".equals(ascription)){
					ExReTemperatureFile.add(ExperimentResultFile.get(i));
				}
				if("SurfaceFile".equals(ascription)){
					SurfaceFile.add(ExperimentResultFile.get(i));
				}
				if("ShapeFile".equals(ascription)){
					ShapeFile.add(ExperimentResultFile.get(i));
				}
				if("SurfaceRoughnessFile".equals(ascription)){
					SurfaceRoughnessFile.add(ExperimentResultFile.get(i));
				}
				if("SurfaceHardnessFile".equals(ascription)){
					SurfaceHardnessFile.add(ExperimentResultFile.get(i));
				}
				if("ExReSectionHardnessFile".equals(ascription)){
					ExReSectionHardnessFile.add(ExperimentResultFile.get(i));
				}
				if("ExReSurfaceStressFile".equals(ascription)){
					ExReSurfaceStressFile.add(ExperimentResultFile.get(i));
				}
				if("ExReSectionStressFile".equals(ascription)){
					ExReSectionStressFile.add(ExperimentResultFile.get(i));
				}
				if("ExReDefined1File".equals(ascription)){
					ExReDefined1File.add(ExperimentResultFile.get(i));
				}
				if("ExReDefined2File".equals(ascription)){
					ExReDefined2File.add(ExperimentResultFile.get(i));
				}
				if("ExReDefined3File".equals(ascription)){
					ExReDefined3File.add(ExperimentResultFile.get(i));
				}
				if("ExReDefined4File".equals(ascription)){
					ExReDefined4File.add(ExperimentResultFile.get(i));
				}
				if("ExReDefined5File".equals(ascription)){
					ExReDefined5File.add(ExperimentResultFile.get(i));
				}
				if("ExReWearFile".equals(ascription)){
					ExReWearFile.add(ExperimentResultFile.get(i));
				}
				
			}
			ExperimentResult.put("ExReForceFile", ExReForceFile);
			ExperimentResult.put("ExReTemperatureFile", ExReTemperatureFile);
			ExperimentResult.put("SurfaceFile", SurfaceFile);
			ExperimentResult.put("ShapeFile", ShapeFile);
			ExperimentResult.put("SurfaceRoughnessFile", SurfaceRoughnessFile);
			ExperimentResult.put("SurfaceHardnessFile", SurfaceHardnessFile);
			ExperimentResult.put("ExReSectionHardnessFile", ExReSectionHardnessFile);
			ExperimentResult.put("ExReSurfaceStressFile", ExReSurfaceStressFile);
			ExperimentResult.put("ExReSectionStressFile", ExReSectionStressFile);
			ExperimentResult.put("ExReDefined1File", ExReDefined1File);
			ExperimentResult.put("ExReDefined2File", ExReDefined2File);
			ExperimentResult.put("ExReDefined3File", ExReDefined3File);
			ExperimentResult.put("ExReDefined4File", ExReDefined4File);
			ExperimentResult.put("ExReDefined5File", ExReDefined5File);
			ExperimentResult.put("ExReWearFile", ExReWearFile);
			
			
			String array_ExReForceFile = "";
			String array_ExReForceFile_name = "";
			if(ExReForceFile != null && ExReForceFile.size() > 0){
				for(int i = 0; i < ExReForceFile.size(); i++){
					array_ExReForceFile = array_ExReForceFile + ExReForceFile.get(i).get("url_ExperimentResultFile") + ",";
					array_ExReForceFile_name = array_ExReForceFile_name + ExReForceFile.get(i).get("name_ExperimentResultFile") + ",";
				}
			}
			
			String array_ExReTemperatureFile = "";
			String array_ExReTemperatureFile_name = "";
			if(ExReTemperatureFile != null && ExReTemperatureFile.size() > 0){
				for(int i = 0; i < ExReTemperatureFile.size(); i++){
					array_ExReTemperatureFile = array_ExReTemperatureFile + ExReTemperatureFile.get(i).get("url_ExperimentResultFile") + ",";
					array_ExReTemperatureFile_name = array_ExReTemperatureFile_name + ExReTemperatureFile.get(i).get("name_ExperimentResultFile") + ",";
				}
			}
			
			String array_SurfaceFile = "";
			String array_SurfaceFile_name = "";
			if(SurfaceFile != null && SurfaceFile.size() > 0){
				for(int i = 0; i < SurfaceFile.size(); i++){
					array_SurfaceFile = array_SurfaceFile + SurfaceFile.get(i).get("url_ExperimentResultFile") + ",";
					array_SurfaceFile_name = array_SurfaceFile_name + SurfaceFile.get(i).get("name_ExperimentResultFile") + ",";
				}
			}
			
			String array_ShapeFile = "";
			String array_ShapeFile_name = "";
			if(ShapeFile != null && ShapeFile.size() > 0){
				for(int i = 0; i < ShapeFile.size(); i++){
					array_ShapeFile = array_ShapeFile + ShapeFile.get(i).get("url_ExperimentResultFile") + ",";
					array_ShapeFile_name = array_ShapeFile_name + ShapeFile.get(i).get("name_ExperimentResultFile") + ",";
				}
			}
			
			String array_SurfaceRoughnessFile = "";
			String array_SurfaceRoughnessFile_name = "";
			if(SurfaceRoughnessFile != null && SurfaceRoughnessFile.size() > 0){
				for(int i = 0; i < SurfaceRoughnessFile.size(); i++){
					array_SurfaceRoughnessFile = array_SurfaceRoughnessFile + SurfaceRoughnessFile.get(i).get("url_ExperimentResultFile") + ",";
					array_SurfaceRoughnessFile_name = array_SurfaceRoughnessFile_name + SurfaceRoughnessFile.get(i).get("name_ExperimentResultFile") + ",";
				}
			}
			
			String array_SurfaceHardnessFile = "";
			String array_SurfaceHardnessFile_name = "";
			if(SurfaceHardnessFile != null && SurfaceHardnessFile.size() > 0){
				for(int i = 0; i < SurfaceHardnessFile.size(); i++){
					array_SurfaceHardnessFile = array_SurfaceHardnessFile + SurfaceHardnessFile.get(i).get("url_ExperimentResultFile") + ",";
					array_SurfaceHardnessFile_name = array_SurfaceHardnessFile_name + SurfaceHardnessFile.get(i).get("name_ExperimentResultFile") + ",";
				}
			}
			
			String array_ExReSectionHardnessFile = "";
			String array_ExReSectionHardnessFile_name = "";
			if(ExReSectionHardnessFile != null && ExReSectionHardnessFile.size() > 0){
				for(int i = 0; i < ExReSectionHardnessFile.size(); i++){
					array_ExReSectionHardnessFile = array_ExReSectionHardnessFile + ExReSectionHardnessFile.get(i).get("url_ExperimentResultFile") + ",";
					array_ExReSectionHardnessFile_name = array_ExReSectionHardnessFile_name + ExReSectionHardnessFile.get(i).get("name_ExperimentResultFile") + ",";
				}
			}
			
			String array_ExReSurfaceStressFile = "";
			String array_ExReSurfaceStressFile_name = "";
			if(ExReSurfaceStressFile != null && ExReSurfaceStressFile.size() > 0){
				for(int i = 0; i < ExReSurfaceStressFile.size(); i++){
					array_ExReSurfaceStressFile = array_ExReSurfaceStressFile + ExReSurfaceStressFile.get(i).get("url_ExperimentResultFile") + ",";
					array_ExReSurfaceStressFile_name = array_ExReSurfaceStressFile_name + ExReSurfaceStressFile.get(i).get("name_ExperimentResultFile") + ",";
				}
			}
			
			String array_ExReSectionStressFile = "";
			String array_ExReSectionStressFile_name = "";
			if(ExReSectionStressFile != null && ExReSectionStressFile.size() > 0){
				for(int i = 0; i < ExReSectionStressFile.size(); i++){
					array_ExReSectionStressFile = array_ExReSectionStressFile + ExReSectionStressFile.get(i).get("url_ExperimentResultFile") + ",";
					array_ExReSectionStressFile_name = array_ExReSectionStressFile_name + ExReSectionStressFile.get(i).get("name_ExperimentResultFile") + ",";
				}
			}
			
			String array_ExReDefined1File = "";
			String array_ExReDefined1File_name = "";
			if(ExReDefined1File != null && ExReDefined1File.size() > 0){
				for(int i = 0; i < ExReDefined1File.size(); i++){
					array_ExReDefined1File = array_ExReDefined1File + ExReDefined1File.get(i).get("url_ExperimentResultFile") + ",";
					array_ExReDefined1File_name = array_ExReDefined1File_name + ExReDefined1File.get(i).get("name_ExperimentResultFile") + ",";
				}
			}
			
			String array_ExReDefined2File = "";
			String array_ExReDefined2File_name = "";
			if(ExReDefined2File != null && ExReDefined2File.size() > 0){
				for(int i = 0; i < ExReDefined2File.size(); i++){
					array_ExReDefined2File = array_ExReDefined2File + ExReDefined2File.get(i).get("url_ExperimentResultFile") + ",";
					array_ExReDefined2File_name = array_ExReDefined2File_name + ExReDefined2File.get(i).get("name_ExperimentResultFile") + ",";
				}
			}
			
			String array_ExReDefined3File = "";
			String array_ExReDefined3File_name = "";
			if(ExReDefined3File != null && ExReDefined3File.size() > 0){
				for(int i = 0; i < ExReDefined3File.size(); i++){
					array_ExReDefined3File = array_ExReDefined3File + ExReDefined3File.get(i).get("url_ExperimentResultFile") + ",";
					array_ExReDefined3File_name = array_ExReDefined3File_name + ExReDefined3File.get(i).get("name_ExperimentResultFile") + ",";
				}
			}
			
			String array_ExReDefined4File = "";
			String array_ExReDefined4File_name = "";
			if(ExReDefined4File != null && ExReDefined4File.size() > 0){
				for(int i = 0; i < ExReDefined4File.size(); i++){
					array_ExReDefined4File = array_ExReDefined4File + ExReDefined4File.get(i).get("url_ExperimentResultFile") + ",";
					array_ExReDefined4File_name = array_ExReDefined4File_name + ExReDefined4File.get(i).get("name_ExperimentResultFile") + ",";
				}
			}
			
			String array_ExReDefined5File = "";
			String array_ExReDefined5File_name = "";
			if(ExReDefined5File != null && ExReDefined5File.size() > 0){
				for(int i = 0; i < ExReDefined5File.size(); i++){
					array_ExReDefined5File = array_ExReDefined5File + ExReDefined5File.get(i).get("url_ExperimentResultFile") + ",";
					array_ExReDefined5File_name = array_ExReDefined5File_name + ExReDefined5File.get(i).get("name_ExperimentResultFile") + ",";
				}
			}
			
			String array_ExReWearFile = "";
			String array_ExReWearFile_name = "";
			if(ExReWearFile != null && ExReWearFile.size() > 0){
				for(int i = 0; i < ExReWearFile.size(); i++){
					array_ExReWearFile = array_ExReWearFile + ExReWearFile.get(i).get("url_ExperimentResultFile") + ",";
					array_ExReWearFile_name = array_ExReWearFile_name + ExReWearFile.get(i).get("name_ExperimentResultFile") + ",";
				}
			}
			
			mv.addObject("array_ExReWearFile", array_ExReWearFile);
			mv.addObject("array_ExReWearFile_name", array_ExReWearFile_name);
			
			mv.addObject("array_ExReDefined5File", array_ExReDefined5File);
			mv.addObject("array_ExReDefined5File_name", array_ExReDefined5File_name);
			
			mv.addObject("array_ExReDefined4File", array_ExReDefined4File);
			mv.addObject("array_ExReDefined4File_name", array_ExReDefined4File_name);
			
			mv.addObject("array_ExReDefined3File", array_ExReDefined3File);
			mv.addObject("array_ExReDefined3File_name", array_ExReDefined3File_name);
			
			mv.addObject("array_ExReDefined2File", array_ExReDefined2File);
			mv.addObject("array_ExReDefined2File_name", array_ExReDefined2File_name);
			
			mv.addObject("array_ExReDefined1File", array_ExReDefined1File);
			mv.addObject("array_ExReDefined1File_name", array_ExReDefined1File_name);
			
			mv.addObject("array_ExReSectionStressFile", array_ExReSectionStressFile);
			mv.addObject("array_ExReSectionStressFile_name", array_ExReSectionStressFile_name);
			
			mv.addObject("array_ExReSurfaceStressFile", array_ExReSurfaceStressFile);
			mv.addObject("array_ExReSurfaceStressFile_name", array_ExReSurfaceStressFile_name);
			
			mv.addObject("array_ExReSectionHardnessFile", array_ExReSectionHardnessFile);
			mv.addObject("array_ExReSectionHardnessFile_name", array_ExReSectionHardnessFile_name);
			
			mv.addObject("array_SurfaceHardnessFile", array_SurfaceHardnessFile);
			mv.addObject("array_SurfaceHardnessFile_name", array_SurfaceHardnessFile_name);
			
			mv.addObject("array_SurfaceRoughnessFile", array_SurfaceRoughnessFile);
			mv.addObject("array_SurfaceRoughnessFile_name", array_SurfaceRoughnessFile_name);
			
			mv.addObject("array_ShapeFile", array_ShapeFile);
			mv.addObject("array_ShapeFile_name", array_ShapeFile_name);
			
			mv.addObject("array_SurfaceFile", array_SurfaceFile);
			mv.addObject("array_SurfaceFile_name", array_SurfaceFile_name);
			
			mv.addObject("array_ExReTemperatureFile", array_ExReTemperatureFile);
			mv.addObject("array_ExReTemperatureFile_name", array_ExReTemperatureFile_name);
			
			mv.addObject("array_ExReForceFile", array_ExReForceFile);
			mv.addObject("array_ExReForceFile_name", array_ExReForceFile_name);
			
			
		}
		
		
		List<Map> ExperimentParameterToolWear = experimentParameterResultService.CheckExperimentParameterToolWear(id_ExperimentParameterResult);
		String  id_ExperimentParameterToolWear = "";
		int i = 0;
		for( i =0 ; i<ExperimentParameterToolWear.size();i++){
			id_ExperimentParameterToolWear = ""+ ExperimentParameterToolWear.get(i).get("id_ExperimentParameterToolWear");
			List<Map> ExperimentParameterToolWearPicture = experimentParameterResultService.CheckExperimentParameterToolWearPicture(id_ExperimentParameterToolWear);
			if(ExperimentParameterToolWearPicture!=null && ExperimentParameterToolWearPicture.size()>0){
				List<Map> ExReQianDaoPicture = new ArrayList();
				List<Map> ExReHouDaoPicture = new ArrayList();
				List<Map> ExReDaojianPicture = new ArrayList();
				List<Map> ExReotherPicture = new ArrayList();
				for(int j = 0; j <ExperimentParameterToolWearPicture.size(); j++){
					String ascription = (String) ExperimentParameterToolWearPicture.get(j).get("ascription");
					if("ExReQianDaoPicture".equals(ascription)){
						ExReQianDaoPicture.add(ExperimentParameterToolWearPicture.get(j));
					}
					if("ExReHouDaoPicture".equals(ascription)){
						ExReHouDaoPicture.add(ExperimentParameterToolWearPicture.get(j));
					}
					if("ExReDaojianPicture".equals(ascription)){
						ExReDaojianPicture.add(ExperimentParameterToolWearPicture.get(j));
					}
					if("ExReotherPicture".equals(ascription)){
						ExReotherPicture.add(ExperimentParameterToolWearPicture.get(j));
					}
					
				}
				ExperimentParameterToolWear.get(i).put("ExReQianDaoPicture", ExReQianDaoPicture);
				ExperimentParameterToolWear.get(i).put("ExReHouDaoPicture", ExReHouDaoPicture);
				ExperimentParameterToolWear.get(i).put("ExReDaojianPicture", ExReDaojianPicture);
				ExperimentParameterToolWear.get(i).put("ExReotherPicture", ExReotherPicture);
				String array_ExReQianDaoPicture = "";
				if(ExReQianDaoPicture != null && ExReQianDaoPicture.size() > 0){
					for(int k = 0; k < ExReQianDaoPicture.size(); k++){
						array_ExReQianDaoPicture = array_ExReQianDaoPicture + ExReQianDaoPicture.get(k).get("url_ExperimentParameterToolWearPicture") + ",";
					}
				}
				
				String array_ExReHouDaoPicture = "";
				if(ExReHouDaoPicture != null && ExReHouDaoPicture.size() > 0){
					for(int k = 0; k < ExReHouDaoPicture.size(); k++){
						array_ExReHouDaoPicture = array_ExReHouDaoPicture + ExReHouDaoPicture.get(k).get("url_ExperimentParameterToolWearPicture") + ",";
					}
				}
				
				String array_ExReDaojianPicture = "";
				if(ExReDaojianPicture != null && ExReDaojianPicture.size() > 0){
					for(int k = 0; k < ExReDaojianPicture.size(); k++){
						array_ExReDaojianPicture = array_ExReDaojianPicture + ExReDaojianPicture.get(k).get("url_ExperimentParameterToolWearPicture") + ",";
					}
				}
				
				String array_ExReotherPicture = "";
				if(ExReotherPicture != null && ExReotherPicture.size() > 0){
					for(int k = 0; k < ExReotherPicture.size(); k++){
						array_ExReotherPicture = array_ExReotherPicture + ExReotherPicture.get(k).get("url_ExperimentParameterToolWearPicture") + ",";
					}
				}
				
			}
			
		}
		mv.addObject("Number",i);
		
		mv.addObject("ExperimentResult",ExperimentResult);
		
		mv.addObject("ExperimentParameterToolWear",ExperimentParameterToolWear);
		if(WhetherVariable==1){
			mv.setViewName("/WEB-INF/experimentControl/experimentParameterResult/experimentResult_child_list");
		}else{
			mv.setViewName("/WEB-INF/experimentControl/experimentParameterResult/experimentResult_child_edit");
		}
		
		
		
		return mv;
		
		
	}
	
	
	@ResponseBody
    @RequestMapping(value="/saveResultFile")
	public Object saveResultFile(
			@RequestParam(value="resultFile",required=false)MultipartFile resultFile ,
			String ascription , HttpServletRequest request ) throws Exception{
		Map<String,String> data = new HashMap<String, String>();
		String OriginalFilename = resultFile.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/resultFile/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			resultFile.transferTo(materials_big_img_file); 
			data.put("url", "/resultFile/" + big_url + "." + fileSuffix);
			data.put("fileName", OriginalFilename);
			data.put("ascription", ascription);
		}else{

		}
		return data;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/saveResultInfo")
	public Object saveResultInfo(String id_ExperimentParameterResult,String ExReForceX,String ExReForceY,String ExReForceZ,String ExReTorque,String ExReTemperature,
			String ExReSurfaceMorphology,String ExReChipShape,String ExReSurfaceRoughness,String ExReSurfaceHardness,String ExReSectionHardness,String ExReSurfaceStress,
			String ExReSectionStress,String ExReDefined1,String ExReDefined1Value,String ExReDefined2,String ExReDefined2Value,String ExReDefined3,
			String ExReDefined3Value,String ExReDefined4,String ExReDefined4Value,String ExReDefined5,String ExReDefined5Value,String ExReToolLife,
			String ExReWearStandard,String array_ExReForceFile,String array_ExReForceFile_name,String array_ExReTemperatureFile,String array_ExReTemperatureFile_name,
			String array_SurfaceFile,String array_SurfaceFile_name,String array_ShapeFile,String array_ShapeFile_name,String array_SurfaceRoughnessFile,String array_SurfaceRoughnessFile_name,
			String array_SurfaceHardnessFile,String array_SurfaceHardnessFile_name,String array_ExReSectionHardnessFile,String array_ExReSectionHardnessFile_name,String array_ExReSurfaceStressFile,String array_ExReSurfaceStressFile_name,
			String array_ExReSectionStressFile,String array_ExReSectionStressFile_name,String array_ExReDefined1File,
			String array_ExReDefined1File_name,String array_ExReDefined2File,String array_ExReDefined2File_name,
			String array_ExReDefined3File,String array_ExReDefined3File_name,String array_ExReDefined4File,String array_ExReDefined4File_name,
			String array_ExReDefined5File,String array_ExReDefined5File_name,String array_ExReWearFile,String array_ExReWearFile_name,
			String life){
		try {
			
			if(life!=null&&!"".equals(life)){
				List<Map> lifeList = new ArrayList<Map>();  
			    lifeList = JSONObject.parseArray(life, Map.class);
			    experimentParameterResultService.saveLifeInfo(lifeList,id_ExperimentParameterResult);
			}
		    Map resultInfo = new HashMap();
		    resultInfo.put("id_ExperimentParameterResult", id_ExperimentParameterResult);
		    resultInfo.put("ExReForceX", ExReForceX);
		    resultInfo.put("ExReForceY", ExReForceY);
		    resultInfo.put("ExReForceZ", ExReForceZ);
		    resultInfo.put("ExReTorque", ExReTorque);
		    resultInfo.put("ExReTemperature", ExReTemperature);
		    resultInfo.put("ExReSurfaceMorphology", ExReSurfaceMorphology);
		    resultInfo.put("ExReChipShape", ExReChipShape);
		    resultInfo.put("ExReSurfaceRoughness", ExReSurfaceRoughness);
		    resultInfo.put("ExReSurfaceHardness", ExReSurfaceHardness);
		    resultInfo.put("ExReSectionHardness", ExReSectionHardness);
		    resultInfo.put("ExReSurfaceStress", ExReSurfaceStress);
		    resultInfo.put("ExReSectionStress", ExReSectionStress);
		    resultInfo.put("ExReDefined1", ExReDefined1);
		    resultInfo.put("ExReDefined1Value", ExReDefined1Value);
		    resultInfo.put("ExReDefined2", ExReDefined2);
		    resultInfo.put("ExReDefined2Value", ExReDefined2Value);
		    resultInfo.put("ExReDefined3", ExReDefined3);
		    resultInfo.put("ExReDefined3Value", ExReDefined3Value);
		    resultInfo.put("ExReDefined4", ExReDefined4);
		    resultInfo.put("ExReDefined4Value", ExReDefined4Value);
		    resultInfo.put("ExReDefined5", ExReDefined5);
		    resultInfo.put("ExReDefined5Value", ExReDefined5Value);
		    resultInfo.put("ExReToolLife", ExReToolLife);
		    resultInfo.put("ExReWearStandard", ExReWearStandard);
		    experimentParameterResultService.saveResultInfo(resultInfo);
		    
		    experimentParameterResultService.cleanResultFile(resultInfo);
		    
		    if(array_ExReForceFile != null && !"".equals(array_ExReForceFile)){
				String array_ExReForceFiles[] = array_ExReForceFile.split(",");
				String array_ExReForceFiles_name[] = array_ExReForceFile_name.split(",");
				
				for(int i=0; i<array_ExReForceFiles.length; i++){
					if(array_ExReForceFiles[i] != null && !"".equals(array_ExReForceFiles[i])){
						resultInfo.put("url_ExperimentResultFile", array_ExReForceFiles[i]);
						resultInfo.put("name_ExperimentResultFile", array_ExReForceFiles_name[i]);
						resultInfo.put("ascription", "ExReForceFile");
						experimentParameterResultService.saveFileAll(resultInfo);
					}
				}
			}
		    
		    if(array_ExReTemperatureFile != null && !"".equals(array_ExReTemperatureFile)){
				String array_ExReTemperatureFiles[] = array_ExReTemperatureFile.split(",");
				String array_ExReTemperatureFiles_name[] = array_ExReTemperatureFile_name.split(",");
				
				for(int i=0; i<array_ExReTemperatureFiles.length; i++){
					if(array_ExReTemperatureFiles[i] != null && !"".equals(array_ExReTemperatureFiles[i])){
						resultInfo.put("url_ExperimentResultFile", array_ExReTemperatureFiles[i]);
						resultInfo.put("name_ExperimentResultFile", array_ExReTemperatureFiles_name[i]);
						resultInfo.put("ascription", "ExReTemperatureFile");
						experimentParameterResultService.saveFileAll(resultInfo);
					}
				}
			}
		    
		    if(array_SurfaceFile != null && !"".equals(array_SurfaceFile)){
				String array_SurfaceFiles[] = array_SurfaceFile.split(",");
				String array_SurfaceFiles_name[] = array_SurfaceFile_name.split(",");
				
				for(int i=0; i<array_SurfaceFiles.length; i++){
					if(array_SurfaceFiles[i] != null && !"".equals(array_SurfaceFiles[i])){
						resultInfo.put("url_ExperimentResultFile", array_SurfaceFiles[i]);
						resultInfo.put("name_ExperimentResultFile", array_SurfaceFiles_name[i]);
						resultInfo.put("ascription", "SurfaceFile");
						experimentParameterResultService.saveFileAll(resultInfo);
					}
				}
			}
		    
		    if(array_ShapeFile != null && !"".equals(array_ShapeFile)){
				String array_ShapeFiles[] = array_ShapeFile.split(",");
				String array_ShapeFiles_name[] = array_ShapeFile_name.split(",");
				
				for(int i=0; i<array_ShapeFiles.length; i++){
					if(array_ShapeFiles[i] != null && !"".equals(array_ShapeFiles[i])){
						resultInfo.put("url_ExperimentResultFile", array_ShapeFiles[i]);
						resultInfo.put("name_ExperimentResultFile", array_ShapeFiles_name[i]);
						resultInfo.put("ascription", "ShapeFile");
						experimentParameterResultService.saveFileAll(resultInfo);
					}
				}
			}
		    
		    if(array_SurfaceRoughnessFile != null && !"".equals(array_SurfaceRoughnessFile)){
				String array_SurfaceRoughnessFiles[] = array_SurfaceRoughnessFile.split(",");
				String array_SurfaceRoughnessFiles_name[] = array_SurfaceRoughnessFile_name.split(",");
				
				for(int i=0; i<array_SurfaceRoughnessFiles.length; i++){
					if(array_SurfaceRoughnessFiles[i] != null && !"".equals(array_SurfaceRoughnessFiles[i])){
						resultInfo.put("url_ExperimentResultFile", array_SurfaceRoughnessFiles[i]);
						resultInfo.put("name_ExperimentResultFile", array_SurfaceRoughnessFiles_name[i]);
						resultInfo.put("ascription", "SurfaceRoughnessFile");
						experimentParameterResultService.saveFileAll(resultInfo);
					}
				}
			}
		    
		    if(array_SurfaceHardnessFile != null && !"".equals(array_SurfaceHardnessFile)){
				String array_SurfaceHardnessFiles[] = array_SurfaceHardnessFile.split(",");
				String array_SurfaceHardnessFiles_name[] = array_SurfaceHardnessFile_name.split(",");
				
				for(int i=0; i<array_SurfaceHardnessFiles.length; i++){
					if(array_SurfaceHardnessFiles[i] != null && !"".equals(array_SurfaceHardnessFiles[i])){
						resultInfo.put("url_ExperimentResultFile", array_SurfaceHardnessFiles[i]);
						resultInfo.put("name_ExperimentResultFile", array_SurfaceHardnessFiles_name[i]);
						resultInfo.put("ascription", "SurfaceHardnessFile");
						experimentParameterResultService.saveFileAll(resultInfo);
					}
				}
			}
		    
		    if(array_ExReSectionHardnessFile != null && !"".equals(array_ExReSectionHardnessFile)){
				String array_ExReSectionHardnessFiles[] = array_ExReSectionHardnessFile.split(",");
				String array_ExReSectionHardnessFiles_name[] = array_ExReSectionHardnessFile_name.split(",");
				
				for(int i=0; i<array_ExReSectionHardnessFiles.length; i++){
					if(array_ExReSectionHardnessFiles[i] != null && !"".equals(array_ExReSectionHardnessFiles[i])){
						resultInfo.put("url_ExperimentResultFile", array_ExReSectionHardnessFiles[i]);
						resultInfo.put("name_ExperimentResultFile", array_ExReSectionHardnessFiles_name[i]);
						resultInfo.put("ascription", "ExReSectionHardnessFile");
						experimentParameterResultService.saveFileAll(resultInfo);
					}
				}
			}
		    
		    if(array_ExReSurfaceStressFile != null && !"".equals(array_ExReSurfaceStressFile)){
				String array_ExReSurfaceStressFiles[] = array_ExReSurfaceStressFile.split(",");
				String array_ExReSurfaceStressFiles_name[] = array_ExReSurfaceStressFile_name.split(",");
				
				for(int i=0; i<array_ExReSurfaceStressFiles.length; i++){
					if(array_ExReSurfaceStressFiles[i] != null && !"".equals(array_ExReSurfaceStressFiles[i])){
						resultInfo.put("url_ExperimentResultFile", array_ExReSurfaceStressFiles[i]);
						resultInfo.put("name_ExperimentResultFile", array_ExReSurfaceStressFiles_name[i]);
						resultInfo.put("ascription", "ExReSurfaceStressFile");
						experimentParameterResultService.saveFileAll(resultInfo);
					}
				}
			}
		    
		    if(array_ExReSectionStressFile != null && !"".equals(array_ExReSectionStressFile)){
				String array_ExReSectionStressFiles[] = array_ExReSectionStressFile.split(",");
				String array_ExReSectionStressFiles_name[] = array_ExReSectionStressFile_name.split(",");
				
				for(int i=0; i<array_ExReSectionStressFiles.length; i++){
					if(array_ExReSectionStressFiles[i] != null && !"".equals(array_ExReSectionStressFiles[i])){
						resultInfo.put("url_ExperimentResultFile", array_ExReSectionStressFiles[i]);
						resultInfo.put("name_ExperimentResultFile", array_ExReSectionStressFiles_name[i]);
						resultInfo.put("ascription", "ExReSectionStressFile");
						experimentParameterResultService.saveFileAll(resultInfo);
					}
				}
			}
		    
		    if(array_ExReDefined1File != null && !"".equals(array_ExReDefined1File)){
				String array_ExReDefined1Files[] = array_ExReDefined1File.split(",");
				String array_ExReDefined1Files_name[] = array_ExReDefined1File_name.split(",");
				
				for(int i=0; i<array_ExReDefined1Files.length; i++){
					if(array_ExReDefined1Files[i] != null && !"".equals(array_ExReDefined1Files[i])){
						resultInfo.put("url_ExperimentResultFile", array_ExReDefined1Files[i]);
						resultInfo.put("name_ExperimentResultFile", array_ExReDefined1Files_name[i]);
						resultInfo.put("ascription", "ExReDefined1File");
						experimentParameterResultService.saveFileAll(resultInfo);
					}
				}
			}
		    
		    if(array_ExReDefined2File != null && !"".equals(array_ExReDefined2File)){
				String array_ExReDefined2Files[] = array_ExReDefined2File.split(",");
				String array_ExReDefined2Files_name[] = array_ExReDefined2File_name.split(",");
				
				for(int i=0; i<array_ExReDefined2Files.length; i++){
					if(array_ExReDefined2Files[i] != null && !"".equals(array_ExReDefined2Files[i])){
						resultInfo.put("url_ExperimentResultFile", array_ExReDefined2Files[i]);
						resultInfo.put("name_ExperimentResultFile", array_ExReDefined2Files_name[i]);
						resultInfo.put("ascription", "ExReDefined2File");
						experimentParameterResultService.saveFileAll(resultInfo);
					}
				}
			}
		    
		    if(array_ExReDefined3File != null && !"".equals(array_ExReDefined3File)){
				String array_ExReDefined3Files[] = array_ExReDefined3File.split(",");
				String array_ExReDefined3Files_name[] = array_ExReDefined3File_name.split(",");
				
				for(int i=0; i<array_ExReDefined3Files.length; i++){
					if(array_ExReDefined3Files[i] != null && !"".equals(array_ExReDefined3Files[i])){
						resultInfo.put("url_ExperimentResultFile", array_ExReDefined3Files[i]);
						resultInfo.put("name_ExperimentResultFile", array_ExReDefined3Files_name[i]);
						resultInfo.put("ascription", "ExReDefined3File");
						experimentParameterResultService.saveFileAll(resultInfo);
					}
				}
			}
		    
		    if(array_ExReDefined4File != null && !"".equals(array_ExReDefined4File)){
				String array_ExReDefined4Files[] = array_ExReDefined4File.split(",");
				String array_ExReDefined4Files_name[] = array_ExReDefined4File_name.split(",");
				
				for(int i=0; i<array_ExReDefined4Files.length; i++){
					if(array_ExReDefined4Files[i] != null && !"".equals(array_ExReDefined4Files[i])){
						resultInfo.put("url_ExperimentResultFile", array_ExReDefined4Files[i]);
						resultInfo.put("name_ExperimentResultFile", array_ExReDefined4Files_name[i]);
						resultInfo.put("ascription", "ExReDefined4File");
						experimentParameterResultService.saveFileAll(resultInfo);
					}
				}
			}
		    
		    if(array_ExReDefined5File != null && !"".equals(array_ExReDefined5File)){
				String array_ExReDefined5Files[] = array_ExReDefined5File.split(",");
				String array_ExReDefined5Files_name[] = array_ExReDefined5File_name.split(",");
				
				for(int i=0; i<array_ExReDefined5Files.length; i++){
					if(array_ExReDefined5Files[i] != null && !"".equals(array_ExReDefined5Files[i])){
						resultInfo.put("url_ExperimentResultFile", array_ExReDefined5Files[i]);
						resultInfo.put("name_ExperimentResultFile", array_ExReDefined5Files_name[i]);
						resultInfo.put("ascription", "ExReDefined5File");
						experimentParameterResultService.saveFileAll(resultInfo);
					}
				}
			}
		    
		    if(array_ExReWearFile != null && !"".equals(array_ExReWearFile)){
				String array_ExReWearFiles[] = array_ExReWearFile.split(",");
				String array_ExReWearFiles_name[] = array_ExReWearFile_name.split(",");
				
				for(int i=0; i<array_ExReWearFiles.length; i++){
					if(array_ExReWearFiles[i] != null && !"".equals(array_ExReWearFiles[i])){
						resultInfo.put("url_ExperimentResultFile", array_ExReWearFiles[i]);
						resultInfo.put("name_ExperimentResultFile", array_ExReWearFiles_name[i]);
						resultInfo.put("ascription", "ExReWearFile");
						experimentParameterResultService.saveFileAll(resultInfo);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}
	    return "1";
		
	}
	
	
	 
	 @RequestMapping(value="/selectResult")
	 public ModelAndView selectResult(Page page, HttpServletRequest request){
		 ModelAndView mv=new ModelAndView();
			
			PageData pd = new PageData();
			
			HttpSession session = request.getSession();
			Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
			
			try {
				
				pd = this.getPageData();
				
				page.setPd(pd);
				Map map	= experimentParameterResultService.queryResultList(page);//查询试验基本信息页面
				page = (Page)map.get("page");
				List<Map> list = (List<Map>)map.get("list");
				
				if(list != null && list.size() > 0){
					for(int i = 0; i < list.size(); i++){
						Map ExperimentManage = list.get(i);
						int id_ExperimentManage = (int) ExperimentManage.get("id_ExperimentManage");
						
						Map para = new HashMap();
						para.put("id_ExperimentManage", id_ExperimentManage);
						
						//查询试验报告
						List<Map> ExperimentReportList = experimentParameterResultService.queryExperimentReportList(para);
						ExperimentManage.put("ExperimentReportList", ExperimentReportList);
						
						if(ExperimentManage!=null&&ExperimentManage.size()>0){
							String keys = experimentParameterResultService.selectKeys(""+ExperimentManage.get("id_ExperimentManage"));  //查询该实验都有哪些参数字段
							if(keys!=null&&!"".equals(keys)){
								String parameter[] = keys.split(",");    
								List<String> parameters = new ArrayList(Arrays.asList(parameter));//将这些字段转成List查询
								List<Map> ExperimentParameterResult = experimentParameterResultService.ExperimentParameterResult(parameters,""+ExperimentManage.get("id_ExperimentManage")); //用于和类型值对应。
								logger.info(ExperimentParameterResult.toString());
								
								ExperimentManage.put("ExperimentParameterResult",ExperimentParameterResult);
								ExperimentManage.put("parameters",parameters);
							}
						}
						
						list.set(i, ExperimentManage);
					}
				}
				
				List<Map> CategoryExperimentType = experimentManageService.CategoryExperimentType(); //用于和类型值对应。
				mv.addObject("CategoryExperimentType",CategoryExperimentType);
				
				mv.addObject("ExperimentManage", list);
				mv.addObject("pd", pd);
				mv.addObject("page", page);
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.setViewName("/WEB-INF/experimentControl/experimentParameterResult/experimentResult_list_new");
			
			return mv;
	 }
	
	@RequestMapping("/goExportResult")
	public ModelAndView goExportResult(String id_ExperimentParameterResult, HttpServletResponse res){
		
		Map ExperimentResult = experimentParameterResultService.CheckExperimentResultById(id_ExperimentParameterResult);
		try{ 
			 // 第一步，创建workbook
		     HSSFWorkbook wb = new HSSFWorkbook();  
		     // 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet  
		     HSSFSheet sheet = wb.createSheet("表");  
		     // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short  
		     HSSFRow row = sheet.createRow((int) 0);  
		     // 第四步，创建单元格，并设置值表头 设置表头居中  
		     HSSFCellStyle style = wb.createCellStyle();  
		     style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式  
		     
		     Set set = ExperimentResult.keySet();
		     List keyList = new ArrayList(set);
		     System.out.println(keyList);
		     for(int i=0;i<keyList.size();i++){
		    	 HSSFCell cell = row.createCell((short) i);  
			     cell.setCellValue(keyList.get(i)+"");  
			     cell.setCellStyle(style);  
		     }
		     for(int j= 0;j<ExperimentResult.size();j++){
		    	 row = sheet.createRow((int) 1);  
	             row.createCell((short) j).setCellValue(""+ExperimentResult.get(keyList.get(j)));  
	         }
		     
		     String fileName = "结果信息表";
		     ByteArrayOutputStream os = new ByteArrayOutputStream();
		     wb.write(os);
		     byte[] content = os.toByteArray();
		     InputStream is = new ByteArrayInputStream(content);
		     // 设置response参数，可以打开下载页面
		     res.reset();
		     res.setContentType("application/vnd.ms-excel;charset=utf-8");
		     res.setHeader("Content-Disposition", "attachment;filename=" + new String((fileName + ".xls").getBytes(), "iso-8859-1"));
		     ServletOutputStream out = res.getOutputStream();
		     BufferedInputStream bis = null;
		     BufferedOutputStream bos = null;
		     try {
			     bis = new BufferedInputStream(is);
			     bos = new BufferedOutputStream(out);
			     byte[] buff = new byte[2048];
			     int bytesRead;
			     while(-1 != (bytesRead = bis.read(buff, 0, buff.length))){
			    	 bos.write(buff, 0, bytesRead);
			    	 }
		     } 
		     catch (Exception e) {
		    	 e.printStackTrace();
		     } finally {
			     if (bis != null)
			     bis.close();
			     if (bos != null)
			     bos.close();
		     }
	     }catch (Exception e) {
	    	 e.printStackTrace();
	    	 System.out.println(e);
			}
		return null;
	}
	
	
	
	
	
	
	
}



















