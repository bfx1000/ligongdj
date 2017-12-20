package com.qf.tool.xidaoHolder.controller;

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

import com.qf.tool.xidaoHolder.service.xidaoHolderService;
import com.qf.util.PageData;
import com.qf.util.common.JackJson;
import com.qf.util.controller.BaseController;
import com.qf.util.file.ByteToFile;
import com.qf.util.page.Page;

/**
 * 
 * @ClassName:  XidaoHolderAppController   
 * @Description:TODO
 * @author: 	yinxf
 * @date:   	2017年10月26日 下午3:12:58   
 *
 */
@Controller
@RequestMapping("/xidaoHolderApp")
public class xidaoHolderAppController extends BaseController {

	@Resource(name = "xidaoHolderService")
	private xidaoHolderService xidaoHolderService;

	/**
	 * 查询xidao数据-刀柄列表
	 * 
	 * @param page
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "queryXidaoHolderList", produces = "application/json; charset=utf-8")
	public String queryXidaoHolderList(int pageNo, int pageSize, String numberXidaoHolder, String nameXidaoHolder,
			String typeXidaoHolder, String isoBladeXidao, String typeBlade, String diameterXidaoHolder,
			String companyXidaoHolder) {

		String json = "";
		Map<String, Object> resultmap = new HashMap<String, Object>();
		Map map = null;

		try {
			Page page = new Page(pageNo, pageSize);
			PageData pd = new PageData();

			pd.put("numberXidaoHolder", numberXidaoHolder);
			pd.put("nameXidaoHolder", nameXidaoHolder);
			pd.put("typeXidaoHolder", typeXidaoHolder);
			pd.put("isoBladeXidao", isoBladeXidao);
			pd.put("typeBlade", typeBlade);
			pd.put("diameterXidaoHolder", diameterXidaoHolder);
			pd.put("companyXidaoHolder", companyXidaoHolder);
			page.setPd(pd);

			// 查询车刀数据-刀柄列表
			map = xidaoHolderService.queryXidaoHolderList(page);
			page = (Page) map.get("page");
			List<Map> list = (List<Map>) map.get("list");
			if (list != null && list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					Map xidaoHolder = list.get(i);
					int id_XidaoHolder = (int) xidaoHolder.get("id_XidaoHolder");

					Map para = new HashMap();
					para.put("id_XidaoHolder", id_XidaoHolder);

					// 查询刀柄图片列表 PictureXidaoHolder
					List<Map> pictureXidaoHolderList = xidaoHolderService.queryPictureXidaoHolderList(para);
					// 查询详细图片列表 PictureDetailXidaoHolder
					List<Map> pictureDetailXidaoHolderList = xidaoHolderService.queryPictureDetailXidaoHolderList(para);
					// 查询详细信息列表 InformDetailXidaoHolder
					List<Map> informDetailXidaoHolderList = xidaoHolderService.queryInformDetailXidaoHolderList(para);

					xidaoHolder.put("pictureXidaoHolderList", pictureXidaoHolderList);
					xidaoHolder.put("pictureDetailXidaoHolderList", pictureDetailXidaoHolderList);
					xidaoHolder.put("informDetailXidaoHolderList", informDetailXidaoHolderList);
					list.set(i, xidaoHolder);
				}
				Map pageMap = new HashMap();
				int pageCount = page.getPageCount();
				pageMap.put("pageCount", pageCount);
				resultmap.put("page", pageMap);
			} else {
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
		para.put("numberXidaoHolder", numberXidaoHolder);
		para.put("nameXidaoHolder", nameXidaoHolder);
		para.put("typeXidaoHolder", typeXidaoHolder);
		para.put("isoBladeXidao", isoBladeXidao);
		para.put("typeBlade", typeBlade);
		para.put("diameterXidaoHolder", diameterXidaoHolder);
		para.put("companyXidaoHolder", companyXidaoHolder);
		resultmap.put("para", para);

		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}

	/**
	 * 去新增车刀数据-刀柄页面
	 */
	@ResponseBody
	@RequestMapping(value = "/goAddXidaoHolder", produces = "application/json; charset=utf-8")
	public String goAddXidaoHolder(String id) {
		String json = "";
		Map resultmap = new HashMap();
		Map map = null;

		Map para = new HashMap();
		para.put("id_XidaoHolder", id);
		
		// 查询车刀数据-刀柄数据
		Map xidaoHolder = xidaoHolderService.queryXidaoHolderById(para);
		if (xidaoHolder != null) {

			// 查询刀柄图片列表 PictureXidaoHolder
			List<Map> pictureXidaoHolderList = xidaoHolderService.queryPictureXidaoHolderList(para);
			String array_PictureXidaoHolder = "";
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

			resultmap.put("result", "1");
			resultmap.put("xidaoHolder", xidaoHolder);

			resultmap.put("array_PictureXidaoHolder", array_PictureXidaoHolder);
			resultmap.put("array_PictureDetailXidaoHolder", array_PictureDetailXidaoHolder);
			resultmap.put("array_InformDetailXidaoHolder", array_InformDetailXidaoHolder);
			resultmap.put("array_InformDetailXidaoHolder_Name", array_InformDetailXidaoHolder_Name);
		}

		// 查询ISO基准刀片 json
		List<String> ISOList = xidaoHolderService.queryIsoList();
		resultmap.put("ISOList", ISOList);

		json = JackJson.fromObjectToJson(resultmap);
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/savePictureXidaoHolder", produces = "application/json; charset=utf-8")
	public String savePictureXidaoHolder(String id_XidaoHolder, String array_PictureXidaoHolder,
			String array_PictureDetailXidaoHolder, String array_InformDetailXidaoHolder,
			String array_InformDetailXidaoHolder_Name, String PictureXidaoHolder, String fileSuffix, String filename)
			throws Exception {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();

		String json = "";
		Map resultmap = new HashMap();

		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureXidaoMap = new HashMap();

		if (PictureXidaoHolder != null) {
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 = request.getSession().getServletContext().getRealPath("/goods/pictureXidaoHolder/");
			String fileName = big_url + "." + fileSuffix;
			String filepath2 = request.getSession().getServletContext()
					.getRealPath("/goods/pictureXidaoHolder/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(PictureXidaoHolder, filepath2);
			array_PictureXidaoHolder = array_PictureXidaoHolder + "/pictureXidaoHolder/" + big_url + "." + fileSuffix
					+ ",";
		}

		resultmap.put("result", "1");
		resultmap.put("array_PictureXidaoHolder", array_PictureXidaoHolder);
		resultmap.put("array_PictureDetailXidaoHolder", array_PictureDetailXidaoHolder);
		resultmap.put("array_InformDetailXidaoHolder", array_InformDetailXidaoHolder);
		resultmap.put("array_InformDetailXidaoHolder_Name", array_InformDetailXidaoHolder_Name);

		json = JackJson.fromObjectToJson(resultmap);

		return json;

	}

	/**
	 * 保存详细图片
	 */
	@ResponseBody
	@RequestMapping(value = "/savePictureDetailXidaoHolder", produces = "application/json; charset=utf-8")
	public String savePictureDetailXidaoHolder(String id_XidaoHolder, String array_PictureXidaoHolder,
			String array_PictureDetailXidaoHolder, String array_InformDetailXidaoHolder,
			String array_InformDetailXidaoHolder_Name, String pictureDetailXidaoHolder, String fileSuffix,
			String filename) throws Exception {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();

		String json = "";
		Map resultmap = new HashMap();

		Map resultMap = new HashMap();
		if (pictureDetailXidaoHolder != null) {
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 = request.getSession().getServletContext().getRealPath("/goods/pictureDetailXidaoHolder/");
			String fileName = big_url + "." + fileSuffix;
			String filepath2 = request.getSession().getServletContext()
					.getRealPath("/goods/pictureDetailXidaoHolder/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(pictureDetailXidaoHolder, filepath2);
			array_PictureDetailXidaoHolder = array_PictureDetailXidaoHolder + "/pictureDetailXidaoHolder/" + big_url
					+ "." + fileSuffix + ",";
		}
		resultmap.put("result", "1");
		resultmap.put("array_PictureXidaoHolder", array_PictureXidaoHolder);
		resultmap.put("array_PictureDetailXidaoHolder", array_PictureDetailXidaoHolder);
		resultmap.put("array_InformDetailXidaoHolder", array_InformDetailXidaoHolder);
		resultmap.put("array_InformDetailXidaoHolder_Name", array_InformDetailXidaoHolder_Name);

		json = JackJson.fromObjectToJson(resultmap);

		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/saveInformDetailXidaoHolder", produces = "application/json; charset=utf-8")
	public String saveInformDetailXidaoHolder(String id_XidaoHolder, String array_PictureXidaoHolder,
			String array_PictureDetailXidaoHolder, String array_InformDetailXidaoHolder,
			String array_InformDetailXidaoHolder_Name, String informDetailXidaoHolder, String fileSuffix,
			String filename) throws Exception {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();

		String json = "";
		Map resultmap = new HashMap();

		Map resultMap = new HashMap();
		ModelAndView mv = this.getModelAndView();
		Map PictureXidaoMap = new HashMap();

		if (informDetailXidaoHolder != null) {
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 = request.getSession().getServletContext().getRealPath("/goods/informDetailXidaoHolder/");
			String fileName = big_url + "." + fileSuffix;
			String filepath2 = request.getSession().getServletContext()
					.getRealPath("/goods/informDetailXidaoHolder/" + big_url + "." + fileSuffix);
			ByteToFile.GenerateImage(informDetailXidaoHolder, filepath2);
			array_InformDetailXidaoHolder = array_InformDetailXidaoHolder + "/informDetailXidaoHolder/" + big_url + "."
					+ fileSuffix + ",";
			array_InformDetailXidaoHolder_Name = array_InformDetailXidaoHolder_Name + filename + ",";
		}

		resultmap.put("result", "1");
		resultmap.put("array_PictureXidaoHolder", array_PictureXidaoHolder);
		resultmap.put("array_PictureDetailXidaoHolder", array_PictureDetailXidaoHolder);
		resultmap.put("array_InformDetailXidaoHolder", array_InformDetailXidaoHolder);
		resultmap.put("array_InformDetailXidaoHolder_Name", array_InformDetailXidaoHolder_Name);

		json = JackJson.fromObjectToJson(resultmap);

		return json;

	}

	/**
	 * 保存刀柄数据（新增、修改）
	 * 
	 * @param user_id
	 * @param id_XidaoHolder
	 * @param array_PictureXidaoHolder
	 * @param array_PictureDetailXidaoHolder
	 * @param array_InformDetailXidaoHolder
	 * @param array_InformDetailXidaoHolder_Name
	 * @param numberXidaoHolder
	 * @param nameXidaoHolder
	 * @param typeXidaoHolder
	 * @param typeCustomXidaoHolder
	 * @param isoBladeXidao
	 * @param typeBlade
	 * @param typeCustomBlade
	 * @param diameterXidaoHolder
	 * @param companyXidaoHolder
	 * @param featureXidaoHolder
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/saveXidaoHolder", produces = "application/json; charset=utf-8")
	public String saveXidaoHolder(String user_id, int id_XidaoHolder, String array_PictureXidaoHolder,
			String array_PictureDetailXidaoHolder, String array_InformDetailXidaoHolder,
			String array_InformDetailXidaoHolder_Name, String numberXidaoHolder, String nameXidaoHolder,
			String typeXidaoHolder, String typeCustomXidaoHolder, String isoBladeXidao, String typeBlade,
			String typeCustomBlade, String diameterXidaoHolder, String companyXidaoHolder, String featureXidaoHolder) {

		String json = "";
		Map resultmap = new HashMap();

		Map para = new HashMap();

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
		para.put("user_id", user_id);
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
				String[] array_PictureXidaoHolders = array_PictureXidaoHolder.split(",");
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
	 * 删除车刀数据-刀柄
	 * 
	 * @param id_XidaoHolder
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteXidaoHolder", produces = "application/json; charset=utf-8")
	public String deleteXidaoHolder(String id_XidaoHolder) {
		String json = "";
		Map resultmap = new HashMap();

		Map para = new HashMap();
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
