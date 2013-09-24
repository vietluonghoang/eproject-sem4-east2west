<%--
    Document   : insertCar
    Created on : Apr 14, 2013, 10:49:51 AM
    Author     : Tuan Ngoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <%@include file="templateAdminHead.jsp" %>
    </head>
        <body>

            <%
            %>

        <%@include file="templateAdminHeader.jsp" %>


        You have logon as <%= ngocStatefulRemote.get$username() %>
        <br/>
        <br/>
        Please choose where you want to go from the navigation bar above
        <br/>
        Have a nice day!


<%@include file="templateAdminFooter.jsp" %>
    </body>
</html>
