package com.qf.toolPlan.designTurningHolder.controller;

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

import com.itextpdf.text.log.SysoCounter;
import com.qf.toolPlan.designTurningBlade.service.DesignTurningBladeService;
import com.qf.toolPlan.designTurningHolder.service.designTurningHolderService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.common.JackJson;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/designTurningHolder")
public class designTurningHolderController extends BaseController{

	
	@Resource(name="designTurningHolderService")
    private designTurningHolderService designTurningHolderService; 
	
	@Resource(name="designTurningBladeService")
	private DesignTurningBladeService designTurningBladeService;
	
	@RequestMapping("queryDesignTurningHolderList")
	public ModelAndView queryDesignTurningHolderList(Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= designTurningHolderService.queryDesignTurningHolderList(page);//查询车刀数据-刀柄列表
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			if(list != null && list.size() > 0){
				for(int i = 0; i < list.size(); i++){
					Map designTurningHolder = list.get(i);
					int id_DesignTurningHolder = (int) designTurningHolder.get("id_DesignTurningHolder");
					
					Map para = new HashMap();
					para.put("id_DesignTurningHolder", id_DesignTurningHolder);
					
					//查询刀柄设计图片列表 
					List<Map> pictureDesignTurningHolderList = designTurningHolderService.queryPictureDesignTurningHolderList(para);
					//查询详细信息列表 
					List<Map> informDetailDesignTurningHolderList = designTurningHolderService.queryInformDetailDesignTurningHolderList(para);
					//part文件
					List<Map> partDesignTurningHolderList = designTurningHolderService.queryPartDesignTurningHolderList(para);
					
					designTurningHolder.put("pictureDesignTurningHolderList", pictureDesignTurningHolderList);
					designTurningHolder.put("informDetailDesignTurningHolderList", informDetailDesignTurningHolderList);
					designTurningHolder.put("partDesignTurningHolderList", partDesignTurningHolderList);
					list.set(i, designTurningHolder);
				}
			}
			//查询类别列表
			List<Map> categoryDesignTurningHolder = designTurningHolderService.queryCategoryDesignTurningHolderList();
			mv.addObject("categoryDesignTurningHolder", categoryDesignTurningHolder);
			mv.addObject("designTurningHolderList", list);
			System.out.println("信息"+","+list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/toolPlan/designTurningTool/designTurningHolder/designTurningHoder_list");
		return mv;
	}

	
	
	/**
	 * 去新增刀柄设计页面
	 */
	@RequestMapping(value="/goAddDesignTurningHolder")
	public ModelAndView goAddTurningHolder(String id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
			
		Map para = new HashMap();
		para.put("id_DesignTurningHolder", id);
		Map designturningHolder = designTurningHolderService.queryDesignTurningHolderById(para);//查询车刀数据-刀柄数据
		if(designturningHolder != null){
			
			//查询刀柄图片列表 PictureTurningHolder
			List<Map> pictureDesignTurningHolderList = designTurningHolderService.queryPictureDesignTurningHolderList(para);
			String array_PictureDesignTurningHolder = "";
			if(pictureDesignTurningHolderList != null && pictureDesignTurningHolderList.size() > 0){
				for(int i = 0; i < pictureDesignTurningHolderList.size(); i++){
					array_PictureDesignTurningHolder = array_PictureDesignTurningHolder + pictureDesignTurningHolderList.get(i).get("url_PictureDesignTurningHolder") + ",";
				}
			}
			
			//查询详细图片列表 PictureDetailTurningHolder
			List<Map> partDesignTurningHolderList = designTurningHolderService.queryPartDesignTurningHolderList(para);
			String array_PartDesignTurningHolder = "";
			String array_PartDesignTurningHolder_name = "";
			if(partDesignTurningHolderList != null && partDesignTurningHolderList.size() > 0){
				for(int i = 0; i < partDesignTurningHolderList.size(); i++){
					array_PartDesignTurningHolder = array_PartDesignTurningHolder + partDesignTurningHolderList.get(i).get("url_PartDesignTurningHolder") + ",";
					array_PartDesignTurningHolder_name = array_PartDesignTurningHolder_name + partDesignTurningHolderList.get(i).get("name_PartDesignTurningHolder") + ",";
				}
			}
			
			//查询详细信息列表 InformDetailTurningHolder
			List<Map> informDetailDesignTurningHolderList = designTurningHolderService.queryInformDetailDesignTurningHolderList(para);
			String array_InformDetailDesignTurningHolder = "";
			String array_InformDetailDesignTurningHolder_name = "";
			if(informDetailDesignTurningHolderList != null && informDetailDesignTurningHolderList.size() > 0){
				for(int i = 0; i < informDetailDesignTurningHolderList.size(); i++){
					array_InformDetailDesignTurningHolder = array_InformDetailDesignTurningHolder + informDetailDesignTurningHolderList.get(i).get("url_InformDetailDesignTurningHolder") + ",";
					array_InformDetailDesignTurningHolder_name = array_InformDetailDesignTurningHolder_name + informDetailDesignTurningHolderList.get(i).get("name_InformDetailDesignTurningHolder") + ",";
				}
			}
			
			
			
			designturningHolder.put("pictureDesignTurningHolderList", pictureDesignTurningHolderList);
			designturningHolder.put("partDesignTurningHolderList", partDesignTurningHolderList);
			designturningHolder.put("informDetailDesignTurningHolderList", informDetailDesignTurningHolderList);
			
			mv.addObject("array_PictureDesignTurningHolder", array_PictureDesignTurningHolder);
			mv.addObject("array_PartDesignTurningHolder", array_PartDesignTurningHolder);
			mv.addObject("array_PartDesignTurningHolder_name", array_PartDesignTurningHolder_name);
			mv.addObject("array_InformDetailDesignTurningHolder", array_InformDetailDesignTurningHolder);
			mv.addObject("array_InformDetailDesignTurningHolder_name", array_InformDetailDesignTurningHolder_name);
			
		}
		
		//查询ISO基准刀片 json
		List<String> ISOList = designTurningHolderService.queryISOList();
		if(ISOList != null && ISOList.size() > 0){
			String isoArray[] = new String[ISOList.size()];  
			for(int i=0;i<ISOList.size();i++){
				isoArray[i] = ISOList.get(i);
			}
			String json = JackJson.fromObjectToJson(isoArray);
			mv.addObject("isoArray", json);
		}
		//查询类别列表
		List<Map> categoryDesignTurningHolder = designTurningHolderService.queryCategoryDesignTurningHolderList();
		mv.addObject("categoryDesignTurningHolder", categoryDesignTurningHolder);
		
		mv.setViewName("/WEB-INF/toolPlan/designTurningTool/designTurningHolder/designTurningHolder_edit");
		mv.addObject("msg", "saveDesignTurningHolder");
		mv.addObject("turn_url", turn_url);
		mv.addObject("designturningHolder", designturningHolder);
		
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
	@RequestMapping(value="/savePictureDesignTurningHolder")
	public ModelAndView savePictureDesignTurningHolder(int id_DesignTurningHolder, 
			String array_PictureDesignTurningHolder, 
			String array_PartDesignTurningHolder, String array_PartDesignTurningHolder_name,
			String array_InformDetailDesignTurningHolder, String array_InformDetailDesignTurningHolder_name, 
			@RequestParam(value="PictureDesignTurningHolder",required=false)CommonsMultipartFile PictureDesignTurningHolder ,
			String DesignNumberTurningHolder, String DesignNameTurningHolder, String DesignTypeTurningHolder, 
			String DesignISOBladeTurning, String DesignBladecategoryTurningHolder, String DesignEdgeAngleTurningHolder, 
			String DesignFeatureTurningHolder, String DesignCompanyTurningHolder, String DesignTypeCustomBlade,
			HttpServletRequest request ) throws Exception{
		
		Map DesignturningHolder = new HashMap();
		
		DesignturningHolder.put("id_DesignTurningHolder", id_DesignTurningHolder);
		DesignturningHolder.put("DesignNumberTurningHolder", DesignNumberTurningHolder);
		DesignturningHolder.put("DesignNameTurningHolder", DesignNameTurningHolder);

		Map temp = new HashMap();
		temp.put("name_CategoryDesignTurningHolder", DesignTypeTurningHolder);
		Map CategoryDesignTurningHolder = designTurningHolderService.queryCategoryDesignTurningHolderByName(temp);
		if(CategoryDesignTurningHolder!=null || "".equals(CategoryDesignTurningHolder)){
			DesignturningHolder.put("DesignTypeTurningHolder", CategoryDesignTurningHolder.get("id_CategoryDesignTurningHolder"));
		}
		
		DesignturningHolder.put("DesignISOBladeTurning", DesignISOBladeTurning);
		DesignturningHolder.put("DesignBladecategoryTurningHolder", DesignBladecategoryTurningHolder);
		DesignturningHolder.put("DesignEdgeAngleTurningHolder", DesignEdgeAngleTurningHolder);
		DesignturningHolder.put("DesignFeatureTurningHolder", DesignFeatureTurningHolder);
		DesignturningHolder.put("DesignCompanyTurningHolder", DesignCompanyTurningHolder);
		DesignturningHolder.put("DesignTypeCustomBlade", DesignTypeCustomBlade);
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureBTADrillMap = new HashMap(); 
		
		String OriginalFilename = PictureDesignTurningHolder.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureDesignTurningHolder/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			PictureDesignTurningHolder.transferTo(materials_big_img_file); 
			PictureBTADrillMap.put("url_PictureDesignTurningHolder", "/pictureDesignTurningHolder/" + big_url + "." + fileSuffix);
			PictureBTADrillMap.put("id_DesignTurningHolder", id_DesignTurningHolder);
			array_PictureDesignTurningHolder = array_PictureDesignTurningHolder + "/pictureDesignTurningHolder/" + big_url + "." + fileSuffix + ",";

		}else{

		}
		//查询ISO基准刀片 json
		List<String> ISOList = designTurningHolderService.queryISOList();
		if(ISOList != null && ISOList.size() > 0){
			String isoArray[] = new String[ISOList.size()];  
			for(int i=0;i<ISOList.size();i++){
				isoArray[i] = ISOList.get(i);
			}
			String json = JackJson.fromObjectToJson(isoArray);
			mv.addObject("isoArray", json);
		}
		//查询类别列表
		List<Map> categoryDesignTurningHolder = designTurningHolderService.queryCategoryDesignTurningHolderList();
		mv.addObject("categoryDesignTurningHolder", categoryDesignTurningHolder);
		mv.addObject("array_PictureDesignTurningHolder", array_PictureDesignTurningHolder);
		mv.addObject("array_PartDesignTurningHolder", array_PartDesignTurningHolder);
		mv.addObject("array_PartDesignTurningHolder_name", array_PartDesignTurningHolder_name);
		mv.addObject("array_InformDetailDesignTurningHolder", array_InformDetailDesignTurningHolder);
		mv.addObject("array_InformDetailDesignTurningHolder_name", array_InformDetailDesignTurningHolder_name);
		
		mv.addObject("designturningHolder", DesignturningHolder);
		
		mv.setViewName("/WEB-INF/toolPlan/designTurningTool/designTurningHolder/designTurningHolder_edit");

		return mv;
		
	}
	
	
	
	
	
	/**
	 * 保存part
	 * @param id_BTADrill
	 * @param PictureBTADrill
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/savePartDesignTurningHolder")
	public ModelAndView savePartDesignTurningHolder(int id_DesignTurningHolder, 
			String array_PictureDesignTurningHolder, 
			String array_PartDesignTurningHolder, String array_PartDesignTurningHolder_name,
			String array_InformDetailDesignTurningHolder, String array_InformDetailDesignTurningHolder_name, 
			@RequestParam(value="PartDesignTurningHolder",required=false)CommonsMultipartFile PartDesignTurningHolder ,
			String DesignNumberTurningHolder, String DesignNameTurningHolder, String DesignTypeTurningHolder, 
			String DesignISOBladeTurning, String DesignBladecategoryTurningHolder, String DesignEdgeAngleTurningHolder, 
			String DesignFeatureTurningHolder, String DesignCompanyTurningHolder, String DesignTypeCustomBlade,
			HttpServletRequest request ) throws Exception{
		
		Map DesignturningHolder = new HashMap();
		
		DesignturningHolder.put("id_DesignTurningHolder", id_DesignTurningHolder);
		DesignturningHolder.put("DesignNumberTurningHolder", DesignNumberTurningHolder);
		DesignturningHolder.put("DesignNameTurningHolder", DesignNameTurningHolder);

		Map temp = new HashMap();
		temp.put("name_CategoryDesignTurningHolder", DesignTypeTurningHolder);
		Map CategoryDesignTurningHolder = designTurningHolderService.queryCategoryDesignTurningHolderByName(temp);
		if(CategoryDesignTurningHolder!=null || "".equals(CategoryDesignTurningHolder)){
			DesignturningHolder.put("DesignTypeTurningHolder", CategoryDesignTurningHolder.get("id_CategoryDesignTurningHolder"));
		}
		
		DesignturningHolder.put("DesignISOBladeTurning", DesignISOBladeTurning);
		DesignturningHolder.put("DesignBladecategoryTurningHolder", DesignBladecategoryTurningHolder);
		DesignturningHolder.put("DesignEdgeAngleTurningHolder", DesignEdgeAngleTurningHolder);
		DesignturningHolder.put("DesignFeatureTurningHolder", DesignFeatureTurningHolder);
		DesignturningHolder.put("DesignCompanyTurningHolder", DesignCompanyTurningHolder);
		DesignturningHolder.put("DesignTypeCustomBlade", DesignTypeCustomBlade);
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureBTADrillMap = new HashMap(); 
		
		String OriginalFilename = PartDesignTurningHolder.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/partDesignTurningHolder/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			PartDesignTurningHolder.transferTo(materials_big_img_file); 
			PictureBTADrillMap.put("url_PartDesignTurningHolder", "/partDesignTurningHolder/" + big_url + "." + fileSuffix);
			PictureBTADrillMap.put("id_DesignTurningHolder", id_DesignTurningHolder);
			array_PartDesignTurningHolder = array_PartDesignTurningHolder + "/partDesignTurningHolder/" + big_url + "." + fileSuffix + ",";
			array_PartDesignTurningHolder_name = array_PartDesignTurningHolder_name + OriginalFilename + ",";

		}else{

		}
		//查询ISO基准刀片 json
		List<String> ISOList = designTurningHolderService.queryISOList();
		if(ISOList != null && ISOList.size() > 0){
			String isoArray[] = new String[ISOList.size()];  
			for(int i=0;i<ISOList.size();i++){
				isoArray[i] = ISOList.get(i);
			}
			String json = JackJson.fromObjectToJson(isoArray);
			mv.addObject("isoArray", json);
		}
		//查询类别列表
		List<Map> categoryDesignTurningHolder = designTurningHolderService.queryCategoryDesignTurningHolderList();
		mv.addObject("categoryDesignTurningHolder", categoryDesignTurningHolder);
		mv.addObject("array_PictureDesignTurningHolder", array_PictureDesignTurningHolder);
		mv.addObject("array_PartDesignTurningHolder", array_PartDesignTurningHolder);
		mv.addObject("array_PartDesignTurningHolder_name", array_PartDesignTurningHolder_name);
		mv.addObject("array_InformDetailDesignTurningHolder", array_InformDetailDesignTurningHolder);
		mv.addObject("array_InformDetailDesignTurningHolder_name", array_InformDetailDesignTurningHolder_name);
		
		mv.addObject("designturningHolder", DesignturningHolder);
		
		mv.setViewName("/WEB-INF/toolPlan/designTurningTool/designTurningHolder/designTurningHolder_edit");

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
	@RequestMapping(value="/saveInformDetailDesignTurningHolder")
	public ModelAndView saveInformDetailDesignTurningHolder(
			int id_DesignTurningHolder, 
			String array_PictureDesignTurningHolder, 
			String array_PartDesignTurningHolder, String array_PartDesignTurningHolder_name,
			String array_InformDetailDesignTurningHolder, String array_InformDetailDesignTurningHolder_name, 
			@RequestParam(value="InformDetailDesignTurningHolder",required=false)CommonsMultipartFile InformDetailDesignTurningHolder ,
			String DesignNumberTurningHolder, String DesignNameTurningHolder, String DesignTypeTurningHolder, 
			String DesignISOBladeTurning, String DesignBladecategoryTurningHolder, String DesignEdgeAngleTurningHolder, 
			String DesignFeatureTurningHolder, String DesignCompanyTurningHolder, String DesignTypeCustomBlade,
			HttpServletRequest request ) throws Exception{
		
		Map DesignturningHolder = new HashMap();
		
		DesignturningHolder.put("id_DesignTurningHolder", id_DesignTurningHolder);
		DesignturningHolder.put("DesignNumberTurningHolder", DesignNumberTurningHolder);
		DesignturningHolder.put("DesignNameTurningHolder", DesignNameTurningHolder);

		Map temp = new HashMap();
		temp.put("name_CategoryDesignTurningHolder", DesignTypeTurningHolder);
		Map CategoryDesignTurningHolder = designTurningHolderService.queryCategoryDesignTurningHolderByName(temp);
		if(CategoryDesignTurningHolder!=null || "".equals(CategoryDesignTurningHolder)){
			DesignturningHolder.put("DesignTypeTurningHolder", CategoryDesignTurningHolder.get("id_CategoryDesignTurningHolder"));
		}
		
		DesignturningHolder.put("DesignISOBladeTurning", DesignISOBladeTurning);
		DesignturningHolder.put("DesignBladecategoryTurningHolder", DesignBladecategoryTurningHolder);
		DesignturningHolder.put("DesignEdgeAngleTurningHolder", DesignEdgeAngleTurningHolder);
		DesignturningHolder.put("DesignFeatureTurningHolder", DesignFeatureTurningHolder);
		DesignturningHolder.put("DesignCompanyTurningHolder", DesignCompanyTurningHolder);
		DesignturningHolder.put("DesignTypeCustomBlade", DesignTypeCustomBlade);
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureBTADrillMap = new HashMap(); 
		
		String OriginalFilename = InformDetailDesignTurningHolder.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informDetailDesignTurningHolder/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			InformDetailDesignTurningHolder.transferTo(materials_big_img_file); 
			PictureBTADrillMap.put("url_InformDetailDesignTurningHolder", "/informDetailDesignTurningHolder/" + big_url + "." + fileSuffix);
			PictureBTADrillMap.put("id_DesignTurningHolder", id_DesignTurningHolder);
			array_InformDetailDesignTurningHolder = array_InformDetailDesignTurningHolder + "/informDetailDesignTurningHolder/" + big_url + "." + fileSuffix + ",";
			array_InformDetailDesignTurningHolder_name = array_InformDetailDesignTurningHolder_name + OriginalFilename + ",";

		}else{

		}
		//查询ISO基准刀片 json
		List<String> ISOList = designTurningHolderService.queryISOList();
		if(ISOList != null && ISOList.size() > 0){
			String isoArray[] = new String[ISOList.size()];  
			for(int i=0;i<ISOList.size();i++){
				isoArray[i] = ISOList.get(i);
			}
			String json = JackJson.fromObjectToJson(isoArray);
			mv.addObject("isoArray", json);
		}
		//查询类别列表
		List<Map> categoryDesignTurningHolder = designTurningHolderService.queryCategoryDesignTurningHolderList();
		mv.addObject("categoryDesignTurningHolder", categoryDesignTurningHolder);
		mv.addObject("array_PictureDesignTurningHolder", array_PictureDesignTurningHolder);
		mv.addObject("array_PartDesignTurningHolder", array_PartDesignTurningHolder);
		mv.addObject("array_PartDesignTurningHolder_name", array_PartDesignTurningHolder_name);
		mv.addObject("array_InformDetailDesignTurningHolder", array_InformDetailDesignTurningHolder);
		mv.addObject("array_InformDetailDesignTurningHolder_name", array_InformDetailDesignTurningHolder_name);
		
		mv.addObject("designturningHolder", DesignturningHolder);
		
		mv.setViewName("/WEB-INF/toolPlan/designTurningTool/designTurningHolder/designTurningHolder_edit");

		return mv;
		
	}
	
	
	
	
	@ResponseBody
	@RequestMapping("/saveDesignTurningHolder")
	public String saveDesignTurningHolder(HttpServletRequest request, 
			int id_DesignTurningHolder, 
			String array_PictureDesignTurningHolder, 
			String array_PartDesignTurningHolder, String array_PartDesignTurningHolder_name,
			String array_InformDetailDesignTurningHolder, String array_InformDetailDesignTurningHolder_name, 
			String DesignNumberTurningHolder, String DesignNameTurningHolder, String DesignTypeTurningHolder, 
			String DesignISOBladeTurning, String DesignBladecategoryTurningHolder, String DesignEdgeAngleTurningHolder, 
			String DesignFeatureTurningHolder, String DesignCompanyTurningHolder, String DesignTypeCustomBlade) {
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		Map para = new HashMap();
		
		
		if(!"9".equals(DesignBladecategoryTurningHolder)){
			DesignTypeCustomBlade = null;
		}

		para.put("id_DesignTurningHolder", id_DesignTurningHolder);
		para.put("DesignNumberTurningHolder", DesignNumberTurningHolder);
		para.put("DesignNameTurningHolder", DesignNameTurningHolder);
		
		Map temp = new HashMap();
		temp.put("name_CategoryDesignTurningHolder", DesignTypeTurningHolder);
		Map CategoryDesignTurningHolder = designTurningHolderService.queryCategoryDesignTurningHolderByName(temp);
		if(CategoryDesignTurningHolder!=null || "".equals(CategoryDesignTurningHolder)){
			para.put("DesignTypeTurningHolder", CategoryDesignTurningHolder.get("id_CategoryDesignTurningHolder"));
		}else{
			//保存新的材料类别
			designTurningHolderService.saveCategoryDesignTurningHolder(temp);
			para.put("DesignTypeTurningHolder", temp.get("id_CategoryDesignTurningHolder"));
		}
		
		para.put("DesignISOBladeTurning", DesignISOBladeTurning);
		para.put("DesignBladecategoryTurningHolder", DesignBladecategoryTurningHolder);
		para.put("DesignEdgeAngleTurningHolder", DesignEdgeAngleTurningHolder);
		para.put("DesignFeatureTurningHolder", DesignFeatureTurningHolder);
		para.put("DesignCompanyTurningHolder", DesignCompanyTurningHolder);
		para.put("DesignTypeCustomBlade", DesignTypeCustomBlade);
		para.put("add_time", System.currentTimeMillis() / 1000);
		if(user != null){
			para.put("user_id", user.get("user_id"));
		}else{
			para.put("user_id", 0);
		}
		try {
			if(id_DesignTurningHolder != 0){//修改
				designTurningHolderService.updateDesignTurningHolder(para);
			}else{//新增
				
				designTurningHolderService.saveDesignTurningHolder(para);
			}
			//清空刀柄图片路径
			designTurningHolderService.clearPictureDesignTurningHolderById(para);
			//保存刀柄图片
			if(array_PictureDesignTurningHolder != null && !"".equals(array_PictureDesignTurningHolder)){
				String array_PictureDesignTurningHolders[] = array_PictureDesignTurningHolder.split(",");
				for(int i=0; i<array_PictureDesignTurningHolders.length; i++){
					if(array_PictureDesignTurningHolders[i] != null && !"".equals(array_PictureDesignTurningHolders[i])){
						para.put("url_PictureDesignTurningHolder", array_PictureDesignTurningHolders[i]);
						designTurningHolderService.savePictureDesignTurningHolder(para);
					}
				}
			}
			
			
			//清空详细图片路径
			designTurningHolderService.clearPartDesignTurningHolderById(para);
			//保存详细图片
			if(array_PartDesignTurningHolder != null && !"".equals(array_PartDesignTurningHolder)){
				String array_PartDesignTurningHolders[] = array_PartDesignTurningHolder.split(",");
				String array_PartDesignTurningHolders_name[] = array_PartDesignTurningHolder_name.split(",");
				
				for(int i=0; i<array_PartDesignTurningHolders.length; i++){
					if(array_PartDesignTurningHolders[i] != null && !"".equals(array_PartDesignTurningHolders[i])){
						para.put("url_PartDesignTurningHolder", array_PartDesignTurningHolders[i]);
						para.put("name_PartDesignTurningHolder", array_PartDesignTurningHolders_name[i]);
						designTurningHolderService.savePartDesignTurningHolder(para);
					}
				}
			}
			
			
			//清空详细信息路径
			designTurningHolderService.clearInformDetailDesignTurningHolderById(para);
			//保存详细信息
			if(array_InformDetailDesignTurningHolder != null && !"".equals(array_InformDetailDesignTurningHolder)){
				String array_InformDetailDesignTurningHolders[] = array_InformDetailDesignTurningHolder.split(",");
				String array_InformDetailDesignTurningHolders_name[] = array_InformDetailDesignTurningHolder_name.split(",");
				
				for(int i=0; i<array_InformDetailDesignTurningHolders.length; i++){
					if(array_InformDetailDesignTurningHolders[i] != null && !"".equals(array_InformDetailDesignTurningHolders[i])){
						para.put("url_InformDetailDesignTurningHolder", array_InformDetailDesignTurningHolders[i]);
						para.put("name_InformDetailDesignTurningHolder", array_InformDetailDesignTurningHolders_name[i]);
						designTurningHolderService.saveInformDetailDesignTurningHolder(para);
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
	
	
	
	@ResponseBody
	@RequestMapping("/deleteDesignTurningHolderList")
	public String deleteDesignTurningHolderList(String id_DesignTurningHolder) {
		Map para = new HashMap();
		para.put("id_DesignTurningHolder", id_DesignTurningHolder);
		try {
			//清空刀柄设计图片路径
			designTurningHolderService.clearPictureDesignTurningHolderById(para);
			//清空详细信息路径
			designTurningHolderService.clearInformDetailDesignTurningHolderById(para);
			//清空part文件数据
			designTurningHolderService.clearPartDesignTurningHolderById(para);
			//删除刀柄设计数据
			designTurningHolderService.deleteDesignTurningHolder(para);
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
	
	@RequestMapping("/toTurningBlade")
	public ModelAndView toTurningBlade(Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		String TurningHolderId = request.getParameter("id"); 
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= designTurningBladeService.queryDesignTurningBladeList(page);//查询刀片列表
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			if(list != null && list.size() > 0){
				for(int i = 0; i < list.size(); i++){
					Map designTurningBlade = list.get(i);
					int id_DesignTurningBlade = (int) designTurningBlade.get("id_DesignTurningBlade");
					
					Map para = new HashMap();
					para.put("id_DesignTurningBlade", id_DesignTurningBlade);
					
					//查询刀具图片列表 
					List<Map> pictureDesignTurningBladeList = designTurningBladeService.queryPictureDesignTurningBladeList(para);
					//查询详细信息列表 
					List<Map> informDetailDesignTurningBladeList = designTurningBladeService.queryInformDetailDesignTurningBladeList(para);
					//查询part
					List<Map> partDesignTurningBladeList = designTurningBladeService.queryPartDesignTurningBladeList(para);
					
					designTurningBlade.put("pictureDesignTurningBladeList", pictureDesignTurningBladeList);
					designTurningBlade.put("informDetailDesignTurningBladeList", informDetailDesignTurningBladeList);
					designTurningBlade.put("partDesignTurningBladeList", partDesignTurningBladeList);
					list.set(i, designTurningBlade);
				}
			}
			mv.addObject("designturningBladeList", list);
			mv.addObject("TurningHolderId", TurningHolderId);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/toolPlan/designTurningTool/designTurningBlade/designTurningBlade_list");
		return mv;
		
	}
	
}
