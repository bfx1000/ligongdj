package com.qf.tool.turningHolder.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.qf.tool.turningHolder.service.TurningHolderService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
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
@RequestMapping("/turningHolderApp")
public class TurningHolderAppController  extends BaseController{
	
    @Resource(name="turningHolderService")
    private TurningHolderService turningHolderService;  
    
    /**
	 * 查询车刀数据-刀柄列表
	 * @param page
	 * @param request
	 * @return
	 */
    @ResponseBody
	@RequestMapping(value=	"queryTurningHolderList", produces = "application/json; charset=utf-8")
	public String queryTurningHolderList(int pageNo, int pageSize,
			String NumberTurningHolder, String NameTurningHolder, String TypeTurningHolder,	String ISOBladeTurning, String TypeBlade, 
			String DiameterTurningHolder, String CompanyTurningHolder){
			
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		try {
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("NumberTurningHolder", NumberTurningHolder);
			pd.put("NameTurningHolder", NameTurningHolder);
			pd.put("TypeTurningHolder", TypeTurningHolder);
			pd.put("ISOBladeTurning", ISOBladeTurning);
			pd.put("TypeBlade", TypeBlade);
			pd.put("DiameterTurningHolder", DiameterTurningHolder);
			pd.put("CompanyTurningHolder", CompanyTurningHolder);
			page.setPd(pd);
			
			map	= turningHolderService.queryTurningHolderList(page);//查询车刀数据-刀柄列表
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			if(list != null && list.size() > 0){
				for(int i = 0; i < list.size(); i++){
					Map turningHolder = list.get(i);
					int id_TurningHolder = (int) turningHolder.get("id_TurningHolder");
					
					Map para = new HashMap();
					para.put("id_TurningHolder", id_TurningHolder);
					
					//查询刀柄图片列表 PictureTurningHolder
					List<Map> pictureTurningHolderList = turningHolderService.queryPictureTurningHolderList(para);
					//查询详细图片列表 PictureDetailTurningHolder
					List<Map> pictureDetailTurningHolderList = turningHolderService.queryPictureDetailTurningHolderList(para);
					//查询详细信息列表 InformDetailTurningHolder
					List<Map> informDetailTurningHolderList = turningHolderService.queryInformDetailTurningHolderList(para);
					
					
					turningHolder.put("pictureTurningHolderList", pictureTurningHolderList);
					turningHolder.put("pictureDetailTurningHolderList", pictureDetailTurningHolderList);
					turningHolder.put("informDetailTurningHolderList", informDetailTurningHolderList);
					list.set(i, turningHolder);
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
		para.put("NumberTurningHolder", NumberTurningHolder);
		para.put("NameTurningHolder", NameTurningHolder);
		para.put("TypeTurningHolder", TypeTurningHolder);
		para.put("ISOBladeTurning", ISOBladeTurning);
		para.put("TypeBlade", TypeBlade);
		para.put("DiameterTurningHolder", DiameterTurningHolder);
		para.put("CompanyTurningHolder", CompanyTurningHolder);
		resultmap.put("para", para);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
    
   
    /**
	 * 去新增车刀数据-刀柄页面
	 */
    @ResponseBody
	@RequestMapping(value="/goAddTurningHolder", produces = "application/json; charset=utf-8")
	public String goAddTurningHolder(String id){
    	String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
			
		Map para = new HashMap();
		para.put("id_TurningHolder", id);
		Map turningHolder = turningHolderService.queryTurningHolderById(para);//查询车刀数据-刀柄数据
		if(turningHolder != null){
			
			//查询刀柄图片列表 PictureTurningHolder
			List<Map> pictureTurningHolderList = turningHolderService.queryPictureTurningHolderList(para);
			String array_PictureTurningHolder = "";
			if(pictureTurningHolderList != null && pictureTurningHolderList.size() > 0){
				for(int i = 0; i < pictureTurningHolderList.size(); i++){
					array_PictureTurningHolder = array_PictureTurningHolder + pictureTurningHolderList.get(i).get("url_PictureTurningHolder") + ",";
				}
			}
			
			//查询详细图片列表 PictureDetailTurningHolder
			List<Map> pictureDetailTurningHolderList = turningHolderService.queryPictureDetailTurningHolderList(para);
			String array_PictureDetailTurningHolder = "";
			if(pictureDetailTurningHolderList != null && pictureDetailTurningHolderList.size() > 0){
				for(int i = 0; i < pictureDetailTurningHolderList.size(); i++){
					array_PictureDetailTurningHolder = array_PictureDetailTurningHolder + pictureDetailTurningHolderList.get(i).get("url_PictureDetailTurningHolder") + ",";
				}
			}
			
			//查询详细信息列表 InformDetailTurningHolder
			List<Map> informDetailTurningHolderList = turningHolderService.queryInformDetailTurningHolderList(para);
			String array_InformDetailTurningHolder = "";
			String array_InformDetailTurningHolder_name = "";
			if(informDetailTurningHolderList != null && informDetailTurningHolderList.size() > 0){
				for(int i = 0; i < informDetailTurningHolderList.size(); i++){
					array_InformDetailTurningHolder = array_InformDetailTurningHolder + informDetailTurningHolderList.get(i).get("url_InformDetailTurningHolder") + ",";
					array_InformDetailTurningHolder_name = array_InformDetailTurningHolder_name + informDetailTurningHolderList.get(i).get("name_InformDetailTurningHolder") + ",";
				}
			}
			
			
			
			turningHolder.put("pictureTurningHolderList", pictureTurningHolderList);
			turningHolder.put("pictureDetailTurningHolderList", pictureDetailTurningHolderList);
			turningHolder.put("informDetailTurningHolderList", informDetailTurningHolderList);
			
			resultmap.put("result", "1");
			resultmap.put("turningHolder", turningHolder);
			
			resultmap.put("array_PictureTurningHolder", array_PictureTurningHolder);
			resultmap.put("array_PictureDetailTurningHolder", array_PictureDetailTurningHolder);
			resultmap.put("array_InformDetailTurningHolder", array_InformDetailTurningHolder);
			resultmap.put("array_InformDetailTurningHolder_name", array_InformDetailTurningHolder_name);
		}
		
		//查询ISO基准刀片 json
		List<String> ISOList = turningHolderService.queryISOList();
		resultmap.put("ISOList", ISOList);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
	
	
    /**
	 * 保存刀柄图片
	 * @param id_BTADrill
	 * @param PictureBTADrill
	 * @param request
	 * @return
	 * @throws Exception
	 */
    @ResponseBody
	@RequestMapping(value="/savePictureTurningHolder", produces = "application/json; charset=utf-8")
	public String savePictureTurningHolder(String id_TurningHolder, 
			String array_PictureTurningHolder, 
			String array_PictureDetailTurningHolder, 
			String array_InformDetailTurningHolder, String array_InformDetailTurningHolder_name, 
			String PictureTurningHolder ,String fileSuffix, String filename) throws Exception{
		
    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   
    	
    	String json  = "";  
		Map resultmap = new HashMap();
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureBTADrillMap = new HashMap(); 
		
		if(PictureTurningHolder != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureTurningHolder/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/pictureTurningHolder/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PictureTurningHolder,  filepath2);
			array_PictureTurningHolder = array_PictureTurningHolder + "/pictureTurningHolder/" + big_url + "." + fileSuffix + ",";
		}
	
		resultmap.put("result", "1");
		resultmap.put("array_PictureTurningHolder", array_PictureTurningHolder);
		resultmap.put("array_PictureDetailTurningHolder", array_PictureDetailTurningHolder);
		resultmap.put("array_InformDetailTurningHolder", array_InformDetailTurningHolder);
		resultmap.put("array_InformDetailTurningHolder_name", array_InformDetailTurningHolder_name);

		json = JackJson.fromObjectToJson(resultmap);

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
	@RequestMapping(value="/savePictureDetailTurningHolder", produces = "application/json; charset=utf-8")
	public String savePictureDetailTurningHolder(String id_TurningHolder, 
			String array_PictureTurningHolder, 
			String array_PictureDetailTurningHolder, 
			String array_InformDetailTurningHolder, String array_InformDetailTurningHolder_name, 
			String PictureDetailTurningHolder ,String fileSuffix, String filename
			 ) throws Exception{
		
    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureBTADrillMap = new HashMap(); 
		
		if(PictureDetailTurningHolder != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureDetailTurningHolder/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/pictureDetailTurningHolder/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PictureDetailTurningHolder,  filepath2);
			array_PictureDetailTurningHolder = array_PictureDetailTurningHolder + "/pictureDetailTurningHolder/" + big_url + "." + fileSuffix + ",";
		}
		resultmap.put("result", "1");
		resultmap.put("array_PictureTurningHolder", array_PictureTurningHolder);
		resultmap.put("array_PictureDetailTurningHolder", array_PictureDetailTurningHolder);
		resultmap.put("array_InformDetailTurningHolder", array_InformDetailTurningHolder);
		resultmap.put("array_InformDetailTurningHolder_name", array_InformDetailTurningHolder_name);

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
	@RequestMapping(value="/saveInformDetailTurningHolder", produces = "application/json; charset=utf-8")
	public String saveInformDetailTurningHolder(String id_TurningHolder, 
			String array_PictureTurningHolder, 
			String array_PictureDetailTurningHolder, 
			String array_InformDetailTurningHolder, String array_InformDetailTurningHolder_name, 
			String InformDetailTurningHolder ,String fileSuffix, String filename
			 ) throws Exception{
		
    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureBTADrillMap = new HashMap(); 
		
		
		
		if(InformDetailTurningHolder != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informDetailTurningHolder/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/informDetailTurningHolder/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(InformDetailTurningHolder,  filepath2);
			array_InformDetailTurningHolder = array_InformDetailTurningHolder + "/informDetailTurningHolder/" + big_url + "." + fileSuffix + ",";
			array_InformDetailTurningHolder_name = array_InformDetailTurningHolder_name + filename + ",";
		}
		
		resultmap.put("result", "1");
		resultmap.put("array_PictureTurningHolder", array_PictureTurningHolder);
		resultmap.put("array_PictureDetailTurningHolder", array_PictureDetailTurningHolder);
		resultmap.put("array_InformDetailTurningHolder", array_InformDetailTurningHolder);
		resultmap.put("array_InformDetailTurningHolder_name", array_InformDetailTurningHolder_name);

		json = JackJson.fromObjectToJson(resultmap);

		return json;
		
	}
    
    
    /**
     * 保存刀柄数据（新增、修改）
     * @param user_id
     * @param id_TurningHolder
     * @param array_PictureTurningHolder
     * @param array_PictureDetailTurningHolder
     * @param array_InformDetailTurningHolder
     * @param array_InformDetailTurningHolder_name
     * @param NumberTurningHolder
     * @param NameTurningHolder
     * @param TypeTurningHolder
     * @param TypeCustomTurningHolder
     * @param ISOBladeTurning
     * @param TypeBlade
     * @param TypeCustomBlade
     * @param DiameterTurningHolder
     * @param CompanyTurningHolder
     * @param FeatureTurningHolder
     * @return
     */
    @ResponseBody
	@RequestMapping(value = "/saveTurningHolder", produces = "application/json; charset=utf-8")
	public String saveTurningHolder(String user_id, 
			int id_TurningHolder, 
			String array_PictureTurningHolder, 
			String array_PictureDetailTurningHolder, 
			String array_InformDetailTurningHolder, String array_InformDetailTurningHolder_name, 
			String NumberTurningHolder, String NameTurningHolder, String TypeTurningHolder, 
			String TypeCustomTurningHolder, String ISOBladeTurning, String TypeBlade, 
			String TypeCustomBlade, String DiameterTurningHolder, String CompanyTurningHolder, String FeatureTurningHolder) {
		
    	String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		
		if(!"9".equals(TypeTurningHolder)){
			TypeCustomTurningHolder = null;
		}
		
		if(!"9".equals(TypeBlade)){
			TypeCustomBlade = null;
		}

		para.put("id_TurningHolder", id_TurningHolder);
		para.put("NumberTurningHolder", NumberTurningHolder);
		para.put("NameTurningHolder", NameTurningHolder);
		para.put("TypeTurningHolder", TypeTurningHolder);
		para.put("TypeCustomTurningHolder", TypeCustomTurningHolder);
		para.put("ISOBladeTurning", ISOBladeTurning);
		para.put("TypeBlade", TypeBlade);
		para.put("TypeCustomBlade", TypeCustomBlade);
		para.put("DiameterTurningHolder", DiameterTurningHolder);
		para.put("CompanyTurningHolder", CompanyTurningHolder);
		para.put("FeatureTurningHolder", FeatureTurningHolder);
		
		
		
		para.put("add_time", System.currentTimeMillis() / 1000);
		para.put("user_id", user_id);
		try {
			if(id_TurningHolder != 0){//修改
				turningHolderService.updateTurningHolder(para);
			}else{//新增
				
				turningHolderService.saveTurningHolder(para);
			}
			//清空刀柄图片路径
			turningHolderService.clearPictureTurningHolderByIdTurningHolder(para);
			//保存刀柄图片
			if(array_PictureTurningHolder != null && !"".equals(array_PictureTurningHolder)){
				String array_PictureTurningHolders[] = array_PictureTurningHolder.split(",");
				for(int i=0; i<array_PictureTurningHolders.length; i++){
					if(array_PictureTurningHolders[i] != null && !"".equals(array_PictureTurningHolders[i])){
						para.put("url_PictureTurningHolder", array_PictureTurningHolders[i]);
						turningHolderService.savePictureTurningHolder(para);
					}
				}
			}
			
			
			//清空详细图片路径
			turningHolderService.clearPictureDetailTurningHolderByIdTurningHolder(para);
			//保存详细图片
			if(array_PictureDetailTurningHolder != null && !"".equals(array_PictureDetailTurningHolder)){
				String array_PictureDetailTurningHolders[] = array_PictureDetailTurningHolder.split(",");
				for(int i=0; i<array_PictureDetailTurningHolders.length; i++){
					if(array_PictureDetailTurningHolders[i] != null && !"".equals(array_PictureDetailTurningHolders[i])){
						para.put("url_PictureDetailTurningHolder", array_PictureDetailTurningHolders[i]);
						turningHolderService.savePictureDetailTurningHolder(para);
					}
				}
			}
			
			
			//清空详细信息路径
			turningHolderService.clearInformDetailTurningHolderByIdTurningHolder(para);
			//保存详细信息
			if(array_InformDetailTurningHolder != null && !"".equals(array_InformDetailTurningHolder)){
				String array_InformDetailTurningHolders[] = array_InformDetailTurningHolder.split(",");
				String array_InformDetailTurningHolders_name[] = array_InformDetailTurningHolder_name.split(",");
				
				for(int i=0; i<array_InformDetailTurningHolders.length; i++){
					if(array_InformDetailTurningHolders[i] != null && !"".equals(array_InformDetailTurningHolders[i])){
						para.put("url_InformDetailTurningHolder", array_InformDetailTurningHolders[i]);
						para.put("name_InformDetailTurningHolder", array_InformDetailTurningHolders_name[i]);
						turningHolderService.saveInformDetailTurningHolder(para);
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
	 * 删除车刀数据-刀柄
	 * @param id_TurningHolder
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteTurningHolder", produces = "application/json; charset=utf-8")
	public String deleteTurningHolder(String id_TurningHolder) {
		String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		para.put("id_TurningHolder", id_TurningHolder);
		try {
			//清空刀柄图片路径
			turningHolderService.clearPictureTurningHolderByIdTurningHolder(para);
			//清空详细图片路径
			turningHolderService.clearPictureDetailTurningHolderByIdTurningHolder(para);
			//清空详细信息路径
			turningHolderService.clearInformDetailTurningHolderByIdTurningHolder(para);
			//删除深孔钻数据
			turningHolderService.deleteTurningHolder(para);
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
