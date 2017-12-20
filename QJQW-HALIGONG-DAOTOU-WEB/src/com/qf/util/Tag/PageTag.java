package com.qf.util.Tag;
 
 
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.qf.util.page.Page;


 
   
public class PageTag extends TagSupport {
	/**
	 * @author bamboo
	 */
	private static final long serialVersionUID = 1L;
	private String action = "";
	private String field = "page";
	private String showReSize = "false";
	private String onlyOneShow = "false";
	private String useModelDriven = "false";
	private String counts="true";
	private String mhFrom="" ;
	private String showListNo="false"; 
	private int    listPageCount=10;
	private String otherStyle="prev";  //其他页码样式
	private String nonceStyle="cur";  //当前页码样式
	private String msgStyle="dis";
	private String disableStyle="dis";
	public String getDisableStyle() {
		return disableStyle;
	}

	public void setDisableStyle(String disableStyle) {
		this.disableStyle = disableStyle;
	}

	private String xyyimg="/resources/images/qyy.gif";         //上一页图片
	private String syyimg="/resources/images/hyy.gif";         //下一页图片
	private String kuaituiimg="/resources/images/qwy.gif";        //快退
	private String kuaijinimg="/resources/images/hwy.gif";     //快进
	
	public int doStartTag() throws JspException {
		 
		HttpServletRequest request = (HttpServletRequest) this.pageContext.getRequest();
		JspWriter out = this.pageContext.getOut();
      	Page p  = (Page) request.getAttribute(field);
		int pageNo =   p.getPageNo();
		int pageSize = p.getPageSize();
		int count =    p.getRowCount();
		
		 
		int pageCount = p.getPageCount();
	       
		
		 
		if (count % pageSize == 0) {
			pageCount = count / pageSize ;
		}else{
			pageCount = count / pageSize + 1 ;
		}
		
        if(listPageCount>pageCount){
        	
        	listPageCount=pageCount;
        	
        }
        
        // 
       
		if(pageNo>=pageCount){
			pageNo=pageCount;
		}
		if(pageNo<1){
			pageNo=1;
		}
		p.setPageNo(pageNo);
		if (pageCount > 1 || "true".equals(this.onlyOneShow)
				|| "TRUE".equals(this.onlyOneShow)) {
			try {
 				out.print("<form name=\"page\" id=\"page\" action=\""+request.getContextPath()+"/" + action
						+ "\" method=\"post\">\n");
 						
				if ("true".equals(useModelDriven)|| "TRUE".equals(useModelDriven)) {
					out.print("<input type=\"hidden\" id=\"id_pageNo\" name=\"pageNo\" />\n");
					//out.print("<input type=\"hidden\" id=\"id_pageSize\" name=\""+field+".pageSize\" value=\""
					out.print("<input type=\"hidden\" id=\"id_pageSize\" name=\""+""+"pageSize\" value=\""
									+ pageSize + "\" />\n");
					out.print("<input type=\"hidden\" id=\"id_pageCount\" name=\""
							+ field + ".pageCount\" value=\"" + pageCount
							+ "" + "pageCount\" value=\"" + pageCount
							+ "\" />\n");
				} else {
			 
					out.print("<input type=\"hidden\" id=\"id_pageNo\" name=\""
							+ "" + "pageNo\" />\n");
					out.print("<input type=\"hidden\" id=\"id_pageSize\" name=\""
							+ "" + "pageSize\" value=\"" + pageSize
							+ "\" />\n");
					out.print("<input type=\"hidden\" id=\"id_pageCount\" name=\""
							+ "" + "pageCount\" value=\"" + pageCount
							+ "\" />\n");
				}

				out.print("</form>\n");
		 
				out.print("<script type=\"text/javascript\">\n");
				out.print("function jump(no,size){     \n");
//				out.print(" window.parent.jzts(); \n");
				out.print("	if(size==null || size==\"\"){\n");
				out.print("		document.getElementById('id_pageNo').value= no;\n");
				if(!"".equals(mhFrom))
				out.print("     var mhform=document.forms['"+mhFrom+"']\n"+
						"        for( var k=0 ;k<mhform.elements.length;k++){\n"+
						 "              var fname=mhform.elements[k].name        \n"+
						            
						"               $(fname).find('input[name=fname]').remove()  \n  "+
						"        }\n"+
						"        for( var k=0 ;k<mhform.elements.length;k++){\n"+
						"              if(mhform.elements[k].type=='checkbox' || mhform.elements[k].type=='radio' ){       \n"+
						"                 if(mhform.elements[k].checked==true){     \n"+
						"               var ins=document.createElement(\"input\")\n"+
						"                ins.type=\"hidden\" \n "+
						"                ins.name=mhform.elements[k].name\n"+
						"                ins.value=mhform.elements[k].value\n"+
						"                document.forms['page'].appendChild(ins);\n"+
						"                   }  \n"+
						"                } else{   \n"+
						"            var ins=document.createElement(\"input\")\n"+
						"                ins.type=\"hidden\" \n "+
						"                ins.name=mhform.elements[k].name\n"+
						"                ins.value=mhform.elements[k].value\n"+
						"                document.forms['page'].appendChild(ins);\n"+
						"               }   \n"+
					    "          }  \n");
				
				
				
				out.print("		document.forms['page'].submit();\n	}else{\n");
				if(!"".equals(mhFrom))
				out.print("     var mhform=document.forms['"+mhFrom+"']\n"+
						"        for( var k=0 ;k<mhform.elements.length;k++){\n"+
						"              if(mhform.elements[k].type=='checkbox' || mhform.elements[k].type=='radio' ){       \n"+
						"                 if(mhform.elements[k].checked==true){     \n"+
						"               var ins=document.createElement(\"input\")\n"+
						"                ins.type=\"hidden\" \n "+
						"                ins.name=mhform.elements[k].name\n"+
						"                ins.value=mhform.elements[k].value\n"+
						"                document.forms['page'].appendChild(ins);\n"+
						"                   }  \n"+
						"                } else{   \n"+

						"            var ins=document.createElement(\"input\")\n"+
						"                ins.type=\"hidden\" \n "+
						"                ins.name=mhform.elements[k].name\n"+
						"                ins.value=mhform.elements[k].value\n"+
						"                document.forms['page'].appendChild(ins);\n"+
						"            }\n"+
					    "          }  \n");

				out.print("		document.getElementById('id_pageNo').value= no;\n"
						+ "		document.getElementById('id_pageSize').value= size\n"
 						+ "		document.forms['page'].submit();\n	}\n");
				
				
				
				out.print("}\n");
				out.print("</script>\n");
				//out.print("<ul style=\"heigth:20px ;  width:1000px;  overflow: hidden;\"> \n");
			  
				out.print("<ul class='list-page' >");
				if (pageNo == 1) {
					if("true".equals(this.getCounts())||"TRUE".equals(this.getCounts())){
					out.print("<li     ><span class=\""+msgStyle+"\"  >首页</span> </li> \n");
					//out.print("<li   class=\""+msgStyle+"\"   ><img src=\" "+request.getContextPath()+kuaituiimg+"\"   style=\"margin-top:5px;\"/></li>\n");
					out.print("<li        > <span class=\""+msgStyle+"\" >上一页</span></li>\n");
					}
				} else {
					if("true".equals(this.getCounts())||"TRUE".equals(this.getCounts())){
					out.print("<li      ><a href=\"javascript:jump('1')\">首页</a></li>\n");
					}
					
				if(pageNo-listPageCount<=0){
					//out.print("<li   class=\""+msgStyle+"\" style=\"border-width:0px\" ><img src=\" "+request.getContextPath()+kuaituiimg+"  \"   style=\"margin-top:5px;\" /></li>\n");

				}else{
//					out.print("<li   class=\""+msgStyle+"\"  ><a   href=\"javascript:jump('" + (pageNo - 10)
//							+ "')\"><img   src=\""+request.getContextPath()+kuaituiimg+"\"  style=\"margin-top:5px;\" border=\"0\"/></a></li>\n");
//					
				}
					
					out.print("<li      ><a  href=\"javascript:jump('" + (pageNo - 1)
							+ "')\">上一页</a></li>\n");
				}
	        	if("true".equals(showListNo)){
					
					if( pageCount -pageNo < listPageCount){
						
						for(int i=(pageCount-listPageCount)<0?1:(pageCount-listPageCount+1); i<=pageCount;i++){
							  String style="";
							    if(pageNo==i){
							    style=nonceStyle;
							    out.print("<li> <a href=\"javascript:jump('"+i+"')\" class=\""+style+"\"  > <b>"+i+"</b> </a></li>");
							    }
							    else{
							    style=otherStyle;	
							    out.print("<li> <a href=\"javascript:jump('"+i+"')\" class=\""+style+"\"  > "+i+" </a></li>");
							    }
						}
						
					} else {
						int i=1;
                        if( pageNo<=listPageCount/2 ){ 
                            i=1;						 
                        }
                        else{
                        	
                        	i=pageNo-listPageCount/2;
                        }
                        
                        int k=1;
                        
                       do {
							  String style="";
							    if(pageNo==i){
							    style=nonceStyle;
							    out.print(" <li><a href=\"javascript:jump('"+i+"')\" class=\""+style+"\"  > <b> "+i+"</b>   </a></li> ");
							    }
							    else{
							    style=otherStyle;	
							    out.print(" <li><a href=\"javascript:jump('"+i+"')\" class=\""+style+"\"  >  "+i+"   </a></li> ");
							    }
                      
							i++;
							k++;
                        }  while( k<=listPageCount);
						
					}					
				}
	        	
	        	
				
				if (pageNo == pageCount || pageCount == 0) {
					out.print("<li    ><span class=\""+msgStyle+"\" >下一页</span></li>\n");
					
			    	//out.print("<li   class=\""+msgStyle+"\"  ><img src=\""+request.getContextPath()+kuaijinimg+"  \" style=\"margin-top:5px;\" border=\"0\"/> </li>\n");
					if(!"true".equals(this.getCounts())&&!"TRUE".equals(this.getCounts())){
					out.print("<li ><span class=\""+msgStyle+"\"  >尾页</span></li>\n");
					}
				} else {
					out.print("<li   ><a href=\"javascript:jump('" + (pageNo + 1)
							+ "')\">下一页</a></li>\n");
				  
//					out.print("<li   class=\""+msgStyle+"\"  ><a href=\"javascript:jump('" + (pageNo + 10)
//							+ "')\"><img src=\""+request.getContextPath()+kuaijinimg+" \" border=\"0\"/></a></li>\n");
				
				 if ( pageCount == 0 ||(pageCount-pageNo)< listPageCount) {
					//out.print("<li   class=\""+msgStyle+"\"  ><img src=\""+request.getContextPath()+kuaijinimg+" \" style=\"margin-top:5px;\" border=\"0\"/> </li>\n");
					}else{
						
//						out.print("<li   class=\""+msgStyle+"\"  ><a href=\"javascript:jump('" + (pageNo + 10)
//								+ "')\"><img src=\""+request.getContextPath()+kuaijinimg+" \"  style=\"margin-top:5px;\" border=\"0\"/></a></li>\n");
					}
					
				
				}
				if("true".equals(this.getCounts())||"TRUE".equals(this.getCounts())){
					out.print("<li ><a href=\"javascript:jump('" + pageCount
							+ "')\">尾页</a> </li>\n");
 				out.print("<li style='border:none;width:120px;'><span class=\""+msgStyle+"\"  >共 " + count + "条\n");  
//				out.print("每页"+pageSize+"条         当前第" + pageNo + "页    共 " + pageCount
//						+ "页</span></li>\n");
				out.print("共 " + pageCount
						+ "页</span></li>\n");
				
				  //<input id=\"pn\" style=\"IME-MODE: disabled; WIDTH: 60px; HEIGHT: 15px\" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste=\"this.value=this.value.replace(/\D/g,'')\" maxlength=\"5\" size=\"14\" name=\"pn\" type=\"text\"   value=\""+pageNo+"\"  /> 
				out.print("<li style='border:none;width:70px;'>"
								+ "<span  >转到"
								+ "<input  class=\""+msgStyle+"\"   style=\" color:#35418c;width:25px;border-width:0px 0px 1px 0px ;border-style:solid; border-color:#35418c;text-align:center; font-weight:bold \" id=\"pn\"  max="+pageCount+"  \" onkeyup=\"this.value=this.value.replace(/\\D/g,'')\"  onafterpaste=\"this.value=this.value.replace(/\\D/g,'')\" maxlength=\"5\" size=\"14\" name=\"pn\" type=\"text\"   value=\""+pageNo+"\"  /> 页</span></li><li style='width:30px;' class=\""+otherStyle+"\" > <a  href=\"javascript:void(0)\"  onclick=\"jump(document.getElementById('pn').value)\"  ><b>GO</b></a></li>");
				
				}
				//out.print("</ul>");
 				if ("true".equals(this.showReSize)
						|| "TRUE".equals(this.showReSize)) {
					out.print("<li style='border:none;display:none;'><span   >每页<input class=\""+msgStyle+"\"   style=\" color:#35418c;width:20px;border-width:0px 0px 1px 0px ;border-style:solid; border-color:#35418c;text-align:center; font-weight:bold \" title=\"输入数字,回车设置每页显示条数!\" type=\"text\" id=\"pageSize_value\" "
					 
						+ "value=\""
						+ 10
						+ "\" onkeydown=\"if(event.keyCode==13 && this.value.search(/[^\\d]/g)==-1)jump('"
						+ pageNo + "',this.value);\"/>条</span></li>\n");
				}
 				out.print("</ul>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return super.doStartTag();
	}

	// getter and setter
	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getShowReSize() {
		return showReSize;
	}

	public void setShowReSize(String showReSize) {
		this.showReSize = showReSize;
	}

	public String getOnlyOneShow() {
		return onlyOneShow;
	}

	public void setOnlyOneShow(String onlyOneShow) {
		this.onlyOneShow = onlyOneShow;
	}

	public String getUseModelDriven() {
		return useModelDriven;
	}

	public void setUseModelDriven(String useModelDriven) {
		this.useModelDriven = useModelDriven;
	}

	public String getMhFrom() {
		return mhFrom;
	}

	public void setMhFrom(String mhFrom) {
		this.mhFrom = mhFrom;
	}

	public String getShowListNo() {
		return showListNo;
	}

	public void setShowListNo(String showListNo) {
		this.showListNo = showListNo;
	}

	public int getListPageCount() {
		return listPageCount;
	}

	public void setListPageCount(int listPageCount) {
		this.listPageCount = listPageCount;
	}

	public String getOtherStyle() {
		return otherStyle;
	}

	public void setOtherStyle(String otherStyle) {
		this.otherStyle = otherStyle;
	}

	public String getNonceStyle() {
		return nonceStyle;
	}

	public void setNonceStyle(String nonceStyle) {
		this.nonceStyle = nonceStyle;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getMsgStyle() {
		return msgStyle;
	}

	public void setMsgStyle(String msgStyle) {
		this.msgStyle = msgStyle;
	}

	public String getCounts() {
		return counts;
	}

	public void setCounts(String counts) {
		this.counts = counts;
	}

}
