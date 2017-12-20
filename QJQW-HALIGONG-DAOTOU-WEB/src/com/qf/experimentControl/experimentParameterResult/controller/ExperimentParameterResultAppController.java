package com.qf.experimentControl.experimentParameterResult.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
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

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.qf.experimentControl.experimentManage.service.experimentManageService;
import com.qf.experimentControl.experimentParameterResult.service.ExperimentParameterResultService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.common.JackJson;
import com.qf.util.controller.BaseController;
import com.qf.util.file.ByteToFile;
import com.qf.util.page.Page;

import sun.misc.BASE64Decoder;

@Controller
@RequestMapping("experimentParameterResultApp")
public class ExperimentParameterResultAppController extends BaseController{

	@Resource(name="experimentParameterResultService")
	private ExperimentParameterResultService experimentParameterResultService;
	
	//试验
	@Resource(name="experimentManageService")
	private experimentManageService experimentManageService;
	
	
	/**
	 * 去添加试验参数页面
	 * @param ExperimentNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "goExperimentParameterResult", produces = "application/json; charset=utf-8")
	public String goExperimentParameterResult(String ExperimentNo){
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		if(ExperimentNo!=null&&!"".equals(ExperimentNo)){
			Map<String,String> para = new HashMap();
			
			para.put("ExperimentNo", ExperimentNo);
			
			Map ExperimentManage = experimentParameterResultService.ByExperimentNo(para);	//通过编号查询出实验基本数据的名字和类型值
			resultmap.put("ExperimentManage",ExperimentManage);
			
			List<Map> CategoryExperimentType = experimentManageService.CategoryExperimentType(); //用于和类型值对应。
			resultmap.put("CategoryExperimentType",CategoryExperimentType);
			
			if(ExperimentManage!=null&&ExperimentManage.size()>0){
				String keys = experimentParameterResultService.selectKeys(""+ExperimentManage.get("id_ExperimentManage"));  //查询该实验都有哪些参数字段
				if(keys!=null&&!"".equals(keys)){
					String parameter[] = keys.split(",");    
					List<String> parameters = new ArrayList(Arrays.asList(parameter));//将这些字段转成List查询
					List<Map> ExperimentParameterResult = experimentParameterResultService.ExperimentParameterResult(parameters,""+ExperimentManage.get("id_ExperimentManage")); //用于和类型值对应。
					logger.info(ExperimentParameterResult.toString());
					
					resultmap.put("ExperimentParameterResult",ExperimentParameterResult);
					resultmap.put("parameters",parameters);
				}
				resultmap.put("result", "1");
				resultmap.put("msg","成功");
			}else{
				resultmap.put("result", "0");
				resultmap.put("msg","该编号不存在");
			}
		
		}
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	/**
	 * 导入excel并返回list
	 * @param excelFile
	 * @param fileSuffix
	 * @param filename
	 * @param ExperimentNo1
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "importExcel", produces = "application/json; charset=utf-8")
	public String importExcel(String excelFile,String fileSuffix, String filename,String ExperimentNo1){
		BASE64Decoder decoder = new BASE64Decoder();  
		String json  = "";  
		Map resultmap = new HashMap();
		/*if(ExperimentNo1!=null&&!"".equals(ExperimentNo1)){
			Map<String,String> para = new HashMap();
			para.put("ExperimentNo", ExperimentNo1);
			Map ExperimentManage = experimentParameterResultService.ByExperimentNo(para);	//通过编号查询出实验基本数据的名字和类型值
			resultmap.put("ExperimentManage",ExperimentManage);
			List<Map> CategoryExperimentType = experimentManageService.CategoryExperimentType(); //用于和类型值对应。
			resultmap.put("CategoryExperimentType",CategoryExperimentType);
		}
		String test = "UEsDBBQABgAIAAAAIQCnlfmZhAEAABQGAAATAN0BW0NvbnRlbnRfVHlwZXNdLnhtbCCi2QEooAAC"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAMxUyW7CMBC9V+o/RL5WxEClqqoSOHQ5tkjQDzDxQCwS2/IMFP6+k1BQqdJI"+
"NBx6SZTFb5tnJ+NtWUQbCGicTcUg7osIbOa0sctUvM9eevciQlJWq8JZSMUOUIxH11fJbOcBI15t"+
"MRU5kX+QErMcSoWx82D5y8KFUhE/hqX0KlupJchhv38nM2cJLPWowhCj5AkWal1Q9Lzl13slc2NF"+
"9Lj/r6JKhfK+MJkiFio3Vv8g6bnFwmSgXbYuGTpGH0BpzAGoLGIfDDOGKRCxMRRylLyx6WA0RBMV"+
"6FWVzCC3hSR2APvrIGYPnUTUYDcVyu+ESLsCsDPVqd896IG5Id4ABZ5n7WuAMa+sZ4C58djC0J5d"+
"eyYfLqzmzq0unUrVhrhUxh50N5WAKzQJzqPkwnUWAFWjNeieZ0gIZOCYWRM3F7DyXtcWZX0bdtZw"+
"Wo0jflsGDTpu/4mO7rvyb3lgrgLoKfFJsrz4dv2O3TaXYzczF+D8gRz2cLW6oZGyPtNHnwAAAP//"+
"AwBQSwMEFAAGAAgAAAAhALVVMCP1AAAATAIAAAsAzgFfcmVscy8ucmVscyCiygEooAACAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIySz07DMAzG"+
"70i8Q+T76m5ICKGlu0xIuyFUHsAk7h+1jaMkQPf2hAOCSmPb0fbnzz9b3u7maVQfHGIvTsO6KEGx"+
"M2J712p4rZ9WD6BiImdpFMcajhxhV93ebF94pJSbYtf7qLKLixq6lPwjYjQdTxQL8exypZEwUcph"+
"aNGTGahl3JTlPYa/HlAtPNXBaggHeweqPvo8+bK3NE1veC/mfWKXToxAnhM7y3blQ2YLqc/bqJpC"+
"y0mDFfOc0xHJ+yJjA54m2lxP9P+2OHEiS4nQSODzPN+Kc0Dr64Eun2ip+L3OPOKnhOFNZPhhwcUP"+
"VF8AAAD//wMAUEsDBBQABgAIAAAAIQDeCf0oAgEAANQDAAAaAAgBeGwvX3JlbHMvd29ya2Jvb2su"+
"eG1sLnJlbHMgogQBKKAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"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"+
"FAAGAAgAAAAhAKeV+ZmEAQAAFAYAABMAAAAAAAAAAAAAAAAAAAAAAFtDb250ZW50X1R5cGVzXS54"+
"bWxQSwECLQAUAAYACAAAACEAtVUwI/UAAABMAgAACwAAAAAAAAAAAAAAAACSAwAAX3JlbHMvLnJl"+
"bHNQSwECLQAUAAYACAAAACEA3gn9KAIBAADUAwAAGgAAAAAAAAAAAAAAAAB+BgAAeGwvX3JlbHMv"+
"d29ya2Jvb2sueG1sLnJlbHNQSwECLQAUAAYACAAAACEADz0pr2cBAACBAgAADwAAAAAAAAAAAAAA"+
"AADACAAAeGwvd29ya2Jvb2sueG1sUEsBAi0AFAAGAAgAAAAhAIgn+jGIBgAAVBsAABMAAAAAAAAA"+
"AAAAAAAAVAoAAHhsL3RoZW1lL3RoZW1lMS54bWxQSwECLQAUAAYACAAAACEAYs7UQ2UBAABIAgAA"+
"GAAAAAAAAAAAAAAAAAANEQAAeGwvd29ya3NoZWV0cy9zaGVldDIueG1sUEsBAi0AFAAGAAgAAAAh"+
"ADttMkvBAAAAQgEAACMAAAAAAAAAAAAAAAAAqBIAAHhsL3dvcmtzaGVldHMvX3JlbHMvc2hlZXQx"+
"LnhtbC5yZWxzUEsBAi0AFAAGAAgAAAAhABPELBPCAAAAQgEAACMAAAAAAAAAAAAAAAAAqhMAAHhs"+
"L3dvcmtzaGVldHMvX3JlbHMvc2hlZXQyLnhtbC5yZWxzUEsBAi0AFAAGAAgAAAAhADShCZLCAAAA"+
"QgEAACMAAAAAAAAAAAAAAAAArRQAAHhsL3dvcmtzaGVldHMvX3JlbHMvc2hlZXQzLnhtbC5yZWxz"+
"UEsBAi0AFAAGAAgAAAAhAGLO1ENlAQAASAIAABgAAAAAAAAAAAAAAAAAsBUAAHhsL3dvcmtzaGVl"+
"dHMvc2hlZXQzLnhtbFBLAQItABQABgAIAAAAIQCPqwQhFAIAAPYDAAAYAAAAAAAAAAAAAAAAAEsX"+
"AAB4bC93b3Jrc2hlZXRzL3NoZWV0MS54bWxQSwECLQAUAAYACAAAACEA13m5z9EAAABEAQAAFAAA"+
"AAAAAAAAAAAAAACVGQAAeGwvc2hhcmVkU3RyaW5ncy54bWxQSwECLQAUAAYACAAAACEAxfak9eIB"+
"AAAjBAAADQAAAAAAAAAAAAAAAACYGgAAeGwvc3R5bGVzLnhtbFBLAQItABQABgAIAAAAIQAFy4xK"+
"RwAAAGwBAAAnAAAAAAAAAAAAAAAAAKUcAAB4bC9wcmludGVyU2V0dGluZ3MvcHJpbnRlclNldHRp"+
"bmdzMi5iaW5QSwECLQAUAAYACAAAACEABcuMSkcAAABsAQAAJwAAAAAAAAAAAAAAAAAxHQAAeGwv"+
"cHJpbnRlclNldHRpbmdzL3ByaW50ZXJTZXR0aW5nczEuYmluUEsBAi0AFAAGAAgAAAAhAAXLjEpH"+
"AAAAbAEAACcAAAAAAAAAAAAAAAAAvR0AAHhsL3ByaW50ZXJTZXR0aW5ncy9wcmludGVyU2V0dGlu"+
"Z3MzLmJpblBLAQItABQABgAIAAAAIQBsP/8zQQEAAFECAAARAAAAAAAAAAAAAAAAAEkeAABkb2NQ"+
"cm9wcy9jb3JlLnhtbFBLAQItABQABgAIAAAAIQBIPB02owEAAEYDAAAQAAAAAAAAAAAAAAAAAMEg"+
"AABkb2NQcm9wcy9hcHAueG1sUEsFBgAAAAASABIA/gQAAJojAAAAAA==";*/
		if(excelFile!=null&&!"".equals(excelFile)){
			try {
				byte[] b = decoder.decodeBuffer(excelFile);   //test为base64编码的字符串（其本身是一个excel文件）、将其通过base64形式解码
				for (int i = 0; i < b.length; ++i) {  
	                {// 调整异常数据  
	                if (b[i] < 0)   
	                    b[i] += 256;  
	                }  
	            }
				InputStream n = new ByteArrayInputStream(b);  //将解码后的文件加入输入流
				
				Workbook wb = null;
				if (fileSuffix.equals(".xls")) {  //判断接收到的文件是什么类型的Excel
		           	wb = (Workbook) new HSSFWorkbook(n);     //将流当参数，初始化构造Workbook对象
		        }  
		        else if (fileSuffix.equals(".xlsx")) {  
		            wb = new XSSFWorkbook(n);  //将流当参数，初始化构造Workbook对象
		        }  
				//————————————————————以下一系列为操作表格内容——————————————————————
				Sheet sheet1 = wb.getSheetAt(0);
				Row row = sheet1.getRow(0);
				int coloumNum = row.getPhysicalNumberOfCells();
	            
	            List<String> list = new ArrayList<>();	//将列头存入List
	            for(int i = 0;i<coloumNum;i++){
	            	list.add(""+row.getCell(i));
	            }
	            int rowNum=sheet1.getLastRowNum();//获得总行数
	            System.out.println("行数："+rowNum);	
	            List<Map> ExperimentParameterResult = new ArrayList<Map>();			//将除列头外的数据存入List<Map>
	            for(int i = 1;i<rowNum+1;i++){
	            	Row rowI = sheet1.getRow(i);
	            	Map<String,String> map1 = new HashMap<String,String>();
	            	for(int j = 0;j<coloumNum;j++){
	                	map1.put(list.get(j), ""+rowI.getCell(j));
	            	}
	            	ExperimentParameterResult.add(map1);
	            }
	            System.out.println("所有数据"+ExperimentParameterResult);
	            System.out.println(list);
	            //————————————————————以上一系列为操作表格内容——————————————————————
	            
	            resultmap.put("ExperimentParameterResult",ExperimentParameterResult);    //因为词句报异常。！！！！！！  
	            
	            resultmap.put("parameters",list);
	            
	            resultmap.put("result", "1");
				resultmap.put("msg","成功");
			}catch (Exception e) {
				e.printStackTrace();
				resultmap.put("result", "0");
				resultmap.put("msg","文件解析失败");
			}
		}else{
			resultmap.put("result", "0");
			resultmap.put("msg","传入的文件为空");
		}
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}

	
	
	/**
	 * 保存参数
	 */
	@ResponseBody
	@RequestMapping(value = "saveExperimentParameterResult", produces = "application/json; charset=utf-8")
	public String saveExperimentParameterResult(String json, String id){
		
		String json_return  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		 try{
			 if(json!=null&&!"".equals(json)){
				 List<Map> list = new ArrayList<Map>();  
			     list = JSONObject.parseArray(json, Map.class);   //将Json转换成List<map>
			     
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
		     resultmap.put("result", "1");
		     resultmap.put("msg", "保存成功");
			 }
			 else{
				 resultmap.put("result", "0");
			     resultmap.put("msg", "json为空！");
			 }
		 }catch (Exception e) {
			 e.printStackTrace();
			 resultmap.put("result", "0");
		     resultmap.put("msg", "保存失败");
		}
		 
		json_return = JackJson.fromObjectToJson(resultmap);
		return json_return;
	}
	
	
	/**
	 * 导出ex表
	 * @param json
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "exportExperimentParameterResult", produces = "application/json; charset=utf-8")
	public String exportExperimentParameterResult(String json, String id){
		String json_return  = "";  
		Map resultmap = new HashMap();
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		if(json!=null&&!"".equals(json)){
			 try{
				 List<Map> list = new ArrayList<Map>();  
			     list = JSONObject.parseArray(json, Map.class);   //将Json转换成List<map>
			     
			     //--------------------------分割----------------------------
			     // 第一步，创建workbook
			     XSSFWorkbook wb = new XSSFWorkbook();  
			     // 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet  
			     XSSFSheet sheet = wb.createSheet("表");  
			     // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short  
			     XSSFRow row = sheet.createRow((int) 0);  
			     // 第四步，创建单元格，并设置值表头 设置表头居中  
			     XSSFCellStyle style = wb.createCellStyle();  
			     style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式  
			     
			     Set set = list.get(0).keySet();
			     List keyList = new ArrayList(set);
			     for(int i=0;i<keyList.size();i++){
			    	 XSSFCell cell = row.createCell((short) i);  
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
			     
			     //创建输出流，将Wb内容放入输出流并转成字节数组
			     ByteArrayOutputStream os = new ByteArrayOutputStream();
			     wb.write(os);
			     byte[] content = os.toByteArray();
			     
			     String fileName = "参数信息表";
			     String path =  request.getSession().getServletContext().getRealPath("/goods/excelFile/" + fileName + ".xlsx");
			     System.out.println(path);
			     OutputStream out = new FileOutputStream(path);
			     //将文件生成到该目录下。
			     out.write(content);
			     out.flush();
			     out.close();
			     
			     resultmap.put("result", "1");
			     resultmap.put("msg", "文件导出成功");
			     resultmap.put("url", "/goods/excelFile/" + fileName + ".xml");
			     //--------------------------分割-----------------------------
			 }catch (Exception e) {
				 e.printStackTrace();
				 resultmap.put("result", "0");
				 resultmap.put("msg", "文件生成失败");
			}
		}else{
			resultmap.put("result", "0");
			resultmap.put("msg", "json为空！");
		}
		json_return = JackJson.fromObjectToJson(resultmap);
		return json_return;
	}
	
	
	/**
	 * 通过ID返回实验结果
	 */
	@ResponseBody
	@RequestMapping(value = "CheckExperimentResultList", produces = "application/json; charset=utf-8")
	public String CheckExperimentResultList(String id_ExperimentParameterResult){
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		Map ExperimentResult = experimentParameterResultService.CheckExperimentResultById(id_ExperimentParameterResult);
		System.out.println(ExperimentResult);
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
			
			resultmap.put("array_ExReWearFile", array_ExReWearFile);
			resultmap.put("array_ExReWearFile_name", array_ExReWearFile_name);
			
			resultmap.put("array_ExReDefined5File", array_ExReDefined5File);
			resultmap.put("array_ExReDefined5File_name", array_ExReDefined5File_name);
			
			resultmap.put("array_ExReDefined4File", array_ExReDefined4File);
			resultmap.put("array_ExReDefined4File_name", array_ExReDefined4File_name);
			
			resultmap.put("array_ExReDefined3File", array_ExReDefined3File);
			resultmap.put("array_ExReDefined3File_name", array_ExReDefined3File_name);
			
			resultmap.put("array_ExReDefined2File", array_ExReDefined2File);
			resultmap.put("array_ExReDefined2File_name", array_ExReDefined2File_name);
			
			resultmap.put("array_ExReDefined1File", array_ExReDefined1File);
			resultmap.put("array_ExReDefined1File_name", array_ExReDefined1File_name);
			
			resultmap.put("array_ExReSectionStressFile", array_ExReSectionStressFile);
			resultmap.put("array_ExReSectionStressFile_name", array_ExReSectionStressFile_name);
			
			resultmap.put("array_ExReSurfaceStressFile", array_ExReSurfaceStressFile);
			resultmap.put("array_ExReSurfaceStressFile_name", array_ExReSurfaceStressFile_name);
			
			resultmap.put("array_ExReSectionHardnessFile", array_ExReSectionHardnessFile);
			resultmap.put("array_ExReSectionHardnessFile_name", array_ExReSectionHardnessFile_name);
			
			resultmap.put("array_SurfaceHardnessFile", array_SurfaceHardnessFile);
			resultmap.put("array_SurfaceHardnessFile_name", array_SurfaceHardnessFile_name);
			
			resultmap.put("array_SurfaceRoughnessFile", array_SurfaceRoughnessFile);
			resultmap.put("array_SurfaceRoughnessFile_name", array_SurfaceRoughnessFile_name);
			
			resultmap.put("array_ShapeFile", array_ShapeFile);
			resultmap.put("array_ShapeFile_name", array_ShapeFile_name);
			
			resultmap.put("array_SurfaceFile", array_SurfaceFile);
			resultmap.put("array_SurfaceFile_name", array_SurfaceFile_name);
			
			resultmap.put("array_ExReTemperatureFile", array_ExReTemperatureFile);
			resultmap.put("array_ExReTemperatureFile_name", array_ExReTemperatureFile_name);
			
			resultmap.put("array_ExReForceFile", array_ExReForceFile);
			resultmap.put("array_ExReForceFile_name", array_ExReForceFile_name);
			
			
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
		resultmap.put("Number",i);
		resultmap.put("ExperimentResult",ExperimentResult);
		resultmap.put("ExperimentParameterToolWear",ExperimentParameterToolWear);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
		
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/saveResultFile", produces = "application/json; charset=utf-8")
	public String saveResultFile(
			String file ,String fileSuffix, String filename) throws Exception{
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		String json  = "";  
		Map resultmap = new HashMap();
		String url = null;
		String name = null;
		if(file != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/resultFile/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/resultFile/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(file,  filepath2);
			url =  "/resultFile/" + big_url + "." + fileSuffix;
			name = filename;
		}
		
				
		resultmap.put("result", "1");
		
		resultmap.put("url", url);
		resultmap.put("name", name);
		
		json = JackJson.fromObjectToJson(resultmap);
		
		return json;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/saveResultInfo", produces = "application/json; charset=utf-8")
	public String saveResultInfo(String id_ExperimentParameterResult,String ExReForceX,String ExReForceY,String ExReForceZ,String ExReTorque,String ExReTemperature,
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
		
		String json  = "";  
		Map resultmap = new HashMap();
		
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
			resultmap.put("result", "0");
			resultmap.put("msg", "操作失败");
			json = JackJson.fromObjectToJson(resultmap);
			return json;
		}
		resultmap.put("result", "1");
		resultmap.put("msg", "操作成功");
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	 @ResponseBody
	 @RequestMapping(value="/selectResult", produces = "application/json; charset=utf-8")
	 public String selectResult(int pageNo, int pageSize, 
				String ExperimentNo, String ExperimentType,String ExperimentMachine, 
				String ExperimentPart, String NumberMaterialExperimentPart,String CategoryMaterialExperimentPart, 
				String ExperimentTool, String ExperimentToolMaterial,String ExperimentCuttingFluid, String ExperimentMachiningType){
			
		 	String json  = "";  
			Map resultmap = new HashMap();
			Map map	= null;
			
			try {
				
				Page page = new Page(pageNo, pageSize);
				PageData pd = new PageData();
				
				pd.put("ExperimentNo", ExperimentNo);
				pd.put("ExperimentType", ExperimentType);
				pd.put("ExperimentMachine", ExperimentMachine);
				pd.put("ExperimentPart", ExperimentPart);
				pd.put("NumberMaterialExperimentPart", NumberMaterialExperimentPart);
				pd.put("CategoryMaterialExperimentPart", CategoryMaterialExperimentPart);
				pd.put("ExperimentTool", ExperimentTool);
				pd.put("ExperimentToolMaterial", ExperimentToolMaterial);
				pd.put("ExperimentCuttingFluid", ExperimentCuttingFluid);
				pd.put("ExperimentMachiningType", ExperimentMachiningType);
				
				page.setPd(pd);
				map	= experimentParameterResultService.queryResultList(page);//查询试验基本信息页面
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
					Map pageMap = new HashMap();
					int pageCount = page.getPageCount();
					pageMap.put("pageCount", pageCount);
					resultmap.put("page", pageMap);
				}else{
					Map pageMap = new HashMap();
					pageMap.put("pageCount", 0);
					resultmap.put("page", pageMap);
				}
				List<Map> CategoryExperimentType = experimentManageService.CategoryExperimentType(); //用于和类型值对应。
				resultmap.put("CategoryExperimentType",CategoryExperimentType);
				resultmap.put("result", "1");
				resultmap.put("ExperimentManage", list);
			} catch (Exception e) {
				e.printStackTrace();
				resultmap.put("result", "0");
			}
			Map para = new HashMap();
			para.put("ExperimentNo", ExperimentNo);
			para.put("ExperimentType", ExperimentType);
			para.put("ExperimentMachine", ExperimentMachine);
			para.put("ExperimentPart", ExperimentPart);
			para.put("NumberMaterialExperimentPart", NumberMaterialExperimentPart);
			para.put("CategoryMaterialExperimentPart", CategoryMaterialExperimentPart);
			para.put("ExperimentTool", ExperimentTool);
			para.put("ExperimentToolMaterial", ExperimentToolMaterial);
			para.put("ExperimentCuttingFluid", ExperimentCuttingFluid);
			para.put("ExperimentMachiningType", ExperimentMachiningType);
			resultmap.put("para", para);
			json = JackJson.fromObjectToJson(resultmap);
			return json;
	 }
	 
	 
	 
	 @ResponseBody
	 @RequestMapping(value = "/goExportResult", produces = "application/json; charset=utf-8")
	public String goExportResult(String id_ExperimentParameterResult){
		
	 	String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		Map ExperimentResult = experimentParameterResultService.CheckExperimentResultById(id_ExperimentParameterResult);
		System.out.println(ExperimentResult);
		try{ 
			 // 第一步，创建workbook
		     XSSFWorkbook wb = new XSSFWorkbook();  
		     // 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet  
		     XSSFSheet sheet = wb.createSheet("表");  
		     // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short  
		     XSSFRow row = sheet.createRow((int) 0);  
		     // 第四步，创建单元格，并设置值表头 设置表头居中  
		     XSSFCellStyle style = wb.createCellStyle();  
		     style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式  
		     
		     Set set = ExperimentResult.keySet();
		     List keyList = new ArrayList(set);
		     for(int i=0;i<keyList.size();i++){
		    	 XSSFCell cell = row.createCell((short) i);  
		    	 
			     cell.setCellValue(keyList.get(i)+"");  
			     cell.setCellStyle(style);  
		     }
		     XSSFRow row1 = sheet.createRow((int) 1); 
		     for(int j= 0;j<ExperimentResult.size();j++){
		    	 XSSFCell cell = row1.createCell((short) j);
		    	 cell.setCellValue(ExperimentResult.get(keyList.get(j))+"");  
	         }
		     
		     //创建输出流，将Wb内容放入输出流并转成字节数组
		     ByteArrayOutputStream os = new ByteArrayOutputStream();
		     wb.write(os);
		     byte[] content = os.toByteArray();
		     
		     String fileName = "结果信息表";
		     String path =  request.getSession().getServletContext().getRealPath("/goods/excelFile/" + fileName + ".xlsx");
		     OutputStream out = new FileOutputStream(path);
		     //将文件生成到该目录下。
		     out.write(content);
		     out.flush();
		     out.close();
		     
		     resultmap.put("result", "1");
		     resultmap.put("msg", "文件导出成功");
		     resultmap.put("url", "/excelFile/" + fileName + ".xml");
		     
	     }catch (Exception e) {
	    	 e.printStackTrace();
	    	 resultmap.put("result", "0");
			 resultmap.put("msg", "文件生成失败");
		}
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
		
	}
	 
	 
	
	
}
