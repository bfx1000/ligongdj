package com.qf.toolPlan.designToolBTAdrill.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.qf.toolPlan.designToolBTAdrill.service.DesignToolBTAdrillService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.common.JackJson;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/designToolBTAdrill")
public class DesignToolBTAdrillController extends BaseController{
	
	
	@Resource(name = "designToolBTAdrillService")
	private DesignToolBTAdrillService designToolBTAdrillService;
	
	
	@RequestMapping("queryDesignToolBTAdrillList")
	public ModelAndView queryDesignToolBTAdrillList(Page page, HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		
		try {
			
			pd = this.getPageData();
			
			page.setPd(pd);
			Map map	= designToolBTAdrillService.queryDesignToolBTAdrillList(page);//查询刀片列表
			page = (Page)map.get("page");
			List<Map> list = (List<Map>)map.get("list");
			if(list != null && list.size() > 0){
				for(int i = 0; i < list.size(); i++){
					Map designToolBTAdrill = list.get(i);
					int id_DesignToolBTAdrill = (int) designToolBTAdrill.get("id_DesignToolBTAdrill");
					Map P = JackJson.fromJsonToMap((String)designToolBTAdrill.get("P"));
					Map C = JackJson.fromJsonToMap((String)designToolBTAdrill.get("C"));
					Map ZI = JackJson.fromJsonToMap((String)designToolBTAdrill.get("ZI"));
					Map One = JackJson.fromJsonToMap((String)designToolBTAdrill.get("One"));
					Map Two = JackJson.fromJsonToMap((String)designToolBTAdrill.get("Two"));
					Map Body = new HashMap();
					Map S = new HashMap();
					
					Map para = new HashMap();
					para.put("id_DesignToolBTAdrill", id_DesignToolBTAdrill);
					
					//查询刀具图片列表 
					List<Map> pictureDesignToolBTAdrillList = designToolBTAdrillService.queryPictureDesignToolBTAdrillList(para);
					//查询详细信息列表 
					List<Map> informDetailDesignToolBTAdrillList = designToolBTAdrillService.queryInformDetailDesignToolBTAdrillList(para);
					//查询part
					List<Map> partDesignToolBTAdrillList = designToolBTAdrillService.queryPartDesignToolBTAdrillList(para);
					//查询刀片的part文件（查询出该ID所有，然后在分别给各种型号的刀片Map）
					List<Map> partAll = designToolBTAdrillService.queryPartAllList(para);
					List<Map> pPartList = new ArrayList<Map>();
					List<Map> cPartList = new ArrayList<Map>();
					List<Map> ziPartList = new ArrayList<Map>();
					List<Map> onePartList = new ArrayList<Map>();
					List<Map> twoPartList = new ArrayList<Map>();
					List<Map> bodyPartList = new ArrayList<Map>();
					List<Map> sPartList = new ArrayList<Map>();
					for(int j = 0;j<partAll.size();j++){
						Map partMap = partAll.get(j);
						if("P".equals(partMap.get("ascription"))){
							pPartList.add(partMap);
						}
						if(partMap.get("ascription").equals("C")){
							cPartList.add(partMap);
						}
						if(partMap.get("ascription").equals("ZI")){
							ziPartList.add(partMap);
						}
						if(partMap.get("ascription").equals("One")){
							onePartList.add(partMap);
						}
						if(partMap.get("ascription").equals("Two")){
							twoPartList.add(partMap);
						}
						if(partMap.get("ascription").equals("Body")){
							bodyPartList.add(partMap);
						}
						if(partMap.get("ascription").equals("S")){
							sPartList.add(partMap);
						}
					}
					P.put("pPart", pPartList);
					System.out.println(P);
					C.put("cPart", cPartList);
					ZI.put("ziPart", ziPartList);
					One.put("onePart", onePartList);
					Two.put("twoPart", twoPartList);
					Body.put("bodyPart", bodyPartList);
					S.put("sPart", sPartList);
					designToolBTAdrill.put("pictureDesignToolBTAdrillList", pictureDesignToolBTAdrillList);
					designToolBTAdrill.put("informDetailDesignToolBTAdrillList", informDetailDesignToolBTAdrillList);
					designToolBTAdrill.put("partDesignToolBTAdrillList", partDesignToolBTAdrillList);
					designToolBTAdrill.put("P", P);
					designToolBTAdrill.put("C", C);
					designToolBTAdrill.put("ZI", ZI);
					designToolBTAdrill.put("One", One);
					designToolBTAdrill.put("Two", Two);
					designToolBTAdrill.put("Body", Body);
					designToolBTAdrill.put("S", S);
					list.set(i, designToolBTAdrill);
				}
			}
			mv.addObject("designToolBTAdrill", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/toolPlan/designTurningTool/designToolBTAdrill/designToolBTAdrill_list");
		return mv;
	}
    
    
    /**
     * 查询刀片详细信息
     * @param id
     * @param turn_url
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/goAddDesignToolBTAdrill")
	public ModelAndView goAddDesignToolBTAdrill(String id, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(!"0".equals(id)){
			Map para = new HashMap();
			para.put("id_DesignToolBTAdrill", id);
			Map designToolBTAdrill = designToolBTAdrillService.queryDesignToolBTAdrillById(para);//查询刀片详细信息
			
			Map P = JackJson.fromJsonToMap((String)designToolBTAdrill.get("P"));
			Map C = JackJson.fromJsonToMap((String)designToolBTAdrill.get("C"));
			Map ZI = JackJson.fromJsonToMap((String)designToolBTAdrill.get("ZI"));
			Map One = JackJson.fromJsonToMap((String)designToolBTAdrill.get("One"));
			Map Two = JackJson.fromJsonToMap((String)designToolBTAdrill.get("Two"));
			Map Body = new HashMap();
			Map S = new HashMap();
			
			//查询刀片的part文件（查询出该ID所有，然后在分别给各种型号的刀片Map）
			List<Map> partAll = designToolBTAdrillService.queryPartAllList(para);
			
			List<Map> pPartList = new ArrayList<Map>();
			List<Map> cPartList = new ArrayList<Map>();
			List<Map> ziPartList = new ArrayList<Map>();
			List<Map> onePartList = new ArrayList<Map>();
			List<Map> twoPartList = new ArrayList<Map>();
			List<Map> bodyPartList = new ArrayList<Map>();
			List<Map> sPartList = new ArrayList<Map>();
			
			for(int j = 0;j<partAll.size();j++){
				Map partMap = partAll.get(j);
				if("P".equals(partMap.get("ascription"))){
					pPartList.add(partMap);
				}
				if(partMap.get("ascription").equals("C")){
					cPartList.add(partMap);
				}
				if(partMap.get("ascription").equals("ZI")){
					ziPartList.add(partMap);
				}
				if(partMap.get("ascription").equals("One")){
					onePartList.add(partMap);
				}
				if(partMap.get("ascription").equals("Two")){
					twoPartList.add(partMap);
				}
				if(partMap.get("ascription").equals("Body")){
					bodyPartList.add(partMap);
				}
				if(partMap.get("ascription").equals("S")){
					sPartList.add(partMap);
				}
			}
			
			P.put("pPart", pPartList);
			C.put("cPart", cPartList);
			ZI.put("ziPart", ziPartList);
			One.put("onePart", onePartList);
			Two.put("twoPart", twoPartList);
			Body.put("bodyPart", bodyPartList);
			S.put("sPart", sPartList);
			
			
			
			if(designToolBTAdrill != null){
				
				//查询刀具图片列表 PictureBladeTurningList
				List<Map> pictureDesignToolBTAdrillList = designToolBTAdrillService.queryPictureDesignToolBTAdrillList(para);
				String array_PictureDesignToolBTAdrill = "";
				if(pictureDesignToolBTAdrillList != null && pictureDesignToolBTAdrillList.size() > 0){
					for(int i = 0; i < pictureDesignToolBTAdrillList.size(); i++){
						array_PictureDesignToolBTAdrill = array_PictureDesignToolBTAdrill + pictureDesignToolBTAdrillList.get(i).get("url_DesignToolBTAdrill") + ",";
					}
				}
				
				//查询详细信息列表 InformDetailBladeTurningList
				List<Map> informDetailDesignToolBTAdrillList = designToolBTAdrillService.queryInformDetailDesignToolBTAdrillList(para);
				String array_InformDetailDesignToolBTAdrill = "";
				String array_InformDetailDesignToolBTAdrill_name = "";
				if(informDetailDesignToolBTAdrillList != null && informDetailDesignToolBTAdrillList.size() > 0){
					for(int i = 0; i < informDetailDesignToolBTAdrillList.size(); i++){
						array_InformDetailDesignToolBTAdrill = array_InformDetailDesignToolBTAdrill + informDetailDesignToolBTAdrillList.get(i).get("url_DesignInformDetailBTADrill") + ",";
						array_InformDetailDesignToolBTAdrill_name = array_InformDetailDesignToolBTAdrill_name + informDetailDesignToolBTAdrillList.get(i).get("name_DesignInformDetailBTADrill") + ",";
					}
				}
				
				
				//查询应用实例列表 ApplicationBladeTurningList
				List<Map> partDesignToolBTAdrillList = designToolBTAdrillService.queryPartDesignToolBTAdrillList(para);
				String array_PartDesignToolBTAdrill = "";
				String array_PartDesignToolBTAdrill_name = "";
				if(partDesignToolBTAdrillList != null && partDesignToolBTAdrillList.size() > 0){
					for(int i = 0; i < partDesignToolBTAdrillList.size(); i++){
						array_PartDesignToolBTAdrill = array_PartDesignToolBTAdrill + partDesignToolBTAdrillList.get(i).get("url_DesignPartBTADrill") + ",";
						array_PartDesignToolBTAdrill_name = array_PartDesignToolBTAdrill_name + partDesignToolBTAdrillList.get(i).get("name_DesignPartBTADrill") + ",";
						
					}
				}
				
				String array_pPart = "";
				String array_pPart_name = "";
				if(pPartList != null && pPartList.size() > 0){
					for(int i = 0; i < pPartList.size(); i++){
						array_pPart = array_pPart + pPartList.get(i).get("url_DesignBTADrillPartAll") + ",";
						array_pPart_name = array_pPart_name + pPartList.get(i).get("name_DesignBTADrillPartAll") + ",";
					}
				}
				
				String array_cPart = "";
				String array_cPart_name = "";
				if(cPartList != null && cPartList.size() > 0){
					for(int i = 0; i < cPartList.size(); i++){
						array_cPart = array_cPart + cPartList.get(i).get("url_DesignBTADrillPartAll") + ",";
						array_cPart_name = array_cPart_name + cPartList.get(i).get("name_DesignBTADrillPartAll") + ",";
					}
				}
				String array_ziPart = "";
				String array_ziPart_name = "";
				if(ziPartList != null && ziPartList.size() > 0){
					for(int i = 0; i < ziPartList.size(); i++){
						array_ziPart = array_ziPart + ziPartList.get(i).get("url_DesignBTADrillPartAll") + ",";
						array_ziPart_name = array_ziPart_name + ziPartList.get(i).get("name_DesignBTADrillPartAll") + ",";
					}
				}
				String array_onePart = "";
				String array_onePart_name = "";
				if(onePartList != null && onePartList.size() > 0){
					for(int i = 0; i < onePartList.size(); i++){
						array_onePart = array_onePart + onePartList.get(i).get("url_DesignBTADrillPartAll") + ",";
						array_onePart_name = array_onePart_name + onePartList.get(i).get("name_DesignBTADrillPartAll") + ",";
					}
				}
				String array_twoPart = "";
				String array_twoPart_name = "";
				if(twoPartList != null && twoPartList.size() > 0){
					for(int i = 0; i < twoPartList.size(); i++){
						array_twoPart = array_twoPart + twoPartList.get(i).get("url_DesignBTADrillPartAll") + ",";
						array_twoPart_name = array_twoPart_name + twoPartList.get(i).get("name_DesignBTADrillPartAll") + ",";
					}
				}
				String array_bodyPart = "";
				String array_bodyPart_name = "";
				if(bodyPartList != null && bodyPartList.size() > 0){
					for(int i = 0; i < bodyPartList.size(); i++){
						array_bodyPart = array_bodyPart + bodyPartList.get(i).get("url_DesignBTADrillPartAll") + ",";
						array_bodyPart_name = array_bodyPart_name + bodyPartList.get(i).get("name_DesignBTADrillPartAll") + ",";
					}
				}
				String array_sPart = "";
				String array_sPart_name = "";
				if(sPartList != null && sPartList.size() > 0){
					for(int i = 0; i < sPartList.size(); i++){
						array_sPart = array_sPart + sPartList.get(i).get("url_DesignBTADrillPartAll") + ",";
						array_sPart_name = array_sPart_name + sPartList.get(i).get("name_DesignBTADrillPartAll") + ",";
					}
				}
				
				designToolBTAdrill.put("pictureDesignToolBTAdrillList", pictureDesignToolBTAdrillList);
				designToolBTAdrill.put("informDetailDesignToolBTAdrillList", informDetailDesignToolBTAdrillList);
				designToolBTAdrill.put("partDesignToolBTAdrillList", partDesignToolBTAdrillList);
				designToolBTAdrill.put("P", P);
				designToolBTAdrill.put("C", C);
				designToolBTAdrill.put("ZI", ZI);
				designToolBTAdrill.put("One", One);
				designToolBTAdrill.put("Two", Two);
				designToolBTAdrill.put("Body", Body);
				designToolBTAdrill.put("S", S);
				
				mv.addObject("array_PictureDesignToolBTAdrill", array_PictureDesignToolBTAdrill);
				mv.addObject("array_InformDetailDesignToolBTAdrill", array_InformDetailDesignToolBTAdrill);
				mv.addObject("array_InformDetailDesignToolBTAdrill_name", array_InformDetailDesignToolBTAdrill_name);
				mv.addObject("array_PartDesignToolBTAdrill", array_PartDesignToolBTAdrill);
				mv.addObject("array_PartDesignToolBTAdrill_name", array_PartDesignToolBTAdrill_name);
				mv.addObject("array_pPart", array_pPart);
				mv.addObject("array_pPart_name", array_pPart_name);
				mv.addObject("array_cPart", array_cPart);
				mv.addObject("array_cPart_name", array_cPart_name);
				mv.addObject("array_ziPart", array_ziPart);
				mv.addObject("array_ziPart_name", array_ziPart_name);
				mv.addObject("array_onePart", array_onePart);
				mv.addObject("array_onePart_name", array_onePart_name);
				mv.addObject("array_twoPart", array_twoPart);
				mv.addObject("array_twoPart_name", array_twoPart_name);
				mv.addObject("array_bodyPart", array_bodyPart);
				mv.addObject("array_bodyPart_name", array_bodyPart_name);
				mv.addObject("array_sPart", array_sPart);
				mv.addObject("array_sPart_name", array_sPart_name);
				
				
				mv.addObject("designToolBTAdrill", designToolBTAdrill);
			}
		}
		mv.setViewName("/WEB-INF/toolPlan/designTurningTool/designToolBTAdrill/designToolBTAdrill_edit");
		mv.addObject("msg", "saveToolBTAdrill");
		mv.addObject("turn_url", turn_url);
		
		
		mv.addObject("pd", pd);

		return mv;
		
		
    }
    
    
    /**
     * 添加刀片信息
     */
    @ResponseBody
	@RequestMapping("/saveDesignToolBTAdrill")
	public String saveDesignToolBTAdrill(HttpServletRequest request, 
			int id_DesignToolBTAdrill, String DesignNumberBTADrill, String DesignNameBTADrill, String DesignDiameterBTADrill, String DesignCompanyBTADrill, 
			String DesignBreakerBTADrill, String DesignFeatureBTADrill, String P, String C, String ZI,String One, String Two, 
			String array_PictureDesignToolBTAdrill, 
			String array_InformDetailDesignToolBTAdrill, String array_InformDetailDesignToolBTAdrill_name, String array_PartDesignToolBTAdrill, String array_PartDesignToolBTAdrill_name,
			String array_pPart, String array_pPart_name, String array_cPart, String array_cPart_name, String array_ziPart, String array_ziPart_name,
			String array_onePart, String array_onePart_name, String array_twoPart, String array_twoPart_name, String array_bodyPart, String array_bodyPart_name, 
			String array_sPart, String array_sPart_name ) {
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		
		Map mapP = new HashMap();
		String array_P1[] = P.split(",");
		String array_P[] = new String[5];
		for(int i = 0;i<array_P1.length;i++){
			array_P[i] = array_P1[i];
		}
		mapP.put("DesignBTADrillPWidth", array_P[0]==null?"":array_P[0]);
		mapP.put("DesignBTADrillPEdgeAngle", array_P[1]==null?"":array_P[1]);
		mapP.put("DesignBTADrillPRakeAngle", array_P[2]==null?"":array_P[2]);
		mapP.put("DesignBTADrillPReliefAngle", array_P[3]==null?"":array_P[3]);
		mapP.put("DesignBTADrillPNoseAngle", array_P[4]==null?"":array_P[4]);
		P = JackJson.fromObjectToJson(mapP);
		
		Map mapC = new HashMap();
		String array_C1[] = C.split(",");
		String array_C[] = new String[5];
		for(int i = 0;i<array_C1.length;i++){
			array_C[i] = array_C1[i];
		}
		mapC.put("DesignBTADrillCWidth", array_C[0]==null?"":array_C[0]);
		mapC.put("DesignBTADrillCEdgeAngle", array_C[1]==null?"":array_C[1]);
		mapC.put("DesignBTADrillCRakeAngle", array_C[2]==null?"":array_C[2]);
		mapC.put("DesignBTADrillCReliefAngle", array_C[3]==null?"":array_C[3]);
		mapC.put("DesignBTADrillCNoseAngle", array_C[4]==null?"":array_C[4]);
		C = JackJson.fromObjectToJson(mapC);
		
		Map mapZI = new HashMap();
		String array_ZI1[] = ZI.split(",");
		String array_ZI[] = new String[5];
		for(int i = 0;i<array_ZI1.length;i++){
			array_ZI[i] = array_ZI1[i];
		}
		mapZI.put("DesignBTADrillZIWidth", array_ZI[0]==null?"":array_ZI[0]);
		mapZI.put("DesignBTADrillZIEdgeAngle", array_ZI[1]==null?"":array_ZI[1]);
		mapZI.put("DesignBTADrillZIRakeAngle", array_ZI[2]==null?"":array_ZI[2]);
		mapZI.put("DesignBTADrillZIReliefAngle", array_ZI[3]==null?"":array_ZI[3]);
		mapZI.put("DesignBTADrillZINoseAngle", array_ZI[4]==null?"":array_ZI[4]);
		ZI = JackJson.fromObjectToJson(mapZI);
		
		Map mapOne = new HashMap();
		String array_One1[] = One.split(",");
		String array_One[] = new String[3];
		for(int i = 0;i<array_One1.length;i++){
			array_One[i] = array_One1[i];
		}
		mapOne.put("DesignBTADrillZIArcAngleOne", array_One[0]==null?"":array_One[0]);
		mapOne.put("DesignBTADrillZILeadLengthOne", array_One[1]==null?"":array_One[1]);
		mapOne.put("DesignBTADrillZILeadThicknessOne", array_One[2]==null?"":array_One[2]);
		One = JackJson.fromObjectToJson(mapOne);
		
		Map mapTwo = new HashMap();
		String array_Two1[] = Two.split(",");
		String array_Two[] = new String[3];
		for(int i = 0;i<array_Two1.length;i++){
			array_Two[i] = array_Two1[i];
		}
		mapTwo.put("DesignBTADrillZIArcAngleTwo", array_Two[0]==null?"":array_Two[0]);
		mapTwo.put("DesignBTADrillZILeadLengthTwo", array_Two[1]==null?"":array_Two[1]);
		mapTwo.put("DesignBTADrillZILeadThicknessTwo", array_Two[2]==null?"":array_Two[2]);
		Two = JackJson.fromObjectToJson(mapTwo);
		
		Map para = new HashMap();
		para.put("id_DesignToolBTAdrill", id_DesignToolBTAdrill);
		para.put("DesignNumberBTADrill", DesignNumberBTADrill);
		para.put("DesignNameBTADrill", DesignNameBTADrill);
		para.put("DesignDiameterBTADrill", "".equals(DesignDiameterBTADrill)||DesignDiameterBTADrill==null?"0":DesignDiameterBTADrill);
		para.put("DesignCompanyBTADrill", DesignCompanyBTADrill);
		para.put("DesignBreakerBTADrill", DesignBreakerBTADrill);
		para.put("DesignFeatureBTADrill", DesignFeatureBTADrill);
		para.put("P", P);
		para.put("C", C);
		para.put("ZI", ZI);
		para.put("One", One);
		para.put("Two", Two);
		
		System.out.println("需要存储的数据为："+para);
		try {
			if(id_DesignToolBTAdrill != 0){//修改
				designToolBTAdrillService.updateDesignToolBTAdrill(para);
			}else{//新增
				
				designToolBTAdrillService.saveDesignToolBTAdrill(para);
			}
			
			//清空刀具图片路径 
			designToolBTAdrillService.clearPictureDesignToolBTAdrillById(para);
			//保存刀具图片
			if(array_PictureDesignToolBTAdrill != null && !"".equals(array_PictureDesignToolBTAdrill)){
				String array_PictureDesignToolBTAdrills[] = array_PictureDesignToolBTAdrill.split(",");
				for(int i=0; i<array_PictureDesignToolBTAdrills.length; i++){
					if(array_PictureDesignToolBTAdrills[i] != null && !"".equals(array_PictureDesignToolBTAdrills[i])){
						para.put("url_DesignToolBTAdrill", array_PictureDesignToolBTAdrills[i]);
						designToolBTAdrillService.savePictureDesignToolBTAdrill(para);
					}
				}
			}
			
			//清空详细图片路径 
			designToolBTAdrillService.clearPartDesignToolBTAdrillById(para);
			//保存详细图片
			if(array_PartDesignToolBTAdrill != null && !"".equals(array_PartDesignToolBTAdrill)){
				String array_PartDesignToolBTAdrills[] = array_PartDesignToolBTAdrill.split(",");
				String array_PartDesignToolBTAdrills_name[] = array_PartDesignToolBTAdrill_name.split(",");
				for(int i=0; i<array_PartDesignToolBTAdrills.length; i++){
					if(array_PartDesignToolBTAdrills[i] != null && !"".equals(array_PartDesignToolBTAdrills[i])){
						para.put("url_DesignPartBTADrill", array_PartDesignToolBTAdrills[i]);
						para.put("name_DesignPartBTADrill", array_PartDesignToolBTAdrills_name[i]);
						designToolBTAdrillService.savePartDesignToolBTAdrill(para);
					}
				}
			}
			
			//清空详细信息路径
			designToolBTAdrillService.clearInformDetailDesignToolBTAdrillById(para);
			//保存详细信息
			if(array_InformDetailDesignToolBTAdrill != null && !"".equals(array_InformDetailDesignToolBTAdrill)){
				String array_InformDetailDesignToolBTAdrills[] = array_InformDetailDesignToolBTAdrill.split(",");
				String array_InformDetailDesignToolBTAdrills_name[] = array_InformDetailDesignToolBTAdrill_name.split(",");
				
				for(int i=0; i<array_InformDetailDesignToolBTAdrills.length; i++){
					if(array_InformDetailDesignToolBTAdrills[i] != null && !"".equals(array_InformDetailDesignToolBTAdrills[i])){
						para.put("url_DesignInformDetailBTADrill", array_InformDetailDesignToolBTAdrills[i]);
						para.put("name_DesignInformDetailBTADrill", array_InformDetailDesignToolBTAdrills_name[i]);
						designToolBTAdrillService.saveInformDetailDesignToolBTAdrill(para);
					}
				}
			}
			
			designToolBTAdrillService.cleanPartAllDesignToolBTAdrillById(para);
			
			if(array_pPart != null && !"".equals(array_pPart)){
				String array_pParts[] = array_pPart.split(",");
				String array_pParts_name[] = array_pPart_name.split(",");
				
				for(int i=0; i<array_pParts.length; i++){
					if(array_pParts[i] != null && !"".equals(array_pParts[i])){
						para.put("url_DesignBTADrillPartAll", array_pParts[i]);
						para.put("name_DesignBTADrillPartAll", array_pParts_name[i]);
						para.put("ascription", "P");
						designToolBTAdrillService.savePartAll(para);
					}
				}
			}
			
			if(array_cPart != null && !"".equals(array_cPart)){
				String array_cParts[] = array_cPart.split(",");
				String array_cParts_name[] = array_cPart_name.split(",");
				
				for(int i=0; i<array_cParts.length; i++){
					if(array_cParts[i] != null && !"".equals(array_cParts[i])){
						para.put("url_DesignBTADrillPartAll", array_cParts[i]);
						para.put("name_DesignBTADrillPartAll", array_cParts_name[i]);
						para.put("ascription", "C");
						designToolBTAdrillService.savePartAll(para);
					}
				}
			}
			
			if(array_ziPart != null && !"".equals(array_ziPart)){
				String array_ziParts[] = array_ziPart.split(",");
				String array_ziParts_name[] = array_ziPart_name.split(",");
				
				for(int i=0; i<array_ziParts.length; i++){
					if(array_ziParts[i] != null && !"".equals(array_ziParts[i])){
						para.put("url_DesignBTADrillPartAll", array_ziParts[i]);
						para.put("name_DesignBTADrillPartAll", array_ziParts_name[i]);
						para.put("ascription", "ZI");
						designToolBTAdrillService.savePartAll(para);
					}
				}
			}
			
			if(array_onePart != null && !"".equals(array_onePart)){
				String array_oneParts[] = array_onePart.split(",");
				String array_oneParts_name[] = array_onePart_name.split(",");
				
				for(int i=0; i<array_oneParts.length; i++){
					if(array_oneParts[i] != null && !"".equals(array_oneParts[i])){
						para.put("url_DesignBTADrillPartAll", array_oneParts[i]);
						para.put("name_DesignBTADrillPartAll", array_oneParts_name[i]);
						para.put("ascription", "One");
						designToolBTAdrillService.savePartAll(para);
					}
				}
			}
			
			if(array_twoPart != null && !"".equals(array_twoPart)){
				String array_twoParts[] = array_twoPart.split(",");
				String array_twoParts_name[] = array_twoPart_name.split(",");
				
				for(int i=0; i<array_twoParts.length; i++){
					if(array_twoParts[i] != null && !"".equals(array_twoParts[i])){
						para.put("url_DesignBTADrillPartAll", array_twoParts[i]);
						para.put("name_DesignBTADrillPartAll", array_twoParts_name[i]);
						para.put("ascription", "Two");
						designToolBTAdrillService.savePartAll(para);
					}
				}
			}
			
			if(array_bodyPart != null && !"".equals(array_bodyPart)){
				String array_bodyParts[] = array_bodyPart.split(",");
				String array_bodyParts_name[] = array_bodyPart_name.split(",");
				
				for(int i=0; i<array_bodyParts.length; i++){
					if(array_bodyParts[i] != null && !"".equals(array_bodyParts[i])){
						para.put("url_DesignBTADrillPartAll", array_bodyParts[i]);
						para.put("name_DesignBTADrillPartAll", array_bodyParts_name[i]);
						para.put("ascription", "Body");
						designToolBTAdrillService.savePartAll(para);
					}
				}
			}
			
			if(array_sPart != null && !"".equals(array_sPart)){
				String array_sParts[] = array_sPart.split(",");
				String array_sParts_name[] = array_sPart_name.split(",");
				
				for(int i=0; i<array_sParts.length; i++){
					if(array_sParts[i] != null && !"".equals(array_sParts[i])){
						para.put("url_DesignBTADrillPartAll", array_sParts[i]);
						para.put("name_DesignBTADrillPartAll", array_sParts_name[i]);
						para.put("ascription", "S");
						designToolBTAdrillService.savePartAll(para);
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
    @ResponseBody
	@RequestMapping(value="/savePictureDesignToolBTAdrill")
	public Object savePictureDesignToolBTAdrill(
			@RequestParam("PictureDesignToolBTAdrill") MultipartFile PictureDesignToolBTAdrill,
			HttpServletRequest request ) throws Exception{
		String url = null;
		String OriginalFilename = PictureDesignToolBTAdrill.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/pictureDesignToolBTAdrill/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			PictureDesignToolBTAdrill.transferTo(materials_big_img_file); 
			url = "/pictureDesignToolBTAdrill/" + big_url + "." + fileSuffix;
		}else{

		}
		return url;
		
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
	@RequestMapping(value="/savePartDesignToolBTAdrill")
	public Object savePartDesignToolBTAdrill(
			@RequestParam(value="PartDesignToolBTAdrill",required=false)MultipartFile PartDesignToolBTAdrill ,
			HttpServletRequest request ) throws Exception{
		
		Map<String,String> data = new HashMap<String, String>();
		String OriginalFilename = PartDesignToolBTAdrill.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/partDesignToolBTAdrill/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			PartDesignToolBTAdrill.transferTo(materials_big_img_file); 
			data.put("url", "/partDesignToolBTAdrill/" + big_url + "." + fileSuffix);
			data.put("fileName", OriginalFilename);

		}else{

		}

		return data;
		
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
    @RequestMapping(value="/saveInformDetailDesignToolBTAdrill")
	public Object saveInformDetailDesignToolBTAdrill(
			@RequestParam(value="InformDetailDesignToolBTAdrill",required=false)MultipartFile InformDetailDesignToolBTAdrill ,
			HttpServletRequest request ) throws Exception{
		Map<String,String> data = new HashMap<String, String>();
		String OriginalFilename = InformDetailDesignToolBTAdrill.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/informDetailDesignToolBTAdrill/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			InformDetailDesignToolBTAdrill.transferTo(materials_big_img_file); 
			data.put("url", "/informDetailDesignToolBTAdrill/" + big_url + "." + fileSuffix);
			data.put("fileName", OriginalFilename);
		}else{

		}
		return data;
		
	}
    
	
    @ResponseBody
    @RequestMapping(value="/savePartAllDesignToolBTAdrill")
	public Object savePartAllDesignToolBTAdrill(
			@RequestParam(value="file",required=false)MultipartFile file ,
			String ascription, HttpServletRequest request ) throws Exception{
		Map<String,String> data = new HashMap<String, String>();
		String OriginalFilename = file.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/partAllDesignToolBTAdrill/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			file.transferTo(materials_big_img_file); 
			data.put("url", "/partAllDesignToolBTAdrill/" + big_url + "." + fileSuffix);
			data.put("fileName", OriginalFilename);
			data.put("ascription", ascription);
		}else{

		}
		return data;
		
	}
	
	
	/**
	 * 删除刀片数据
	 * @param id_BTADrill
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteDesignToolBTAdrill")
	public String deleteDesignToolBTAdrill(String id_DesignToolBTAdrill) {
		Map para = new HashMap();
		para.put("id_DesignToolBTAdrill", id_DesignToolBTAdrill);
		try {
			//清空刀具图片路径 PictureBladeTurning
			designToolBTAdrillService.clearPictureDesignToolBTAdrillById(para);
			//清空应用实例路径 ApplicationBladeTurning
			designToolBTAdrillService.clearPartDesignToolBTAdrillById(para);
			//清空详细信息路径 InformDetailBladeTurning
			designToolBTAdrillService.clearInformDetailDesignToolBTAdrillById(para);
			//清空所有刀片的part
			designToolBTAdrillService.clearPartAllById(para);
			//删除刀片数据
			designToolBTAdrillService.deleteDesignToolBTAdrill(para);
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}

}
