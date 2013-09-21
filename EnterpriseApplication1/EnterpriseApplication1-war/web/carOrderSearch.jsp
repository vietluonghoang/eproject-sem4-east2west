<%-- 
    Document   : carOrderSearch
    Created on : Apr 17, 2013, 2:32:38 AM
    Author     : Tuan Ngoc
--%>

<%@page import="ngoc.entity.CarOrder"%>
<%@page import="ngoc.bean.NgocStatefulRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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


        <%
        String $today = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
        if(cusINFO==null) {
                %>you have to login in<%
            } else {
        %>
        <form action="NgocServlet" method="post">
            <input type="hidden" name="$userID" value="<%= cusINFO.getUserID() %>" />
            From <input name="$from" type="text" value="<%=$today%>" id="datepicker3" />
            to <input name="$to" type="text" value="<%=$today%>" id="datepicker4" />
            <input type="submit" name="action" value="search range" />
        </form>
        <br/><br/>
        <%
        //Context ctx = new InitialContext();
        NgocStatefulRemote ngocStatelessRemote = (NgocStatefulRemote) ctx.lookup("NgocStatefulRemote");

        ngocStatelessRemote.autoFinishOrder();

        CarOrder[] result;
        if(request.getAttribute("INFO") == null) {
            result = ngocStatelessRemote.searchCarOrder(cusINFO.getUserID(), null, null);
        } else {
            result = (CarOrder[])request.getAttribute("INFO");
        }
        if (result.length==0) {
            %>
            No result found. Please broaden your search
            <%
        } else {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>order number</th>
                    <th>order date</th>
                    <th>status</th>
                    <th>order cost</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <%
                for (int i=result.length-1;i>=0;i--) {
                %>
                <tr>
                    <td><%= result[i].getCarOrderID() %></td>
                    <td><%=new SimpleDateFormat("yyyy/MM/dd").format(result[i].getCreateDate())%></td>
                    <td><%=result[i].getStatus()%></td>
                    <td><%=result[i].getOrderCost()%> USD</td>
                    <td><form action="carOrderDetail.jsp" method="post" target="_blank">
                            <input type="hidden" name="$userID" value="<%= cusINFO.getUserID() %>" />
                            <input type="hidden" name="$carOrderID" value="<%= result[i].getCarOrderID() %>" />
                            <input type="submit" name="action" value="details" id="btViewDetail"/>
                        </form><br/>
                        <%
                        if(result[i].getStatus().equals("waiting")) {
                            
                        %>
                        <form action="NgocServlet" method="post" onsubmit=
                            "return confirm('Refund:if order is placed today:70%, yesterday:80%, before yesterday: 90%');">
                            <input type="hidden" name="$carOrderID" value="<%=result[i].getCarOrderID()%>" />
                            <input type="submit" name="action" value="cancel" id="btCancel2"/>
                        </form>
                        <%}%>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
        <%}}%>


<!------------------------- CONTENT BEGIN ------------------------------>


            </div>
            <%@include file="templateFooter.jsp" %>
        </div>
    </body>
</html>
