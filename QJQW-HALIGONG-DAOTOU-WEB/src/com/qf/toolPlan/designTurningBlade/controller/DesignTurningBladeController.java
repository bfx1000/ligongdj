package com.qf.toolPlan.designTurningBlade.controller;

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

import com.qf.toolPlan.designTurningBlade.service.DesignTurningBladeService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.common.JackJson;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/designTurningBlade")
public class DesignTurningBladeController extends BaseController{

	
	@Resource(name="designTurningBladeService")
	private DesignTurningBladeService designTurningBladeService;
	
	
	 @RequestMapping("queryDesignTurningBladeList")
		public ModelAndView queryDesignTurningBladeList(Page page, HttpServletRequest request){
			ModelAndView mv=new ModelAndView();
			PageData pd = new PageData();
			
			HttpSession session = request.getSession();
			Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
			
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
				System.out.println("刀片信息"+","+list);
				mv.addObject("designturningBladeList", list);
				mv.addObject("pd", pd);
				mv.addObject("page", page);
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.setViewName("/WEB-INF/toolPlan/designTurningTool/designTurningBlade/designTurningBlade_list");
			return mv;
		}
	    
	    
	    /**
	     * 查询刀片详细信息
	     * @param id
	     * @param turn_url
	     * @return
	     * @throws Exception
	     */
	    @RequestMapping(value="/goAddDesignTurningBlade")
		public ModelAndView goAddDesignTurningBlade(String id, String turn_url)throws Exception{
			ModelAndView mv = this.getModelAndView();
			PageData pd = new PageData();
			pd = this.getPageData();
			
			Map para = new HashMap();
			para.put("id_DesignTurningBlade", id);
			Map designturningBlade = designTurningBladeService.queryDesignTurningBladeById(para);//查询刀片详细信息
			if(designturningBlade != null){
				
				//查询刀具图片列表 PictureBladeTurningList
				List<Map> pictureDesignTurningBladeList = designTurningBladeService.queryPictureDesignTurningBladeList(para);
				String array_PictureDesignTurningBlade = "";
				if(pictureDesignTurningBladeList != null && pictureDesignTurningBladeList.size() > 0){
					for(int i = 0; i < pictureDesignTurningBladeList.size(); i++){
						array_PictureDesignTurningBlade = array_PictureDesignTurningBlade + pictureDesignTurningBladeList.get(i).get("url_PictureDesignTurningBlade") + ",";
					}
				}
				
				//查询详细信息列表 InformDetailBladeTurningList
				List<Map> informDetailDesignTurningBladeList = designTurningBladeService.queryInformDetailDesignTurningBladeList(para);
				String array_InformDetailDesignTurningBlade = "";
				String array_InformDetailDesignTurningBlade_name = "";
				if(informDetailDesignTurningBladeList != null && informDetailDesignTurningBladeList.size() > 0){
					for(int i = 0; i < informDetailDesignTurningBladeList.size(); i++){
						array_InformDetailDesignTurningBlade = array_InformDetailDesignTurningBlade + informDetailDesignTurningBladeList.get(i).get("url_InformDetailDesignTurningBlade") + ",";
						array_InformDetailDesignTurningBlade_name = array_InformDetailDesignTurningBlade_name + informDetailDesignTurningBladeList.get(i).get("name_InformDetailDesignTurningBlade") + ",";
					}
				}
				
				
				//查询应用实例列表 ApplicationBladeTurningList
				List<Map> partDesignTurningBladeList = designTurningBladeService.queryPartDesignTurningBladeList(para);
				String array_PartDesignTurningBlade = "";
				String array_PartDesignTurningBlade_name = "";
				if(partDesignTurningBladeList != null && partDesignTurningBladeList.size() > 0){
					for(int i = 0; i < partDesignTurningBladeList.size(); i++){
						array_PartDesignTurningBlade = array_PartDesignTurningBlade + partDesignTurningBladeList.get(i).get("url_PartDesignTurningBlade") + ",";
						array_PartDesignTurningBlade_name = array_PartDesignTurningBlade_name + partDesignTurningBladeList.get(i).get("name_PartDesignTurningBlade") + ",";
						
					}
				}
				
				designturningBlade.put("pictureDesignTurningBladeList", pictureDesignTurningBladeList);
				designturningBlade.put("informDetailDesignTurningBladeList", informDetailDesignTurningBladeList);
				designturningBlade.put("partDesignTurningBladeList", partDesignTurningBladeList);
				
				mv.addObject("array_PictureDesignTurningBlade", array_PictureDesignTurningBlade);
				mv.addObject("array_InformDetailDesignTurningBlade", array_InformDetailDesignTurningBlade);
				mv.addObject("array_InformDetailDesignTurningBlade_name", array_InformDetailDesignTurningBlade_name);
				mv.addObject("array_PartDesignTurningBlade", array_PartDesignTurningBlade);
				mv.addObject("array_PartDesignTurningBlade_name", array_PartDesignTurningBlade_name);
			}
			//查询ISO基准刀片 json
			List<String> ISOList = designTurningBladeService.queryISOList();
			if(ISOList != null && ISOList.size() > 0){
				String isoArray[] = new String[ISOList.size()];  
				for(int i=0;i<ISOList.size();i++){
					isoArray[i] = ISOList.get(i);
				}
				String json = JackJson.fromObjectToJson(isoArray);
				mv.addObject("isoArray", json);
			}
			System.out.println(designturningBlade);
			
			mv.setViewName("/WEB-INF/toolPlan/designTurningTool/designTurningBlade/designTurningBlade_edit");
			mv.addObject("msg", "saveToolBTAdrill");
			mv.addObject("turn_url", turn_url);
			mv.addObject("designturningBlade", designturningBlade);
			
			mv.addObject("pd", pd);

			return mv;
			
			
	    }
	    
	    
	    /**
	     * 添加刀片信息
	     */
	    @ResponseBody
		@RequestMapping("/saveDesignTurningBlade")
		public String saveDesignTurningBlade(HttpServletRequest request, 
				int id_DesignTurningBlade, String DesignNumberTurningBlade, String DesignNameTurningBlade, String DesignTypeBTADrill, String DesignISOBladeTurning, 
				String DesignMachiningTypeBladeTurning, String DesignCompanyTurningBlade, String DesignToolBladeFeatureTurning, String DesignQianjiaoBladeTurning, String DesignHoujiaoBladeTurning, 
				String DesignRenqingjiaoBladeTurning, String DesignNoseRadiusTurning, String DesignBreakerBladeTurning, String DesignHolderInfo,
				String array_PictureDesignTurningBlade, 
				String array_InformDetailDesignTurningBlade, String array_InformDetailDesignTurningBlade_name, 
				String array_PartDesignTurningBlade, String array_PartDesignTurningBlade_name	) {
			
	    	HttpSession session = request.getSession();
			Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
			Map para = new HashMap();
			para.put("id_DesignTurningBlade", id_DesignTurningBlade);
			para.put("DesignNumberTurningBlade", DesignNumberTurningBlade);
			para.put("DesignNameTurningBlade", DesignNameTurningBlade);
			para.put("DesignTypeBTADrill", DesignTypeBTADrill);
			para.put("DesignISOBladeTurning", DesignISOBladeTurning);
			para.put("DesignMachiningTypeBladeTurning", DesignMachiningTypeBladeTurning);
			para.put("DesignCompanyTurningBlade", DesignCompanyTurningBlade);
			para.put("DesignToolBladeFeatureTurning", DesignToolBladeFeatureTurning);
			para.put("DesignHolderInfo", DesignHolderInfo);
			if(DesignQianjiaoBladeTurning == null || "".equals(DesignQianjiaoBladeTurning)){
				para.put("DesignQianjiaoBladeTurning", "0");
			}else{
				para.put("DesignQianjiaoBladeTurning", DesignQianjiaoBladeTurning);
			}
			
			if(DesignHoujiaoBladeTurning == null || "".equals(DesignHoujiaoBladeTurning)){
				para.put("DesignHoujiaoBladeTurning", "0");
			}else{
				para.put("DesignHoujiaoBladeTurning", DesignHoujiaoBladeTurning);
			}
			
			if(DesignRenqingjiaoBladeTurning == null || "".equals(DesignRenqingjiaoBladeTurning)){
				para.put("DesignRenqingjiaoBladeTurning", "0");
			}else{
				para.put("DesignRenqingjiaoBladeTurning", DesignRenqingjiaoBladeTurning);
			}
			
			if(DesignNoseRadiusTurning == null || "".equals(DesignNoseRadiusTurning)){
				para.put("DesignNoseRadiusTurning", "0");
			}else{
				para.put("DesignNoseRadiusTurning", DesignNoseRadiusTurning);
			}
			
			para.put("DesignBreakerBladeTurning", DesignBreakerBladeTurning);
			para.put("add_time", System.currentTimeMillis() / 1000);
			if(user != null){
				para.put("user_id", user.get("user_id"));
			}else{
				para.put("user_id", 0);
			}
			try {
				if(id_DesignTurningBlade != 0){//修改
					designTurningBladeService.updateDesignTurningBlade(para);
				}else{//新增
					
					designTurningBladeService.saveDesignTurningBlade(para);
				}
				
				//清空刀具图片路径 PictureBladeTurning
				designTurningBladeService.clearPictureDesignTurningBladeById(para);
				//保存刀具图片
				if(array_PictureDesignTurningBlade != null && !"".equals(array_PictureDesignTurningBlade)){
					String array_PictureDesignTurningBlades[] = array_PictureDesignTurningBlade.split(",");
					for(int i=0; i<array_PictureDesignTurningBlades.length; i++){
						if(array_PictureDesignTurningBlades[i] != null && !"".equals(array_PictureDesignTurningBlades[i])){
							para.put("url_PictureDesignTurningBlade", array_PictureDesignTurningBlades[i]);
							designTurningBladeService.savePictureDesignTurningBlade(para);
						}
					}
				}
				
				//清空详细图片路径 PictureDetailBladeTurning
				designTurningBladeService.clearPartDesignTurningBladeById(para);
				//保存详细图片
				if(array_PartDesignTurningBlade != null && !"".equals(array_PartDesignTurningBlade)){
					String array_PartDesignTurningBlades[] = array_PartDesignTurningBlade.split(",");
					String array_PartDesignTurningBlades_name[] = array_PartDesignTurningBlade_name.split(",");
					for(int i=0; i<array_PartDesignTurningBlades.length; i++){
						if(array_PartDesignTurningBlades[i] != null && !"".equals(array_PartDesignTurningBlades[i])){
							para.put("url_PartDesignTurningBlade", array_PartDesignTurningBlades[i]);
							para.put("name_PartDesignTurningBlade", array_PartDesignTurningBlades_name[i]);
							designTurningBladeService.savePartDesignTurningBlade(para);
						}
					}
				}
				
				//清空详细信息路径 InformDetailBladeTurning
				designTurningBladeService.clearInformDetailDesignTurningBladeById(para);
				//保存详细信息
				if(array_InformDetailDesignTurningBlade != null && !"".equals(array_InformDetailDesignTurningBlade)){
					String array_InformDetailDesignTurningBlades[] = array_InformDetailDesignTurningBlade.split(",");
					String array_InformDetailDesignTurningBlades_name[] = array_InformDetailDesignTurningBlade_name.split(",");
					
					for(int i=0; i<array_InformDetailDesignTurningBlades.length; i++){
						if(array_InformDetailDesignTurningBlades[i] != null && !"".equals(array_InformDetailDesignTurningBlades[i])){
							para.put("url_InformDetailDesignTurningBlade", array_InformDetailDesignTurningBlades[i]);
							para.put("name_InformDetailDesignTurningBlade", array_InformDetailDesignTurningBlades_name[i]);
							designTurningBladeService.saveInformDetailDesignTurningBlade(para);
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
		 * 保存刀具图片
		 * @param id_BTADrill
		 * @param PictureBTADrill
		 * @param request
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value="/savePictureDesignTurningBlade")
		public ModelAndView savePictureDesignTurningBlade(
				String id_DesignTurningBlade, String DesignNumberTurningBlade, String DesignNameTurningBlade, String DesignTypeBTADrill, String DesignISOBladeTurning, 
				String DesignMachiningTypeBladeTurning, String DesignCompanyTurningBlade, String DesignToolBladeFeatureTurning, String DesignQianjiaoBladeTurning, String DesignHoujiaoBladeTurning, 
				String DesignRenqingjiaoBladeTurning, String DesignNoseRadiusTurning, String DesignBreakerBladeTurning, String DesignHolderInfo,
				String array_PictureDesignTurningBlade, 
				String array_InformDetailDesignTurningBlade, String array_InformDetailDesignTurningBlade_name, 
				String array_PartDesignTurningBlade, String array_PartDesignTurningBlade_name,
				@RequestParam(value="PictureDesignTurningBlade",required=false)CommonsMultipartFile PictureDesignTurningBlade ,
				HttpServletRequest request ) throws Exception{

			Map designturningBlade = new HashMap();
			
			designturningBlade.put("id_DesignTurningBlade", id_DesignTurningBlade);
			designturningBlade.put("DesignNumberTurningBlade", DesignNumberTurningBlade);
			designturningBlade.put("DesignNameTurningBlade", DesignNameTurningBlade);
			designturningBlade.put("DesignTypeBTADrill", DesignTypeBTADrill);
			designturningBlade.put("DesignISOBladeTurning", DesignISOBladeTurning);
			designturningBlade.put("DesignMachiningTypeBladeTurning", DesignMachiningTypeBladeTurning);
			designturningBlade.put("DesignCompanyTurningBlade", DesignCompanyTurningBlade);
			designturningBlade.put("DesignToolBladeFeatureTurning", DesignToolBladeFeatureTurning);
			designturningBlade.put("DesignQianjiaoBladeTurning", DesignQianjiaoBladeTurning);
			designturningBlade.put("DesignHoujiaoBladeTurning", DesignHoujiaoBladeTurning);
			designturningBlade.put("DesignRenqingjiaoBladeTurning", DesignRenqingjiaoBladeTurning);
			designturningBlade.put("DesignNoseRadiusTurning", DesignNoseRadiusTurning);
			designturningBlade.put("DesignBreakerBladeTurning", DesignBreakerBladeTurning);
			designturningBlade.put("DesignHolderInfo", DesignHolderInfo);
			Map resultMap = new HashMap();
			ModelAndView mv = this.getModelAndView();
			Map PictureDesignTurningBladeMap = new HashMap(); 
			
			String OriginalFilename = PictureDesignTurningBlade.getOriginalFilename();  
			if(OriginalFilename != null && !"".equals(OriginalFilename)){
				String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
				String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
				String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureDesignTurningBlade/" + big_url + "." + fileSuffix);
				
				File materials_big_img_file = new File(filepath1);
				
				PictureDesignTurningBlade.transferTo(materials_big_img_file); 
				PictureDesignTurningBladeMap.put("url_PictureDesignTurningBlade", "/pictureDesignTurningBlade/" + big_url + "." + fileSuffix);
				PictureDesignTurningBladeMap.put("id_DesignTurningBlade", id_DesignTurningBlade);
				array_PictureDesignTurningBlade = array_PictureDesignTurningBlade + "/pictureDesignTurningBlade/" + big_url + "." + fileSuffix + ",";

			}else{

			}
			//查询ISO基准刀片 json
			List<String> ISOList = designTurningBladeService.queryISOList();
			if(ISOList != null && ISOList.size() > 0){
				String isoArray[] = new String[ISOList.size()];  
				for(int i=0;i<ISOList.size();i++){
					isoArray[i] = ISOList.get(i);
				}
				String json = JackJson.fromObjectToJson(isoArray);
				mv.addObject("isoArray", json);
			}
			mv.addObject("array_PictureDesignTurningBlade", array_PictureDesignTurningBlade);
			mv.addObject("array_InformDetailDesignTurningBlade", array_InformDetailDesignTurningBlade);
			mv.addObject("array_InformDetailDesignTurningBlade_name", array_InformDetailDesignTurningBlade_name);
			mv.addObject("array_PartDesignTurningBlade", array_PartDesignTurningBlade);
			mv.addObject("array_PartDesignTurningBlade_name", array_PartDesignTurningBlade_name);
			
			mv.addObject("designturningBlade", designturningBlade);
			
			mv.setViewName("/WEB-INF/toolPlan/designTurningTool/designTurningBlade/designTurningBlade_edit");

			return mv;
			
		}
		/**
		 * 保存应用实例
		 * @param id_BTADrill
		 * @param PictureBTADrill
		 * @param request
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value="/savePartDesignTurningBlade")
		public ModelAndView savePartDesignTurningBlade(
				String id_DesignTurningBlade, String DesignNumberTurningBlade, String DesignNameTurningBlade, String DesignTypeBTADrill, String DesignISOBladeTurning, 
				String DesignMachiningTypeBladeTurning, String DesignCompanyTurningBlade, String DesignToolBladeFeatureTurning, String DesignQianjiaoBladeTurning, String DesignHoujiaoBladeTurning, 
				String DesignRenqingjiaoBladeTurning, String DesignNoseRadiusTurning, String DesignBreakerBladeTurning, String DesignHolderInfo,
				String array_PictureDesignTurningBlade, 
				String array_InformDetailDesignTurningBlade, String array_InformDetailDesignTurningBlade_name, 
				String array_PartDesignTurningBlade, String array_PartDesignTurningBlade_name,
				@RequestParam(value="PartDesignTurningBlade",required=false)CommonsMultipartFile PartDesignTurningBlade ,
				HttpServletRequest request ) throws Exception{

			Map designturningBlade = new HashMap();
			
			designturningBlade.put("id_DesignTurningBlade", id_DesignTurningBlade);
			designturningBlade.put("DesignNumberTurningBlade", DesignNumberTurningBlade);
			designturningBlade.put("DesignNameTurningBlade", DesignNameTurningBlade);
			designturningBlade.put("DesignTypeBTADrill", DesignTypeBTADrill);
			designturningBlade.put("DesignISOBladeTurning", DesignISOBladeTurning);
			designturningBlade.put("DesignMachiningTypeBladeTurning", DesignMachiningTypeBladeTurning);
			designturningBlade.put("DesignCompanyTurningBlade", DesignCompanyTurningBlade);
			designturningBlade.put("DesignToolBladeFeatureTurning", DesignToolBladeFeatureTurning);
			designturningBlade.put("DesignQianjiaoBladeTurning", DesignQianjiaoBladeTurning);
			designturningBlade.put("DesignHoujiaoBladeTurning", DesignHoujiaoBladeTurning);
			designturningBlade.put("DesignRenqingjiaoBladeTurning", DesignRenqingjiaoBladeTurning);
			designturningBlade.put("DesignNoseRadiusTurning", DesignNoseRadiusTurning);
			designturningBlade.put("DesignBreakerBladeTurning", DesignBreakerBladeTurning);
			designturningBlade.put("DesignHolderInfo", DesignHolderInfo);
			
			Map resultMap = new HashMap();
			ModelAndView mv = this.getModelAndView();
			Map PartDesignTurningBladeMap = new HashMap(); 
			
			String OriginalFilename = PartDesignTurningBlade.getOriginalFilename();  
			if(OriginalFilename != null && !"".equals(OriginalFilename)){
				String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
				String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
				String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/partDesignTurningBlade/" + big_url + "." + fileSuffix);
				
				File materials_big_img_file = new File(filepath1);
				
				PartDesignTurningBlade.transferTo(materials_big_img_file); 
				PartDesignTurningBladeMap.put("url_PartDesignTurningBlade", "/partDesignTurningBlade/" + big_url + "." + fileSuffix);
				PartDesignTurningBladeMap.put("id_DesignTurningBlade", id_DesignTurningBlade);
				array_PartDesignTurningBlade = array_PartDesignTurningBlade + "/partDesignTurningBlade/" + big_url + "." + fileSuffix + ",";
				array_PartDesignTurningBlade_name = array_PartDesignTurningBlade_name + OriginalFilename + ",";

			}else{

			}
			//查询ISO基准刀片 json
			List<String> ISOList = designTurningBladeService.queryISOList();
			if(ISOList != null && ISOList.size() > 0){
				String isoArray[] = new String[ISOList.size()];  
				for(int i=0;i<ISOList.size();i++){
					isoArray[i] = ISOList.get(i);
				}
				String json = JackJson.fromObjectToJson(isoArray);
				mv.addObject("isoArray", json);
			}
			mv.addObject("array_PictureDesignTurningBlade", array_PictureDesignTurningBlade);
			mv.addObject("array_InformDetailDesignTurningBlade", array_InformDetailDesignTurningBlade);
			mv.addObject("array_InformDetailDesignTurningBlade_name", array_InformDetailDesignTurningBlade_name);
			mv.addObject("array_PartDesignTurningBlade", array_PartDesignTurningBlade);
			mv.addObject("array_PartDesignTurningBlade_name", array_PartDesignTurningBlade_name);
			
			mv.addObject("designturningBlade", designturningBlade);
			
			mv.setViewName("/WEB-INF/toolPlan/designTurningTool/designTurningBlade/designTurningBlade_edit");

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
		@RequestMapping(value="/saveInformDetailDesignTurningBlade")
		public ModelAndView saveInformDetailDesignTurningBlade(
				String id_DesignTurningBlade, String DesignNumberTurningBlade, String DesignNameTurningBlade, String DesignTypeBTADrill, String DesignISOBladeTurning, 
				String DesignMachiningTypeBladeTurning, String DesignCompanyTurningBlade, String DesignToolBladeFeatureTurning, String DesignQianjiaoBladeTurning, String DesignHoujiaoBladeTurning, 
				String DesignRenqingjiaoBladeTurning, String DesignNoseRadiusTurning, String DesignBreakerBladeTurning, String DesignHolderInfo,
				String array_PictureDesignTurningBlade, 
				String array_InformDetailDesignTurningBlade, String array_InformDetailDesignTurningBlade_name, 
				String array_PartDesignTurningBlade, String array_PartDesignTurningBlade_name,
				@RequestParam(value="InformDetailDesignTurningBlade",required=false)CommonsMultipartFile InformDetailDesignTurningBlade ,
				HttpServletRequest request ) throws Exception{

			Map designturningBlade = new HashMap();
			
			designturningBlade.put("id_DesignTurningBlade", id_DesignTurningBlade);
			designturningBlade.put("DesignNumberTurningBlade", DesignNumberTurningBlade);
			designturningBlade.put("DesignNameTurningBlade", DesignNameTurningBlade);
			designturningBlade.put("DesignTypeBTADrill", DesignTypeBTADrill);
			designturningBlade.put("DesignISOBladeTurning", DesignISOBladeTurning);
			designturningBlade.put("DesignMachiningTypeBladeTurning", DesignMachiningTypeBladeTurning);
			designturningBlade.put("DesignCompanyTurningBlade", DesignCompanyTurningBlade);
			designturningBlade.put("DesignToolBladeFeatureTurning", DesignToolBladeFeatureTurning);
			designturningBlade.put("DesignQianjiaoBladeTurning", DesignQianjiaoBladeTurning);
			designturningBlade.put("DesignHoujiaoBladeTurning", DesignHoujiaoBladeTurning);
			designturningBlade.put("DesignRenqingjiaoBladeTurning", DesignRenqingjiaoBladeTurning);
			designturningBlade.put("DesignNoseRadiusTurning", DesignNoseRadiusTurning);
			designturningBlade.put("DesignBreakerBladeTurning", DesignBreakerBladeTurning);
			designturningBlade.put("DesignHolderInfo", DesignHolderInfo);
			
			Map resultMap = new HashMap();
			ModelAndView mv = this.getModelAndView();
			Map InformDetailDesignTurningBladeMap = new HashMap(); 
			
			String OriginalFilename = InformDetailDesignTurningBlade.getOriginalFilename();  
			if(OriginalFilename != null && !"".equals(OriginalFilename)){
				String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
				String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
				String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informDetailDesignTurningBlade/" + big_url + "." + fileSuffix);
				
				File materials_big_img_file = new File(filepath1);
				
				InformDetailDesignTurningBlade.transferTo(materials_big_img_file); 
				InformDetailDesignTurningBladeMap.put("url_InformDetailDesignTurningBlade", "/informDetailDesignTurningBlade/" + big_url + "." + fileSuffix);
				InformDetailDesignTurningBladeMap.put("id_DesignTurningBlade", id_DesignTurningBlade);
				array_InformDetailDesignTurningBlade = array_InformDetailDesignTurningBlade + "/informDetailDesignTurningBlade/" + big_url + "." + fileSuffix + ",";
				array_InformDetailDesignTurningBlade_name = array_InformDetailDesignTurningBlade_name + OriginalFilename + ",";

			}else{

			}
			//查询ISO基准刀片 json
			List<String> ISOList = designTurningBladeService.queryISOList();
			if(ISOList != null && ISOList.size() > 0){
				String isoArray[] = new String[ISOList.size()];  
				for(int i=0;i<ISOList.size();i++){
					isoArray[i] = ISOList.get(i);
				}
				String json = JackJson.fromObjectToJson(isoArray);
				mv.addObject("isoArray", json);
			}
			mv.addObject("array_PictureDesignTurningBlade", array_PictureDesignTurningBlade);
			mv.addObject("array_InformDetailDesignTurningBlade", array_InformDetailDesignTurningBlade);
			mv.addObject("array_InformDetailDesignTurningBlade_name", array_InformDetailDesignTurningBlade_name);
			mv.addObject("array_PartDesignTurningBlade", array_PartDesignTurningBlade);
			mv.addObject("array_PartDesignTurningBlade_name", array_PartDesignTurningBlade_name);
			
			mv.addObject("designturningBlade", designturningBlade);
			
			mv.setViewName("/WEB-INF/toolPlan/designTurningTool/designTurningBlade/designTurningBlade_edit");

			return mv;
			
		}
		
		
		
		
		/**
		 * 删除刀片数据
		 * @param id_BTADrill
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/deleteDesignTurningBlade")
		public String deleteDesignTurningBlade(String id_DesignTurningBlade) {
			Map para = new HashMap();
			para.put("id_DesignTurningBlade", id_DesignTurningBlade);
			try {
				//清空刀具图片路径 PictureBladeTurning
				designTurningBladeService.clearPictureDesignTurningBladeById(para);
				//清空应用实例路径 ApplicationBladeTurning
				designTurningBladeService.clearPartDesignTurningBladeById(para);
				//清空详细信息路径 InformDetailBladeTurning
				designTurningBladeService.clearInformDetailDesignTurningBladeById(para);
				//删除刀片数据
				designTurningBladeService.deleteDesignTurningBlade(para);
			} catch (Exception e) {
				e.printStackTrace();
				return "0";
			}						
			return "1";
		}
	
		
	
}
