<%-- 
    Document   : adminLogin
    Created on : Apr 25, 2013, 4:13:12 PM
    Author     : Tuan Ngoc
--%>

<%@page import="ngoc.bean.NgocStatefulRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

            <%
            Context ctx = new InitialContext();
            NgocStatefulRemote ngocStatefulRemote = (NgocStatefulRemote)ctx.lookup("NgocStatefulRemote");
            ngocStatefulRemote = (NgocStatefulRemote)session.getAttribute("admin");
            if (ngocStatefulRemote!=null) {
                if (ngocStatefulRemote.get$username()!=null) {
                    %>
                        <meta http-equiv="refresh" content="1;url=adminHome.jsp">
                        <script type="text/javascript">
                            window.location.href = "adminHome.jsp"
                        </script>
                    <%
                }
            }
            %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Internet Dreams</title>
<link rel="stylesheet" href="css/screen.css" type="text/css" media="screen" title="default" />
<!--  jquery core -->
<script src="js/jquery/jquery-1.4.1.min.js" type="text/javascript"></script>

<!-- Custom jquery scripts -->
<script src="js/jquery/custom_jquery.js" type="text/javascript"></script>

<!-- MUST BE THE LAST SCRIPT IN <HEAD></HEAD></HEAD> png fix -->
<script src="js/jquery/jquery.pngFix.pack.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
$(document).pngFix( );
});
</script>
</head>
<body id="login-bg">

<!-- Start: login-holder -->
<div id="login-holder">

	<!-- start logo -->
	<div id="logo-login">

	</div>
	<!-- end logo -->

	<div class="clear"></div>

	<!--  start loginbox ................................................................................. -->
	<div id="loginbox">

	<!--  start login-inner -->
	<div id="login-inner">
            <form action="NgocServlet" method="post">
		<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<th>Username</th>
			<td><input type="text" name="$username" class="login-inp" /></td>
		</tr>
		<tr>
			<th>Password</th>
			<td><input type="password" name="$password"  onfocus="this.value=''" class="login-inp" /></td>
		</tr>
		<tr>
			<th></th>
			<td valign="top"></td>
		</tr>
		<tr>
			<th></th>
			<td><input type="submit" name="action" value="login" class="submit-login"  /></td>
		</tr>
		</table>
            </form>
	</div>
 	<!--  end login-inner -->
	<div class="clear"></div>

 </div>
 <!--  end loginbox -->

	<!--  start forgotbox ................................................................................... -->
	<div id="forgotbox">
		
	</div>
	<!--  end forgotbox -->

</div>
<!-- End: login-holder -->
</body>

</html>