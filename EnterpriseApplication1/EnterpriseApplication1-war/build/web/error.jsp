<%-- 
    Document   : error
    Created on : Apr 26, 2013, 11:06:36 PM
    Author     : JAKE
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="e2w.enitites.Tour"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="e2w.enitites.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <%@include file="templateHeadTag.jsp" %>
    </head>
    <body>

        <div id="page-container">

            <%@include file="templateHeader.jsp" %>
            <div id="content">
                <h2>Error Page</h2>
                <p><strong>Error is </strong><%
                    String error = request.getAttribute("error").toString();
                    %><%=error%>
            </div>  
            <%@include file="templateFooter.jsp" %>
        </div>
    </body>
</html>
