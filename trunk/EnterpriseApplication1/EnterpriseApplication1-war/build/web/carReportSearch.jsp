<%-- 
    Document   : carReportSearch
    Created on : Apr 25, 2013, 4:03:34 PM
    Author     : Anh Tuan
--%>

<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="tuan.bean.TuanStatefulRemote"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <meta http-equiv="Content-Language" content="en-us" />

	    <meta http-equiv="imagetoolbar" content="no" />
	    <meta name="MSSmartTagsPreventParsing" content="true" />

	    <meta name="description" content="Description" />
	    <meta name="keywords" content="Keywords" />

	    <meta name="author" content="Enlighten Designs" />

	    <style type="text/css" media="all">@import "css/css-style-admin.css";</style>

            <link rel="stylesheet" href="jquery/jquery-ui.css"/>
            <script src="jquery/jquery-1.9.1.js"></script>
             <script src="jquery/jquery-ui.js"></script>
             <script>
$(function() {
$("#datepicker3").datepicker({dateFormat: 'yy/mm/dd'});
$("#datepicker4").datepicker({dateFormat: 'yy/mm/dd'});
});

</script>
    </head>
    <body>
        <div id="page-container">
             <div id="page-container">

	 <div id="header">

	 </div>
            <div id="content">



<!------------------------- CONTENT BEGIN ------------------------------>
<div id="content">
		<h2>Report</h2>
	    <p><strong>Report</strong> will show the result of the type of report from date to date</p>
	 </div>

        <%
            Context ctx = new InitialContext();
            
            TuanStatefulRemote tuanStatefulRemote = (TuanStatefulRemote)ctx.lookup("TuanStatefulRemote");
            tuanStatefulRemote = (TuanStatefulRemote)session.getAttribute("admin");
            if (tuanStatefulRemote == null) {
                %>
                <meta http-equiv="refresh" content="1;url=adminLogin.jsp">
                <script type="text/javascript">
                    window.location.href = "adminLogin.jsp"
                </script>
                <%
            } else if (tuanStatefulRemote.get$username()==null) {
                %>
                <meta http-equiv="refresh" content="1;url=adminLogin.jsp">
                <script type="text/javascript">
                    window.location.href = "adminLogin.jsp"
                </script>
                <%
            } else {

        String $today = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
        %>
        <form action="TuanServlet" method="post" target="_blank">
            <strong>From</strong> <input name="$from" type="text" value="<%=$today%>" id="datepicker3" /><br/>
            <strong>To</strong>  <input name="$to" type="text" value="<%=$today%>" id="datepicker4" /><br/>
            <input type="submit" name="action" value="report" />
        </form>


<!------------------------- CONTENT BEGIN ------------------------------>

<%}%>
            </div>
        </div>
        </div>
    </body>
</html>
