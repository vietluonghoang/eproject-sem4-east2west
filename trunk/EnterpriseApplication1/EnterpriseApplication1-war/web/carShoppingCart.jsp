<%-- 
    Document   : carShoppingCart
    Created on : Apr 15, 2013, 4:42:00 PM
    Author     : Anh Tuan
--%>

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
        <style>
            #btCheckOut{
     font-size: 0;
 width: 120px;
 height: 51px;
 border: none;
 margin: 0;
 padding: 0;
 background: url(images/button/check-out-button.png) 0 0 no-repeat;
}
#btRemove{
     font-size: 0;
 width: 81px;
 height: 22px;
 border: none;
 margin: 0;
 padding: 0;
 background: url(images/button/remove-button.png) 0 0 no-repeat;
}
#btUpdate{
     font-size: 0;
 width: 100px;
 height: 26px;
 border: none;
 margin: 0;
 padding: 0;
 background: url(images/button/update-cart-button.png) 0 0 no-repeat;
}
        </style>
        

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
        //Context ctx = new InitialContext();
        TuanStatefulRemote tuanStateful = (TuanStatefulRemote) ctx.lookup("TuanStatefulRemote");
        tuanStateful = (TuanStatefulRemote)session.getAttribute("carCart");
        if(cusINFO==null) {
                %>you have to login in<%
            } else {
        if (tuanStateful == null) {
        %>
            Cart is empty
        <%
        } else {
            boolean empty=true;
            for (int j=0;j<tuanStateful.get$length();j++) {
                    if(!tuanStateful.get$orderDTO()[j].is$deleted()) {
                        empty=false;
            }}
            if (empty) {
                %>
                    Cart is empty
                <%
            } else {
            int $orderCost=0;
        %>
        <script>
            $(function() {
            <%
            int $datePicker = 5;
            for (int i=0;i<tuanStateful.get$length();i++) {
                if(!tuanStateful.get$orderDTO()[i].is$deleted()) {
            %>
                $("#datepicker<%= $datePicker++ %>").datepicker({dateFormat: 'yy/mm/dd'});
                $("#datepicker<%= $datePicker++ %>").datepicker({dateFormat: 'yy/mm/dd'});
            <%
                }
            }
            $datePicker = 5;
            %>
            });
        </script>


            
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
                    if(!tuanStateful.get$orderDTO()[i].is$deleted()) {
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

                <tr><form action="TuanServlet" method="post">
                    <input type="hidden" name="i" value="<%=i%>" />
                    <input type="hidden" name="$inStock" value="<%= tuanStateful.get$orderDTO()[i].get$inStock() %>" />
                    <td><%= tuanStateful.get$orderDTO()[i].get$model()%></td>
                    <td><input type="text" size="1" name="$quantity" value="<%=tuanStateful.get$orderDTO()[i].get$quantity()%>"/></td>
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
                    <td><input type="text" size="9" name="$pickup" value="<%=$pickup%>" id="datepicker<%= $datePicker++ %>"/></td>
                    <td><input type="text" size="9" name="$dropoff" value="<%=$dropoff%>" id="datepicker<%= $datePicker++ %>"/></td>
                    <td><%=$totalCost%> $</td>
                    <td align="center"><input type="submit" name="action" value="update item" id="btUpdate"/><br/>
                        <form action="TuanServlet" method="post" onsubmit=
                            "return confirm('Do you want to remove this item?');">
                            <input type="hidden" name="i" value="<%=i%>" />
                            <input type="submit" name="action" value="remove" id="btRemove"/>
                        </form>
                    </td>
                    </form>
                </tr>
                <%}}%>
            </tbody>
        </table>
        <br/>
        <span style="color:red">Order cost: <%=$orderCost%> USD</span>
        <br/><br/>
        <form action="carCheckout.jsp" method="post">
            <input type="submit" name="action" value="checkout" id="btCheckOut"/>
        </form>
        <%}}}%>


<!------------------------- CONTENT BEGIN ------------------------------>


            </div>
            <%@include file="templateFooter.jsp" %>
        </div>
    </body>
</html>
