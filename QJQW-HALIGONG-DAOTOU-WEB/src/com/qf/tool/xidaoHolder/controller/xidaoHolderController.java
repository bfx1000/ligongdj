package com.qf.tool.xidaoHolder.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.qf.tool.xidaoHolder.service.xidaoHolderService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.common.JackJson;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;
/**
 * 
 * @ClassName:  XidaoHolderController   
 * @Description:TODO
 * @author: 	yinxf
 * @date:   	2017年10月26日 下午3:13:38   
 *
 */
@Controller
@RequestMapping("/xidaoHolder")
public class xidaoHolderController extends BaseController {
	@Autowired
	@Resource(name = "xidaoHolderService")
	private xidaoHolderService xidaoHolderService;
	
	/** 
	 * @Description: 查询铣刀列表，返回mv
	 */
	@RequestMapping(value = "queryXidaoHolderList")
	public ModelAndView queryXidaoHolderList(Page page, HttpServletRequest request) {

		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();


		try {

			pd = this.getPageData();

			page.setPd(pd);
			
			// 查询车刀数据-刀柄列表
			Map map = xidaoHolderService.queryXidaoHolderList(page);
			page = (Page) map.get("page");
			List<Map> list = (List<Map>) map.get("list");
			if (list != null && list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					Map xidaoHolder = list.get(i);
					int id_XidaoHolder = (int) xidaoHolder.get("id_XidaoHolder");

					Map<String, Comparable<Integer>> para = new HashMap<String, Comparable<Integer>>();
					para.put("id_XidaoHolder", id_XidaoHolder);

					// 查询刀柄图片列表
					List<Map> pictureXidaoHolderList = xidaoHolderService.queryPictureXidaoHolderList(para);
					
					// 查询详细图片列表
					List<Map> pictureDetailXidaoHolderList = xidaoHolderService.queryPictureDetailXidaoHolderList(para);
					
					// 查询详细信息列表
					List<Map> informDetailXidaoHolderList = xidaoHolderService.queryInformDetailXidaoHolderList(para);

					xidaoHolder.put("pictureXidaoHolderList", pictureXidaoHolderList);
					xidaoHolder.put("pictureDetailXidaoHolderList", pictureDetailXidaoHolderList);
					xidaoHolder.put("informDetailXidaoHolderList", informDetailXidaoHolderList);
					list.set(i, xidaoHolder);

				}
			}
			mv.addObject("xidaoHolderList", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}

		mv.setViewName("/WEB-INF/tool/xidao/xidaoHolder/xidaoHolderList");
		return mv;
	}

	@RequestMapping(value = "/goAddXidaoHolder")
	public ModelAndView goAddXidaoHolder(String id, String turn_url) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		Map<String,Object> para = new HashMap<String,Object>();
		para.put("id_XidaoHolder", id);
		
