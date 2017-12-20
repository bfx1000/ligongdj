package com.qf.toolPlan.designTurningBlade.controller;

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

import com.qf.toolPlan.designTurningBlade.service.DesignTurningBladeService;
import com.qf.util.PageData;
import com.qf.util.common.JackJson;
import com.qf.util.controller.BaseController;
import com.qf.util.file.ByteToFile;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/designTurningBladeApp")
public class DesignTurningBladeAppController extends BaseController{

	@Resource(name="designTurningBladeService")
	private DesignTurningBladeService designTurningBladeService;
	
	/**
	 * 查询刀片列表
	 * @param page
	 * @param request
	 * @return
	 */
    @ResponseBody
    @RequestMapping(value="queryDesignTurningBladeList", produces = "application/json; charset=utf-8")
	public String queryDesignTurningBladeList(int pageNo, int pageSize, 
			String DesignNumberTurningBlade, String DesignTypeBTADrill, String DesignISOBladeTurning, 
			String DesignMachiningTypeBladeTurning, String DesignCompanyTurningBlade,String DesignToolBladeFeatureTurning){
		ModelAndView mv=new ModelAndView();
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		try {
			
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("DesignNumberTurningBlade", DesignNumberTurningBlade);
			pd.put("DesignTypeBTADrill", DesignTypeBTADrill);
			pd.put("DesignISOBladeTurning", DesignISOBladeTurning);
			pd.put("DesignMachiningTypeBladeTurning", DesignMachiningTypeBladeTurning);
			pd.put("DesignCompanyTurningBlade", DesignCompanyTurningBlade);
			pd.put("DesignToolBladeFeatureTurning", DesignToolBladeFeatureTurning);
			page.setPd(pd);
			map	= designTurningBladeService.queryDesignTurningBladeList(page);//查询刀片列表
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
		para.put("DesignNumberTurningBlade", DesignNumberTurningBlade);
		para.put("DesignTypeBTADrill", DesignTypeBTADrill);
		para.put("DesignISOBladeTurning", DesignISOBladeTurning);
		para.put("DesignMachiningTypeBladeTurning", DesignMachiningTypeBladeTurning);
		para.put("DesignCompanyTurningBlade", DesignCompanyTurningBlade);
		para.put("DesignToolBladeFeatureTurning", DesignToolBladeFeatureTurning);
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
    @RequestMapping(value="/goAddDesignTurningBlade", produces = "application/json; charset=utf-8")
	public String goAddTurningBlade(String id)throws Exception{
    	String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
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
			
			resultmap.put("result", "1");
			resultmap.put("designturningBlade", designturningBlade);
			
			resultmap.put("array_PictureDesignTurningBlade", array_PictureDesignTurningBlade);
			resultmap.put("array_InformDetailDesignTurningBlade", array_InformDetailDesignTurningBlade);
			resultmap.put("array_InformDetailDesignTurningBlade_name", array_InformDetailDesignTurningBlade_name);
			resultmap.put("array_PartDesignTurningBlade", array_PartDesignTurningBlade);
			resultmap.put("array_PartDesignTurningBlade_name", array_PartDesignTurningBlade_name);
		}
		
		
		//查询ISO基准刀片 json
		List<String> ISOList = designTurningBladeService.queryISOList();
		resultmap.put("ISOList", ISOList);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
    }
    
    
    
    
    
    /**
     * 添加刀片信息
     * @return
     */
    @ResponseBody
	@RequestMapping(value="/saveDesignTurningBlade", produces = "application/json; charset=utf-8")
	public String saveDesignTurningBlade(String user_id, 
			int id_DesignTurningBlade, String DesignNumberTurningBlade, String DesignNameTurningBlade, String DesignTypeBTADrill, String DesignISOBladeTurning, 
			String DesignMachiningTypeBladeTurning, String DesignCompanyTurningBlade, String DesignToolBladeFeatureTurning, String DesignQianjiaoBladeTurning, String DesignHoujiaoBladeTurning, 
			String DesignRenqingjiaoBladeTurning, String DesignNoseRadiusTurning, String DesignBreakerBladeTurning, 
			String array_PictureDesignTurningBlade, 
			String array_InformDetailDesignTurningBlade, String array_InformDetailDesignTurningBlade_name, 
			String array_PartDesignTurningBlade, String array_PartDesignTurningBlade_name) {
		
    	String json  = "";  
		Map resultmap = new HashMap();
		
		Map para = new HashMap();
		
		para.put("id_DesignTurningBlade", id_DesignTurningBlade);
		para.put("DesignNumberTurningBlade", DesignNumberTurningBlade);
		para.put("DesignNameTurningBlade", DesignNameTurningBlade);
		para.put("DesignTypeBTADrill", DesignTypeBTADrill);
		para.put("DesignISOBladeTurning", DesignISOBladeTurning);
		para.put("DesignMachiningTypeBladeTurning", DesignMachiningTypeBladeTurning);
		para.put("DesignCompanyTurningBlade", DesignCompanyTurningBlade);
		para.put("DesignToolBladeFeatureTurning", DesignToolBladeFeatureTurning);
		
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
		para.put("user_id", user_id);
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
	@RequestMapping(value="/savePictureDesignTurningBlade", produces = "application/json; charset=utf-8")
	public String savePictureDesignTurningBlade(
			String array_PictureDesignTurningBlade, 
			String array_InformDetailDesignTurningBlade, String array_InformDetailDesignTurningBlade_name, 
			String array_PartDesignTurningBlade, String array_PartDesignTurningBlade_name,
			String PictureDesignTurningBlade ,String fileSuffix, String filename
			) throws Exception{
		
    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureDesignTurningBladeMap = new HashMap(); 
		
		
		if(PictureDesignTurningBlade != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureDesignTurningBlade/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/pictureDesignTurningBlade/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PictureDesignTurningBlade,  filepath2);
			array_PictureDesignTurningBlade = array_PictureDesignTurningBlade + "/pictureDesignTurningBlade/" + big_url + "." + fileSuffix + ",";
		}
		//查询ISO基准刀片 json
		List<String> ISOList = designTurningBladeService.queryISOList();
		resultmap.put("ISOList", ISOList);
		resultmap.put("result", "1");
		resultmap.put("array_PictureDesignTurningBlade", array_PictureDesignTurningBlade);
		resultmap.put("array_InformDetailDesignTurningBlade", array_InformDetailDesignTurningBlade);
		resultmap.put("array_InformDetailDesignTurningBlade_name", array_InformDetailDesignTurningBlade_name);
		resultmap.put("array_PartDesignTurningBlade", array_PartDesignTurningBlade);
		resultmap.put("array_PartDesignTurningBlade_name", array_PartDesignTurningBlade_name);
		
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
	@RequestMapping(value="/savePartDesignTurningBlade", produces = "application/json; charset=utf-8")
	public String savePartDesignTurningBlade(
			String array_PictureDesignTurningBlade, 
			String array_InformDetailDesignTurningBlade, String array_InformDetailDesignTurningBlade_name, 
			String array_PartDesignTurningBlade, String array_PartDesignTurningBlade_name,
			String PartDesignTurningBlade ,String fileSuffix, String filename
			) throws Exception{

    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		
		ModelAndView mv = this.getModelAndView();
		Map PartDesignTurningBladeMap = new HashMap(); 
		
		if(PartDesignTurningBlade != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/partDesignTurningBlade/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/partDesignTurningBlade/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PartDesignTurningBlade,  filepath2);
			array_PartDesignTurningBlade = array_PartDesignTurningBlade + "/partDesignTurningBlade/" + big_url + "." + fileSuffix + ",";
			array_PartDesignTurningBlade_name = array_PartDesignTurningBlade_name + filename + ",";
		}
		//查询ISO基准刀片 json
		List<String> ISOList = designTurningBladeService.queryISOList();
		resultmap.put("ISOList", ISOList);
		resultmap.put("result", "1");
		resultmap.put("array_PictureDesignTurningBlade", array_PictureDesignTurningBlade);
		resultmap.put("array_InformDetailDesignTurningBlade", array_InformDetailDesignTurningBlade);
		resultmap.put("array_InformDetailDesignTurningBlade_name", array_InformDetailDesignTurningBlade_name);
		resultmap.put("array_PartDesignTurningBlade", array_PartDesignTurningBlade);
		resultmap.put("array_PartDesignTurningBlade_name", array_PartDesignTurningBlade_name);
		
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
	@RequestMapping(value="/saveInformDetailDesignTurningBlade", produces = "application/json; charset=utf-8")
	public String saveInformDetailDesignTurningBlade(
			String array_PictureDesignTurningBlade, 
			String array_InformDetailDesignTurningBlade, String array_InformDetailDesignTurningBlade_name, 
			String array_PartDesignTurningBlade, String array_PartDesignTurningBlade_name,
			String InformDetailDesignTurningBlade ,String fileSuffix, String filename
			 ) throws Exception{

    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		
		Map InformDetailDesignTurningBladeMap = new HashMap(); 
		
		if(InformDetailDesignTurningBlade != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informDetailDesignTurningBlade/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/informDetailDesignTurningBlade/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(InformDetailDesignTurningBlade,  filepath2);
			array_InformDetailDesignTurningBlade = array_InformDetailDesignTurningBlade + "/informDetailDesignTurningBlade/" + big_url + "." + fileSuffix + ",";
			array_InformDetailDesignTurningBlade_name = array_InformDetailDesignTurningBlade_name + filename + ",";
		}
		//查询ISO基准刀片 json
		List<String> ISOList = designTurningBladeService.queryISOList();
		resultmap.put("ISOList", ISOList);
		resultmap.put("result", "1");
		resultmap.put("array_PictureDesignTurningBlade", array_PictureDesignTurningBlade);
		resultmap.put("array_InformDetailDesignTurningBlade", array_InformDetailDesignTurningBlade);
		resultmap.put("array_InformDetailDesignTurningBlade_name", array_InformDetailDesignTurningBlade_name);
		resultmap.put("array_PartDesignTurningBlade", array_PartDesignTurningBlade);
		resultmap.put("array_PartDesignTurningBlade_name", array_PartDesignTurningBlade_name);
		
		json = JackJson.fromObjectToJson(resultmap);

		return json;
	}
	
    
    
    /**
	 * 删除刀片数据
	 * @param id_BTADrill
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteDesignTurningBlade", produces = "application/json; charset=utf-8")
	public String deleteDesignTurningBlade(String id_DesignTurningBlade) {
		String json  = "";  
		Map resultmap = new HashMap();
		
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
		}catch (Exception e) {
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
