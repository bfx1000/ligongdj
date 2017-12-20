package com.qf.productionManage.ProcessStep.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.qf.productionManage.ProcessStep.service.ProcessStepService;
import com.qf.util.PageData;
import com.qf.util.common.Const;
import com.qf.util.controller.BaseController;
import com.qf.util.page.Page;

@Controller
@RequestMapping("/ProcessStep")
public class ProcessStepController extends BaseController{

	@Resource(name = "ProcessStepService")
	private ProcessStepService processStepService;
	
	
	//列表
	@RequestMapping("/ProcessStepList")
	public ModelAndView ProcessStepList(Page page, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		PageData pd = new PageData();
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		try {
			
			pd = this.getPageData();
			
			String NoProcedureProcessFlow = ""+pd.get("NoProcedureProcessFlow");   //获取工序编号
			System.out.println(NoProcedureProcessFlow);
			if(pd.get("NoProcedureProcessFlow")!=null && !"".equals(NoProcedureProcessFlow)){
				/*
				 * 此if用来判断编号是否为空，不为空继续、为空直接返回页面，并提示用户输入编号
				 */
				Map WorkingProcedure = processStepService.queryWorkingProcedureList(NoProcedureProcessFlow);   //通过工序编号查找工序记录
				
				if(WorkingProcedure!=null && WorkingProcedure.size()>0){
					/*
					 * 此if用来判断编号是否正确。正确继续。不正确返回页面并提示。
					 */
					String id_ProcessFlow = ""+WorkingProcedure.get("id_ProcessFlow");	//通过工序记录获得工序ID
					System.out.println(id_ProcessFlow);
					Map ProcessFlow = processStepService.queryProcessFlowList(id_ProcessFlow);	//通过工序ID查找工艺流程记录
					
					String id_WorkingProcedure = ""+WorkingProcedure.get("id_WorkingProcedure");	//通过工序记录获得工序ID
					pd.put("id_WorkingProcedure", id_WorkingProcedure);	//将工序ID存入pageData中
					
					page.setPd(pd);
					Map map	= processStepService.queryProcessStepList(page);//查询工步信息
					page = (Page)map.get("page");
					List<Map> list = (List<Map>)map.get("list");	//工步List<Map>
					if(list != null && list.size() > 0){
						for(int i = 0; i < list.size(); i++){
							Map ProcessStep = list.get(i);
							int id_ProcessStep = (int) ProcessStep.get("id_ProcessStep");
							
							Map para = new HashMap();
							para.put("id_ProcessStep", id_ProcessStep);
							
							//查询图片列表 
							List<Map> PictureProcessStep = processStepService.queryPictureProcessStepList(para);
							
							ProcessStep.put("PictureProcessStep", PictureProcessStep);
							list.set(i, ProcessStep);
						}
					}
					mv.addObject("ProcessFlow", ProcessFlow);
					mv.addObject("WorkingProcedure", WorkingProcedure);
					mv.addObject("ProcessStep", list);
					mv.addObject("pd", pd);
					mv.addObject("page", page);
				}
				else{  //编号不正确时！
					System.out.println("输入的编号有误");
					mv.addObject("result", "输入的工序编号不存在！请重新输入！");
					mv.setViewName("/WEB-INF/productionManage/ProcessStep/ProcessStep_list");
					return mv;
				}
			}
			else{   //编号为空时！
				System.out.println("请输入编号！");
				mv.addObject("result", "请输入编号！");
				mv.setViewName("/WEB-INF/productionManage/ProcessStep/ProcessStep_list");
				return mv;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/WEB-INF/productionManage/ProcessStep/ProcessStep_list");
		return mv;
	}
	
	//去添加页面
	@RequestMapping(value="/goAddProcessStep")
	public ModelAndView goAddProcessStep(String id, String NoProcedureProcessFlow, String turn_url)throws Exception{
		ModelAndView mv = this.getModelAndView();

		if(NoProcedureProcessFlow!=null && !"".equals(NoProcedureProcessFlow)){
			
			Map WorkingProcedure = processStepService.queryWorkingProcedureList(NoProcedureProcessFlow);  	 //通过工序编号查找工序记录
			mv.addObject("WorkingProcedure", WorkingProcedure);
			
			if(WorkingProcedure!=null && WorkingProcedure.size()>0){
				String id_ProcessFlow = ""+WorkingProcedure.get("id_ProcessFlow");	//通过工序记录获得工序ID
				
				Map ProcessFlow = processStepService.queryProcessFlowList(id_ProcessFlow);					//通过工序ID查找工艺流程记录
				mv.addObject("ProcessFlow", ProcessFlow);
			}
		}
		
		Map para = new HashMap();
		para.put("id_ProcessStep", id);
		Map ProcessStep = processStepService.queryProcessStepListById(para);//查询标准机床
		if(ProcessStep != null){
			
			//查询材料图片列表 PictureMaterial
			List<Map> PictureProcessStep = processStepService.queryPictureProcessStepList(para);
			String array_PictureProcessStep = "";
			if(PictureProcessStep != null && PictureProcessStep.size() > 0){
				for(int i = 0; i < PictureProcessStep.size(); i++){
					array_PictureProcessStep = array_PictureProcessStep + PictureProcessStep.get(i).get("url_PictureProcessStep") + ",";
				}
			}
			
			ProcessStep.put("PictureProcessStep", PictureProcessStep);
			
			mv.addObject("array_PictureProcessStep", array_PictureProcessStep);
			
		}
		
		mv.setViewName("/WEB-INF/productionManage/ProcessStep/ProcessStep_edit");
		mv.addObject("turn_url", turn_url);
		mv.addObject("ProcessStep", ProcessStep);
		
		return mv;
	}
	
	//保存图片
	@ResponseBody
	@RequestMapping(value="/savePictureProcessStep")
	public Object savePictureProcessStep(
			@RequestParam("PictureProcessStep") MultipartFile PictureProcessStep,
			HttpServletRequest request ) throws Exception{
		String url = null;
		String OriginalFilename = PictureProcessStep.getOriginalFilename();  
		if(OriginalFilename != null && !"".equals(OriginalFilename)){
			String fileSuffix = OriginalFilename.substring(OriginalFilename.lastIndexOf(".") + 1).toLowerCase(); 
			String big_url = String.valueOf(Calendar.getInstance().getTimeInMillis());
			String filepath1 =  request.getSession().getServletContext().getRealPath("/goods/PictureProcessStep/" + big_url + "." + fileSuffix);
			
			File materials_big_img_file = new File(filepath1);
			
			PictureProcessStep.transferTo(materials_big_img_file); 
			url = "/PictureProcessStep/" + big_url + "." + fileSuffix;
		}else{

		}
		return url;
	}
	
	
	 /**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/saveProcessStep")
	public String saveProcessStep(HttpServletRequest request, 
			String array_PictureProcessStep, 
			int id_ProcessStep, int id_WorkingProcedure, String NoProcessStep, String MachiningTypeProcessStep, String MachiningLevelProcessStep, 
			String NameProcessStep, String ContentProcessStep, String MeasureProcessStep, String ToolHolderProcessStep, String ToolbladeProcessStep,
			String ToolMaterialProcessStep, String CutterProcessStep, String CutterSpeedProcessStep, String SpindlespeedProcessStep, String FeedProcessStep,
			String FeedSpeedProcessStep, String CuttingDepthProcessStep, String CuttingWidthProcessStep, String TimeMachiningProcessStep, String TimeAssistProcessStep,
			String RemarkProcessStep, String DeviceProcessStep, String FixtureProcessStep, String CuttingFluidProcessStep
			) {
		
		HttpSession session = request.getSession();
		Map user = (Map) session.getAttribute(Const.SESSION_ADMIN);
		Map para = new HashMap();
		
		para.put("id_ProcessStep", id_ProcessStep);
		para.put("id_WorkingProcedure", id_WorkingProcedure);
		para.put("NoProcessStep", NoProcessStep);
		para.put("MachiningTypeProcessStep", MachiningTypeProcessStep);
		para.put("MachiningLevelProcessStep", MachiningLevelProcessStep);
		para.put("NameProcessStep", NameProcessStep);
		para.put("ContentProcessStep", ContentProcessStep);
		para.put("MeasureProcessStep", MeasureProcessStep);
		para.put("ToolHolderProcessStep", ToolHolderProcessStep);
		para.put("ToolbladeProcessStep", ToolbladeProcessStep);
		para.put("ToolMaterialProcessStep", ToolMaterialProcessStep);
		para.put("CutterProcessStep", CutterProcessStep);
		para.put("CutterSpeedProcessStep", CutterSpeedProcessStep);
		para.put("SpindlespeedProcessStep", SpindlespeedProcessStep);
		para.put("FeedProcessStep", FeedProcessStep);
		para.put("FeedSpeedProcessStep", FeedSpeedProcessStep);
		para.put("CuttingDepthProcessStep", CuttingDepthProcessStep);
		para.put("CuttingWidthProcessStep", CuttingWidthProcessStep);
		para.put("TimeMachiningProcessStep", TimeMachiningProcessStep);
		para.put("TimeAssistProcessStep", TimeAssistProcessStep);
		para.put("RemarkProcessStep", RemarkProcessStep);
		para.put("DeviceProcessStep", DeviceProcessStep);
		para.put("FixtureProcessStep", FixtureProcessStep);
		para.put("CuttingFluidProcessStep", CuttingFluidProcessStep);
		
		try {
			if(id_ProcessStep != 0){//修改
				processStepService.updateProcessStep(para);
			}else{//新增
				processStepService.saveProcessStep(para);
			}
			//先清空文件表中该ID的文件
			processStepService.clearPictureProcessStep(para);
			//保存详细信息
			if(array_PictureProcessStep != null && !"".equals(array_PictureProcessStep)){
				String array_PictureProcessSteps[] = array_PictureProcessStep.split(",");
				
				for(int i=0; i<array_PictureProcessSteps.length; i++){
					if(array_PictureProcessSteps[i] != null && !"".equals(array_PictureProcessSteps[i])){
						para.put("url_PictureProcessStep", array_PictureProcessSteps[i]);
						processStepService.savePictureProcessStep(para);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}						
		return "1";
	}
	
	//删除
	@ResponseBody
	@RequestMapping("deleteProcessStepList")
	public String deleteProcessStepList(String id_ProcessStep){
		Map para = new HashMap();
		para.put("id_ProcessStep", id_ProcessStep);
		try {
			processStepService.deleteProcessStepList(para);
			
			processStepService.clearPictureProcessStep(para);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}	
		return "1";
	}
	
	
}
