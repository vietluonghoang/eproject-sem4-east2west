<%-- 
    Document   : adminCarSearch
    Created on : Apr 14, 2013, 11:54:35 AM
    Author     : Anh Tuan
--%>

<%@page import="tuan.entity.Car"%>
<%@page import="tuan.bean.TuanStatelessRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="jquery/jquery-ui.css"/>
            <script src="jquery/jquery-1.9.1.js"></script>
             <script src="jquery/jquery-ui.js"></script>
        <script src="jquery/jquery.tablePagination.0.js"></script>
        
    </head>
    <body>
        <div id="page-container">
            <%@include file="templateHeader.jsp" %>
            <div id="content">


<!------------------------- CONTENT BEGIN ------------------------------>
<br/><div style="text-align: center;"><a href="carSearch.jsp">Car Search</a> | <a href="carShoppingCart.jsp">Shopping Cart</a> |
    <a href="carOrderSearch.jsp">Order Search</a></div>
 <br/><br/>
<!------------------------- CONTENT BEGIN ------------------------------>


        <form action="TuanServlet" method="post">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Model</td>
                        <td><input type="text" name="$model" /></td>
                    </tr>
                    <tr>
                        <td>Type</td>
                        <td><input type="text" name="$type" /></td>
                    </tr>
                    <tr>
                        <td>Seating capacity</td>
                        <td><input type="text" name="$seat" /></td>
                    </tr>
                    <tr>
                        <td>Airconditioner</td>
                        <td><input type="radio" name="$airConditioner" value="yes" /> Yes
                            <input type="radio" name="$airConditioner" value="no" /> No</td>
                    </tr>
                    <tr>
                        <td>stock quantity >=</td>
                        <td><input type="text" name="$stock" /></td>
                    </tr>
                    <tr>
                        <td>price from</td>
                        <td><input type="text" name="$from" /> USD</td>
                    </tr>
                    <tr>
                        <td>price to</td>
                        <td><input type="text" name="$to" /> USD</td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="action" value="search" id="btSearch" /></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </form>
            <br/><br/>
        <%
        //Context ctx = new InitialContext();
        TuanStatelessRemote tuanStatelessRemote = (TuanStatelessRemote) ctx.lookup("TuanStatelessRemote");
        Car[] result;
        if(request.getAttribute("INFO") == null) {
            result = (Car[])tuanStatelessRemote.search("SELECT c FROM Car c WHERE c.isDeleted = false");
        } else {
            result = (Car[])request.getAttribute("INFO");
        }
        if (result.length==0) {
            %>
            No result found. Please broaden your search
            <%
        } else {
        %>
	


<div id="car-items">
<h2>CAR</h2>
<div id="testTable">
    <div id="menuTable">
                <%
                //for (int i = 0; i < result.length; i++) {
                for (int i=result.length-1;i>=0;i--) {
                %>
<table border="0" >
  <tr>
    <td rowspan="6"><img src="images/<%=result[i].getImage() %>" width="250"/></td>
    <td><strong>Model</strong></td>
    <td><%=result[i].getModel() %></td>
  </tr>
  <tr>
    <td><strong>Type</strong></td>
    <td><%= result[i].getType() %></td>
  </tr>
  <tr>
    <td><strong>Capacity</strong></td>
    <td><%= result[i].getSeat() %></td>
  </tr>
  <tr>
    <td><strong>Quantity</strong></td>
    <td><%= result[i].getQuantityStock() %></td>
  </tr>
  <tr>
    <td><strong>Price</strong></td>
    <td><%=result[i].getPrice() %> $/day</td>
  </tr>
   <tr>
    <td colspan="3">
        <form action="carDescription.jsp" method="post">
            <input type="hidden" name="$carID" value="<%=result[i].getCarID() %>" />
            <input type="submit" name="action" value="description" align="right" id="btViewDetail" />
        </form>
    </td>
  </tr>
</table>
            <%}%>
</div>
</div>
<br/>
<div align="center">
</div>
</div>

                <%}%>


<!------------------------- CONTENT BEGIN ------------------------------>


            </div>
            <%@include file="templateFooter.jsp" %>
        </div>
    </body>
</html>
