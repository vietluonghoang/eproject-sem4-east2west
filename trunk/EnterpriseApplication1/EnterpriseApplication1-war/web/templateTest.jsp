<%--
    Document   : home
    Created on : Apr 21, 2013, 7:46:17 AM
    Author     : JAKE
--%>

<%@page import="javax.naming.InitialContext"%>
<%@page import="e2w.enitites.Tour"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="e2w.enitites.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>East2West</title>
        <meta http-equiv="Content-Language" content="en-us" />

	    <meta http-equiv="imagetoolbar" content="no" />
	    <meta name="MSSmartTagsPreventParsing" content="true" />

	    <meta name="description" content="Description" />
	    <meta name="keywords" content="Keywords" />

	    <meta name="author" content="Enlighten Designs" />

	    <style type="text/css" media="all">@import "css/css-style.css";</style>

            <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css"/>
            <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
             <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
              <script>
$(function() {
$("#datepicker1").datepicker({dateFormat: 'yy-mm-dd'});
$("#datepicker2").datepicker({dateFormat: 'yy-mm-dd'});
});
</script>

    </head>
    <body>

	 <div id="page-container">

             <%@include file="templateHeader.jsp" %>

	 <div id="content">
             CONTENT CONETEN
</div>


             <%@include file="templateFooter.jsp" %>


	 </div>
	</body>
</html>
