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
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.qf.tool.turningHolder.service.TurningHolderService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.common.JackJson;
import com.qf.util.controller.BaseController;
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
@RequestMapping("/turningHolder")
public class TurningHolderController  extends BaseController{
	
	@Resource(name="turningHolderService")
    private TurningHolderService turningHolderService;  
    
	/**
	 * 查询车刀数据-刀柄列表
	 * @param page
	 * @param request
	 * @return
	 */
	
	
	//ModelAndView(String viewName, Map model) 
	//modelAndView httpServletRequest是model page是view    modelAndView是将两者绑定在一起，一次返回两个参数
	@RequestMapping("queryTurningHolderList")
	public ModelAndView queryTurningHolderList(Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();//resquest.getSession将HttpServletRequest与session连接起来，赋值给 session
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);//绑定属性名SESSION_ADMIN（admin）
		
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= turningHolderService.queryTurningHolderList(page);//查询车刀数据-刀柄列表
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
			}
			
			mv.addObject("turningHolderList", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/tool/turningTool/turningHolder/turningHolderList");//返回文件名
		return mv;
	}
	
	
	
	
	/**
	 * 去新增车刀数据-刀柄页面
	 */
	@RequestMapping(value="/goAddTurningHolder")
	public ModelAndView goAddTurningHolder(String id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
			
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
			
			mv.addObject("array_PictureTurningHolder", array_PictureTurningHolder);
			mv.addObject("array_PictureDetailTurningHolder", array_PictureDetailTurningHolder);
			mv.addObject("array_InformDetailTurningHolder", array_InformDetailTurningHolder);
			mv.addObject("array_InformDetailTurningHolder_name", array_InformDetailTurningHolder_name);
			
		}
		
		//查询ISO基准刀片 json
		List<String> ISOList = turningHolderService.queryISOList();
		if(ISOList != null && ISOList.size() > 0){
			String isoArray[] = new String[ISOList.size()];  
			for(int i=0;i<ISOList.size();i++){
				isoArray[i] = ISOList.get(i);
			}
			String json = JackJson.fromObjectToJson(isoArray);
			mv.addObject("isoArray", json);
		}
		
		
		mv.setViewName("/WEB-INF/tool/turningTool/turningHolder/turningHolder_edit");
		mv.addObject("msg", "saveTurningHolder");
		mv.addObject("turn_url", turn_url);
		mv.addObject("turningHolder", turningHolder);
		
		mv.addObject("pd", pd);

		return mv;
	}
	
	
	
	
	/**
	 * 保存刀柄图片
	 * @param id_BTADrill
	 * @param PictureBTADrill
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/savePictureTurningHolder")
	public ModelAndView savePictureTurningHolder(String id_TurningHolder, 
			String array_PictureTurningHolder, 
			String array_PictureDetailTurningHolder, 
			String array_InformDetailTurningHolder, String array_InformDetailTurningHolder_name, 
			@RequestParam(value="PictureTurningHolder",required=false)CommonsMultipartFile PictureTurningHolder ,
			String NumberTurningHolder, String NameTurningHolder, String TypeTurningHolder, 
			String TypeCustomTurningHolder, String ISOBladeTurning, String TypeBlade, 
			String TypeCustomBlade, String DiameterTurningHolder, String CompanyTurningHolder, String FeatureTurningHolder,
			HttpServletRequest request ) throws Exception{
		
		Map turningHolder = new HashMap();
		
		turningHolder.put("id_TurningHolder", id_TurningHolder);
		turningHolder.put("NumberTurningHolder", NumberTurningHolder);
		turningHolder.put("NameTurningHolder", NameTurningHolder);
		turningHolder.put("TypeTurningHolder", TypeTurningHolder);
		turningHolder.put("TypeCustomTurningHolder", TypeCustomTurningHolder);
		turningHolder.put("ISOBladeTurning", ISOBladeTurning);
		turningHolder.put("TypeBlade", TypeBlade);
		turningHolder.put("TypeCustomBlade", TypeCustomBlade);
		turningHolder.put("DiameterTurningHolder", DiameterTurningHolder);
		turningHolder.put("CompanyTurningHolder", CompanyTurningHolder);
		turningHolder.put("FeatureTurningHolder", FeatureTurningHolder);
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureBTADrillMap = new HashMap(); 
		
		String OriginalFilename = PictureTurningHolder.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureTurningHolder/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			PictureTurningHolder.transferTo(materials_big_img_file); 
			PictureBTADrillMap.put("url_PictureTurningHolder", "/pictureTurningHolder/" + big_url + "." + fileSuffix);
			PictureBTADrillMap.put("id_TurningHolder", id_TurningHolder);
			array_PictureTurningHolder = array_PictureTurningHolder + "/pictureTurningHolder/" + big_url + "." + fileSuffix + ",";

		}else{

		}
	
		mv.addObject("array_PictureTurningHolder", array_PictureTurningHolder);
		mv.addObject("array_PictureDetailTurningHolder", array_PictureDetailTurningHolder);
		mv.addObject("array_InformDetailTurningHolder", array_InformDetailTurningHolder);
		mv.addObject("array_InformDetailTurningHolder_name", array_InformDetailTurningHolder_name);
		
		mv.addObject("turningHolder", turningHolder);
		
		mv.setViewName("/WEB-INF/tool/turningTool/turningHolder/turningHolder_edit");

		return mv;
		
	}
	
	
	
	
	
	/**
	 * 保存详细图片
	 * @param id_BTADrill
	 * @param PictureBTADrill
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/savePictureDetailTurningHolder")
	public ModelAndView savePictureDetailTurningHolder(String id_TurningHolder, 
			String array_PictureTurningHolder, 
			String array_PictureDetailTurningHolder, 
			String array_InformDetailTurningHolder, String array_InformDetailTurningHolder_name, 
			@RequestParam(value="PictureDetailTurningHolder",required=false)CommonsMultipartFile PictureDetailTurningHolder ,
			String NumberTurningHolder, String NameTurningHolder, String TypeTurningHolder, 
			String TypeCustomTurningHolder, String ISOBladeTurning, String TypeBlade, 
			String TypeCustomBlade, String DiameterTurningHolder, String CompanyTurningHolder, String FeatureTurningHolder,
			HttpServletRequest request ) throws Exception{
		
		Map turningHolder = new HashMap();
		
		turningHolder.put("id_TurningHolder", id_TurningHolder);
		turningHolder.put("NumberTurningHolder", NumberTurningHolder);
		turningHolder.put("NameTurningHolder", NameTurningHolder);
		turningHolder.put("TypeTurningHolder", TypeTurningHolder);
		turningHolder.put("TypeCustomTurningHolder", TypeCustomTurningHolder);
		turningHolder.put("ISOBladeTurning", ISOBladeTurning);
		turningHolder.put("TypeBlade", TypeBlade);
		turningHolder.put("TypeCustomBlade", TypeCustomBlade);
		turningHolder.put("DiameterTurningHolder", DiameterTurningHolder);
		turningHolder.put("CompanyTurningHolder", CompanyTurningHolder);
		turningHolder.put("FeatureTurningHolder", FeatureTurningHolder);
		
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureBTADrillMap = new HashMap(); 
		
		String OriginalFilename = PictureDetailTurningHolder.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureDetailTurningHolder/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			PictureDetailTurningHolder.transferTo(materials_big_img_file); 
			PictureBTADrillMap.put("url_PictureDetailTurningHolder", "/pictureDetailTurningHolder/" + big_url + "." + fileSuffix);
			PictureBTADrillMap.put("id_TurningHolder", id_TurningHolder);
			array_PictureDetailTurningHolder = array_PictureDetailTurningHolder + "/pictureDetailTurningHolder/" + big_url + "." + fileSuffix + ",";

		}else{

		}
	
		mv.addObject("array_PictureTurningHolder", array_PictureTurningHolder);
		mv.addObject("array_PictureDetailTurningHolder", array_PictureDetailTurningHolder);
		mv.addObject("array_InformDetailTurningHolder", array_InformDetailTurningHolder);
		mv.addObject("array_InformDetailTurningHolder_name", array_InformDetailTurningHolder_name);
		
		mv.addObject("turningHolder", turningHolder);
		
		mv.setViewName("/WEB-INF/tool/turningTool/turningHolder/turningHolder_edit");

		return mv;
		
	}
	
	
	
	
	/**
	 * 保存详细信息
	 * @param id_BTADrill
	 * @param PictureBTADrill
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveInformDetailTurningHolder")
	public ModelAndView saveInformDetailTurningHolder(String id_TurningHolder, 
			String array_PictureTurningHolder, 
			String array_PictureDetailTurningHolder, 
			String array_InformDetailTurningHolder, String array_InformDetailTurningHolder_name, 
			@RequestParam(value="InformDetailTurningHolder",required=false)CommonsMultipartFile InformDetailTurningHolder ,
			String NumberTurningHolder, String NameTurningHolder, String TypeTurningHolder, 
			String TypeCustomTurningHolder, String ISOBladeTurning, String TypeBlade, 
			String TypeCustomBlade, String DiameterTurningHolder, String CompanyTurningHolder, String FeatureTurningHolder,
			HttpServletRequest request ) throws Exception{
		
		Map turningHolder = new HashMap();
		
		turningHolder.put("id_TurningHolder", id_TurningHolder);
		turningHolder.put("NumberTurningHolder", NumberTurningHolder);
		turningHolder.put("NameTurningHolder", NameTurningHolder);
		turningHolder.put("TypeTurningHolder", TypeTurningHolder);
		turningHolder.put("TypeCustomTurningHolder", TypeCustomTurningHolder);
		turningHolder.put("ISOBladeTurning", ISOBladeTurning);
		turningHolder.put("TypeBlade", TypeBlade);
		turningHolder.put("TypeCustomBlade", TypeCustomBlade);
		turningHolder.put("DiameterTurningHolder", DiameterTurningHolder);
		turningHolder.put("CompanyTurningHolder", CompanyTurningHolder);
		turningHolder.put("FeatureTurningHolder", FeatureTurningHolder);
		
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureBTADrillMap = new HashMap(); 
		
		String OriginalFilename = InformDetailTurningHolder.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informDetailTurningHolder/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			InformDetailTurningHolder.transferTo(materials_big_img_file); 
			PictureBTADrillMap.put("url_InformDetailTurningHolder", "/informDetailTurningHolder/" + big_url + "." + fileSuffix);
			PictureBTADrillMap.put("id_TurningHolder", id_TurningHolder);
			array_InformDetailTurningHolder = array_InformDetailTurningHolder + "/informDetailTurningHolder/" + big_url + "." + fileSuffix + ",";
			array_InformDetailTurningHolder_name = array_InformDetailTurningHolder_name + OriginalFilename + ",";

		}else{

		}
	
		mv.addObject("array_PictureTurningHolder", array_PictureTurningHolder);
		mv.addObject("array_PictureDetailTurningHolder", array_PictureDetailTurningHolder);
		mv.addObject("array_InformDetailTurningHolder", array_InformDetailTurningHolder);
		mv.addObject("array_InformDetailTurningHolder_name", array_InformDetailTurningHolder_name);
		
		mv.addObject("turningHolder", turningHolder);
		
		mv.setViewName("/WEB-INF/tool/turningTool/turningHolder/turningHolder_edit");

		return mv;
		
	}
	
	
	
	
	@ResponseBody
	@RequestMapping("/saveTurningHolder")
	public String saveTurningHolder(HttpServletRequest request, 
			int id_TurningHolder, 
			String array_PictureTurningHolder, 
			String array_PictureDetailTurningHolder, 
			String array_InformDetailTurningHolder, String array_InformDetailTurningHolder_name, 
			String NumberTurningHolder, String NameTurningHolder, String TypeTurningHolder, 
			String TypeCustomTurningHolder, String ISOBladeTurning, String TypeBlade, 
			String TypeCustomBlade, String DiameterTurningHolder, String CompanyTurningHolder, String FeatureTurningHolder) {
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
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
		if(user != null){
			para.put("user_id", user.get("user_id"));
		}else{
			para.put("user_id", 0);
		}
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
			return "0";
		}						
		return "1";
	}
	
	
	
	/**
	 * 删除车刀数据-刀柄
	 * @param id_TurningHolder
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteTurningHolder")
	public String deleteTurningHolder(String id_TurningHolder) {
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
			return "0";
		}						
		return "1";
	}
	
}
