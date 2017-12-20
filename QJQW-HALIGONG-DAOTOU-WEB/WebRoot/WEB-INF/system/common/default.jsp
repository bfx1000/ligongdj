<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path_default = request.getContextPath();
%>
<link href="<%=path_default%>/resources/css/index/style_a.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path_default%>/resources/js/jquery/jquery-1.8.2.js"></script>
<script type="text/javascript" src="<%=path_default%>/resources/js/jquery.SuperSlide.2.1.1.source.js"></script>
<script type="text/javascript" src="<%=path_default%>/resources/js/jquery.collapser.js"></script>

<div class="content_index">
	  <a href="#" class="banner_box_index" alt="汽轮机专用" title="模具加工"></a>
	  <!-- dtcp.html -->
	  <!--  内容   -->
	  <div class="listbox">
		<div class="list_box1">
		  <h3>最新刀具<a href="#" class="more">更多</a></h3>
		  <ul>
			<li>
			  <a href="#">
				<img src="<%=path_default%>/resources/images/img_cd.jpg" class="list_img" alt="方肩铣刀" title="方肩铣刀"/>
				<h4>方肩铣刀</h4>
				<p>方肩铣刀，90度的刀片称为方肩铣刀，直径大的方肩铣刀也叫面铣刀，方肩铣刀占所有铣削作业的50-60%,能很好地替代一般的前角面铣。方肩铣刀可以应用于诸多场合。</p>
			  </a>
			</li>
			<li>
			  <a href="#">
				<img src="<%=path_default%>/resources/images/img_sk.jpg" class="list_img" alt="螺纹铣刀" title="螺纹铣刀"/>
				<h4>螺纹铣刀</h4>
				<p>螺纹铣刀在加工精度、加工效率方面具有极大优势，且加工时不受螺纹结构和螺纹旋向的限制，一把螺纹铣刀可加工多种不同旋向的内、外螺纹。螺纹铣刀的耐用度是丝锥的十多倍甚至数十倍，而且在数控铣削螺纹过程中，对螺纹直径尺寸的调整极为方便。</p>
			  </a>
			</li>
			<li>
			  <a href="#">
				<img src="<%=path_default%>/resources/images/img_lc1.jpg" class="list_img" alt="面铣刀" title="面铣刀"/>
				<h4>面铣刀</h4>
				<p>又称盘铣刀，用于立式铣床、端面铣床或龙门铣床上加工平面，端面和圆周上均有刀齿,也有粗齿和细齿之分。其结构有整体式、镶齿式和可转位式 3种。</p>
			  </a>
			</li>
			<li class="end">
			  <a href="#">
			    <img src="<%=path_default%>/resources/images/img_lc2.jpg" class="list_img" alt="球头铣刀" title="球头铣刀"/>
			    <h4>球头铣刀</h4>
			    <p>球头铣刀可以铣削模具钢、铸铁、碳素钢、合金钢、工具钢、一般铁材，属于立铣刀。可以在高温环境下正常作业。球头铣刀的材质：高速钢、特殊加硬高速钢。广泛用于各种曲面，圆弧沟槽加工。维持切削性能的最高温度450-550摄氏度。</p>
			  </a>
			</li>
			<div class="clear"></div>
		  </ul>
		</div>
		<div class="list_box1">
		  <h3>更多铣刀<a href="#" class="more">更多</a></h3>
		  <ul>
			<li>
			  <a href="#">
				<img src="<%=path_default%>/resources/images/img_fangxi.jpg" class="list_img" alt="可转位刀片仿形铣刀" title="可转位刀片仿形铣刀"/>
				<h4>可转位刀片仿形铣刀</h4>
				<p>仿形铣刀，又称做“钮扣刀具”， 能够提高机床性能外，改善加工状况</p>
			  </a>
			</li>
			<li>
			  <a href="#">
				<img src="<%=path_default%>/resources/images/img_caoxidao.jpg" class="list_img" alt="槽铣刀" title="槽铣刀"/>
				<h4>槽铣刀</h4>
				<p>槽铣刀适用于手机树脂机壳射出成形所需模具的加工。</p>
			  </a>
			</li>
			<li>
			  <a href="#">
				<img src="<%=path_default%>/resources/images/img_renxi.jpg" class="list_img" alt="可转位刀片三面刃铣刀" title="可转位刀片三面刃铣刀"/>
				<h4>可转位刀片三面刃铣刀</h4>
				<p>三面刃铣刀简称三面刃：三个刃口均有后角，刃口锋利，切削轻快。三面刃铣刀是标准的机床刀具，通常在卧铣床上使用，一般用于铣沟槽和台阶。</p>
			  </a>
			</li>
			<li class="end">
			  <a href="#">
				<img src="<%=path_default%>/resources/images/img_qiandaojiao.jpg" class="list_img" alt="前倒角铣刀" title="前倒角铣刀"/>
				<h4>前倒角铣刀</h4>
				<p>用于铣削成一定角度的沟槽，有单角和双角铣刀两种。</p>
			  </a>
			</li>
		  </ul>
		</div>
			
	  </div>
	  <div class="clear"></div>
	</div>