		// 查询车刀数据-刀柄数据
		Map xidaoHolder = xidaoHolderService.queryXidaoHolderById(para);
		if (xidaoHolder != null) {

			// 查询刀柄图片列表 PictureXidaoHolder
			List<Map> pictureXidaoHolderList = xidaoHolderService.queryPictureXidaoHolderList(para);
			String array_PictureXidaoHolder = "";
			
			//最后结果：array_pic=url_pic(1),	url_pic(2),	url_pic(3),	url_pic(4),	
			if (pictureXidaoHolderList != null && pictureXidaoHolderList.size() > 0) {
				for (int i = 0; i < pictureXidaoHolderList.size(); i++) {
					array_PictureXidaoHolder = array_PictureXidaoHolder
							+ pictureXidaoHolderList.get(i).get("url_PictureXidaoHolder") + ",";
				}
			}

			// 查询详细图片列表 PictureDetailXidaoHolder
			List<Map> pictureDetailXidaoHolderList = xidaoHolderService.queryPictureDetailXidaoHolderList(para);
			String array_PictureDetailXidaoHolder = "";
			if (pictureDetailXidaoHolderList != null && pictureDetailXidaoHolderList.size() > 0) {
				for (int i = 0; i < pictureDetailXidaoHolderList.size(); i++) {
					array_PictureDetailXidaoHolder = array_PictureDetailXidaoHolder
							+ pictureDetailXidaoHolderList.get(i).get("url_PictureDetailXidaoHolder") + ",";
				}
			}

			// 查询详细信息列表 InformDetailXidaoHolder
			List<Map> informDetailXidaoHolderList = xidaoHolderService.queryInformDetailXidaoHolderList(para);
			String array_InformDetailXidaoHolder = "";
			String array_InformDetailXidaoHolder_Name = "";
			if (informDetailXidaoHolderList != null && informDetailXidaoHolderList.size() > 0) {
				for (int i = 0; i < informDetailXidaoHolderList.size(); i++) {
					array_InformDetailXidaoHolder = array_InformDetailXidaoHolder
							+ informDetailXidaoHolderList.get(i).get("url_InformDetailXidaoHolder") + ",";
					array_InformDetailXidaoHolder_Name = array_InformDetailXidaoHolder_Name
							+ informDetailXidaoHolderList.get(i).get("name_InformDetailXidaoHolder") + ",";
				}
			}

			xidaoHolder.put("pictureXidaoHolderList", pictureXidaoHolderList);
			xidaoHolder.put("pictureDetailXidaoHolderList", pictureDetailXidaoHolderList);
			xidaoHolder.put("informDetailXidaoHolderList", informDetailXidaoHolderList);

			mv.addObject("array_PictureXidaoHolder", array_PictureXidaoHolder);
			mv.addObject("array_PictureDetailXidaoHolder", array_PictureDetailXidaoHolder);
			mv.addObject("array_InformDetailXidaoHolder", array_InformDetailXidaoHolder);
			mv.addObject("array_InformDetailXidaoHolder_Name", array_InformDetailXidaoHolder_Name);
			
		}

		// 查询ISO基准刀片 json
		List<String> isoList = xidaoHolderService.queryIsoList();
		if (isoList != null && isoList.size() > 0) {
			String[] isoArray = new String[isoList.size()];
			for (int i = 0; i < isoList.size(); i++) {
				isoArray[i] = isoList.get(i);
			}
			String json = JackJson.fromObjectToJson(isoArray);
			mv.addObject("isoArray", json);
		}

		mv.setViewName("/WEB-INF/tool/xidao/xidaoHolder/xidaoHolder_edit");
		mv.addObject("msg", "saveXidaoHolder");
		mv.addObject("turn_url", turn_url);
		mv.addObject("xidaoHolder", xidaoHolder);

		mv.addObject("pd", pd);

