<%-- 
    Document   : carShoppingCart
    Created on : Apr 15, 2013, 4:42:00 PM
    Author     : Tuan Ngoc
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="ngoc.bean.NgocStatefulRemote"%>
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

        <%@include file="templateHeadTag.jsp" %>
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
                    NgocStatefulRemote ngocStateful = (NgocStatefulRemote) ctx.lookup("NgocStatefulRemote");
                    ngocStateful = (NgocStatefulRemote) session.getAttribute("carCart");
                    if (cusINFO == null) {
                %>you have to login in<%                } else {
                            if (ngocStateful == null) {
                %>
                Cart is empty
                <%        } else {
                    boolean empty = true;
                    for (int j = 0; j < ngocStateful.get$length(); j++) {
                        if (!ngocStateful.get$orderDTO()[j].is$deleted()) {
                            empty = false;
                        }
                    }
                    if (empty) {
                %>
                Cart is empty
                <%                } else {
                    int $orderCost = 0;
                %>
                <script>
                    $(function() {
                    <%
                        int $datePicker = 5;
                        for (int i = 0; i < ngocStateful.get$length(); i++) {
                            if (!ngocStateful.get$orderDTO()[i].is$deleted()) {
                    %>
                        $("#datepicker<%= $datePicker++%>").datepicker({dateFormat: 'yy/mm/dd'});
                        $("#datepicker<%= $datePicker++%>").datepicker({dateFormat: 'yy/mm/dd'});
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
                            for (int i = 0; i < ngocStateful.get$length(); i++) {
                                if (!ngocStateful.get$orderDTO()[i].is$deleted()) {
                                    String $pickup = new SimpleDateFormat("yyyy/MM/dd").format(ngocStateful.get$orderDTO()[i].get$pickup());
                                    String $dropoff = new SimpleDateFormat("yyyy/MM/dd").format(ngocStateful.get$orderDTO()[i].get$dropoff());
                                    int $driver = 0;
                                    if (ngocStateful.get$orderDTO()[i].is$driver()) {
                                        $driver = 10;
                                    }
                                    int $totalCost = (ngocStateful.$get$price(i) * ngocStateful.get$orderDTO()[i].get$quantity() + $driver) * (int) ((ngocStateful.get$orderDTO()[i].get$dropoff().getTime() - ngocStateful.get$orderDTO()[i].get$pickup().getTime())
                                            / (1000 * 60 * 60 * 24) + 1);
                                    $orderCost += $totalCost;
                        %>

                        <tr><form action="NgocServlet" method="post">
                        <input type="hidden" name="i" value="<%=i%>" />
                        <input type="hidden" name="$inStock" value="<%= ngocStateful.get$orderDTO()[i].get$inStock()%>" />
                        <td><%= ngocStateful.get$orderDTO()[i].get$model()%></td>
                        <td><input type="text" size="1" name="$quantity" value="<%=ngocStateful.get$orderDTO()[i].get$quantity()%>"/></td>
                        <td><%
                            if (ngocStateful.get$orderDTO()[i].is$driver()) {
                            %>
                            <input type="checkbox" name="$driver" checked />
                            <%                            } else {
                            %>
                            <input type="checkbox" name="$driver" />
                            <%                                }
                            %>
                        </td>
                        <td><input type="text" size="9" name="$pickup" value="<%=$pickup%>" id="datepicker<%= $datePicker++%>"/></td>
                        <td><input type="text" size="9" name="$dropoff" value="<%=$dropoff%>" id="datepicker<%= $datePicker++%>"/></td>
                        <td><%=$totalCost%> $</td>
                        <td align="center"><input type="submit" name="action" value="update item" id="btUpdate"/><br/>
                            <form action="NgocServlet" method="post" onsubmit=
                                  "return confirm('Do you want to remove this item?');">
                                <input type="hidden" name="i" value="<%=i%>" />
                                <input type="submit" name="action" value="remove" id="btRemove"/>
                            </form>
                        </td>
                    </form>
                    </tr>
                    <%}
                    }%>
                    </tbody>
                </table>
                <br/>
                <span style="color:red">Order cost: <%=$orderCost%> USD</span>
                <br/><br/>
                <form action="carCheckout.jsp" method="post">
                    <input type="submit" name="action" value="checkout" id="btCheckOut"/>
                </form>
                <%}
                }
            }%>


                <!------------------------- CONTENT BEGIN ------------------------------>


            </div>
            <%@include file="templateFooter.jsp" %>
        </div>
    </body>
</html>
