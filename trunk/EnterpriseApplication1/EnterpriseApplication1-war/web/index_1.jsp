<%-- 
    Document   : index
    Created on : Apr 14, 2013, 10:45:29 AM
    Author     : Tuan Ngoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="templateHeadTag.jsp" %>
    </head>
    <body>
        <div id="page-container">
            <%@include file="templateHeader.jsp" %>
            <div id="content">


<!------------------------- CONTENT BEGIN ------------------------------>
<br/><div style="text-align: center;"><a href="carSearch.jsp">Car Search</a> | <a href="carShoppingCart.jsp">Shopping Cart</a> |
    <a href="carOrderSearch.jsp">Order Search</a> | <a href="carReportSearch.jsp">Car Report</a></div>
 <br/><br/>
<!------------------------- CONTENT BEGIN ------------------------------>


        <a href="adminCarInsert.jsp">admincarinsert</a>
        <a href="adminCarSearch.jsp">admincarsearch</a><br/>
        <a href="carSearch.jsp">carsearch</a>
        <a href="carShoppingCart.jsp">carshoppingcart</a><br/>
        <a href="carOrderSearch.jsp">carordersearch</a><br/>
        <a href="carReportSearch.jsp">carreportsearch</a><br/>


<!------------------------- CONTENT BEGIN ------------------------------>


            </div>
            <%@include file="templateFooter.jsp" %>
        </div>
    </body>
</html>
