<%-- 
    Document   : carShoppingCart
    Created on : Apr 15, 2013, 4:42:00 PM
    Author     : Anh Tuan
--%>

<%@page import="e2w.enitites.Customer"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="tuan.bean.TuanStatefulRemote"%>
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
        if(cusINFO==null) {
                %>you have to login in<%
            } else {
        //Context ctx = new InitialContext();
        TuanStatefulRemote tuanStateful = (TuanStatefulRemote) ctx.lookup("TuanStatefulRemote");
        tuanStateful = (TuanStatefulRemote)session.getAttribute("carCart");
        if (tuanStateful == null) {
        %>
            Cart is empty
        <%
        } else {
            int $orderCost=0;
            Customer customer = tuanStateful.getBillingAddress(cusINFO.getUserID());
        %>
        name: <%=customer.getFullname()%><br/>
        Address: <%=customer.getAddress()%><br/>
        phone: <%=customer.getPhone()%><br/>
        <br/>
        <table border="1">
            <thead>
                <tr>
                    <th>model</th>
                    <th>quantity</th>
                    <th>with driver</th>
                    <th>pickup date</th>
                    <th>dropoff date</th>
                    <th>Total cost</th>
                </tr>
            </thead>
            <tbody>
                <%
                for (int i=0;i<tuanStateful.get$length();i++) {
                    if (!tuanStateful.get$orderDTO()[i].is$deleted()) {
                    String $pickup = new SimpleDateFormat("yyyy/MM/dd").format(tuanStateful.get$orderDTO()[i].get$pickup());
                    String $dropoff = new SimpleDateFormat("yyyy/MM/dd").format(tuanStateful.get$orderDTO()[i].get$dropoff());
                    int $driver=0;
                    if(tuanStateful.get$orderDTO()[i].is$driver()) {
                        $driver=10;
                    }
                    int $totalCost = (tuanStateful.$get$price(i)*tuanStateful.get$orderDTO()[i].get$quantity()+$driver)*(int)(
                            (tuanStateful.get$orderDTO()[i].get$dropoff().getTime() - tuanStateful.get$orderDTO()[i].get$pickup().getTime())
                            / (1000 * 60 * 60 * 24)+1);
                    $orderCost+= $totalCost;
                %>

                <tr>
                    <td><%=tuanStateful.get$orderDTO()[i].get$model()%></td>
                    <td><%=tuanStateful.get$orderDTO()[i].get$quantity()%></td>
                    <td><%
                        if(tuanStateful.get$orderDTO()[i].is$driver()) {
                            %>
                            <input type="checkbox" name="$driver" checked />
                            <%
                        } else {
                            %>
                            <input type="checkbox" name="$driver" />
                            <%
                        }
                        %>
                    </td>
                    <td><%=$pickup%></td>
                    <td><%=$dropoff%></td>
                    <td><%=$totalCost%> USD</td>
                </tr>
                <%}}%>
            </tbody>
        </table>
        <br/>
        <span style="color:red">Order cost: <%=$orderCost%> USD</span>
        <br/><br/>
        <form action="TuanServlet" method="post">
            <input type="hidden" name="$userID" value="<%= cusINFO.getUserID() %>" />
            <input type="submit" name="action" value="place order" id="btConfirm"/>
        </form>
        <%}}%>


<!------------------------- CONTENT BEGIN ------------------------------>


            </div>
            <%@include file="templateFooter.jsp" %>
        </div>
    </body>
</html>
