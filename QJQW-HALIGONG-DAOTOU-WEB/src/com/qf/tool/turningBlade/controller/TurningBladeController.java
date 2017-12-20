package com.qf.tool.turningBlade.controller;

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

import com.qf.tool.turningBlade.service.TurningBladeService;
import com.qf.tool.turningHolder.service.TurningHolderService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
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
@RequestMapping("/turningBlade")
public class TurningBladeController  extends BaseController{
	
	@Resource(name="turningBladeService")
	private TurningBladeService turningBladeService;
	
	/**
	 * 查询刀片列表
	 * @param page
	 * @param request
	 * @return
	 */
    @RequestMapping("queryTurningBladeList")
	public ModelAndView queryTurningBladeList(Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= turningBladeService.queryTurningBladeList(page);//查询刀片列表
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			if(list != null && list.size() > 0){
				for(int i = 0; i < list.size(); i++){
					Map turningBlade = list.get(i);
					int id_TurningBlade = (int) turningBlade.get("id_TurningBlade");
					
					Map para = new HashMap();
					para.put("id_TurningBlade", id_TurningBlade);
					
					//查询刀具图片列表 PictureBladeTurningList
					List<Map> pictureBladeTurningList = turningBladeService.queryPictureBladeTurningList(para);
					//查询详细图片列表 PictureDetailBladeTurningList
					List<Map> pictureDetailBladeTurningList = turningBladeService.queryPictureDetailBladeTurningList(para);
					//查询详细信息列表 InformDetailBladeTurningList
					List<Map> informDetailBladeTurningList = turningBladeService.queryInformDetailBladeTurningList(para);
					//查询应用实例列表 ApplicationBladeTurningList
					List<Map> applicationBladeTurningList = turningBladeService.queryApplicationBladeTurningList(para);
					
					turningBlade.put("pictureBladeTurningList", pictureBladeTurningList);
					turningBlade.put("pictureDetailBladeTurningList", pictureDetailBladeTurningList);
					turningBlade.put("informDetailBladeTurningList", informDetailBladeTurningList);
					turningBlade.put("applicationBladeTurningList", applicationBladeTurningList);
					list.set(i, turningBlade);
				}
			}
			
			mv.addObject("turningBladeList", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/tool/turningTool/turningBlade/turningBladeList");
		return mv;
	}
    
    
    /**
     * 查询刀片详细信息
     * @param id
     * @param turn_url
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/goAddTurningBlade")
	public ModelAndView goAddTurningBlade(String id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		Map para = new HashMap();
		para.put("id_TurningBlade", id);
		Map turningBlade = turningBladeService.queryTurningBladeById(para);//查询刀片详细信息
		if(turningBlade != null){
			String isPMKNS = (String) turningBlade.get("isPMKNS");
			if("P".equals(isPMKNS)){
				turningBlade.put("ISOTextBTADrill", turningBlade.get("ISOPTextTurningBlade"));
			}else if("M".equals(isPMKNS)){
				turningBlade.put("ISOTextBTADrill", turningBlade.get("ISOMTextTurningBlade"));
			}else if("K".equals(isPMKNS)){
				turningBlade.put("ISOTextBTADrill", turningBlade.get("ISOKTextTurningBlade"));
			}else if("N".equals(isPMKNS)){
				turningBlade.put("ISOTextBTADrill", turningBlade.get("ISONTextTurningBlade"));
			}else if("S".equals(isPMKNS)){
				turningBlade.put("ISOTextBTADrill", turningBlade.get("ISOSTextTurningBlade"));
			}
			
			
			
			//查询刀具图片列表 PictureBladeTurningList
			List<Map> pictureBladeTurningList = turningBladeService.queryPictureBladeTurningList(para);
			String array_PictureBladeTurning = "";
			if(pictureBladeTurningList != null && pictureBladeTurningList.size() > 0){
				for(int i = 0; i < pictureBladeTurningList.size(); i++){
					array_PictureBladeTurning = array_PictureBladeTurning + pictureBladeTurningList.get(i).get("url_PictureBladeTurning") + ",";
				}
			}
			
			//查询详细图片列表 PictureDetailBladeTurningList
			List<Map> pictureDetailBladeTurningList = turningBladeService.queryPictureDetailBladeTurningList(para);
			String array_PictureDetailBladeTurning = "";
			if(pictureDetailBladeTurningList != null && pictureDetailBladeTurningList.size() > 0){
				for(int i = 0; i < pictureDetailBladeTurningList.size(); i++){
					array_PictureDetailBladeTurning = array_PictureDetailBladeTurning + pictureDetailBladeTurningList.get(i).get("url_PictureDetailBladeTurning") + ",";
				}
			}
			
			//查询详细信息列表 InformDetailBladeTurningList
			List<Map> informDetailBladeTurningList = turningBladeService.queryInformDetailBladeTurningList(para);
			String array_InformDetailBladeTurning = "";
			String array_InformDetailBladeTurning_name = "";
			if(informDetailBladeTurningList != null && informDetailBladeTurningList.size() > 0){
				for(int i = 0; i < informDetailBladeTurningList.size(); i++){
					array_InformDetailBladeTurning = array_InformDetailBladeTurning + informDetailBladeTurningList.get(i).get("url_InformDetailBladeTurning") + ",";
					array_InformDetailBladeTurning_name = array_InformDetailBladeTurning_name + informDetailBladeTurningList.get(i).get("name_InformDetailBladeTurning") + ",";
				}
			}
			
			
			//查询应用实例列表 ApplicationBladeTurningList
			List<Map> applicationBladeTurningList = turningBladeService.queryApplicationBladeTurningList(para);
			String array_ApplicationBladeTurning = "";
			String array_ApplicationBladeTurning_name = "";
			if(applicationBladeTurningList != null && applicationBladeTurningList.size() > 0){
				for(int i = 0; i < applicationBladeTurningList.size(); i++){
					array_ApplicationBladeTurning = array_ApplicationBladeTurning + applicationBladeTurningList.get(i).get("url_ApplicationBladeTurning") + ",";
					array_ApplicationBladeTurning_name = array_ApplicationBladeTurning_name + applicationBladeTurningList.get(i).get("name_ApplicationBladeTurning") + ",";
					
				}
			}
			
			turningBlade.put("pictureBladeTurningList", pictureBladeTurningList);
			turningBlade.put("pictureDetailBladeTurningList", pictureDetailBladeTurningList);
			turningBlade.put("informDetailBladeTurningList", informDetailBladeTurningList);
			turningBlade.put("applicationBladeTurningList", applicationBladeTurningList);
			
			mv.addObject("array_PictureBladeTurning", array_PictureBladeTurning);
			mv.addObject("array_PictureDetailBladeTurning", array_PictureDetailBladeTurning);
			mv.addObject("array_InformDetailBladeTurning", array_InformDetailBladeTurning);
			mv.addObject("array_InformDetailBladeTurning_name", array_InformDetailBladeTurning_name);
			mv.addObject("array_ApplicationBladeTurning", array_ApplicationBladeTurning);
			mv.addObject("array_ApplicationBladeTurning_name", array_ApplicationBladeTurning_name);
		}
		
		
		mv.setViewName("/WEB-INF/tool/turningTool/turningBlade/turningBlade_edit");
		mv.addObject("msg", "saveToolBTAdrill");
		mv.addObject("turn_url", turn_url);
		mv.addObject("turningBlade", turningBlade);
		
		mv.addObject("pd", pd);

		return mv;
		
		
    }
    
    
    /**
     * 添加刀片信息
     * @param request
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
	@RequestMapping("/saveTurningBlade")
	public String saveTurningBlade(HttpServletRequest request, 
			int id_TurningBlade, String NumberTurningBlade, String TypeBTADrill, String NameTurningBlade, String ISOBladeTurning, 
			String ToolCoatBladeTurning, String ToolMaterialBladeTurning, String MachiningTypeBladeTurning, String ToolBladeFeatureTurning, String CompanyTurningBlade, 
			String QianjiaoBladeTurning, String HoujiaoBladeTurning, String HoujisojiaoBladeTurning, String NoseRadiusTurning, String BreakerBladeTurning, 
			String MateriaBladeTurning, String isPMKNS, String ISOPBladeTurning, String ISOPTextBladeTurning, String ISOMBladeTurning, 
			String ISOMTextBladeTurning, String ISOKBladeTurning, String ISOKTextBladeTurning, String ISONBladeTurning, String ISONTextBladeTurning, 
			String ISOSBladeTurning, String ISOSTextBladeTurning, String HolderInfo,
			String array_PictureBladeTurning, 
			String array_PictureDetailBladeTurning, 
			String array_InformDetailBladeTurning, String array_InformDetailBladeTurning_name, 
			String array_ApplicationBladeTurning, String array_ApplicationBladeTurning_name	) {
		
    	HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		Map para = new HashMap();
		
		para.put("id_TurningBlade", id_TurningBlade);
		para.put("NumberTurningBlade", NumberTurningBlade);
		para.put("TypeBTADrill", TypeBTADrill);
		para.put("NameTurningBlade", NameTurningBlade);
		para.put("ISOBladeTurning", ISOBladeTurning);
		para.put("ToolCoatBladeTurning", ToolCoatBladeTurning);
		para.put("ToolMaterialBladeTurning", ToolMaterialBladeTurning);
		para.put("MachiningTypeBladeTurning", MachiningTypeBladeTurning);
		para.put("ToolBladeFeatureTurning", ToolBladeFeatureTurning);
		para.put("CompanyTurningBlade", CompanyTurningBlade);
		
		if(QianjiaoBladeTurning == null || "".equals(QianjiaoBladeTurning)){
			para.put("QianjiaoBladeTurning", "0");
		}else{
			para.put("QianjiaoBladeTurning", QianjiaoBladeTurning);
		}
		
		if(HoujiaoBladeTurning == null || "".equals(HoujiaoBladeTurning)){
			para.put("HoujiaoBladeTurning", "0");
		}else{
			para.put("HoujiaoBladeTurning", HoujiaoBladeTurning);
		}
		
		if(HoujisojiaoBladeTurning == null || "".equals(HoujisojiaoBladeTurning)){
			para.put("HoujisojiaoBladeTurning", "0");
		}else{
			para.put("HoujisojiaoBladeTurning", HoujisojiaoBladeTurning);
		}
		
		if(NoseRadiusTurning == null || "".equals(NoseRadiusTurning)){
			para.put("NoseRadiusTurning", "0");
		}else{
			para.put("NoseRadiusTurning", NoseRadiusTurning);
		}
		
		para.put("BreakerBladeTurning", BreakerBladeTurning);
		para.put("MateriaBladeTurning", MateriaBladeTurning);
		para.put("isPMKNS", isPMKNS);
		para.put("ISOPBladeTurning", ISOPBladeTurning);
		para.put("ISOPTextBladeTurning", ISOPTextBladeTurning);
		para.put("ISOMBladeTurning", ISOMBladeTurning);
		para.put("ISOMTextBladeTurning", ISOMTextBladeTurning);
		para.put("ISOKBladeTurning", ISOKBladeTurning);
		para.put("ISOKTextBladeTurning", ISOKTextBladeTurning);
		para.put("ISONBladeTurning", ISONBladeTurning);
		para.put("ISONTextBladeTurning", ISONTextBladeTurning);
		para.put("ISOSBladeTurning", ISOSBladeTurning);
		para.put("ISOSTextBladeTurning", ISOSTextBladeTurning);
		para.put("HolderInfo", HolderInfo);
//		para.put("isPMKNS", isPMKNS);
//		if(isPMKNS != null && !"".equals(isPMKNS)){
//			if("P".equals(isPMKNS)){//1 加工P 2 加工M 3 加工K 4 加工N 5 加工S
//				para.put("ISOPBTADrill", "1");
//				para.put("ISOPTextBTADrill", ISOTextBTADrill);
//			}else if("M".equals(isPMKNS)){//1 加工P 2 加工M 3 加工K 4 加工N 5 加工S
//				para.put("ISOMBTADrill", "1");
//				para.put("ISOMTextBTADrill", ISOTextBTADrill);
//			}else if("K".equals(isPMKNS)){//1 加工P 2 加工M 3 加工K 4 加工N 5 加工S
//				para.put("ISOKBTADrill", "1");
//				para.put("ISOKTextBTADrill", ISOTextBTADrill);
//			}else if("N".equals(isPMKNS)){//1 加工P 2 加工M 3 加工K 4 加工N 5 加工S
//				para.put("ISONBTADrill", "1");
//				para.put("ISONTextBTADrill", ISOTextBTADrill);
//			}else if("S".equals(isPMKNS)){//1 加工P 2 加工M 3 加工K 4 加工N 5 加工S
//				para.put("ISOSBTADrill", "1");
//				para.put("ISOSTextBTADrill", ISOTextBTADrill);
//			}
//		}
		para.put("add_time", System.currentTimeMillis() / 1000);
		if(user != null){
			para.put("user_id", user.get("user_id"));
		}else{
			para.put("user_id", 0);
		}
		try {
			if(id_TurningBlade != 0){//修改
				turningBladeService.updateTurningBlade(para);
			}else{//新增
				
				turningBladeService.saveTurningBlade(para);
			}
			
			//清空刀具图片路径 PictureBladeTurning
			turningBladeService.clearPictureBladeTurningByIdTurningBlade(para);
			//保存刀具图片
			if(array_PictureBladeTurning != null && !"".equals(array_PictureBladeTurning)){
				String array_PictureBladeTurnings[] = array_PictureBladeTurning.split(",");
				for(int i=0; i<array_PictureBladeTurnings.length; i++){
					if(array_PictureBladeTurnings[i] != null && !"".equals(array_PictureBladeTurnings[i])){
						para.put("url_PictureBladeTurning", array_PictureBladeTurnings[i]);
						turningBladeService.savePictureBladeTurning(para);
					}
				}
			}
			
			//清空详细图片路径 PictureDetailBladeTurning
			turningBladeService.clearPictureDetailBladeTurningByIdTurningBlade(para);
			//保存详细图片
			if(array_PictureDetailBladeTurning != null && !"".equals(array_PictureDetailBladeTurning)){
				String array_PictureDetailBladeTurnings[] = array_PictureDetailBladeTurning.split(",");
				for(int i=0; i<array_PictureDetailBladeTurnings.length; i++){
					if(array_PictureDetailBladeTurnings[i] != null && !"".equals(array_PictureDetailBladeTurnings[i])){
						para.put("url_PictureDetailBladeTurning", array_PictureDetailBladeTurnings[i]);
						turningBladeService.savePictureDetailBladeTurning(para);
					}
				}
			}
			
			//清空应用实例路径 ApplicationBladeTurning
			turningBladeService.clearApplicationBladeTurningByIdTurningBlade(para);
			//保存应用实例
			if(array_ApplicationBladeTurning != null && !"".equals(array_ApplicationBladeTurning)){
				String array_ApplicationBladeTurnings[] = array_ApplicationBladeTurning.split(",");
				String array_ApplicationBladeTurnings_name[] = array_ApplicationBladeTurning_name.split(",");
				for(int i=0; i<array_ApplicationBladeTurnings.length; i++){
					if(array_ApplicationBladeTurnings[i] != null && !"".equals(array_ApplicationBladeTurnings[i])){
						para.put("url_ApplicationBladeTurning", array_ApplicationBladeTurnings[i]);
						para.put("name_ApplicationBladeTurning", array_ApplicationBladeTurnings_name[i]);
						turningBladeService.saveApplicationBladeTurning(para);
					}
				}
			}
			
			//清空详细信息路径 InformDetailBladeTurning
			turningBladeService.clearInformDetailBladeTurningByIdTurningBlade(para);
			//保存详细信息
			if(array_InformDetailBladeTurning != null && !"".equals(array_InformDetailBladeTurning)){
				String array_InformDetailBladeTurnings[] = array_InformDetailBladeTurning.split(",");
				String array_InformDetailBladeTurnings_name[] = array_InformDetailBladeTurning_name.split(",");
				
				for(int i=0; i<array_InformDetailBladeTurnings.length; i++){
					if(array_InformDetailBladeTurnings[i] != null && !"".equals(array_InformDetailBladeTurnings[i])){
						para.put("url_InformDetailBladeTurning", array_InformDetailBladeTurnings[i]);
						para.put("name_InformDetailBladeTurning", array_InformDetailBladeTurnings_name[i]);
						turningBladeService.saveInformDetailBladeTurning(para);
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
	@RequestMapping(value="/savePictureBladeTurning")
	public ModelAndView savePictureBladeTurning(
			String id_TurningBlade, String NumberTurningBlade, String TypeBTADrill, String NameTurningBlade, String ISOBladeTurning, 
			String ToolCoatBladeTurning, String ToolMaterialBladeTurning, String MachiningTypeBladeTurning, String ToolBladeFeatureTurning, String CompanyTurningBlade, 
			String QianjiaoBladeTurning, String HoujiaoBladeTurning, String HoujisojiaoBladeTurning, String NoseRadiusTurning, String BreakerBladeTurning, 
			String MateriaBladeTurning, 
			String isPMKNS, 
			String ISOPBladeTurning, String ISOPTextBladeTurning, 
			String ISOMBladeTurning, String ISOMTextBladeTurning, 
			String ISOKBladeTurning, String ISOKTextBladeTurning, 
			String ISONBladeTurning, String ISONTextBladeTurning, 
			String ISOSBladeTurning, String ISOSTextBladeTurning, String HolderInfo,
			String array_PictureBladeTurning, 
			String array_PictureDetailBladeTurning, 
			String array_InformDetailBladeTurning, String array_InformDetailBladeTurning_name, 
			String array_ApplicationBladeTurning, String array_ApplicationBladeTurning_name,
			@RequestParam(value="PictureBladeTurning",required=false)CommonsMultipartFile PictureBladeTurning ,
			HttpServletRequest request ) throws Exception{
		
		Map turningBlade = new HashMap();
		
		turningBlade.put("id_TurningBlade", id_TurningBlade);
		turningBlade.put("NumberTurningBlade", NumberTurningBlade);
		turningBlade.put("TypeBTADrill", TypeBTADrill);
		turningBlade.put("NameTurningBlade", NameTurningBlade);
		turningBlade.put("ISOBladeTurning", ISOBladeTurning);
		turningBlade.put("ToolCoatBladeTurning", ToolCoatBladeTurning);
		turningBlade.put("ToolMaterialBladeTurning", ToolMaterialBladeTurning);
		turningBlade.put("MachiningTypeBladeTurning", MachiningTypeBladeTurning);
		turningBlade.put("ToolBladeFeatureTurning", ToolBladeFeatureTurning);
		turningBlade.put("CompanyTurningBlade", CompanyTurningBlade);
		turningBlade.put("QianjiaoBladeTurning", QianjiaoBladeTurning);
		turningBlade.put("HoujiaoBladeTurning", HoujiaoBladeTurning);
		turningBlade.put("HoujisojiaoBladeTurning", HoujisojiaoBladeTurning);
		turningBlade.put("NoseRadiusTurning", NoseRadiusTurning);
		turningBlade.put("BreakerBladeTurning", BreakerBladeTurning);
		turningBlade.put("MateriaBladeTurning", MateriaBladeTurning);
		turningBlade.put("isPMKNS", isPMKNS);
		turningBlade.put("ISOPBladeTurning", ISOPBladeTurning);
		turningBlade.put("ISOPTextBladeTurning", ISOPTextBladeTurning);
		turningBlade.put("ISOMBladeTurning", ISOMBladeTurning);
		turningBlade.put("ISOMTextBladeTurning", ISOMTextBladeTurning);
		turningBlade.put("ISOKBladeTurning", ISOKBladeTurning);
		turningBlade.put("ISOKTextBladeTurning", ISOKTextBladeTurning);
		turningBlade.put("ISONBladeTurning", ISONBladeTurning);
		turningBlade.put("ISONTextBladeTurning", ISONTextBladeTurning);
		turningBlade.put("ISOSBladeTurning", ISOSBladeTurning);
		turningBlade.put("ISOSTextBladeTurning", ISOSTextBladeTurning);
		turningBlade.put("HolderInfo", HolderInfo);
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureBladeTurningMap = new HashMap(); 
		
		String OriginalFilename = PictureBladeTurning.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureBladeTurning/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			PictureBladeTurning.transferTo(materials_big_img_file); 
			PictureBladeTurningMap.put("url_PictureBladeTurning", "/pictureBladeTurning/" + big_url + "." + fileSuffix);
			PictureBladeTurningMap.put("id_TurningBlade", id_TurningBlade);
			array_PictureBladeTurning = array_PictureBladeTurning + "/pictureBladeTurning/" + big_url + "." + fileSuffix + ",";

		}else{

		}
	
		mv.addObject("array_PictureBladeTurning", array_PictureBladeTurning);
		mv.addObject("array_PictureDetailBladeTurning", array_PictureDetailBladeTurning);
		mv.addObject("array_InformDetailBladeTurning", array_InformDetailBladeTurning);
		mv.addObject("array_InformDetailBladeTurning_name", array_InformDetailBladeTurning_name);
		mv.addObject("array_ApplicationBladeTurning", array_ApplicationBladeTurning);
		mv.addObject("array_ApplicationBladeTurning_name", array_ApplicationBladeTurning_name);
		
		mv.addObject("turningBlade", turningBlade);
		
		mv.setViewName("/WEB-INF/tool/turningTool/turningBlade/turningBlade_edit");

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
	@RequestMapping(value="/savePictureDetailBladeTurning")
	public ModelAndView savePictureDetailBladeTurning(
			String id_TurningBlade, String NumberTurningBlade, String TypeBTADrill, String NameTurningBlade, String ISOBladeTurning, 
			String ToolCoatBladeTurning, String ToolMaterialBladeTurning, String MachiningTypeBladeTurning, String ToolBladeFeatureTurning, String CompanyTurningBlade, 
			String QianjiaoBladeTurning, String HoujiaoBladeTurning, String HoujisojiaoBladeTurning, String NoseRadiusTurning, String BreakerBladeTurning, 
			String MateriaBladeTurning, 
			String isPMKNS, 
			String ISOPBladeTurning, String ISOPTextBladeTurning, 
			String ISOMBladeTurning, String ISOMTextBladeTurning, 
			String ISOKBladeTurning, String ISOKTextBladeTurning, 
			String ISONBladeTurning, String ISONTextBladeTurning, 
			String ISOSBladeTurning, String ISOSTextBladeTurning, String HolderInfo,
			String array_PictureBladeTurning, 
			String array_PictureDetailBladeTurning, 
			String array_InformDetailBladeTurning, String array_InformDetailBladeTurning_name, 
			String array_ApplicationBladeTurning, String array_ApplicationBladeTurning_name,
			@RequestParam(value="PictureDetailBladeTurning",required=false)CommonsMultipartFile PictureDetailBladeTurning ,
			HttpServletRequest request ) throws Exception{
		
		Map turningBlade = new HashMap();
		
		turningBlade.put("id_TurningBlade", id_TurningBlade);
		turningBlade.put("NumberTurningBlade", NumberTurningBlade);
		turningBlade.put("TypeBTADrill", TypeBTADrill);
		turningBlade.put("NameTurningBlade", NameTurningBlade);
		turningBlade.put("ISOBladeTurning", ISOBladeTurning);
		turningBlade.put("ToolCoatBladeTurning", ToolCoatBladeTurning);
		turningBlade.put("ToolMaterialBladeTurning", ToolMaterialBladeTurning);
		turningBlade.put("MachiningTypeBladeTurning", MachiningTypeBladeTurning);
		turningBlade.put("ToolBladeFeatureTurning", ToolBladeFeatureTurning);
		turningBlade.put("CompanyTurningBlade", CompanyTurningBlade);
		turningBlade.put("QianjiaoBladeTurning", QianjiaoBladeTurning);
		turningBlade.put("HoujiaoBladeTurning", HoujiaoBladeTurning);
		turningBlade.put("HoujisojiaoBladeTurning", HoujisojiaoBladeTurning);
		turningBlade.put("NoseRadiusTurning", NoseRadiusTurning);
		turningBlade.put("BreakerBladeTurning", BreakerBladeTurning);
		turningBlade.put("MateriaBladeTurning", MateriaBladeTurning);
		turningBlade.put("isPMKNS", isPMKNS);
		turningBlade.put("ISOPBladeTurning", ISOPBladeTurning);
		turningBlade.put("ISOPTextBladeTurning", ISOPTextBladeTurning);
		turningBlade.put("ISOMBladeTurning", ISOMBladeTurning);
		turningBlade.put("ISOMTextBladeTurning", ISOMTextBladeTurning);
		turningBlade.put("ISOKBladeTurning", ISOKBladeTurning);
		turningBlade.put("ISOKTextBladeTurning", ISOKTextBladeTurning);
		turningBlade.put("ISONBladeTurning", ISONBladeTurning);
		turningBlade.put("ISONTextBladeTurning", ISONTextBladeTurning);
		turningBlade.put("ISOSBladeTurning", ISOSBladeTurning);
		turningBlade.put("ISOSTextBladeTurning", ISOSTextBladeTurning);
		turningBlade.put("HolderInfo", HolderInfo);
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureDetailBladeTurningMap = new HashMap(); 
		
		String OriginalFilename = PictureDetailBladeTurning.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureDetailBladeTurning/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			PictureDetailBladeTurning.transferTo(materials_big_img_file); 
			PictureDetailBladeTurningMap.put("url_PictureDetailBladeTurning", "/pictureDetailBladeTurning/" + big_url + "." + fileSuffix);
			PictureDetailBladeTurningMap.put("id_TurningBlade", id_TurningBlade);
			array_PictureDetailBladeTurning = array_PictureDetailBladeTurning + "/pictureDetailBladeTurning/" + big_url + "." + fileSuffix + ",";

		}else{

		}
	
		mv.addObject("array_PictureBladeTurning", array_PictureBladeTurning);
		mv.addObject("array_PictureDetailBladeTurning", array_PictureDetailBladeTurning);
		mv.addObject("array_InformDetailBladeTurning", array_InformDetailBladeTurning);
		mv.addObject("array_InformDetailBladeTurning_name", array_InformDetailBladeTurning_name);
		mv.addObject("array_ApplicationBladeTurning", array_ApplicationBladeTurning);
		mv.addObject("array_ApplicationBladeTurning_name", array_ApplicationBladeTurning_name);
		
		mv.addObject("turningBlade", turningBlade);
		
		mv.setViewName("/WEB-INF/tool/turningTool/turningBlade/turningBlade_edit");

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
	@RequestMapping(value="/saveApplicationBladeTurning")
	public ModelAndView saveApplicationBladeTurning(
			String id_TurningBlade, String NumberTurningBlade, String TypeBTADrill, String NameTurningBlade, String ISOBladeTurning, 
			String ToolCoatBladeTurning, String ToolMaterialBladeTurning, String MachiningTypeBladeTurning, String ToolBladeFeatureTurning, String CompanyTurningBlade, 
			String QianjiaoBladeTurning, String HoujiaoBladeTurning, String HoujisojiaoBladeTurning, String NoseRadiusTurning, String BreakerBladeTurning, 
			String MateriaBladeTurning, 
			String isPMKNS, 
			String ISOPBladeTurning, String ISOPTextBladeTurning, 
			String ISOMBladeTurning, String ISOMTextBladeTurning, 
			String ISOKBladeTurning, String ISOKTextBladeTurning, 
			String ISONBladeTurning, String ISONTextBladeTurning, 
			String ISOSBladeTurning, String ISOSTextBladeTurning, String HolderInfo,
			String array_PictureBladeTurning, 
			String array_PictureDetailBladeTurning, 
			String array_InformDetailBladeTurning, String array_InformDetailBladeTurning_name, 
			String array_ApplicationBladeTurning, String array_ApplicationBladeTurning_name,
			@RequestParam(value="ApplicationBladeTurning",required=false)CommonsMultipartFile ApplicationBladeTurning ,
			HttpServletRequest request ) throws Exception{

		Map turningBlade = new HashMap();
		
		turningBlade.put("id_TurningBlade", id_TurningBlade);
		turningBlade.put("NumberTurningBlade", NumberTurningBlade);
		turningBlade.put("TypeBTADrill", TypeBTADrill);
		turningBlade.put("NameTurningBlade", NameTurningBlade);
		turningBlade.put("ISOBladeTurning", ISOBladeTurning);
		turningBlade.put("ToolCoatBladeTurning", ToolCoatBladeTurning);
		turningBlade.put("ToolMaterialBladeTurning", ToolMaterialBladeTurning);
		turningBlade.put("MachiningTypeBladeTurning", MachiningTypeBladeTurning);
		turningBlade.put("ToolBladeFeatureTurning", ToolBladeFeatureTurning);
		turningBlade.put("CompanyTurningBlade", CompanyTurningBlade);
		turningBlade.put("QianjiaoBladeTurning", QianjiaoBladeTurning);
		turningBlade.put("HoujiaoBladeTurning", HoujiaoBladeTurning);
		turningBlade.put("HoujisojiaoBladeTurning", HoujisojiaoBladeTurning);
		turningBlade.put("NoseRadiusTurning", NoseRadiusTurning);
		turningBlade.put("BreakerBladeTurning", BreakerBladeTurning);
		turningBlade.put("MateriaBladeTurning", MateriaBladeTurning);
		turningBlade.put("isPMKNS", isPMKNS);
		turningBlade.put("ISOPBladeTurning", ISOPBladeTurning);
		turningBlade.put("ISOPTextBladeTurning", ISOPTextBladeTurning);
		turningBlade.put("ISOMBladeTurning", ISOMBladeTurning);
		turningBlade.put("ISOMTextBladeTurning", ISOMTextBladeTurning);
		turningBlade.put("ISOKBladeTurning", ISOKBladeTurning);
		turningBlade.put("ISOKTextBladeTurning", ISOKTextBladeTurning);
		turningBlade.put("ISONBladeTurning", ISONBladeTurning);
		turningBlade.put("ISONTextBladeTurning", ISONTextBladeTurning);
		turningBlade.put("ISOSBladeTurning", ISOSBladeTurning);
		turningBlade.put("ISOSTextBladeTurning", ISOSTextBladeTurning);
		turningBlade.put("HolderInfo", HolderInfo);
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map ApplicationBladeTurningMap = new HashMap(); 
		
		String OriginalFilename = ApplicationBladeTurning.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/applicationBladeTurning/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			ApplicationBladeTurning.transferTo(materials_big_img_file); 
			ApplicationBladeTurningMap.put("url_ApplicationBladeTurning", "/applicationBladeTurning/" + big_url + "." + fileSuffix);
			ApplicationBladeTurningMap.put("id_TurningBlade", id_TurningBlade);
			array_ApplicationBladeTurning = array_ApplicationBladeTurning + "/applicationBladeTurning/" + big_url + "." + fileSuffix + ",";
			array_ApplicationBladeTurning_name = array_ApplicationBladeTurning_name + OriginalFilename + ",";

		}else{

		}
	
		mv.addObject("array_PictureBladeTurning", array_PictureBladeTurning);
		mv.addObject("array_PictureDetailBladeTurning", array_PictureDetailBladeTurning);
		mv.addObject("array_InformDetailBladeTurning", array_InformDetailBladeTurning);
		mv.addObject("array_InformDetailBladeTurning_name", array_InformDetailBladeTurning_name);
		mv.addObject("array_ApplicationBladeTurning", array_ApplicationBladeTurning);
		mv.addObject("array_ApplicationBladeTurning_name", array_ApplicationBladeTurning_name);
		
		mv.addObject("turningBlade", turningBlade);
		
		mv.setViewName("/WEB-INF/tool/turningTool/turningBlade/turningBlade_edit");

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
	@RequestMapping(value="/saveInformDetailBladeTurning")
	public ModelAndView saveInformDetailBladeTurning(
			String id_TurningBlade, String NumberTurningBlade, String TypeBTADrill, String NameTurningBlade, String ISOBladeTurning, 
			String ToolCoatBladeTurning, String ToolMaterialBladeTurning, String MachiningTypeBladeTurning, String ToolBladeFeatureTurning, String CompanyTurningBlade, 
			String QianjiaoBladeTurning, String HoujiaoBladeTurning, String HoujisojiaoBladeTurning, String NoseRadiusTurning, String BreakerBladeTurning, 
			String MateriaBladeTurning, 
			String isPMKNS, 
			String ISOPBladeTurning, String ISOPTextBladeTurning, 
			String ISOMBladeTurning, String ISOMTextBladeTurning, 
			String ISOKBladeTurning, String ISOKTextBladeTurning, 
			String ISONBladeTurning, String ISONTextBladeTurning, 
			String ISOSBladeTurning, String ISOSTextBladeTurning, String HolderInfo,
			String array_PictureBladeTurning, 
			String array_PictureDetailBladeTurning, 
			String array_InformDetailBladeTurning, String array_InformDetailBladeTurning_name, 
			String array_ApplicationBladeTurning, String array_ApplicationBladeTurning_name,
			@RequestParam(value="InformDetailBladeTurning",required=false)CommonsMultipartFile InformDetailBladeTurning ,
			HttpServletRequest request ) throws Exception{

		Map turningBlade = new HashMap();
		
		turningBlade.put("id_TurningBlade", id_TurningBlade);
		turningBlade.put("NumberTurningBlade", NumberTurningBlade);
		turningBlade.put("TypeBTADrill", TypeBTADrill);
		turningBlade.put("NameTurningBlade", NameTurningBlade);
		turningBlade.put("ISOBladeTurning", ISOBladeTurning);
		turningBlade.put("ToolCoatBladeTurning", ToolCoatBladeTurning);
		turningBlade.put("ToolMaterialBladeTurning", ToolMaterialBladeTurning);
		turningBlade.put("MachiningTypeBladeTurning", MachiningTypeBladeTurning);
		turningBlade.put("ToolBladeFeatureTurning", ToolBladeFeatureTurning);
		turningBlade.put("CompanyTurningBlade", CompanyTurningBlade);
		turningBlade.put("QianjiaoBladeTurning", QianjiaoBladeTurning);
		turningBlade.put("HoujiaoBladeTurning", HoujiaoBladeTurning);
		turningBlade.put("HoujisojiaoBladeTurning", HoujisojiaoBladeTurning);
		turningBlade.put("NoseRadiusTurning", NoseRadiusTurning);
		turningBlade.put("BreakerBladeTurning", BreakerBladeTurning);
		turningBlade.put("MateriaBladeTurning", MateriaBladeTurning);
		turningBlade.put("isPMKNS", isPMKNS);
		turningBlade.put("ISOPBladeTurning", ISOPBladeTurning);
		turningBlade.put("ISOPTextBladeTurning", ISOPTextBladeTurning);
		turningBlade.put("ISOMBladeTurning", ISOMBladeTurning);
		turningBlade.put("ISOMTextBladeTurning", ISOMTextBladeTurning);
		turningBlade.put("ISOKBladeTurning", ISOKBladeTurning);
		turningBlade.put("ISOKTextBladeTurning", ISOKTextBladeTurning);
		turningBlade.put("ISONBladeTurning", ISONBladeTurning);
		turningBlade.put("ISONTextBladeTurning", ISONTextBladeTurning);
		turningBlade.put("ISOSBladeTurning", ISOSBladeTurning);
		turningBlade.put("ISOSTextBladeTurning", ISOSTextBladeTurning);
		turningBlade.put("HolderInfo", HolderInfo);
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map InformDetailBladeTurningMap = new HashMap(); 
		
		String OriginalFilename = InformDetailBladeTurning.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informDetailBladeTurning/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			InformDetailBladeTurning.transferTo(materials_big_img_file); 
			InformDetailBladeTurningMap.put("url_InformDetailBladeTurning", "/informDetailBladeTurning/" + big_url + "." + fileSuffix);
			InformDetailBladeTurningMap.put("id_TurningBlade", id_TurningBlade);
			array_InformDetailBladeTurning = array_InformDetailBladeTurning + "/informDetailBladeTurning/" + big_url + "." + fileSuffix + ",";
			array_InformDetailBladeTurning_name = array_InformDetailBladeTurning_name + OriginalFilename + ",";

		}else{

		}
	
		mv.addObject("array_PictureBladeTurning", array_PictureBladeTurning);
		mv.addObject("array_PictureDetailBladeTurning", array_PictureDetailBladeTurning);
		mv.addObject("array_InformDetailBladeTurning", array_InformDetailBladeTurning);
		mv.addObject("array_InformDetailBladeTurning_name", array_InformDetailBladeTurning_name);
		mv.addObject("array_ApplicationBladeTurning", array_ApplicationBladeTurning);
		mv.addObject("array_ApplicationBladeTurning_name", array_ApplicationBladeTurning_name);
		
		mv.addObject("turningBlade", turningBlade);
		
		mv.setViewName("/WEB-INF/tool/turningTool/turningBlade/turningBlade_edit");

		return mv;
		
	}
	
	
	
	
	/**
	 * 删除刀片数据
	 * @param id_BTADrill
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteTurningBlade")
	public String deleteTurningBlade(String id_TurningBlade) {
		Map para = new HashMap();
		para.put("id_TurningBlade", id_TurningBlade);
		try {
			//清空刀具图片路径 PictureBladeTurning
			turningBladeService.clearPictureBladeTurningByIdTurningBlade(para);
			//清空详细图片路径 PictureDetailBladeTurning
			turningBladeService.clearPictureDetailBladeTurningByIdTurningBlade(para);
			//清空应用实例路径 ApplicationBladeTurning
			turningBladeService.clearApplicationBladeTurningByIdTurningBlade(para);
			//清空详细信息路径 InformDetailBladeTurning
			turningBladeService.clearInformDetailBladeTurningByIdTurningBlade(para);
			//删除刀片数据
			turningBladeService.deleteTurningBlade(para);
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}

}
