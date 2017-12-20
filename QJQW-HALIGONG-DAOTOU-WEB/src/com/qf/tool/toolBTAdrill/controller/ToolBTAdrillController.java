package com.qf.tool.toolBTAdrill.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.qf.tool.toolBTAdrill.service.ToolBTAdrillService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.common.JackJson;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;

/**
 *
 * 项目名称：qf 类名称：SystemUserController 类描述：用户管理 创建人：周广文 创建时间：2015年5月13日 下午2:02:00
 * 修改人：周广文 修改时间：2015年5月13日 下午2:02:00 修改备注：
 * 
 * @version
 *
 */
@Controller
@RequestMapping("/toolBTAdrill")
public class ToolBTAdrillController extends BaseController {

	@Resource(name = "toolBTAdrillService")
	private ToolBTAdrillService toolBTAdrillService;

	@RequestMapping("queryToolBTAdrillList")
	public ModelAndView queryToolBTAdrillList(Page page, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();//每页数据
		
		try {

			pd = this.getPageData();
			page.setPd(pd);
			Map map = toolBTAdrillService.queryToolBTAdrillList(page);// 查询深孔钻列表
			page = (Page) map.get("page");
			List<Map> list = (List<Map>) map.get("list");
			if (list != null && list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					Map toolBTAdrill = list.get(i);
					System.out.println(list.get(i).size());
					int id_BTADrill = (int) toolBTAdrill.get("id_BTADrill");

					Map para = new HashMap();
					para.put("id_BTADrill", id_BTADrill);

					// 查询刀具图片列表 PictureBTADrill
					List<Map> pictureBTADrillList = toolBTAdrillService.queryPictureBTADrillList(para);
					// 查询详细图片列表 PictureDetailBTADrill
					List<Map> pictureDetailBTADrill = toolBTAdrillService.queryPictureDetailBTADrillList(para);
					// 查询详细信息列表 InformDetailBTADrill
					List<Map> informDetailBTADrillList = toolBTAdrillService.queryInformDetailBTADrillList(para);
					// 查询应用实例列表 ApplicationBTADrill
					List<Map> applicationBTADrillList = toolBTAdrillService.queryApplicationBTADrillList(para);

					toolBTAdrill.put("pictureBTADrillList", pictureBTADrillList);
					toolBTAdrill.put("pictureDetailBTADrillList", pictureDetailBTADrill);
					toolBTAdrill.put("informDetailBTADrillList", informDetailBTADrillList);
					toolBTAdrill.put("applicationBTADrillList", applicationBTADrillList);
					list.set(i, toolBTAdrill);
				}
			}

			mv.addObject("toolBTAdrillList", list);
			mv.addObject("pd", pd);
			mv.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/tool/toolBTAdrill/toolBTAdrillList");
		return mv;
	}

