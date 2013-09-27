<%-- 
    Document   : Econtact
    Created on : Apr 29, 2013, 10:03:55 AM
    Author     : JAKE
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="e2w.enitites.Customer"%>
<%@page import="e2w.enitites.Tour"%>
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
                <h2>Contact Us</h2>
                <p>If you have any question or problems please send to this email : e2w@gmail.com</p>
                <p>We will reply as soon as we can</p>
                <p>Address of East2West company : 16/26 Oak st,Katrina ward,Arizona</p>

            </div>
            <%@include file="templateFooter.jsp" %>
        </div>
    </body>
</html>
