<%
	String pathl = request.getContextPath();
	String basePathl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+pathl+"/";
%>




		
		
		<!-- 本页面涉及的js函数，都在head.jsp页面中     -->
		<div id="sidebar" >

			


				<ul class="nav nav-list">

					<li class="active" id="fhindex">
					  <a href="<%=path%>/qjqwmain/systemuser/view" target="mainFrame"><i class="icon-dashboard"></i><span>后台首页</span></a>
					</li>



			<c:forEach items="${menuList}" var="menu">
				<li id="lm${menu.menu_id }">
			
					  <a href="#" class="dropdown-toggle" onclick="onturnMenu('<%=path%>${menu.menu_url }')">
						<i class="${menu.menu_icon == null ? 'icon-desktop' : menu.menu_icon}"></i>
						<span>${menu.menu_name }</span>
						<b class="arrow icon-angle-down"></b>
					  </a>
					  
				</li>
			</c:forEach>

				</ul><!--/.nav-list-->

				<div id="sidebar-collapse"><i class="icon-double-angle-left"></i></div>

			</div><!--/#sidebar-->

