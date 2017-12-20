package com.qf.tool.toolBTAdrill.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.qf.tool.toolBTAdrill.service.ToolBTAdrillService;
import com.qf.util.PageData;
import com.qf.util.common.JackJson;
import com.qf.util.controller.BaseController;
import com.qf.util.file.ByteToFile;
import com.qf.util.page.Page;

/**
*
* 项目名称：qf
* 类名称：SystemUserController
* 类描述：用户管理
* 创建人：周广文
* 创建时间：2015年5月13日 下午2:02:00
* 修改人：周广文
* 修改时间：2015年5月13日 下午2:02:00
* 修改备注：
* @version
*
*/
@Controller
@RequestMapping("/toolBTAdrillApp")
public class ToolBTAdrillAppController  extends BaseController{
	
    @Resource(name="toolBTAdrillService")
    private ToolBTAdrillService toolBTAdrillService;  
    
    @ResponseBody
    @RequestMapping(value="queryToolBTAdrillList", produces = "application/json; charset=utf-8")
	public String queryToolBTAdrillList(int pageNo, int pageSize, String NumberBTADrill, String TypeBTADrill, String NameBTADrill, 
			String DiameterBTADrill, String MateriaBTAlDrill, String ToolMaterialBTADrill, String ToolCoatBTADrill, String BreakerBTADrill, String CompanyBTADrill){
    	
    	System.out.println("pageNo == " + pageNo + "=====================" + "     pageSize = " + pageSize);
    	String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		try {
			Page page = new Page(pageNo, pageSize);

			PageData pd = new PageData();
			pd.put("NumberBTADrill", NumberBTADrill);
			pd.put("TypeBTADrill", TypeBTADrill);
			pd.put("NameBTADrill", NameBTADrill);
			pd.put("DiameterBTADrill", DiameterBTADrill);
			pd.put("MateriaBTAlDrill", MateriaBTAlDrill);
			pd.put("ToolMaterialBTADrill", ToolMaterialBTADrill);
			pd.put("ToolCoatBTADrill", ToolCoatBTADrill);
			pd.put("BreakerBTADrill", BreakerBTADrill);
			pd.put("CompanyBTADrill", CompanyBTADrill);
			page.setPd(pd);
			
			map	= toolBTAdrillService.queryToolBTAdrillList(page);//查询深孔钻列表
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			if(list != null && list.size() > 0){
				for(int i = 0; i < list.size(); i++){
					Map toolBTAdrill = list.get(i);
					int id_BTADrill = (int) toolBTAdrill.get("id_BTADrill");
					
					Map para = new HashMap();
					para.put("id_BTADrill", id_BTADrill);
					
					//查询刀具图片列表 PictureBTADrill
					List<Map> pictureBTADrillList = toolBTAdrillService.queryPictureBTADrillList(para);
					//查询详细图片列表 PictureDetailBTADrill
					List<Map> pictureDetailBTADrill = toolBTAdrillService.queryPictureDetailBTADrillList(para);
					//查询详细信息列表 InformDetailBTADrill
					List<Map> informDetailBTADrillList = toolBTAdrillService.queryInformDetailBTADrillList(para);
					//查询应用实例列表 ApplicationBTADrill
					List<Map> applicationBTADrillList = toolBTAdrillService.queryApplicationBTADrillList(para);
					
					toolBTAdrill.put("pictureBTADrillList", pictureBTADrillList);
					toolBTAdrill.put("pictureDetailBTADrillList", pictureDetailBTADrill);
					toolBTAdrill.put("informDetailBTADrillList", informDetailBTADrillList);
					toolBTAdrill.put("applicationBTADrillList", applicationBTADrillList);
					list.set(i, toolBTAdrill);
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
			
			resultmap.put("result", "1");
			resultmap.put("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			resultmap.put("result", "0");
		}
		
		Map para = new HashMap();
		para.put("NumberBTADrill", NumberBTADrill);
		para.put("TypeBTADrill", TypeBTADrill);
		para.put("NameBTADrill", NameBTADrill);
		para.put("DiameterBTADrill", DiameterBTADrill);
		para.put("MateriaBTAlDrill", MateriaBTAlDrill);
		para.put("ToolMaterialBTADrill", ToolMaterialBTADrill);
		para.put("ToolCoatBTADrill", ToolCoatBTADrill);
		para.put("BreakerBTADrill", BreakerBTADrill);
		para.put("CompanyBTADrill", CompanyBTADrill);
		resultmap.put("para", para);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
		
	}
  
    
   
    /**
	 * 去新增深孔钻页面
	 */
    @ResponseBody
	@RequestMapping(value="/goAddToolBTAdrill", produces = "application/json; charset=utf-8")
	public String goAddToolBTAdrill(String id){

    	String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		Map para = new HashMap();
		para.put("id_BTADrill", id);
		Map toolBTAdrill = toolBTAdrillService.queryToolBTAdrillById(para);//查询深孔钻
		if(toolBTAdrill != null){
			String isPMKNS = (String) toolBTAdrill.get("isPMKNS");
			if("P".equals(isPMKNS)){
				toolBTAdrill.put("ISOTextBTADrill", toolBTAdrill.get("ISOPTextBTADrill"));
			}else if("M".equals(isPMKNS)){
				toolBTAdrill.put("ISOTextBTADrill", toolBTAdrill.get("ISOMTextBTADrill"));
			}else if("K".equals(isPMKNS)){
				toolBTAdrill.put("ISOTextBTADrill", toolBTAdrill.get("ISOKTextBTADrill"));
			}else if("N".equals(isPMKNS)){
				toolBTAdrill.put("ISOTextBTADrill", toolBTAdrill.get("ISONTextBTADrill"));
			}else if("S".equals(isPMKNS)){
				toolBTAdrill.put("ISOTextBTADrill", toolBTAdrill.get("ISOSTextBTADrill"));
			}
			
			
			//查询刀具图片列表 PictureBTADrill
			List<Map> pictureBTADrillList = toolBTAdrillService.queryPictureBTADrillList(para);
			String array_PictureBTADrill = "";
			if(pictureBTADrillList != null && pictureBTADrillList.size() > 0){
				for(int i = 0; i < pictureBTADrillList.size(); i++){
					array_PictureBTADrill = array_PictureBTADrill + pictureBTADrillList.get(i).get("url_PictureBTADrill") + ",";
				}
			}
			
			//查询详细图片列表 PictureDetailBTADrill
			List<Map> pictureDetailBTADrillList = toolBTAdrillService.queryPictureDetailBTADrillList(para);
			String array_PictureDetailBTADrill = "";
			if(pictureDetailBTADrillList != null && pictureDetailBTADrillList.size() > 0){
				for(int i = 0; i < pictureDetailBTADrillList.size(); i++){
					array_PictureDetailBTADrill = array_PictureDetailBTADrill + pictureDetailBTADrillList.get(i).get("url_PictureDetailBTADrill") + ",";
				}
			}
			
			//查询详细信息列表 InformDetailBTADrill
			List<Map> informDetailBTADrillList = toolBTAdrillService.queryInformDetailBTADrillList(para);
			String array_InformDetailBTADrill = "";
			String array_InformDetailBTADrill_name = "";
			if(informDetailBTADrillList != null && informDetailBTADrillList.size() > 0){
				for(int i = 0; i < informDetailBTADrillList.size(); i++){
					array_InformDetailBTADrill = array_InformDetailBTADrill + informDetailBTADrillList.get(i).get("url_InformDetailBTADrill") + ",";
					array_InformDetailBTADrill_name = array_InformDetailBTADrill_name + informDetailBTADrillList.get(i).get("name_InformDetailBTADrill") + ",";
				}
			}
			
			//查询应用实例列表 ApplicationBTADrill
			List<Map> applicationBTADrillList = toolBTAdrillService.queryApplicationBTADrillList(para);
			String array_ApplicationBTADrill = "";
			String array_ApplicationBTADrill_name = "";
			if(applicationBTADrillList != null && applicationBTADrillList.size() > 0){
				for(int i = 0; i < applicationBTADrillList.size(); i++){
					array_ApplicationBTADrill = array_ApplicationBTADrill + applicationBTADrillList.get(i).get("url_ApplicationBTADrill") + ",";
					array_ApplicationBTADrill_name = array_ApplicationBTADrill_name + applicationBTADrillList.get(i).get("name_ApplicationBTADrill") + ",";
				}
			}
			
			toolBTAdrill.put("pictureBTADrillList", pictureBTADrillList);
			toolBTAdrill.put("pictureDetailBTADrillList", pictureDetailBTADrillList);
			toolBTAdrill.put("informDetailBTADrillList", informDetailBTADrillList);
			toolBTAdrill.put("applicationBTADrillList", applicationBTADrillList);
			
			resultmap.put("result", "1");
			resultmap.put("toolBTAdrill", toolBTAdrill);
			
			resultmap.put("array_PictureBTADrill", array_PictureBTADrill);
			resultmap.put("array_PictureDetailBTADrill", array_PictureDetailBTADrill);
			resultmap.put("array_InformDetailBTADrill", array_InformDetailBTADrill);
			resultmap.put("array_InformDetailBTADrill_name", array_InformDetailBTADrill_name);
			resultmap.put("array_ApplicationBTADrill", array_ApplicationBTADrill);
			resultmap.put("array_ApplicationBTADrill_name", array_ApplicationBTADrill_name);
		}

		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
	/**
	 * 保存深孔钻数据
	 * @param user_id
	 * @param id_BTADrill
	 * @param NumberBTADrill
	 * @param TypeBTADrill
	 * @param NameBTADrill
	 * @param DiameterBTADrill
	 * @param MateriaBTAlDrill
	 * @param ToolMaterialBTADrill
	 * @param ToolCoatBTADrill
	 * @param BreakerBTADrill
	 * @param isPMKNS
	 * @param ISOTextBTADrill
	 * @param array_PictureBTADrill
	 * @param array_PictureDetailBTADrill
	 * @param array_InformDetailBTADrill
	 * @param array_InformDetailBTADrill_name
	 * @param array_ApplicationBTADrill
	 * @param array_ApplicationBTADrill_name
	 * @return
	 */
    @ResponseBody
	@RequestMapping(value="/saveToolBTAdrill", produces = "application/json; charset=utf-8")
	public String saveToolBTAdrill(String user_id, int id_BTADrill, String NumberBTADrill, String TypeBTADrill, String NameBTADrill, String DiameterBTADrill
								 , String MateriaBTAlDrill, String ToolMaterialBTADrill, String ToolCoatBTADrill, String BreakerBTADrill, String CompanyBTADrill, String isPMKNS
								 , String ISOPTextBTADrill, String ISOMTextBTADrill, String ISOKTextBTADrill, String ISONTextBTADrill, String ISOSTextBTADrill
								 , String array_PictureBTADrill, String array_PictureDetailBTADrill
								 , String array_InformDetailBTADrill, String array_InformDetailBTADrill_name, String array_ApplicationBTADrill, String array_ApplicationBTADrill_name) {
    	String json  = "";  
		Map resultmap = new HashMap();
//		Map map	= null;
    	
    	Map para = new HashMap();
		para.put("id_BTADrill", id_BTADrill);
		para.put("NumberBTADrill", NumberBTADrill);
		para.put("TypeBTADrill", TypeBTADrill);
		para.put("NameBTADrill", NameBTADrill);
		if(DiameterBTADrill == null || "".equals(DiameterBTADrill)){
			para.put("DiameterBTADrill", "0");
		}else{
			para.put("DiameterBTADrill", DiameterBTADrill);
		}
		para.put("MateriaBTAlDrill", MateriaBTAlDrill);
		para.put("ToolMaterialBTADrill", ToolMaterialBTADrill);
		para.put("ToolCoatBTADrill", ToolCoatBTADrill);
		para.put("BreakerBTADrill", BreakerBTADrill);
		para.put("CompanyBTADrill", CompanyBTADrill);
		para.put("isPMKNS", isPMKNS);
		if(isPMKNS != null && !"".equals(isPMKNS)){
			if(isPMKNS.contains("P")){//1 加工P 2 加工M 3 加工K 4 加工N 5 加工S
				para.put("ISOPBTADrill", "1");
				para.put("ISOPTextBTADrill", ISOPTextBTADrill);
			}
			if(isPMKNS.contains("M")){//1 加工P 2 加工M 3 加工K 4 加工N 5 加工S
				para.put("ISOMBTADrill", "1");
				para.put("ISOMTextBTADrill", ISOMTextBTADrill);
			}
			if(isPMKNS.contains("K")){//1 加工P 2 加工M 3 加工K 4 加工N 5 加工S
				para.put("ISOKBTADrill", "1");
				para.put("ISOKTextBTADrill", ISOKTextBTADrill);
			}
			if(isPMKNS.contains("N")){//1 加工P 2 加工M 3 加工K 4 加工N 5 加工S
				para.put("ISONBTADrill", "1");
				para.put("ISONTextBTADrill", ISONTextBTADrill);
			}
			if(isPMKNS.contains("S")){//1 加工P 2 加工M 3 加工K 4 加工N 5 加工S
				para.put("ISOSBTADrill", "1");
				para.put("ISOSTextBTADrill", ISOSTextBTADrill);
			}
		}
		para.put("add_time", System.currentTimeMillis() / 1000);
		para.put("user_id", user_id);
		try {
			if(id_BTADrill != 0){//修改
				toolBTAdrillService.updateToolBTAdrill(para);
			}else{//新增
				
				toolBTAdrillService.saveToolBTAdrill(para);
			}
			//清空刀具图片路径
			toolBTAdrillService.clearPictureBTADrillByIdBTADrill(para);
			//保存刀具图片
			if(array_PictureBTADrill != null && !"".equals(array_PictureBTADrill)){
				String array_PictureBTADrills[] = array_PictureBTADrill.split(",");
				for(int i=0; i<array_PictureBTADrills.length; i++){
					if(array_PictureBTADrills[i] != null && !"".equals(array_PictureBTADrills[i])){
						para.put("url_PictureBTADrill", array_PictureBTADrills[i]);
						toolBTAdrillService.savePictureBTADrill(para);
					}
				}
			}
			
			
			//清空详细图片路径
			toolBTAdrillService.clearPictureDetailBTADrillByIdBTADrill(para);
			//保存详细图片
			if(array_PictureDetailBTADrill != null && !"".equals(array_PictureDetailBTADrill)){
				String array_PictureDetailBTADrills[] = array_PictureDetailBTADrill.split(",");
				for(int i=0; i<array_PictureDetailBTADrills.length; i++){
					if(array_PictureDetailBTADrills[i] != null && !"".equals(array_PictureDetailBTADrills[i])){
						para.put("url_PictureDetailBTADrill", array_PictureDetailBTADrills[i]);
						toolBTAdrillService.savePictureDetailBTADrill(para);
					}
				}
			}
			
			
			//清空应用实例路径
			toolBTAdrillService.clearApplicationBTADrillByIdBTADrill(para);
			//保存应用实例
			if(array_ApplicationBTADrill != null && !"".equals(array_ApplicationBTADrill)){
				String array_ApplicationBTADrills[] = array_ApplicationBTADrill.split(",");
				String array_ApplicationBTADrills_name[] = array_ApplicationBTADrill_name.split(",");
				for(int i=0; i<array_ApplicationBTADrills.length; i++){
					if(array_ApplicationBTADrills[i] != null && !"".equals(array_ApplicationBTADrills[i])){
						para.put("url_ApplicationBTADrill", array_ApplicationBTADrills[i]);
						para.put("name_ApplicationBTADrill", array_ApplicationBTADrills_name[i]);
						toolBTAdrillService.saveApplicationBTADrill(para);
					}
				}
			}
			
			
			//清空详细信息路径
			toolBTAdrillService.clearInformDetailBTADrillByIdBTADrill(para);
			//保存详细信息
			if(array_InformDetailBTADrill != null && !"".equals(array_InformDetailBTADrill)){
				String array_InformDetailBTADrills[] = array_InformDetailBTADrill.split(",");
				String array_InformDetailBTADrills_name[] = array_InformDetailBTADrill_name.split(",");
				
				for(int i=0; i<array_InformDetailBTADrills.length; i++){
					if(array_InformDetailBTADrills[i] != null && !"".equals(array_InformDetailBTADrills[i])){
						para.put("url_InformDetailBTADrill", array_InformDetailBTADrills[i]);
						para.put("name_InformDetailBTADrill", array_InformDetailBTADrills_name[i]);
						toolBTAdrillService.saveInformDetailBTADrill(para);
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
    
    
    
    /**
	 * 保存刀具图片
	 * @param id_BTADrill
	 * @param PictureBTADrill
	 * @param request
	 * @return
	 * @throws Exception
	 */
    @ResponseBody
	@RequestMapping(value="/savePictureBTADrill", produces = "application/json; charset=utf-8")
	public String savePictureBTADrill(String id_BTADrill, String array_PictureBTADrill
			, String array_PictureDetailBTADrill, String array_ApplicationBTADrill, String array_ApplicationBTADrill_name, String array_InformDetailBTADrill, String array_InformDetailBTADrill_name,
			String PictureBTADrill ,String fileSuffix, String filename
		  ){
	    	System.out.println("===========================================");
    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   
	    	
	    	String json  = "";  
			Map resultmap = new HashMap();
    	try {
    		
//    		Map map	= null;
    		
    		Map resultMap = new HashMap();
    		ModelAndView mv = this.getModelAndView();
    		Map PictureBTADrillMap = new HashMap(); 
    		
    		if(PictureBTADrill != null){
    			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
    			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/picturebtadrill/");
    			String fileName =  big_url + "." + fileSuffix;
    			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/picturebtadrill/" + big_url + "." + fileSuffix);
    			ByteToFile.GenerateImage(PictureBTADrill,  filepath2);
    			array_PictureBTADrill = array_PictureBTADrill + "/picturebtadrill/" + big_url + "." + fileSuffix + ",";
    		}

    		resultmap.put("result", "1");
    		resultmap.put("array_PictureBTADrill", array_PictureBTADrill);
    		resultmap.put("array_PictureDetailBTADrill", array_PictureDetailBTADrill);
    		resultmap.put("array_ApplicationBTADrill", array_ApplicationBTADrill);
    		resultmap.put("array_ApplicationBTADrill_name", array_ApplicationBTADrill_name);
    		resultmap.put("array_InformDetailBTADrill", array_InformDetailBTADrill);
    		resultmap.put("array_InformDetailBTADrill_name", array_InformDetailBTADrill_name);
    		

    		json = JackJson.fromObjectToJson(resultmap);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    	
		return json;
		
	}



    /**
	 * 保存详细图片
	 * @param id_BTADrill
	 * @param PictureBTADrill
	 * @param request
	 * @return
	 * @throws Exception
	 */
    @ResponseBody
    @RequestMapping(value="/savePictureDetailBTADrill", produces = "application/json; charset=utf-8")
	public String savePictureDetailBTADrill(String id_BTADrill, String array_PictureBTADrill
			, String array_PictureDetailBTADrill, String array_ApplicationBTADrill, String array_ApplicationBTADrill_name, String array_InformDetailBTADrill, String array_InformDetailBTADrill_name,
			String PictureDetailBTADrill ,String fileSuffix, String filename
		) throws Exception{
    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureBTADrillMap = new HashMap(); 
		
		if(PictureDetailBTADrill != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureDetailBTADrill/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/pictureDetailBTADrill/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PictureDetailBTADrill,  filepath2);
			array_PictureDetailBTADrill = array_PictureDetailBTADrill + "/pictureDetailBTADrill/" + big_url + "." + fileSuffix + ",";
		}
		
		resultmap.put("result", "1");
		resultmap.put("array_PictureBTADrill", array_PictureBTADrill);
		resultmap.put("array_PictureDetailBTADrill", array_PictureDetailBTADrill);
		resultmap.put("array_ApplicationBTADrill", array_ApplicationBTADrill);
		resultmap.put("array_ApplicationBTADrill_name", array_ApplicationBTADrill_name);
		resultmap.put("array_InformDetailBTADrill", array_InformDetailBTADrill);
		resultmap.put("array_InformDetailBTADrill_name", array_InformDetailBTADrill_name);

		json = JackJson.fromObjectToJson(resultmap);
		return json;
		
	}
    
    
    
    
    /**
	 * 保存应用实例
	 * @param id_BTADrill
	 * @param PictureBTADrill
	 * @param request
	 * @return
	 * @throws Exception
	 */
    @ResponseBody
	@RequestMapping(value="/saveApplicationBTADrill", produces = "application/json; charset=utf-8")
	public String saveApplicationBTADrill(String id_BTADrill, String array_PictureBTADrill
			, String array_PictureDetailBTADrill, String array_ApplicationBTADrill, String array_ApplicationBTADrill_name, String array_InformDetailBTADrill, String array_InformDetailBTADrill_name,
			String ApplicationBTADrill ,String fileSuffix, String filename
			) throws Exception{
    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureBTADrillMap = new HashMap(); 
		
		
		if(ApplicationBTADrill != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/applicationBTADrill/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/applicationBTADrill/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(ApplicationBTADrill,  filepath2);
//			array_PictureBTADrill = array_PictureBTADrill + "/applicationBTADrill/" + big_url + "." + fileSuffix + ",";
			array_ApplicationBTADrill = array_ApplicationBTADrill + "/applicationBTADrill/" + big_url + "." + fileSuffix + ",";
			array_ApplicationBTADrill_name = array_ApplicationBTADrill_name + filename + ",";
		}
		
		resultmap.put("result", "1");
		resultmap.put("array_PictureBTADrill", array_PictureBTADrill);
		resultmap.put("array_PictureDetailBTADrill", array_PictureDetailBTADrill);
		resultmap.put("array_ApplicationBTADrill", array_ApplicationBTADrill);
		resultmap.put("array_ApplicationBTADrill_name", array_ApplicationBTADrill_name);
		resultmap.put("array_InformDetailBTADrill", array_InformDetailBTADrill);
		resultmap.put("array_InformDetailBTADrill_name", array_InformDetailBTADrill_name);

		json = JackJson.fromObjectToJson(resultmap);
		return json;
		
	}
    
    
    
    
    
    /**
	 * 保存详细信息
	 * @param id_BTADrill
	 * @param PictureBTADrill
	 * @param request
	 * @return
	 * @throws Exception
	 */
    @ResponseBody
	@RequestMapping(value="/saveInformDetailBTADrill", produces = "application/json; charset=utf-8")
	public String saveInformDetailBTADrill(String id_BTADrill, String array_PictureBTADrill
			, String array_PictureDetailBTADrill, String array_ApplicationBTADrill, String array_ApplicationBTADrill_name
			, String array_InformDetailBTADrill, String array_InformDetailBTADrill_name,
			String InformDetailBTADrill ,String fileSuffix, String filename
		) throws Exception{
    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureBTADrillMap = new HashMap(); 
		
		if(InformDetailBTADrill != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informDetailBTADrill/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/informDetailBTADrill/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(InformDetailBTADrill,  filepath2);
			array_InformDetailBTADrill = array_InformDetailBTADrill + "/informDetailBTADrill/" + big_url + "." + fileSuffix + ",";
			array_InformDetailBTADrill_name = array_InformDetailBTADrill_name + filename + ",";
		}
		
		resultmap.put("result", "1");
		resultmap.put("array_PictureBTADrill", array_PictureBTADrill);
		resultmap.put("array_PictureDetailBTADrill", array_PictureDetailBTADrill);
		resultmap.put("array_ApplicationBTADrill", array_ApplicationBTADrill);
		resultmap.put("array_ApplicationBTADrill_name", array_ApplicationBTADrill_name);
		resultmap.put("array_InformDetailBTADrill", array_InformDetailBTADrill);
		resultmap.put("array_InformDetailBTADrill_name", array_InformDetailBTADrill_name);

		json = JackJson.fromObjectToJson(resultmap);
		return json;
		
	}
    
    
    
    /**
	 * 删除深孔钻数据
	 * @param id_BTADrill
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deleteToolBTAdrill", produces = "application/json; charset=utf-8")
	public String deleteToolBTAdrill(String id_BTADrill) {
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		para.put("id_BTADrill", id_BTADrill);
		try {
			//清空刀具图片路径
			toolBTAdrillService.clearPictureBTADrillByIdBTADrill(para);
			//清空详细图片路径
			toolBTAdrillService.clearPictureDetailBTADrillByIdBTADrill(para);
			//清空应用实例路径
			toolBTAdrillService.clearApplicationBTADrillByIdBTADrill(para);
			//清空详细信息路径
			toolBTAdrillService.clearInformDetailBTADrillByIdBTADrill(para);
			//删除深孔钻数据
			toolBTAdrillService.deleteToolBTAdrill(para);
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
}
