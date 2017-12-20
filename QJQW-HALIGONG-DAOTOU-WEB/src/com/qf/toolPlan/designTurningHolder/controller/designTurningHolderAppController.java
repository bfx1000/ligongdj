package com.qf.toolPlan.designTurningHolder.controller;

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
import com.qf.toolPlan.designTurningHolder.service.designTurningHolderService;
import com.qf.util.PageData;
import com.qf.util.common.JackJson;
import com.qf.util.controller.BaseController;
import com.qf.util.file.ByteToFile;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/designTurningHolderApp")
public class designTurningHolderAppController extends BaseController{
	
	@Resource(name="designTurningHolderService")
    private designTurningHolderService designTurningHolderService; 
	
	@Resource(name="designTurningBladeService")
	private DesignTurningBladeService designTurningBladeService;
	
	@ResponseBody
	@RequestMapping(value = "queryDesignTurningHolderList", produces = "application/json; charset=utf-8")
	public String queryDesignTurningHolderList(int pageNo, int pageSize, 
			String DesignNumberTurningHolder, String DesignNameTurningHolder, String DesignTypeTurningHolder, 
			String DesignISOBladeTurning, String DesignBladecategoryTurningHolder,String DesignEdgeAngleTurningHolder,
			String DesignCompanyTurningHolder){
		
		ModelAndView mv=new ModelAndView();
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
		try {
			
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();
			
			pd.put("DesignNumberTurningHolder", DesignNumberTurningHolder);
			pd.put("DesignNameTurningHolder", DesignNameTurningHolder);
			pd.put("DesignTypeTurningHolder", DesignTypeTurningHolder);
			pd.put("DesignISOBladeTurning", DesignISOBladeTurning);
			pd.put("DesignBladecategoryTurningHolder", DesignBladecategoryTurningHolder);
			pd.put("DesignEdgeAngleTurningHolder", DesignEdgeAngleTurningHolder);
			pd.put("DesignCompanyTurningHolder", DesignCompanyTurningHolder);
			page.setPd(pd);
			
			map	= designTurningHolderService.queryDesignTurningHolderList(page);//查询车刀数据-刀柄列表
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
				Map pageMap = new HashMap();
				int pageCount = page.getPageCount();
				pageMap.put("pageCount", pageCount);
				resultmap.put("page", pageMap);
			 }else{
				Map pageMap = new HashMap();
				pageMap.put("pageCount", 0);
				resultmap.put("page", pageMap);
			}
			List<Map> categoryDesignTurningHolder = designTurningHolderService.queryCategoryDesignTurningHolderList();
			resultmap.put("categoryDesignTurningHolder", categoryDesignTurningHolder);
			resultmap.put("result", "1");
			resultmap.put("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			resultmap.put("result", "0");
		}
		Map para = new HashMap();
		para.put("DesignNumberTurningHolder", DesignNumberTurningHolder);
		para.put("DesignNameTurningHolder", DesignNameTurningHolder);
		para.put("DesignTypeTurningHolder", DesignTypeTurningHolder);
		para.put("DesignISOBladeTurning", DesignISOBladeTurning);
		para.put("DesignBladecategoryTurningHolder", DesignBladecategoryTurningHolder);
		para.put("DesignEdgeAngleTurningHolder", DesignEdgeAngleTurningHolder);
		para.put("DesignCompanyTurningHolder", DesignCompanyTurningHolder);
		resultmap.put("para", para);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}
   
    
	
	
    /**
     * 查询刀片详细信息
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/goAddDesignTurningHolder", produces = "application/json; charset=utf-8")
	public String goAddDesignTurningHolder(String id)throws Exception{
    	String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		
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
			
			resultmap.put("result", "1");
			resultmap.put("designturningHolder", designturningHolder);
			
			resultmap.put("array_PictureDesignTurningHolder", array_PictureDesignTurningHolder);
			resultmap.put("array_PartDesignTurningHolder", array_PartDesignTurningHolder);
			resultmap.put("array_PartDesignTurningHolder_name", array_PartDesignTurningHolder_name);
			resultmap.put("array_InformDetailDesignTurningHolder", array_InformDetailDesignTurningHolder);
			resultmap.put("array_InformDetailDesignTurningHolder_name", array_InformDetailDesignTurningHolder_name);
		}
		List<Map> categoryDesignTurningHolder = designTurningHolderService.queryCategoryDesignTurningHolderList();
		resultmap.put("categoryDesignTurningHolder", categoryDesignTurningHolder);
		//查询ISO基准刀片 json
		List<String> ISOList = designTurningHolderService.queryISOList();
		resultmap.put("ISOList", ISOList);
		
		json = JackJson.fromObjectToJson(resultmap);
		return json;
    }
    
    
    
    
    
    /**
     * 添加刀片信息
     * @return
     */
    @ResponseBody
	@RequestMapping(value="/saveDesignTurningHolder", produces = "application/json; charset=utf-8")
	public String saveDesignTurningHolder(String user_id, 
			int id_DesignTurningHolder, 
			String array_PictureDesignTurningHolder, 
			String array_PartDesignTurningHolder, String array_PartDesignTurningHolder_name,
			String array_InformDetailDesignTurningHolder, String array_InformDetailDesignTurningHolder_name, 
			String DesignNumberTurningHolder, String DesignNameTurningHolder, String DesignTypeTurningHolder, 
			String DesignISOBladeTurning, String DesignBladecategoryTurningHolder, String DesignEdgeAngleTurningHolder, 
			String DesignFeatureTurningHolder, String DesignCompanyTurningHolder, String DesignTypeCustomBlade) {
		
    	String json  = "";  
		Map resultmap = new HashMap();
		
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
		para.put("user_id", user_id);
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
	@RequestMapping(value="/savePictureDesignTurningHolder", produces = "application/json; charset=utf-8")
	public String savePictureDesignTurningHolder(
			String array_PictureDesignTurningHolder, 
			String array_PartDesignTurningHolder, String array_PartDesignTurningHolder_name,
			String array_InformDetailDesignTurningHolder, String array_InformDetailDesignTurningHolder_name, 
			String PictureDesignTurningHolder ,String fileSuffix, String filename
			) throws Exception{
		
    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		
		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureDesignTurningHolderMap = new HashMap(); 
		
		
		if(PictureDesignTurningHolder != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureDesignTurningHolder/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/pictureDesignTurningHolder/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PictureDesignTurningHolder,  filepath2);
			array_PictureDesignTurningHolder = array_PictureDesignTurningHolder + "/pictureDesignTurningHolder/" + big_url + "." + fileSuffix + ",";
		}
		//查询ISO基准刀片 json
		List<String> ISOList = designTurningHolderService.queryISOList();
		resultmap.put("ISOList", ISOList);
		List<Map> categoryDesignTurningHolder = designTurningHolderService.queryCategoryDesignTurningHolderList();
		resultmap.put("categoryDesignTurningHolder", categoryDesignTurningHolder);
		resultmap.put("result", "1");
		resultmap.put("array_PictureDesignTurningHolder", array_PictureDesignTurningHolder);
		resultmap.put("array_PartDesignTurningHolder", array_PartDesignTurningHolder);
		resultmap.put("array_PartDesignTurningHolder_name", array_PartDesignTurningHolder_name);
		resultmap.put("array_InformDetailDesignTurningHolder", array_InformDetailDesignTurningHolder);
		resultmap.put("array_InformDetailDesignTurningHolder_name", array_InformDetailDesignTurningHolder_name);
		
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
	@RequestMapping(value="/savePartDesignTurningHolder", produces = "application/json; charset=utf-8")
	public String savePartDesignTurningHolder(
			String array_PictureDesignTurningHolder, 
			String array_PartDesignTurningHolder, String array_PartDesignTurningHolder_name,
			String array_InformDetailDesignTurningHolder, String array_InformDetailDesignTurningHolder_name, 
			String PartDesignTurningHolder ,String fileSuffix, String filename
			) throws Exception{

    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		
		ModelAndView mv = this.getModelAndView();
		Map PartDesignTurningHolderMap = new HashMap(); 
		
		if(PartDesignTurningHolder != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/partDesignTurningHolder/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/partDesignTurningHolder/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PartDesignTurningHolder,  filepath2);
			array_PartDesignTurningHolder = array_PartDesignTurningHolder + "/partDesignTurningHolder/" + big_url + "." + fileSuffix + ",";
			array_PartDesignTurningHolder_name = array_PartDesignTurningHolder_name + filename + ",";
		}
		//查询ISO基准刀片 json
		List<String> ISOList = designTurningHolderService.queryISOList();
		resultmap.put("ISOList", ISOList);
		List<Map> categoryDesignTurningHolder = designTurningHolderService.queryCategoryDesignTurningHolderList();
		resultmap.put("categoryDesignTurningHolder", categoryDesignTurningHolder);
		resultmap.put("result", "1");
		resultmap.put("array_PictureDesignTurningHolder", array_PictureDesignTurningHolder);
		resultmap.put("array_PartDesignTurningHolder", array_PartDesignTurningHolder);
		resultmap.put("array_PartDesignTurningHolder_name", array_PartDesignTurningHolder_name);
		resultmap.put("array_InformDetailDesignTurningHolder", array_InformDetailDesignTurningHolder);
		resultmap.put("array_InformDetailDesignTurningHolder_name", array_InformDetailDesignTurningHolder_name);
		
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
	@RequestMapping(value="/saveInformDetailDesignTurningHolder", produces = "application/json; charset=utf-8")
	public String saveInformDetailDesignTurningHolder(
			String array_PictureDesignTurningHolder, 
			String array_PartDesignTurningHolder, String array_PartDesignTurningHolder_name,
			String array_InformDetailDesignTurningHolder, String array_InformDetailDesignTurningHolder_name, 
			String InformDetailDesignTurningHolder ,String fileSuffix, String filename
			 ) throws Exception{

    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();   

    	String json  = "";  
		Map resultmap = new HashMap();
		
		Map InformDetailDesignTurningHolderMap = new HashMap(); 
		
		if(InformDetailDesignTurningHolder != null){
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informDetailDesignTurningHolder/");
			String fileName =  big_url + "." + fileSuffix;
			String filepath2 =  request.getSession().getServletContext().getRealPath("/goods/informDetailDesignTurningHolder/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(InformDetailDesignTurningHolder,  filepath2);
			array_InformDetailDesignTurningHolder = array_InformDetailDesignTurningHolder + "/informDetailDesignTurningHolder/" + big_url + "." + fileSuffix + ",";
			array_InformDetailDesignTurningHolder_name = array_InformDetailDesignTurningHolder_name + filename + ",";
		}
		//查询ISO基准刀片 json
		List<String> ISOList = designTurningHolderService.queryISOList();
		resultmap.put("ISOList", ISOList);
		List<Map> categoryDesignTurningHolder = designTurningHolderService.queryCategoryDesignTurningHolderList();
		resultmap.put("categoryDesignTurningHolder", categoryDesignTurningHolder);
		resultmap.put("result", "1");
		resultmap.put("array_PictureDesignTurningHolder", array_PictureDesignTurningHolder);
		resultmap.put("array_PartDesignTurningHolder", array_PartDesignTurningHolder);
		resultmap.put("array_PartDesignTurningHolder_name", array_PartDesignTurningHolder_name);
		resultmap.put("array_InformDetailDesignTurningHolder", array_InformDetailDesignTurningHolder);
		resultmap.put("array_InformDetailDesignTurningHolder_name", array_InformDetailDesignTurningHolder_name);
		
		json = JackJson.fromObjectToJson(resultmap);

		return json;
	}
	
    
    
    /**
	 * 删除刀片数据
	 * @param id_BTADrill
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteDesignTurningHolderList", produces = "application/json; charset=utf-8")
	public String deleteDesignTurningHolderList(String id_DesignTurningHolder) {
		String json  = "";  
		Map resultmap = new HashMap();
		
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
		
	@ResponseBody
	@RequestMapping(value = "/toTurningBlade", produces = "application/json; charset=utf-8")
	public String toTurningBlade(int pageNo, int pageSize, String id,
			String DesignNumberTurningBlade, String DesignTypeBTADrill, String DesignISOBladeTurning, 
			String DesignMachiningTypeBladeTurning, String DesignCompanyTurningBlade,String DesignToolBladeFeatureTurning){
		ModelAndView mv=new ModelAndView();
		
		String json  = "";  
		Map resultmap = new HashMap();
		Map map	= null;
		String TurningHolderId = id; 
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
			resultmap.put("TurningHolderId", TurningHolderId);
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
	
	
	
	
	
	
	
	
	
	
}
