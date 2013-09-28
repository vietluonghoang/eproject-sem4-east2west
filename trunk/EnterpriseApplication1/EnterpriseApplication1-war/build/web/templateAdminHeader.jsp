
<%@page import="ngoc.bean.NgocStatefulRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>

            <%
            Context ctx = new InitialContext();
            NgocStatefulRemote ngocStatefulRemote = (NgocStatefulRemote)ctx.lookup("NgocStatefulRemote");
            ngocStatefulRemote = (NgocStatefulRemote)session.getAttribute("admin");
            if (ngocStatefulRemote == null) {
                %>
                <meta http-equiv="refresh" content="1;url=adminLogin.jsp">
                <script type="text/javascript">
                    window.location.href = "adminLogin.jsp"

                    function newPopup(url) {
                popupWindow = window.open(
		url,'','height=600,width=800,left=10,top=10,resizable=no,scrollbars=no,toolbar=no,menubar=no,location=no,directories=no,status=yes');
                if (window.focus) {newwindow.focus()}
                return false;
                }
                </script>
                <%
            } else if (ngocStatefulRemote.get$username()==null) {
                %>
                <meta http-equiv="refresh" content="1;url=adminLogin.jsp">
                <script type="text/javascript">
                    window.location.href = "adminLogin.jsp"
                </script>
                <%
            } else {
            %>

<!-- Start: page-top-outer -->
<div id="page-top-outer">

<!-- Start: page-top -->
<div id="page-top">

	<!-- start logo -->
	<div id="logo">
            <img width="156" height="40"src="images/logoAdmin.png"/>
	</div>
	<!-- end logo -->

	<!--  start top-search -->
	<div id="top-search">
		<table border="0" cellpadding="0" cellspacing="0">
		<tr>
		<td></td>
		<td>
		</td>
		<td>
		</td>
		</tr>
		</table>
	</div>
 	<!--  end top-search -->
 	<div class="clear"></div>

</div>
<!-- End: page-top -->

</div>
<!-- End: page-top-outer -->

<div class="clear">&nbsp;</div>

<!--  start nav-outer-repeat................................................................................................. START -->
<div class="nav-outer-repeat">
<!--  start nav-outer -->
<div class="nav-outer">

		<!-- start nav-right -->
		<div id="nav-right">

			<div class="showhide-account"></div>
			<div class="nav-divider">&nbsp;</div>
			<a href="" id="logout" onmouseover="javascript:document.getElementsByClassName('account-content')[0].style.display='inline';" onmouseout="javascript:document.getElementsByClassName('account-content')[0].style.display='inline';">
                            <form action="NgocServlet" method="POST">
                                <input type="hidden" name="action" value="logout" />
                                <input type="image" src="images/shared/nav/nav_logout.gif" width="64" height="14" />
                            </form>
                        </a>
			<div class="clear">&nbsp;</div>

			<!--  start account-content -->
			<div class="account-content">
			<div class="account-drop-inner">
				<a href="" id="acc-settings">Settings</a>
				<div class="clear">&nbsp;</div>
				<div class="acc-line">&nbsp;</div>
				<a href="" id="acc-details">Personal details </a>
				<div class="clear">&nbsp;</div>
				<div class="acc-line">&nbsp;</div>
				<a href="" id="acc-project">Project details</a>
				<div class="clear">&nbsp;</div>
				<div class="acc-line">&nbsp;</div>
				<a href="" id="acc-inbox">Inbox</a>
				<div class="clear">&nbsp;</div>
				<div class="acc-line">&nbsp;</div>
				<a href="" id="acc-stats">Statistics</a>
			</div>
			</div>
			<!--  end account-content -->

		</div>
		<!-- end nav-right -->


		<!--  start nav -->
		<div class="nav">
		<div class="table">

                <ul class="select"><li><a href="Ehome.jsp"><b>Homepage</b><!--[if IE 7]><!--></a><!--<![endif]-->
		<!--[if lte IE 6]><table><tr><td><![endif]-->
		<div class="select_sub show">
			<ul class="sub">
			</ul>
		</div>
		<!--[if lte IE 6]></td></tr></table></a><![endif]-->
		</li>
		</ul>

                <%if ($category.equals("car")) {
                    %><ul class="current"><%
                } else {
                    %><ul class="select"><%
                }
                %>
                    <li><a href="#nogo"><b>Car</b><!--[if IE 7]><!--></a><!--<![endif]-->
		<!--[if lte IE 6]><table><tr><td><![endif]-->
		<div class="select_sub show">
			<ul class="sub">
                                <%if($page.equals("insert")) {
                                    %><li class="sub_show"><%
                                } else {
                                    %><li><%
                                }
                                %>
                                    <a href="adminCarInsert.jsp">Add new car</a>
                                </li>
				<%if($page.equals("search")) {
                                    %><li class="sub_show"><%
                                } else {
                                    %><li><%
                                }
                                %>
                                    <a href="adminCarSearch.jsp" >Search car</a>
                                </li>
			</ul>
		</div>
		<!--[if lte IE 6]></td></tr></table></a><![endif]-->
		</li>
		</ul>

		<div class="nav-divider">&nbsp;</div>

		<%if ($category.equals("hotel")) {
                    %><ul class="current"><%
                } else {
                    %><ul class="select"><%
                }
                %>
                    <li><a href="#nogo"><b>Hotel</b><!--[if IE 7]><!--></a><!--<![endif]-->
		<!--[if lte IE 6]><table><tr><td><![endif]-->
		<div class="select_sub show">
			<ul class="sub">
                                <%if($page.equals("insert")) {
                                    %><li class="sub_show"><%
                                } else {
                                    %><li><%
                                }
                                %>
                                    <a href="adminHotelInsert.jsp">Add new hotel</a>
                                </li>
				<%if($page.equals("search")) {
                                    %><li class="sub_show"><%
                                } else {
                                    %><li><%
                                }
                                %>
                                    <a href="adminHotelSearch.jsp">Search hotel</a>
                                </li>
			</ul>
		</div>
		<!--[if lte IE 6]></td></tr></table></a><![endif]-->
		</li>
		</ul>

		<div class="nav-divider">&nbsp;</div>

		<%if ($category.equals("flight")) {
                    %><ul class="current"><%
                } else {
                    %><ul class="select"><%
                }
                %>
                    <li><a href="#nogo"><b>Flight</b><!--[if IE 7]><!--></a><!--<![endif]-->
		<!--[if lte IE 6]><table><tr><td><![endif]-->
		<div class="select_sub show">
			<ul class="sub">
                                <%if($page.equals("insert")) {
                                    %><li class="sub_show"><%
                                } else {
                                    %><li><%
                                }
                                %>
                                    <a href="adminInsertFlight.jsp">Add new flight</a>
                                </li>
				<%if($page.equals("search")) {
                                    %><li class="sub_show"><%
                                } else {
                                    %><li><%
                                }
                                %>
                                    <a href="adminFlight.jsp">Manage flight</a>
                                </li>
			</ul>
		</div>
		<!--[if lte IE 6]></td></tr></table></a><![endif]-->
		</li>
		</ul>



                <div class="nav-divider">&nbsp;</div>

		<ul class="select"><li><a href="#nogo"><b>Report</b><!--[if IE 7]><!--></a><!--<![endif]-->
		<!--[if lte IE 6]><table><tr><td><![endif]-->
		<div class="select_sub show">
			<ul class="sub">
                                <li><a href="carReportSearch.jsp" >Car report</a></li>
                                <li><a href="AdminTourReport.jsp" >Tour report</a></li>
			</ul>
		</div>
		<!--[if lte IE 6]></td></tr></table></a><![endif]-->
		</li>
		</ul>



		<div class="clear"></div>
		</div>
		<div class="clear"></div>
		</div>
		<!--  start nav -->

</div>
<div class="clear"></div>
<!--  start nav-outer -->
</div>
<!--  start nav-outer-repeat................................................... END -->

  <div class="clear"></div>

<!-- start content-outer ........................................................................................................................START -->
<div id="content-outer">
<!-- start content -->
<div id="content">

	<!--  start page-heading -->
	<div id="page-heading">

		<h1>Hello  <strong><%= ngocStatefulRemote.get$username() %></strong></h1>

	</div>
	<!-- end page-heading -->

	<table border="0" width="100%" cellpadding="0" cellspacing="0" id="content-table">
	<tr>
		<th rowspan="3" class="sized"><img src="images/shared/side_shadowleft.jpg" width="20" height="300" alt="" /></th>
		<th class="topleft"></th>
		<td id="tbl-border-top">&nbsp;</td>
		<th class="topright"></th>
		<th rowspan="3" class="sized"><img src="images/shared/side_shadowright.jpg" width="20" height="300" alt="" /></th>
	</tr>
	<tr>
		<td id="tbl-border-left"></td>
		<td>
		<!--  start content-table-inner ...................................................................... START -->
		<div id="content-table-inner">

			<!--  start table-content  -->
			<div id="table-content">