		return mv;
	}

	/**
	 * 
	 * @Title: savePictureXidaoHolder   
	 * @Description: TODO
	 * @param: @param id_XidaoHolder
	 * @param: @param array_PictureXidaoHolder
	 * @param: @param array_PictureDetailXidaoHolder
	 * @param: @param array_InformDetailXidaoHolder
	 * @param: @param array_InformDetailXidaoHolder_Name
	 * @param: @param PictureXidaoHolder
	 * @param: @param numberXidaoHolder
	 * @param: @param nameXidaoHolder
	 * @param: @param typeXidaoHolder
	 * @param: @param typeCustomXidaoHolder
	 * @param: @param isoBladeXidao
	 * @param: @param typeBlade
	 * @param: @param typeCustomBlade
	 * @param: @param diameterXidaoHolder
	 * @param: @param companyXidaoHolder
	 * @param: @param featureXidaoHolder
	 * @param: @param request
	 * @param: @return
	 * @param: @throws Exception      
	 * @return: ModelAndView      
	 * @throws
	 */
	@RequestMapping(value = "/savePictureXidaoHolder")
	public ModelAndView savePictureXidaoHolder(String id_XidaoHolder, String array_PictureXidaoHolder,
			String array_PictureDetailXidaoHolder, String array_InformDetailXidaoHolder,
			String array_InformDetailXidaoHolder_Name,
			@RequestParam(value = "PictureXidaoHolder", required = false) CommonsMultipartFile PictureXidaoHolder,
			String numberXidaoHolder, String nameXidaoHolder, String typeXidaoHolder, String typeCustomXidaoHolder,
			String isoBladeXidao, String typeBlade, String typeCustomBlade, String diameterXidaoHolder,
			String companyXidaoHolder, String featureXidaoHolder, HttpServletRequest request) throws Exception {

		Map<String, Object> xidaoHolder = new HashMap<String, Object>();

		xidaoHolder.put("id_XidaoHolder", id_XidaoHolder);
		xidaoHolder.put("numberXidaoHolder", numberXidaoHolder);
		xidaoHolder.put("nameXidaoHolder", nameXidaoHolder);
		xidaoHolder.put("typeXidaoHolder", typeXidaoHolder);
		xidaoHolder.put("typeCustomXidaoHolder", typeCustomXidaoHolder);
		xidaoHolder.put("isoBladeXidao", isoBladeXidao);
		xidaoHolder.put("typeBlade", typeBlade);
		xidaoHolder.put("typeCustomBlade", typeCustomBlade);
		xidaoHolder.put("diameterXidaoHolder", diameterXidaoHolder);
		xidaoHolder.put("companyXidaoHolder", companyXidaoHolder);
		xidaoHolder.put("featureXidaoHolder", featureXidaoHolder);

		ModelAndView mv = this.getModelAndView();
		Map<String, Object> PictureBTADrillMap = new HashMap<String, Object>();

		String originalFilename = PictureXidaoHolder.getOriginalFilename();
		if (originalFilename != null && !"".equals(originalFilename)) {
			String fileSuffix = originalFilename.substring(originalFilename.lastIndexOf(".") + 1).toLowerCase();
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 = request.getSession().getServletContext()
					.getRealPath("/goods/pictureXidaoHolder/" + big_url + "." + fileSuffix);

			File materials_big_img_file = new File(filepath1);

			PictureXidaoHolder.transferTo(materials_big_img_file);
			PictureBTADrillMap.put("url_PictureXidaoHolder", "/pictureXidaoHolder/" + big_url + "." + fileSuffix);
			PictureBTADrillMap.put("id_XidaoHolder", id_XidaoHolder);
			array_PictureXidaoHolder = array_PictureXidaoHolder + "/pictureXidaoHolder/" + big_url + "." + fileSuffix
					+ ",";

		} else {

		}

		mv.addObject("array_PictureXidaoHolder", array_PictureXidaoHolder);
		mv.addObject("array_PictureDetailXidaoHolder", array_PictureDetailXidaoHolder);
		mv.addObject("array_InformDetailXidaoHolder", array_InformDetailXidaoHolder);
		mv.addObject("array_InformDetailXidaoHolder_Name", array_InformDetailXidaoHolder_Name);

		mv.addObject("xidaoHolder", xidaoHolder);

		mv.setViewName("/WEB-INF/tool/xidao/xidaoHolder/xidaoHolder_edit");

		return mv;

	}

	/**
	 * 保存详细图片
	 * 
	 * @param id_BTADrill
	 * @param PictureBTADrill
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/savePictureDetailXidaoHolder")
	public ModelAndView savePictureDetailXidaoHolder(String id_XidaoHolder, String array_PictureXidaoHolder,
			String array_PictureDetailXidaoHolder, String array_InformDetailXidaoHolder,
			String array_InformDetailXidaoHolder_Name,
			@RequestParam(value = "PictureDetailXidaoHolder", required = false) CommonsMultipartFile PictureDetailXidaoHolder,
			String numberXidaoHolder, String nameXidaoHolder, String typeXidaoHolder, String typeCustomXidaoHolder,
			String isoBladeXidao, String typeBlade, String typeCustomBlade, String diameterXidaoHolder,
			String companyXidaoHolder, String featureXidaoHolder, HttpServletRequest request) throws Exception {

		Map<String, Object> xidaoHolder = new HashMap<String, Object>();

		xidaoHolder.put("id_XidaoHolder", id_XidaoHolder);
		xidaoHolder.put("numberXidaoHolder", numberXidaoHolder);
		xidaoHolder.put("nameXidaoHolder", nameXidaoHolder);
		xidaoHolder.put("typeXidaoHolder", typeXidaoHolder);
		xidaoHolder.put("typeCustomXidaoHolder", typeCustomXidaoHolder);
		xidaoHolder.put("isoBladeXidao", isoBladeXidao);
		xidaoHolder.put("typeBlade", typeBlade);
		xidaoHolder.put("typeCustomBlade", typeCustomBlade);
		xidaoHolder.put("diameterXidaoHolder", diameterXidaoHolder);
		xidaoHolder.put("companyXidaoHolder", companyXidaoHolder);
		xidaoHolder.put("featureXidaoHolder", featureXidaoHolder);

		ModelAndView mv = this.getModelAndView();
		Map<String, Object> PictureBTADrillMap = new HashMap<String, Object>();

		String originalFilename = PictureDetailXidaoHolder.getOriginalFilename();
		if (originalFilename != null && !"".equals(originalFilename)) {
			String fileSuffix = originalFilename.substring(originalFilename.lastIndexOf(".") + 1).toLowerCase();
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 = request.getSession().getServletContext()
					.getRealPath("/goods/pictureDetailXidaoHolder/" + big_url + "." + fileSuffix);

			File materials_big_img_file = new File(filepath1);

			PictureDetailXidaoHolder.transferTo(materials_big_img_file);
			PictureBTADrillMap.put("url_PictureDetailXidaoHolder",
					"/pictureDetailXidaoHolder/" + big_url + "." + fileSuffix);
			PictureBTADrillMap.put("id_XidaoHolder", id_XidaoHolder);
			array_PictureDetailXidaoHolder = array_PictureDetailXidaoHolder + "/pictureDetailXidaoHolder/" + big_url
					+ "." + fileSuffix + ",";

		} else {

		}

		mv.addObject("array_PictureXidaoHolder", array_PictureXidaoHolder);
		mv.addObject("array_PictureDetailXidaoHolder", array_PictureDetailXidaoHolder);
		mv.addObject("array_InformDetailXidaoHolder", array_InformDetailXidaoHolder);
		mv.addObject("array_InformDetailXidaoHolder_Name", array_InformDetailXidaoHolder_Name);

		mv.addObject("xidaoHolder", xidaoHolder);

		mv.setViewName("/WEB-INF/tool/xidao/xidaoHolder/xidaoHolder_edit");

		return mv;

	}

	/**
	 * 保存详细信息
	 * 
	 * @param id_BTADrill
	 * @param PictureBTADrill
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/saveInformDetailXidaoHolder")
	public ModelAndView saveInformDetailXidaoHolder(String id_XidaoHolder, String array_PictureXidaoHolder,
			String array_PictureDetailXidaoHolder, String array_InformDetailXidaoHolder,
			String array_InformDetailXidaoHolder_Name,
			@RequestParam(value = "informDetailXidaoHolder", required = false) CommonsMultipartFile informDetailXidaoHolder,
			String numberXidaoHolder, String nameXidaoHolder, String typeXidaoHolder, String typeCustomXidaoHolder,
			String isoBladeXidao, String typeBlade, String typeCustomBlade, String diameterXidaoHolder,
			String companyXidaoHolder, String featureXidaoHolder, HttpServletRequest request) throws Exception {

		Map<String, Object> xidaoHolder = new HashMap<String, Object>();

		xidaoHolder.put("id_XidaoHolder", id_XidaoHolder);
		xidaoHolder.put("numberXidaoHolder", numberXidaoHolder);
		xidaoHolder.put("nameXidaoHolder", nameXidaoHolder);
		xidaoHolder.put("typeXidaoHolder", typeXidaoHolder);
		xidaoHolder.put("typeCustomXidaoHolder", typeCustomXidaoHolder);
		xidaoHolder.put("isoBladeXidao", isoBladeXidao);
		xidaoHolder.put("typeBlade", typeBlade);
		xidaoHolder.put("typeCustomBlade", typeCustomBlade);
		xidaoHolder.put("diameterXidaoHolder", diameterXidaoHolder);
		xidaoHolder.put("companyXidaoHolder", companyXidaoHolder);
		xidaoHolder.put("featureXidaoHolder", featureXidaoHolder);

		ModelAndView mv = this.getModelAndView();
		Map<String, Object> pictureXidaoHolderMap = new HashMap<String, Object>();

		String originalFilename = informDetailXidaoHolder.getOriginalFilename();
		if (originalFilename != null && !"".equals(originalFilename)) {
			String fileSuffix = originalFilename.substring(originalFilename.lastIndexOf(".") + 1).toLowerCase();
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 = request.getSession().getServletContext()
					.getRealPath("/goods/informDetailXidaoHolder/" + big_url + "." + fileSuffix);

			File materials_big_img_file = new File(filepath1);

			informDetailXidaoHolder.transferTo(materials_big_img_file);
			pictureXidaoHolderMap.put("url_InformDetailXidaoHolder",
					"/informDetailXidaoHolder/" + big_url + "." + fileSuffix);
			pictureXidaoHolderMap.put("id_XidaoHolder", id_XidaoHolder);
			array_InformDetailXidaoHolder = array_InformDetailXidaoHolder + "/informDetailXidaoHolder/" + big_url + "."
					+ fileSuffix + ",";
			array_InformDetailXidaoHolder_Name = array_InformDetailXidaoHolder_Name + originalFilename + ",";

		} else {

		}

		mv.addObject("array_PictureXidaoHolder", array_PictureXidaoHolder);
		mv.addObject("array_PictureDetailXidaoHolder", array_PictureDetailXidaoHolder);
		mv.addObject("array_InformDetailXidaoHolder", array_InformDetailXidaoHolder);
		mv.addObject("array_InformDetailXidaoHolder_Name", array_InformDetailXidaoHolder_Name);

		mv.addObject("xidaoHolder", xidaoHolder);

		mv.setViewName("/WEB-INF/tool/xidao/xidaoHolder/xidaoHolder_edit");

		return mv;

	}

	@ResponseBody
	@RequestMapping("/saveXidaoHolder")
	public String saveXidaoHolder(HttpServletRequest request, int id_XidaoHolder, String array_PictureXidaoHolder,
			String array_PictureDetailXidaoHolder, String array_InformDetailXidaoHolder,
			String array_InformDetailXidaoHolder_Name, String numberXidaoHolder, String nameXidaoHolder,
			String typeXidaoHolder, String typeCustomXidaoHolder, String isoBladeXidao, String typeBlade,
			String typeCustomBlade, String diameterXidaoHolder, String companyXidaoHolder, String featureXidaoHolder) {

		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		Map<String,Object> para = new HashMap<String,Object>();

		if (!"9".equals(typeXidaoHolder)) {
			typeCustomXidaoHolder = null;
		}

		if (!"9".equals(typeBlade)) {
			typeCustomBlade = null;
		}

		para.put("id_XidaoHolder", id_XidaoHolder);
		para.put("numberXidaoHolder", numberXidaoHolder);
		para.put("nameXidaoHolder", nameXidaoHolder);
		para.put("typeXidaoHolder", typeXidaoHolder);
		para.put("typeCustomXidaoHolder", typeCustomXidaoHolder);
		para.put("isoBladeXidao", isoBladeXidao);
		para.put("typeBlade", typeBlade);
		para.put("typeCustomBlade", typeCustomBlade);
		para.put("diameterXidaoHolder", diameterXidaoHolder);
		para.put("companyXidaoHolder", companyXidaoHolder);
		para.put("featureXidaoHolder", featureXidaoHolder);

		para.put("add_time", System.currentTimeMillis() / 1000);
		if (user != null) {
			para.put("user_id", user.get("user_id"));
		} else {
			para.put("user_id", 0);
		}
		try {
			if (id_XidaoHolder != 0) {
				
				// 修改
				xidaoHolderService.updateXidaoHolder(para);
			} else {
				
				// 新增
				xidaoHolderService.saveXidaoHolder(para);
			}
			
			// 清空刀柄图片路径
			xidaoHolderService.clearPictureXidaoHolderByIdXidaoHolder(para);
			
			// 保存刀柄图片
			if (array_PictureXidaoHolder != null && !"".equals(array_PictureXidaoHolder)) {
				String array_PictureXidaoHolders[] = array_PictureXidaoHolder.split(",");
				for (int i = 0; i < array_PictureXidaoHolders.length; i++) {
					if (array_PictureXidaoHolders[i] != null && !"".equals(array_PictureXidaoHolders[i])) {
						para.put("url_PictureXidaoHolder", array_PictureXidaoHolders[i]);
						xidaoHolderService.savePictureXidaoHolder(para);
					}
				}
			}

			// 清空详细图片路径
			xidaoHolderService.clearPictureDetailXidaoHolderByIdXidaoHolder(para);
			// 保存详细图片
			if (array_PictureDetailXidaoHolder != null && !"".equals(array_PictureDetailXidaoHolder)) {
				String[] array_PictureDetailXidaoHolders = array_PictureDetailXidaoHolder.split(",");
				for (int i = 0; i < array_PictureDetailXidaoHolders.length; i++) {
					if (array_PictureDetailXidaoHolders[i] != null && !"".equals(array_PictureDetailXidaoHolders[i])) {
						para.put("url_PictureDetailXidaoHolder", array_PictureDetailXidaoHolders[i]);
						xidaoHolderService.savePictureDetailXidaoHolder(para);
					}
				}
			}

			// 清空详细信息路径
			xidaoHolderService.clearInformDetailXidaoHolderByIdXidaoHolder(para);
			// 保存详细信息
			if (array_InformDetailXidaoHolder != null && !"".equals(array_InformDetailXidaoHolder)) {
				String[] array_InformDetailXidaoHolders = array_InformDetailXidaoHolder.split(",");
				String[] array_InformDetailXidaoHolders_Name = array_InformDetailXidaoHolder_Name.split(",");

				for (int i = 0; i < array_InformDetailXidaoHolders.length; i++) {
					if (array_InformDetailXidaoHolders[i] != null && !"".equals(array_InformDetailXidaoHolders[i])) {
						para.put("url_InformDetailXidaoHolder", array_InformDetailXidaoHolders[i]);
						para.put("name_InformDetailXidaoHolder", array_InformDetailXidaoHolders_Name[i]);
						xidaoHolderService.saveInformDetailXidaoHolder(para);
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
	 * 
	 * @param id_XidaoHolder
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteXidaoHolder")
	public String deleteXidaoHolder(String id_XidaoHolder) {
		Map<String,Object> para = new HashMap<String,Object>();
		para.put("id_XidaoHolder", id_XidaoHolder);
		try {
			// 清空刀柄图片路径
			xidaoHolderService.clearPictureXidaoHolderByIdXidaoHolder(para);
			// 清空详细图片路径
			xidaoHolderService.clearPictureDetailXidaoHolderByIdXidaoHolder(para);
			// 清空详细信息路径
			xidaoHolderService.clearInformDetailXidaoHolderByIdXidaoHolder(para);
			// 删除深孔钻数据
			xidaoHolderService.deleteXidaoHolder(para);
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}
		return "1";
	}

}