	/*
	 * 加载更多
	 */
	@ResponseBody
	@RequestMapping("leadMore")
	public Object leadMore(int number, String order, String asc, String NumberBTADrill, String TypeBTADrill,
			String NameBTADrill, String DiameterBTADrill, String MateriaBTAlDrill, String ToolMaterialBTADrill,
			String ToolCoatBTADrill, String BreakerBTADrill, String CompanyBTADrill, HttpServletRequest request) {

		String json = "";
		Map<String, Object> resultmap = new HashMap<String, Object>();

		PageData pd = new PageData();

		Page page = new Page(number, 10);
		try {

			pd.put("order", order);
			pd.put("asc", asc);
			pd.put("NumberBTADrill", NumberBTADrill);
			pd.put("TypeBTADrill", TypeBTADrill);
			pd.put("NameBTADrill", NameBTADrill);
			pd.put("DiameterBTADrill", DiameterBTADrill);
			pd.put("MateriaBTAlDrill", MateriaBTAlDrill);
			pd.put("ToolMaterialBTADrill", ToolMaterialBTADrill);
			pd.put("ToolCoatBTADrill", ToolCoatBTADrill);
			pd.put("BreakerBTADrill", BreakerBTADrill);
			pd.put("CompanyBTADrill", CompanyBTADrill);

			page.setPd(pd);
			Map map = toolBTAdrillService.queryToolBTAdrillList(page);// 查询深孔钻列表
			page = (Page) map.get("page");
			List<Map> list = (List<Map>) map.get("list");
			if (list != null && list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					Map toolBTAdrill = list.get(i);
					System.out.println(list.get(i).size());
					int id_BTADrill = (int) toolBTAdrill.get("id_BTADrill");

					Map para = new HashMap();
					para.put("id_BTADrill", id_BTADrill);

					// 查询图片列表 PictureBTADrill
					List<Map> pictureBTADrillList = toolBTAdrillService.queryPictureBTADrillList(para);
					// 查询详细图片列表 PictureDetailBTADrill
					List<Map> pictureDetailBTADrill = toolBTAdrillService.queryPictureDetailBTADrillList(para);
					// 查询详细信息列表 InformDetailBTADrill
					List<Map> informDetailBTADrillList = toolBTAdrillService.queryInformDetailBTADrillList(para);
					// 查询应用实例列表 ApplicationBTADrill
					List<Map> applicationBTADrillList = toolBTAdrillService.queryApplicationBTADrillList(para);

					toolBTAdrill.put("pictureBTADrillList", pictureBTADrillList);
					toolBTAdrill.put("pictureDetailBTADrillList", pictureDetailBTADrill);
					toolBTAdrill.put("informDetailBTADrillList", informDetailBTADrillList);
					toolBTAdrill.put("applicationBTADrillList", applicationBTADrillList);
					list.set(i, toolBTAdrill);
					resultmap.put("result", "1");
					resultmap.put("list", list);
					resultmap.put("number", ++number);
				}
			} else {
				resultmap.put("result", "0");
			}

		} catch (Exception e) {
			e.printStackTrace();
			resultmap.put("result", "0");
		}
		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}

	@ResponseBody
	@RequestMapping("queryToolBTAdrillListForApp")
	public String queryToolBTAdrillListForApp(int pageNo, int pageSize) {
		String json = "";
		Map resultmap = new HashMap();
		Map map = null;
		try {
			Page page = new Page();
			page.setPageNo(pageNo);
			page.setPageSize(pageSize);
			map = toolBTAdrillService.queryToolBTAdrillList(page);// 查询深孔钻列表
			List<Map> list = (List<Map>) map.get("list");
			if (list != null && list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					Map toolBTAdrill = list.get(i);
					int id_BTADrill = (int) toolBTAdrill.get("id_BTADrill");

					Map para = new HashMap();
					para.put("id_BTADrill", id_BTADrill);

					// 查询刀具图片列表 PictureBTADrill
					List<Map> pictureBTADrillList = toolBTAdrillService.queryPictureBTADrillList(para);
					// 查询详细图片列表 PictureDetailBTADrill
					List<Map> pictureDetailBTADrill = toolBTAdrillService.queryPictureDetailBTADrillList(para);
					// 查询详细信息列表 InformDetailBTADrill
					List<Map> informDetailBTADrillList = toolBTAdrillService.queryInformDetailBTADrillList(para);
					// 查询应用实例列表 ApplicationBTADrill
					List<Map> applicationBTADrillList = toolBTAdrillService.queryApplicationBTADrillList(para);

					toolBTAdrill.put("pictureBTADrillList", pictureBTADrillList);
					toolBTAdrill.put("pictureDetailBTADrill", pictureDetailBTADrill);
					toolBTAdrill.put("informDetailBTADrillList", informDetailBTADrillList);
					toolBTAdrill.put("applicationBTADrillList", applicationBTADrillList);
					list.set(i, toolBTAdrill);
				}
			}
			resultmap.put("result", "1");
			resultmap.put("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			resultmap.put("result", "0");
		}

		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}

	/**
	 * 去新增深孔钻页面
	 */
	@RequestMapping(value = "/goAddToolBTAdrill")
	public ModelAndView goAddToolBTAdrill(String id, String turn_url) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		Map para = new HashMap();
		para.put("id_BTADrill", id);
		Map toolBTAdrill = toolBTAdrillService.queryToolBTAdrillById(para);// 查询深孔钻
		if (toolBTAdrill != null) {
			String isPMKNS = (String) toolBTAdrill.get("isPMKNS");
			if ("P".equals(isPMKNS)) {
				toolBTAdrill.put("ISOTextBTADrill", toolBTAdrill.get("ISOPTextBTADrill"));
			} else if ("M".equals(isPMKNS)) {
				toolBTAdrill.put("ISOTextBTADrill", toolBTAdrill.get("ISOMTextBTADrill"));
			} else if ("K".equals(isPMKNS)) {
				toolBTAdrill.put("ISOTextBTADrill", toolBTAdrill.get("ISOKTextBTADrill"));
			} else if ("N".equals(isPMKNS)) {
				toolBTAdrill.put("ISOTextBTADrill", toolBTAdrill.get("ISONTextBTADrill"));
			} else if ("S".equals(isPMKNS)) {
				toolBTAdrill.put("ISOTextBTADrill", toolBTAdrill.get("ISOSTextBTADrill"));
			}

			// 查询刀具图片列表 PictureBTADrill “图片地址1”，“图片地址2”，“...”
			List<Map> pictureBTADrillList = toolBTAdrillService.queryPictureBTADrillList(para);
			String array_PictureBTADrill = "";
			if (pictureBTADrillList != null && pictureBTADrillList.size() > 0) {
				for (int i = 0; i < pictureBTADrillList.size(); i++) {
					array_PictureBTADrill = array_PictureBTADrill
							+ pictureBTADrillList.get(i).get("url_PictureBTADrill") + ",";
				}
			}

			// 查询详细图片列表 PictureDetailBTADrill
			List<Map> pictureDetailBTADrillList = toolBTAdrillService.queryPictureDetailBTADrillList(para);
			String array_PictureDetailBTADrill = "";
			if (pictureDetailBTADrillList != null && pictureDetailBTADrillList.size() > 0) {
				for (int i = 0; i < pictureDetailBTADrillList.size(); i++) {
					array_PictureDetailBTADrill = array_PictureDetailBTADrill
							+ pictureDetailBTADrillList.get(i).get("url_PictureDetailBTADrill") + ",";
				}
			}

			// 查询详细信息列表 InformDetailBTADrill
			List<Map> informDetailBTADrillList = toolBTAdrillService.queryInformDetailBTADrillList(para);
			String array_InformDetailBTADrill = "";
			String array_InformDetailBTADrill_name = "";
			if (informDetailBTADrillList != null && informDetailBTADrillList.size() > 0) {
				for (int i = 0; i < informDetailBTADrillList.size(); i++) {
					array_InformDetailBTADrill = array_InformDetailBTADrill
							+ informDetailBTADrillList.get(i).get("url_InformDetailBTADrill") + ",";
					array_InformDetailBTADrill_name = array_InformDetailBTADrill_name
							+ informDetailBTADrillList.get(i).get("name_InformDetailBTADrill") + ",";
				}
			}

			// 查询应用实例列表 ApplicationBTADrill
			List<Map> applicationBTADrillList = toolBTAdrillService.queryApplicationBTADrillList(para);
			String array_ApplicationBTADrill = "";
			String array_ApplicationBTADrill_name = "";
			if (applicationBTADrillList != null && applicationBTADrillList.size() > 0) {
				for (int i = 0; i < applicationBTADrillList.size(); i++) {
					array_ApplicationBTADrill = array_ApplicationBTADrill
							+ applicationBTADrillList.get(i).get("url_ApplicationBTADrill") + ",";
					array_ApplicationBTADrill_name = array_ApplicationBTADrill_name
							+ applicationBTADrillList.get(i).get("name_ApplicationBTADrill") + ",";

				}
			}

			toolBTAdrill.put("pictureBTADrillList", pictureBTADrillList);
			toolBTAdrill.put("pictureDetailBTADrillList", pictureDetailBTADrillList);
			toolBTAdrill.put("informDetailBTADrillList", informDetailBTADrillList);
			toolBTAdrill.put("applicationBTADrillList", applicationBTADrillList);

			mv.addObject("array_PictureBTADrill", array_PictureBTADrill);
			mv.addObject("array_PictureDetailBTADrill", array_PictureDetailBTADrill);
			mv.addObject("array_InformDetailBTADrill", array_InformDetailBTADrill);
			mv.addObject("array_InformDetailBTADrill_name", array_InformDetailBTADrill_name);
			mv.addObject("array_ApplicationBTADrill", array_ApplicationBTADrill);
			mv.addObject("array_ApplicationBTADrill_name", array_ApplicationBTADrill_name);
		}

		mv.setViewName("/WEB-INF/tool/toolBTAdrill/toolBTAdrill_edit");
		mv.addObject("msg", "saveToolBTAdrill");
		mv.addObject("turn_url", turn_url);
		mv.addObject("toolBTAdrill", toolBTAdrill);

		mv.addObject("pd", pd);

		return mv;
	}

	@ResponseBody
	@RequestMapping("/saveToolBTAdrill")
	public String saveToolBTAdrill(HttpServletRequest request, int id_BTADrill, String NumberBTADrill,
			String TypeBTADrill, String NameBTADrill, String DiameterBTADrill, String MateriaBTAlDrill,
			String ToolMaterialBTADrill, String ToolCoatBTADrill, String BreakerBTADrill, String CompanyBTADrill,
			String isPMKNS, String ISOPTextBTADrill, String ISOMTextBTADrill, String ISOKTextBTADrill,
			String ISONTextBTADrill, String ISOSTextBTADrill, String array_PictureBTADrill,
			String array_PictureDetailBTADrill, String array_InformDetailBTADrill,
			String array_InformDetailBTADrill_name, String array_ApplicationBTADrill,
			String array_ApplicationBTADrill_name) {
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		Map para = new HashMap();
		para.put("id_BTADrill", id_BTADrill);
		para.put("NumberBTADrill", NumberBTADrill);
		para.put("TypeBTADrill", TypeBTADrill);
		para.put("NameBTADrill", NameBTADrill);
		if (DiameterBTADrill == null || "".equals(DiameterBTADrill)) {
			para.put("DiameterBTADrill", "0");
		} else {
			para.put("DiameterBTADrill", DiameterBTADrill);
		}

		para.put("MateriaBTAlDrill", MateriaBTAlDrill);
		para.put("ToolMaterialBTADrill", ToolMaterialBTADrill);
		para.put("ToolCoatBTADrill", ToolCoatBTADrill);
		para.put("BreakerBTADrill", BreakerBTADrill);
		para.put("CompanyBTADrill", CompanyBTADrill);
		para.put("isPMKNS", isPMKNS);
		if (isPMKNS != null && !"".equals(isPMKNS)) {
			if (isPMKNS.contains("P")) {// 1 加工P 2 加工M 3 加工K 4 加工N 5 加工S
				para.put("ISOPBTADrill", "1");
				para.put("ISOPTextBTADrill", ISOPTextBTADrill);
			}
			if (isPMKNS.contains("M")) {// 1 加工P 2 加工M 3 加工K 4 加工N 5 加工S
				para.put("ISOMBTADrill", "1");
				para.put("ISOMTextBTADrill", ISOMTextBTADrill);
			}
			if (isPMKNS.contains("K")) {// 1 加工P 2 加工M 3 加工K 4 加工N 5 加工S
				para.put("ISOKBTADrill", "1");
				para.put("ISOKTextBTADrill", ISOKTextBTADrill);
			}
			if (isPMKNS.contains("N")) {// 1 加工P 2 加工M 3 加工K 4 加工N 5 加工S
				para.put("ISONBTADrill", "1");
				para.put("ISONTextBTADrill", ISONTextBTADrill);
			}
			if (isPMKNS.contains("S")) {// 1 加工P 2 加工M 3 加工K 4 加工N 5 加工S
				para.put("ISOSBTADrill", "1");
				para.put("ISOSTextBTADrill", ISOSTextBTADrill);
			}
		}
		para.put("add_time", System.currentTimeMillis() / 1000);
		if (user != null) {
			para.put("user_id", user.get("user_id"));
		} else {
			para.put("user_id", 0);
		}
		try {
			if (id_BTADrill != 0) {// 修改
				toolBTAdrillService.updateToolBTAdrill(para);
			} else {// 新增

				toolBTAdrillService.saveToolBTAdrill(para);
			}
			// 清空刀具图片路径
			toolBTAdrillService.clearPictureBTADrillByIdBTADrill(para);
			// 保存刀具图片
			if (array_PictureBTADrill != null && !"".equals(array_PictureBTADrill)) {
				String array_PictureBTADrills[] = array_PictureBTADrill.split(",");
				for (int i = 0; i < array_PictureBTADrills.length; i++) {
					if (array_PictureBTADrills[i] != null && !"".equals(array_PictureBTADrills[i])) {
						para.put("url_PictureBTADrill", array_PictureBTADrills[i]);
						toolBTAdrillService.savePictureBTADrill(para);
					}
				}
			}

			// 清空详细图片路径
			toolBTAdrillService.clearPictureDetailBTADrillByIdBTADrill(para);
			// 保存详细图片
			if (array_PictureDetailBTADrill != null && !"".equals(array_PictureDetailBTADrill)) {
				String array_PictureDetailBTADrills[] = array_PictureDetailBTADrill.split(",");
				for (int i = 0; i < array_PictureDetailBTADrills.length; i++) {
					if (array_PictureDetailBTADrills[i] != null && !"".equals(array_PictureDetailBTADrills[i])) {
						para.put("url_PictureDetailBTADrill", array_PictureDetailBTADrills[i]);
						toolBTAdrillService.savePictureDetailBTADrill(para);
					}
				}
			}

			// 清空应用实例路径
			toolBTAdrillService.clearApplicationBTADrillByIdBTADrill(para);
			// 保存应用实例
			if (array_ApplicationBTADrill != null && !"".equals(array_ApplicationBTADrill)) {
				String array_ApplicationBTADrills[] = array_ApplicationBTADrill.split(",");
				String array_ApplicationBTADrills_name[] = array_ApplicationBTADrill_name.split(",");
				for (int i = 0; i < array_ApplicationBTADrills.length; i++) {
					if (array_ApplicationBTADrills[i] != null && !"".equals(array_ApplicationBTADrills[i])) {
						para.put("url_ApplicationBTADrill", array_ApplicationBTADrills[i]);
						para.put("name_ApplicationBTADrill", array_ApplicationBTADrills_name[i]);
						toolBTAdrillService.saveApplicationBTADrill(para);
					}
				}
			}

			// 清空详细信息路径
			toolBTAdrillService.clearInformDetailBTADrillByIdBTADrill(para);
			// 保存详细信息
			if (array_InformDetailBTADrill != null && !"".equals(array_InformDetailBTADrill)) {
				String array_InformDetailBTADrills[] = array_InformDetailBTADrill.split(",");
				String array_InformDetailBTADrills_name[] = array_InformDetailBTADrill_name.split(",");

				for (int i = 0; i < array_InformDetailBTADrills.length; i++) {
					if (array_InformDetailBTADrills[i] != null && !"".equals(array_InformDetailBTADrills[i])) {
						para.put("url_InformDetailBTADrill", array_InformDetailBTADrills[i]);
						para.put("name_InformDetailBTADrill", array_InformDetailBTADrills_name[i]);
						toolBTAdrillService.saveInformDetailBTADrill(para);
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
	 * 去刀具图片页面
	 */
	@RequestMapping(value = "/goAddPictureBTADrillList")
	public ModelAndView goAddPictureBTADrillList(String id_BTADrill) throws Exception {
		ModelAndView mv = this.getModelAndView();

		mv.setViewName("/WEB-INF/tool/toolBTAdrill/pictureBTADrill_add");
		mv.addObject("msg", "savePictureBTADrill");
		mv.addObject("id_BTADrill", id_BTADrill);

		return mv;
	}

	/**
	 * 保存刀具图片
	 * 
	 * @param id_BTADrill
	 * @param PictureBTADrill
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/savePictureBTADrill")
	public ModelAndView savePictureBTADrill(String id_BTADrill, String array_PictureBTADrill,
			String array_PictureDetailBTADrill, String array_ApplicationBTADrill, String array_ApplicationBTADrill_name,
			String array_InformDetailBTADrill, String array_InformDetailBTADrill_name,
			@RequestParam(value = "PictureBTADrill", required = false) CommonsMultipartFile PictureBTADrill,
			String NumberBTADrill, String TypeBTADrill, String NameBTADrill, String DiameterBTADrill,
			String MateriaBTAlDrill, String ToolMaterialBTADrill, String ToolCoatBTADrill, String BreakerBTADrill,
			String CompanyBTADrill, String isPMKNS, String ISOPTextBTADrill, String ISOMTextBTADrill,
			String ISOKTextBTADrill, String ISONTextBTADrill, String ISOSTextBTADrill, HttpServletRequest request)
					throws Exception {
		Map toolBTAdrill = new HashMap();
		toolBTAdrill.put("id_BTADrill", id_BTADrill);
		toolBTAdrill.put("NumberBTADrill", NumberBTADrill);
		toolBTAdrill.put("TypeBTADrill", TypeBTADrill);
		toolBTAdrill.put("NameBTADrill", NameBTADrill);
		toolBTAdrill.put("DiameterBTADrill", DiameterBTADrill);
		toolBTAdrill.put("MateriaBTAlDrill", MateriaBTAlDrill);
		toolBTAdrill.put("ToolMaterialBTADrill", ToolMaterialBTADrill);
		toolBTAdrill.put("ToolCoatBTADrill", ToolCoatBTADrill);
		toolBTAdrill.put("BreakerBTADrill", BreakerBTADrill);
		toolBTAdrill.put("CompanyBTADrill", CompanyBTADrill);
		toolBTAdrill.put("isPMKNS", isPMKNS);
		toolBTAdrill.put("ISOPTextBTADrill", ISOPTextBTADrill);
		toolBTAdrill.put("ISOMTextBTADrill", ISOMTextBTADrill);
		toolBTAdrill.put("ISOKTextBTADrill", ISOKTextBTADrill);
		toolBTAdrill.put("ISONTextBTADrill", ISONTextBTADrill);
		toolBTAdrill.put("ISOSTextBTADrill", ISOSTextBTADrill);

		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureBTADrillMap = new HashMap();

		String OriginalFilename = PictureBTADrill.getOriginalFilename();
		if (OriginalFilename != null && !"".equals(OriginalFilename)) {
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase();
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 = request.getSession().getServletContext()
					.getRealPath("/goods/picturebtadrill/" + big_url + "." + fileSuffix);

			File materials_big_img_file = new File(filepath1);

			PictureBTADrill.transferTo(materials_big_img_file);
			PictureBTADrillMap.put("url_PictureBTADrill", "/picturebtadrill/" + big_url + "." + fileSuffix);
			PictureBTADrillMap.put("id_BTADrill", id_BTADrill);
			array_PictureBTADrill = array_PictureBTADrill + "/picturebtadrill/" + big_url + "." + fileSuffix + ",";

		} else {

		}

		mv.addObject("array_PictureBTADrill", array_PictureBTADrill);
		mv.addObject("array_PictureDetailBTADrill", array_PictureDetailBTADrill);
		mv.addObject("array_ApplicationBTADrill", array_ApplicationBTADrill);
		mv.addObject("array_ApplicationBTADrill_name", array_ApplicationBTADrill_name);
		mv.addObject("array_InformDetailBTADrill", array_InformDetailBTADrill);
		mv.addObject("array_InformDetailBTADrill_name", array_InformDetailBTADrill_name);
		mv.addObject("toolBTAdrill", toolBTAdrill);
		mv.setViewName("/WEB-INF/tool/toolBTAdrill/toolBTAdrill_edit");

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
	@RequestMapping(value = "/savePictureDetailBTADrill")
	public ModelAndView savePictureDetailBTADrill(String id_BTADrill, String array_PictureBTADrill,
			String array_PictureDetailBTADrill, String array_ApplicationBTADrill, String array_ApplicationBTADrill_name,
			String array_InformDetailBTADrill, String array_InformDetailBTADrill_name,
			@RequestParam(value = "PictureDetailBTADrill", required = false) CommonsMultipartFile PictureDetailBTADrill,
			String NumberBTADrill, String TypeBTADrill, String NameBTADrill, String DiameterBTADrill,
			String MateriaBTAlDrill, String ToolMaterialBTADrill, String ToolCoatBTADrill, String BreakerBTADrill,
			String CompanyBTADrill, String isPMKNS, String ISOPTextBTADrill, String ISOMTextBTADrill,
			String ISOKTextBTADrill, String ISONTextBTADrill, String ISOSTextBTADrill, HttpServletRequest request)
					throws Exception {
		Map toolBTAdrill = new HashMap();
		toolBTAdrill.put("id_BTADrill", id_BTADrill);
		toolBTAdrill.put("NumberBTADrill", NumberBTADrill);
		toolBTAdrill.put("TypeBTADrill", TypeBTADrill);
		toolBTAdrill.put("NameBTADrill", NameBTADrill);
		toolBTAdrill.put("DiameterBTADrill", DiameterBTADrill);
		toolBTAdrill.put("MateriaBTAlDrill", MateriaBTAlDrill);
		toolBTAdrill.put("ToolMaterialBTADrill", ToolMaterialBTADrill);
		toolBTAdrill.put("ToolCoatBTADrill", ToolCoatBTADrill);
		toolBTAdrill.put("BreakerBTADrill", BreakerBTADrill);
		toolBTAdrill.put("CompanyBTADrill", CompanyBTADrill);
		toolBTAdrill.put("isPMKNS", isPMKNS);
		toolBTAdrill.put("ISOPTextBTADrill", ISOPTextBTADrill);
		toolBTAdrill.put("ISOMTextBTADrill", ISOMTextBTADrill);
		toolBTAdrill.put("ISOKTextBTADrill", ISOKTextBTADrill);
		toolBTAdrill.put("ISONTextBTADrill", ISONTextBTADrill);
		toolBTAdrill.put("ISOSTextBTADrill", ISOSTextBTADrill);

		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureBTADrillMap = new HashMap();

		String OriginalFilename = PictureDetailBTADrill.getOriginalFilename();
		if (OriginalFilename != null && !"".equals(OriginalFilename)) {
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase();
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 = request.getSession().getServletContext()
					.getRealPath("/goods/pictureDetailBTADrill/" + big_url + "." + fileSuffix);

			File materials_big_img_file = new File(filepath1);

			PictureDetailBTADrill.transferTo(materials_big_img_file);
			PictureBTADrillMap.put("url_PictureDetailBTADrill", "/pictureDetailBTADrill/" + big_url + "." + fileSuffix);
			PictureBTADrillMap.put("id_BTADrill", id_BTADrill);
			array_PictureDetailBTADrill = array_PictureDetailBTADrill + "/pictureDetailBTADrill/" + big_url + "."
					+ fileSuffix + ",";

		} else {

		}

		mv.addObject("array_PictureBTADrill", array_PictureBTADrill);
		mv.addObject("array_PictureDetailBTADrill", array_PictureDetailBTADrill);
		mv.addObject("array_ApplicationBTADrill", array_ApplicationBTADrill);
		mv.addObject("array_ApplicationBTADrill_name", array_ApplicationBTADrill_name);
		mv.addObject("array_InformDetailBTADrill", array_InformDetailBTADrill);
		mv.addObject("array_InformDetailBTADrill_name", array_InformDetailBTADrill_name);

		mv.addObject("toolBTAdrill", toolBTAdrill);
		mv.setViewName("/WEB-INF/tool/toolBTAdrill/toolBTAdrill_edit");

		return mv;

	}

	/**
	 * 保存应用实例
	 * 
	 * @param id_BTADrill
	 * @param PictureBTADrill
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/saveApplicationBTADrill")
	public ModelAndView saveApplicationBTADrill(String id_BTADrill, String array_PictureBTADrill,
			String array_PictureDetailBTADrill, String array_ApplicationBTADrill, String array_ApplicationBTADrill_name,
			String array_InformDetailBTADrill, String array_InformDetailBTADrill_name,
			@RequestParam(value = "ApplicationBTADrill", required = false) CommonsMultipartFile ApplicationBTADrill,
			String NumberBTADrill, String TypeBTADrill, String NameBTADrill, String DiameterBTADrill,
			String MateriaBTAlDrill, String ToolMaterialBTADrill, String ToolCoatBTADrill, String BreakerBTADrill,
			String CompanyBTADrill, String isPMKNS, String ISOPTextBTADrill, String ISOMTextBTADrill,
			String ISOKTextBTADrill, String ISONTextBTADrill, String ISOSTextBTADrill, HttpServletRequest request)
					throws Exception {
		Map toolBTAdrill = new HashMap();
		toolBTAdrill.put("id_BTADrill", id_BTADrill);
		toolBTAdrill.put("NumberBTADrill", NumberBTADrill);
		toolBTAdrill.put("TypeBTADrill", TypeBTADrill);
		toolBTAdrill.put("NameBTADrill", NameBTADrill);
		toolBTAdrill.put("DiameterBTADrill", DiameterBTADrill);
		toolBTAdrill.put("MateriaBTAlDrill", MateriaBTAlDrill);
		toolBTAdrill.put("ToolMaterialBTADrill", ToolMaterialBTADrill);
		toolBTAdrill.put("ToolCoatBTADrill", ToolCoatBTADrill);
		toolBTAdrill.put("BreakerBTADrill", BreakerBTADrill);
		toolBTAdrill.put("CompanyBTADrill", CompanyBTADrill);
		toolBTAdrill.put("isPMKNS", isPMKNS);
		toolBTAdrill.put("ISOPTextBTADrill", ISOPTextBTADrill);
		toolBTAdrill.put("ISOMTextBTADrill", ISOMTextBTADrill);
		toolBTAdrill.put("ISOKTextBTADrill", ISOKTextBTADrill);
		toolBTAdrill.put("ISONTextBTADrill", ISONTextBTADrill);
		toolBTAdrill.put("ISOSTextBTADrill", ISOSTextBTADrill);

		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureBTADrillMap = new HashMap();

		String OriginalFilename = ApplicationBTADrill.getOriginalFilename();
		if (OriginalFilename != null && !"".equals(OriginalFilename)) {
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase();
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 = request.getSession().getServletContext()
					.getRealPath("/goods/applicationBTADrill/" + big_url + "." + fileSuffix);

			File materials_big_img_file = new File(filepath1);

			ApplicationBTADrill.transferTo(materials_big_img_file);
			PictureBTADrillMap.put("url_ApplicationBTADrill", "/applicationBTADrill/" + big_url + "." + fileSuffix);
			PictureBTADrillMap.put("id_BTADrill", id_BTADrill);
			array_ApplicationBTADrill = array_ApplicationBTADrill + "/applicationBTADrill/" + big_url + "." + fileSuffix
					+ ",";
			array_ApplicationBTADrill_name = array_ApplicationBTADrill_name + OriginalFilename + ",";

		} else {

		}

		mv.addObject("array_PictureBTADrill", array_PictureBTADrill);
		mv.addObject("array_PictureDetailBTADrill", array_PictureDetailBTADrill);
		mv.addObject("array_ApplicationBTADrill", array_ApplicationBTADrill);
		mv.addObject("array_ApplicationBTADrill_name", array_ApplicationBTADrill_name);
		mv.addObject("array_InformDetailBTADrill", array_InformDetailBTADrill);
		mv.addObject("array_InformDetailBTADrill_name", array_InformDetailBTADrill_name);
		mv.addObject("toolBTAdrill", toolBTAdrill);
		mv.setViewName("/WEB-INF/tool/toolBTAdrill/toolBTAdrill_edit");

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
	@RequestMapping(value = "/saveInformDetailBTADrill")
	public ModelAndView saveInformDetailBTADrill(String id_BTADrill, String array_PictureBTADrill,
			String array_PictureDetailBTADrill, String array_ApplicationBTADrill, String array_ApplicationBTADrill_name,
			String array_InformDetailBTADrill, String array_InformDetailBTADrill_name,
			@RequestParam(value = "InformDetailBTADrill", required = false) CommonsMultipartFile InformDetailBTADrill,
			String NumberBTADrill, String TypeBTADrill, String NameBTADrill, String DiameterBTADrill,
			String MateriaBTAlDrill, String ToolMaterialBTADrill, String ToolCoatBTADrill, String BreakerBTADrill,
			String CompanyBTADrill, String isPMKNS, String ISOPTextBTADrill, String ISOMTextBTADrill,
			String ISOKTextBTADrill, String ISONTextBTADrill, String ISOSTextBTADrill, HttpServletRequest request)
					throws Exception {
		Map toolBTAdrill = new HashMap();
		toolBTAdrill.put("id_BTADrill", id_BTADrill);
		toolBTAdrill.put("NumberBTADrill", NumberBTADrill);
		toolBTAdrill.put("TypeBTADrill", TypeBTADrill);
		toolBTAdrill.put("NameBTADrill", NameBTADrill);
		toolBTAdrill.put("DiameterBTADrill", DiameterBTADrill);
		toolBTAdrill.put("MateriaBTAlDrill", MateriaBTAlDrill);
		toolBTAdrill.put("ToolMaterialBTADrill", ToolMaterialBTADrill);
		toolBTAdrill.put("ToolCoatBTADrill", ToolCoatBTADrill);
		toolBTAdrill.put("BreakerBTADrill", BreakerBTADrill);
		toolBTAdrill.put("CompanyBTADrill", CompanyBTADrill);
		toolBTAdrill.put("isPMKNS", isPMKNS);
		toolBTAdrill.put("ISOPTextBTADrill", ISOPTextBTADrill);
		toolBTAdrill.put("ISOMTextBTADrill", ISOMTextBTADrill);
		toolBTAdrill.put("ISOKTextBTADrill", ISOKTextBTADrill);
		toolBTAdrill.put("ISONTextBTADrill", ISONTextBTADrill);
		toolBTAdrill.put("ISOSTextBTADrill", ISOSTextBTADrill);

		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureBTADrillMap = new HashMap();

		String OriginalFilename = InformDetailBTADrill.getOriginalFilename();
		if (OriginalFilename != null && !"".equals(OriginalFilename)) {
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase();
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 = request.getSession().getServletContext()
					.getRealPath("/goods/informDetailBTADrill/" + big_url + "." + fileSuffix);

			File materials_big_img_file = new File(filepath1);

			InformDetailBTADrill.transferTo(materials_big_img_file);
			PictureBTADrillMap.put("url_InformDetailBTADrill", "/informDetailBTADrill/" + big_url + "." + fileSuffix);
			PictureBTADrillMap.put("id_BTADrill", id_BTADrill);
			array_InformDetailBTADrill = array_InformDetailBTADrill + "/informDetailBTADrill/" + big_url + "."
					+ fileSuffix + ",";
			array_InformDetailBTADrill_name = array_InformDetailBTADrill_name + OriginalFilename + ",";

		} else {

		}

		mv.addObject("array_PictureBTADrill", array_PictureBTADrill);
		mv.addObject("array_PictureDetailBTADrill", array_PictureDetailBTADrill);
		mv.addObject("array_ApplicationBTADrill", array_ApplicationBTADrill);
		mv.addObject("array_ApplicationBTADrill_name", array_ApplicationBTADrill_name);
		mv.addObject("array_InformDetailBTADrill", array_InformDetailBTADrill);
		mv.addObject("array_InformDetailBTADrill_name", array_InformDetailBTADrill_name);
		mv.addObject("toolBTAdrill", toolBTAdrill);
		mv.setViewName("/WEB-INF/tool/toolBTAdrill/toolBTAdrill_edit");

		return mv;

	}

	/**
	 * 删除深孔钻数据
	 * 
	 * @param id_BTADrill
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteToolBTAdrill")
	public String deleteToolBTAdrill(String id_BTADrill) {
		Map para = new HashMap();
		para.put("id_BTADrill", id_BTADrill);
		try {
			// 清空刀具图片路径
			toolBTAdrillService.clearPictureBTADrillByIdBTADrill(para);
			// 清空详细图片路径
			toolBTAdrillService.clearPictureDetailBTADrillByIdBTADrill(para);
			// 清空应用实例路径
			toolBTAdrillService.clearApplicationBTADrillByIdBTADrill(para);
			// 清空详细信息路径
			toolBTAdrillService.clearInformDetailBTADrillByIdBTADrill(para);
			// 删除深孔钻数据
			toolBTAdrillService.deleteToolBTAdrill(para);
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}
		return "1";
	}

	/**
	 * 批量导出
	 * 
	 * 运用POI
	 * 
	 * @param res
	 * @return
	 */

	@RequestMapping("exportExcel")
	public ModelAndView exportExcel(HttpServletResponse res, String ExportId) {
		ModelAndView mv = new ModelAndView();
		String[] ExportIdAll = ExportId.split(",");
		Map para = new HashMap<>();
		try {
			List<Map> list = new ArrayList<Map>();
			if (ExportId != null && !"".equals(ExportId)) {
				for (int i = 0; i < ExportIdAll.length; i++) {
					para.put("id_BTADrill", ExportIdAll[i]);
					list.add(toolBTAdrillService.queryToolBTAdrillById(para));
				}
			}

			// --------------------------分割----------------------------
			// 第一步，创建workbook
			HSSFWorkbook wb = new HSSFWorkbook();
			// 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet
			HSSFSheet sheet = wb.createSheet("表");
			// 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
			HSSFRow row = sheet.createRow((int) 0);
			// 第四步，创建单元格，并设置值表头 设置表头居中
			HSSFCellStyle style = wb.createCellStyle();
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式

			HSSFCell cell = row.createCell((short) 0); // 第1行 第一列
			cell.setCellValue("深孔钻ID");
			cell = row.createCell((short) 1); // 第一行 第二列， 以此类推
			cell.setCellValue("钻头编号");
			cell = row.createCell((short) 2);
			cell.setCellValue("钻头类型");
			cell = row.createCell((short) 3);
			cell.setCellValue("钻头名称");
			cell = row.createCell((short) 4);
			cell.setCellValue("加工直径");
			cell = row.createCell((short) 5);
			cell.setCellValue("加工材料");
			cell = row.createCell((short) 6);
			cell.setCellValue("刀具材料");
			cell = row.createCell((short) 7);
			cell.setCellValue("刀具涂层");
			cell = row.createCell((short) 8);
			cell.setCellValue("断屑槽类型");
			cell = row.createCell((short) 9);
			cell.setCellValue("加工参数");
			cell = row.createCell((short) 10);
			cell.setCellValue("加工P");
			cell = row.createCell((short) 11);
			cell.setCellValue("加工P参数");
			cell = row.createCell((short) 12);
			cell.setCellValue("加工M");
			cell = row.createCell((short) 13);
			cell.setCellValue("加工M参数");
			cell = row.createCell((short) 14);
			cell.setCellValue("加工K");
			cell = row.createCell((short) 15);
			cell.setCellValue("加工K参数");
			cell = row.createCell((short) 16);
			cell.setCellValue("加工N");
			cell = row.createCell((short) 17);
			cell.setCellValue("加工N参数");
			cell = row.createCell((short) 18);
			cell.setCellValue("加工S");
			cell = row.createCell((short) 19);
			cell.setCellValue("加工S参数");
			cell = row.createCell((short) 20);
			cell.setCellValue("生产厂家");
			cell = row.createCell((short) 21);
			cell.setCellStyle(style);
			System.out.println(list.toString());
			if (list != null && list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					row = sheet.createRow((int) i + 1);
					Map map = list.get(i);
					// 第四步，创建单元格，并设置值
					row.createCell((short) 0).setCellValue("" + map.get("id_BTADrill"));
					row.createCell((short) 1).setCellValue("" + map.get("NumberBTADrill"));
					row.createCell((short) 2).setCellValue("" + map.get("TypeBTADrill"));
					row.createCell((short) 3).setCellValue("" + map.get("NameBTADrill"));
					row.createCell((short) 4).setCellValue("" + map.get("DiameterBTADrill"));
					row.createCell((short) 5).setCellValue("" + map.get("MateriaBTAlDrill"));
					row.createCell((short) 6).setCellValue("" + map.get("ToolMaterialBTADrill"));
					row.createCell((short) 7).setCellValue("" + map.get("ToolCoatBTADrill"));
					row.createCell((short) 8).setCellValue("" + map.get("BreakerBTADrill"));
					row.createCell((short) 9).setCellValue("" + map.get("isPMKNS"));
					row.createCell((short) 10).setCellValue("" + map.get("ISOPBTADrill"));
					row.createCell((short) 11).setCellValue("" + map.get("ISOPTextBTADrill"));
					row.createCell((short) 12).setCellValue("" + map.get("ISOMBTADrill"));
					row.createCell((short) 13).setCellValue("" + map.get("ISOMTextBTADrill"));
					row.createCell((short) 14).setCellValue("" + map.get("ISOKBTADrill"));
					row.createCell((short) 15).setCellValue("" + map.get("ISOKTextBTADrill"));
					row.createCell((short) 16).setCellValue("" + map.get("ISONBTADrill"));
					row.createCell((short) 17).setCellValue("" + map.get("ISONTextBTADrill"));
					row.createCell((short) 18).setCellValue("" + map.get("ISOSBTADrill"));
					row.createCell((short) 19).setCellValue("" + map.get("ISOSTextBTADrill"));
					row.createCell((short) 20).setCellValue("" + map.get("CompanyBTADrill"));
				}
			}
			String fileName = "深孔钻信息表";
			ByteArrayOutputStream os = new ByteArrayOutputStream();
			wb.write(os);
			byte[] content = os.toByteArray();
			InputStream is = new ByteArrayInputStream(content);
			// 设置response参数，可以打开下载页面
			res.reset();
			res.setContentType("application/vnd.ms-excel;charset=utf-8");
			res.setHeader("Content-Disposition",
					"attachment;filename=" + new String((fileName + ".xls").getBytes(), "iso-8859-1"));
			ServletOutputStream out = res.getOutputStream();
			BufferedInputStream bis = null;
			BufferedOutputStream bos = null;
			try {
				bis = new BufferedInputStream(is);
				bos = new BufferedOutputStream(out);
				byte[] buff = new byte[2048];
				int bytesRead;
				while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
					bos.write(buff, 0, bytesRead);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (bis != null)
					bis.close();
				if (bos != null)
					bos.close();
			}

			// --------------------------分割-----------------------------
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 导出一条记录
	 * 
	 * @param res
	 * @return
	 */

	@RequestMapping("exportExcelOne")
	public ModelAndView exportExcelOne(String id, HttpServletResponse res) {
		ModelAndView mv = new ModelAndView();
		try {
			Map para = new HashMap();
			para.put("id_BTADrill", id);
			Map toolBTAdrill = toolBTAdrillService.queryToolBTAdrillById(para);// 查询深孔钻
			// --------------------------分割----------------------------
			// 第一步，创建workbook
			HSSFWorkbook wb = new HSSFWorkbook();
			// 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet
			HSSFSheet sheet = wb.createSheet("表");
			// 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
			HSSFRow row = sheet.createRow((int) 0);
			// 第四步，创建单元格，并设置值表头 设置表头居中
			HSSFCellStyle style = wb.createCellStyle();
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式

			HSSFCell cell = row.createCell((short) 0); // 第1行 第一列
			cell.setCellValue("深孔钻ID");
			cell = row.createCell((short) 1); // 第一行 第二列， 以此类推
			cell.setCellValue("钻头编号");
			cell = row.createCell((short) 2);
			cell.setCellValue("钻头类型");
			cell = row.createCell((short) 3);
			cell.setCellValue("钻头名称");
			cell = row.createCell((short) 4);
			cell.setCellValue("加工直径");
			cell = row.createCell((short) 5);
			cell.setCellValue("加工材料");
			cell = row.createCell((short) 6);
			cell.setCellValue("刀具材料");
			cell = row.createCell((short) 7);
			cell.setCellValue("刀具涂层");
			cell = row.createCell((short) 8);
			cell.setCellValue("断屑槽类型");
			cell = row.createCell((short) 9);
			cell.setCellValue("加工参数");
			cell = row.createCell((short) 10);
			cell.setCellValue("加工P");
			cell = row.createCell((short) 11);
			cell.setCellValue("加工P参数");
			cell = row.createCell((short) 12);
			cell.setCellValue("加工M");
			cell = row.createCell((short) 13);
			cell.setCellValue("加工M参数");
			cell = row.createCell((short) 14);
			cell.setCellValue("加工K");
			cell = row.createCell((short) 15);
			cell.setCellValue("加工K参数");
			cell = row.createCell((short) 16);
			cell.setCellValue("加工N");
			cell = row.createCell((short) 17);
			cell.setCellValue("加工N参数");
			cell = row.createCell((short) 18);
			cell.setCellValue("加工S");
			cell = row.createCell((short) 19);
			cell.setCellValue("加工S参数");
			cell = row.createCell((short) 20);
			cell.setCellValue("生产厂家");
			cell = row.createCell((short) 21);
			cell.setCellStyle(style);

			row = sheet.createRow((int) 1);
			// 第四步，创建单元格，并设置值
			row.createCell((short) 0).setCellValue("" + toolBTAdrill.get("id_BTADrill"));
			row.createCell((short) 1).setCellValue("" + toolBTAdrill.get("NumberBTADrill"));
			row.createCell((short) 2).setCellValue("" + toolBTAdrill.get("TypeBTADrill"));
			row.createCell((short) 3).setCellValue("" + toolBTAdrill.get("NameBTADrill"));
			row.createCell((short) 4).setCellValue("" + toolBTAdrill.get("DiameterBTADrill"));
			row.createCell((short) 5).setCellValue("" + toolBTAdrill.get("MateriaBTAlDrill"));
			row.createCell((short) 6).setCellValue("" + toolBTAdrill.get("ToolMaterialBTADrill"));
			row.createCell((short) 7).setCellValue("" + toolBTAdrill.get("ToolCoatBTADrill"));
			row.createCell((short) 8).setCellValue("" + toolBTAdrill.get("BreakerBTADrill"));
			row.createCell((short) 9).setCellValue("" + toolBTAdrill.get("isPMKNS"));
			row.createCell((short) 10).setCellValue("" + toolBTAdrill.get("ISOPBTADrill"));
			row.createCell((short) 11).setCellValue("" + toolBTAdrill.get("ISOPTextBTADrill"));
			row.createCell((short) 12).setCellValue("" + toolBTAdrill.get("ISOMBTADrill"));
			row.createCell((short) 13).setCellValue("" + toolBTAdrill.get("ISOMTextBTADrill"));
			row.createCell((short) 14).setCellValue("" + toolBTAdrill.get("ISOKBTADrill"));
			row.createCell((short) 15).setCellValue("" + toolBTAdrill.get("ISOKTextBTADrill"));
			row.createCell((short) 16).setCellValue("" + toolBTAdrill.get("ISONBTADrill"));
			row.createCell((short) 17).setCellValue("" + toolBTAdrill.get("ISONTextBTADrill"));
			row.createCell((short) 18).setCellValue("" + toolBTAdrill.get("ISOSBTADrill"));
			row.createCell((short) 19).setCellValue("" + toolBTAdrill.get("ISOSTextBTADrill"));
			row.createCell((short) 20).setCellValue("" + toolBTAdrill.get("CompanyBTADrill"));

			String fileName = "深孔钻信息表";
			ByteArrayOutputStream os = new ByteArrayOutputStream();
			wb.write(os);
			byte[] content = os.toByteArray();
			InputStream is = new ByteArrayInputStream(content);
			// 设置response参数，可以打开下载页面
			res.reset();
			res.setContentType("application/vnd.ms-excel;charset=utf-8");
			res.setHeader("Content-Disposition",
					"attachment;filename=" + new String((fileName + ".xls").getBytes(), "iso-8859-1"));
			ServletOutputStream out = res.getOutputStream();
			BufferedInputStream bis = null;
			BufferedOutputStream bos = null;
			try {
				bis = new BufferedInputStream(is);
				bos = new BufferedOutputStream(out);
				byte[] buff = new byte[2048];
				int bytesRead;
				while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
					bos.write(buff, 0, bytesRead);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (bis != null)
					bis.close();
				if (bos != null)
					bos.close();
			}
			// --------------------------分割-----------------------------
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 导出一条记录
	 * 
	 * @param res
	 * @return
	 */

	@RequestMapping("exportTXTOne")
	public ModelAndView exportTXTOne(String id, HttpServletResponse res) {
		ModelAndView mv = new ModelAndView();
		try {
			Map para = new HashMap();
			para.put("id_BTADrill", id);
			Map toolBTAdrill = toolBTAdrillService.queryToolBTAdrillById(para);// 查询深孔钻
			String fileName = "深孔钻信息表";
			String toolBTAdrill_str = toolBTAdrill.toString();
			System.out.println(toolBTAdrill_str);

			byte[] content = toolBTAdrill_str.getBytes();
			InputStream is = new ByteArrayInputStream(content);
			// 设置response参数，可以打开下载页面
			res.reset();
			res.setContentType("application/vnd.ms-excel;charset=utf-8");
			res.setHeader("Content-Disposition",
					"attachment;filename=" + new String((fileName + ".txt").getBytes(), "iso-8859-1"));
			ServletOutputStream out = res.getOutputStream();
			BufferedInputStream bis = null;
			BufferedOutputStream bos = null;
			try {
				bis = new BufferedInputStream(is);
				bos = new BufferedOutputStream(out);
				byte[] buff = new byte[2048];
				int bytesRead;
				while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
					bos.write(buff, 0, bytesRead);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (bis != null)
					bis.close();
				if (bos != null)
					bos.close();
			}
			// --------------------------分割-----------------------------
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@ResponseBody
	@RequestMapping("RunBat")
	public String RunBat() {

		String name = "" + System.currentTimeMillis();
		// 生成txt文件。

		String cmd = "cmd.exe /C start /b D:\\MatlabWork\\ceshi.bat";
		try {
			Process ps = Runtime.getRuntime().exec(cmd);
			while (true) {
				String[] fileName = getFileName("D:\\MatlabWork\\image");
				boolean boo = false;
				for (int i = 0; i < fileName.length; i++) {
					if (fileName[i].indexOf(name) >= 0) {
						boo = true;
						break;
					}
				}
				if (boo) {
					break;
				}
				Thread.sleep(10000);
			}

			return "1";
		} catch (Exception ioe) {
			ioe.printStackTrace();
			return "0";
		}
	}

	public static String[] getFileName(String path) {
		File file = new File(path);
		String[] fileName = file.list();
		return fileName;
	}

}
