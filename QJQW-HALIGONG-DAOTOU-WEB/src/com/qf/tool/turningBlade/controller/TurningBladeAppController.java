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
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.qf.tool.turningBlade.service.TurningBladeService;
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
@RequestMapping("/turningBladeApp")
public class TurningBladeAppController  extends BaseController{
	
    @Resource(name="turningBladeService")
    private TurningBladeService turningBladeService;  
    
    @Resource(name="turningHolderService")
    private TurningHolderService turningHolderService;  

    /**
	 * 查询刀片列表
	 * @param page
	 * @param request
	 * @return
	 */
    @ResponseBody
    @RequestMapping(value="queryTurningBladeList", produces = "application/json; charset=utf-8")
	public String queryTurningBladeList(int pageNo, int pageSize, 
			String NumberTurningBlade, String TypeBTADrill, String ISOBladeTurning, String ToolCoatBladeTurning, String ToolMaterialBladeTurning,
			String MachiningTypeBladeTurning, String ToolBladeFeatureTurning,	String CompanyTurningBlade, String MateriaBladeTurning){
		ModelAndView mv=new ModelAndView();
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		try {
			
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("NumberTurningBlade", NumberTurningBlade);
			pd.put("TypeBTADrill", TypeBTADrill);
			pd.put("ISOBladeTurning", ISOBladeTurning);
			pd.put("ISOBladeTurning", ISOBladeTurning);
			pd.put("ToolCoatBladeTurning", ToolCoatBladeTurning);
			pd.put("ToolMaterialBladeTurning", ToolMaterialBladeTurning);
			pd.put("MachiningTypeBladeTurning", MachiningTypeBladeTurning);
			pd.put("ToolBladeFeatureTurning", ToolBladeFeatureTurning);
			pd.put("CompanyTurningBlade", CompanyTurningBlade);
			pd.put("MateriaBladeTurning", MateriaBladeTurning);
			page.setPd(pd);
			
			map	= turningBladeService.queryTurningBladeList(page);//查询刀片列表
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			System.out.println(list);
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
		para.put("NumberTurningBlade", NumberTurningBlade);
		para.put("TypeBTADrill", TypeBTADrill);
		para.put("ISOBladeTurning", ISOBladeTurning);
		para.put("ISOBladeTurning", ISOBladeTurning);
		para.put("ToolCoatBladeTurning", ToolCoatBladeTurning);
		para.put("ToolMaterialBladeTurning", ToolMaterialBladeTurning);
		para.put("MachiningTypeBladeTurning", MachiningTypeBladeTurning);
		para.put("ToolBladeFeatureTurning", ToolBladeFeatureTurning);
		para.put("CompanyTurningBlade", CompanyTurningBlade);
		para.put("MateriaBladeTurning", MateriaBladeTurning);
		resultmap.put("para", para);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
   
    
	
	
    /**
     * 查询刀片详细信息
     * @param id
     * @param turn_url
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value="/goAddTurningBlade", produces = "application/json; charset=utf-8")
	public String goAddTurningBlade(String id)throws Exception{
    	String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		Map para = new HashMap();
		para.put("id_TurningBlade", id);
		Map turningBlade = turningBladeService.queryTurningBladeById(para);//查询刀片详细信息
		if(turningBlade != null){
			String isPMKNS = (String) turningBlade.get("isPMKNS");
			if("P".equals(isPMKNS)){
				turningBlade.put("ISOTextBTADrill", turningBlade.get("ISOPTextBladeTurning"));
			}else if("M".equals(isPMKNS)){
				turningBlade.put("ISOTextBTADrill", turningBlade.get("ISOMTextBladeTurning"));
			}else if("K".equals(isPMKNS)){
				turningBlade.put("ISOTextBTADrill", turningBlade.get("ISOKTextBladeTurning"));
			}else if("N".equals(isPMKNS)){
				turningBlade.put("ISOTextBTADrill", turningBlade.get("ISONTextBladeTurning"));
			}else if("S".equals(isPMKNS)){
				turningBlade.put("ISOTextBTADrill", turningBlade.get("ISOSTextBladeTurning"));
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
			
			resultmap.put("result", "1");
			resultmap.put("turningBlade", turningBlade);
			
			resultmap.put("array_PictureBladeTurning", array_PictureBladeTurning);
			resultmap.put("array_PictureDetailBladeTurning", array_PictureDetailBladeTurning);
			resultmap.put("array_InformDetailBladeTurning", array_InformDetailBladeTurning);
			resultmap.put("array_InformDetailBladeTurning_name", array_InformDetailBladeTurning_name);
			resultmap.put("array_ApplicationBladeTurning", array_ApplicationBladeTurning);
			resultmap.put("array_ApplicationBladeTurning_name", array_ApplicationBladeTurning_name);
		}
		
		
		//查询ISO基准刀片 json
		List<String> ISOList = turningHolderService.queryISOList();
		resultmap.put("ISOList", ISOList);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
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
	@RequestMapping(value="/saveTurningBlade", produces = "application/json; charset=utf-8")
	public String saveTurningBlade(String user_id, 
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
		
    	String json  = "";  
		Map resultmap = new HashMap();
		
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


		para.put("add_time", System.currentTimeMillis() / 1000);
		para.put("user_id", user_id);
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
	@RequestMapping(value="/savePictureBladeTurning", produces = "application/json; charset=utf-8")
	public String savePictureBladeTurning(
			String array_PictureBladeTurning, 
			String array_PictureDetailBladeTurning, 
			String array_InformDetailBladeTurning, String array_InformDetailBladeTurning_name, 
			String array_ApplicationBladeTurning, String array_ApplicationBladeTurning_name,
			String PictureBladeTurning ,String fileSuffix, String filename
			) throws Exception{
		
    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureBladeTurningMap = new HashMap(); 
		
		
		if(PictureBladeTurning != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureBladeTurning/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/pictureBladeTurning/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PictureBladeTurning,  filepath2);
			array_PictureBladeTurning = array_PictureBladeTurning + "/pictureBladeTurning/" + big_url + "." + fileSuffix + ",";
		}
	
		resultmap.put("result", "1");
		resultmap.put("array_PictureBladeTurning", array_PictureBladeTurning);
		resultmap.put("array_PictureDetailBladeTurning", array_PictureDetailBladeTurning);
		resultmap.put("array_InformDetailBladeTurning", array_InformDetailBladeTurning);
		resultmap.put("array_InformDetailBladeTurning_name", array_InformDetailBladeTurning_name);
		resultmap.put("array_ApplicationBladeTurning", array_ApplicationBladeTurning);
		resultmap.put("array_ApplicationBladeTurning_name", array_ApplicationBladeTurning_name);
		
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
	@RequestMapping(value="/savePictureDetailBladeTurning", produces = "application/json; charset=utf-8")
	public String savePictureDetailBladeTurning(
			String array_PictureBladeTurning, 
			String array_PictureDetailBladeTurning, 
			String array_InformDetailBladeTurning, String array_InformDetailBladeTurning_name, 
			String array_ApplicationBladeTurning, String array_ApplicationBladeTurning_name,
			String PictureDetailBladeTurning ,String fileSuffix, String filename
			) throws Exception{
		
    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
    	Map resultmap = new HashMap();
    	
		ModelAndView mv = this.getModelAndView();
		Map PictureDetailBladeTurningMap = new HashMap(); 
		
		
		if(PictureDetailBladeTurning != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureDetailBladeTurning/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/pictureDetailBladeTurning/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PictureDetailBladeTurning,  filepath2);
			array_PictureDetailBladeTurning = array_PictureDetailBladeTurning + "/pictureDetailBladeTurning/" + big_url + "." + fileSuffix + ",";
		}
		
		resultmap.put("result", "1");
		resultmap.put("array_PictureBladeTurning", array_PictureBladeTurning);
		resultmap.put("array_PictureDetailBladeTurning", array_PictureDetailBladeTurning);
		resultmap.put("array_InformDetailBladeTurning", array_InformDetailBladeTurning);
		resultmap.put("array_InformDetailBladeTurning_name", array_InformDetailBladeTurning_name);
		resultmap.put("array_ApplicationBladeTurning", array_ApplicationBladeTurning);
		resultmap.put("array_ApplicationBladeTurning_name", array_ApplicationBladeTurning_name);
		
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
	@RequestMapping(value="/saveApplicationBladeTurning", produces = "application/json; charset=utf-8")
	public String saveApplicationBladeTurning(
			String array_PictureBladeTurning, 
			String array_PictureDetailBladeTurning, 
			String array_InformDetailBladeTurning, String array_InformDetailBladeTurning_name, 
			String array_ApplicationBladeTurning, String array_ApplicationBladeTurning_name,
			String ApplicationBladeTurning ,String fileSuffix, String filename
			) throws Exception{

    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		
		ModelAndView mv = this.getModelAndView();
		Map ApplicationBladeTurningMap = new HashMap(); 
		
		if(ApplicationBladeTurning != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/applicationBladeTurning/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/applicationBladeTurning/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(ApplicationBladeTurning,  filepath2);
			array_ApplicationBladeTurning = array_ApplicationBladeTurning + "/applicationBladeTurning/" + big_url + "." + fileSuffix + ",";
			array_ApplicationBladeTurning_name = array_ApplicationBladeTurning_name + filename + ",";
		}
		
		resultmap.put("result", "1");
		resultmap.put("array_PictureBladeTurning", array_PictureBladeTurning);
		resultmap.put("array_PictureDetailBladeTurning", array_PictureDetailBladeTurning);
		resultmap.put("array_InformDetailBladeTurning", array_InformDetailBladeTurning);
		resultmap.put("array_InformDetailBladeTurning_name", array_InformDetailBladeTurning_name);
		resultmap.put("array_ApplicationBladeTurning", array_ApplicationBladeTurning);
		resultmap.put("array_ApplicationBladeTurning_name", array_ApplicationBladeTurning_name);
		
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
	@RequestMapping(value="/saveInformDetailBladeTurning", produces = "application/json; charset=utf-8")
	public String saveInformDetailBladeTurning(
			String array_PictureBladeTurning, 
			String array_PictureDetailBladeTurning, 
			String array_InformDetailBladeTurning, String array_InformDetailBladeTurning_name, 
			String array_ApplicationBladeTurning, String array_ApplicationBladeTurning_name,
			String InformDetailBladeTurning ,String fileSuffix, String filename
			 ) throws Exception{

    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		
		Map InformDetailBladeTurningMap = new HashMap(); 
		
		if(InformDetailBladeTurning != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informDetailBladeTurning/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/informDetailBladeTurning/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(InformDetailBladeTurning,  filepath2);
			array_InformDetailBladeTurning = array_InformDetailBladeTurning + "/informDetailBladeTurning/" + big_url + "." + fileSuffix + ",";
			array_InformDetailBladeTurning_name = array_InformDetailBladeTurning_name + filename + ",";
		}
		
		resultmap.put("result", "1");
		resultmap.put("array_PictureBladeTurning", array_PictureBladeTurning);
		resultmap.put("array_PictureDetailBladeTurning", array_PictureDetailBladeTurning);
		resultmap.put("array_InformDetailBladeTurning", array_InformDetailBladeTurning);
		resultmap.put("array_InformDetailBladeTurning_name", array_InformDetailBladeTurning_name);
		resultmap.put("array_ApplicationBladeTurning", array_ApplicationBladeTurning);
		resultmap.put("array_ApplicationBladeTurning_name", array_ApplicationBladeTurning_name);
		
		json = JackJson.fromObjectToJson(resultmap);

		return json;
	}
	
    
    
    /**
	 * 删除刀片数据
	 * @param id_BTADrill
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteTurningBlade", produces = "application/json; charset=utf-8")
	public String deleteTurningBlade(String id_TurningBlade) {
		String json  = "";  
		Map resultmap = new HashMap();
		
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
