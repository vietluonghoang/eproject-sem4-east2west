<%-- 
    Document   : EtourOrder
    Created on : Apr 21, 2013, 9:34:55 AM
    Author     : JAKE
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="e2w.enitites.Tour"%>
<%@page import="e2w.enitites.Customer"%>
<%@page import="e2w.enitites.OrderTour"%>
<%@page import="e2w.dto.OrderTourDTO"%>
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
                <h2>Order Tour</h2>
                <p><strong>The Order of Tour</strong>
                    will show you all of the order of the customer which was booked.<br />
                    The information are Order ID, Order Date, Total, Status.If you want to see the detail of the order,click on the Detail Order Button</p>
            </div>
            <div id="cart" align="center">
                <div id="testTable">
                    <%
                        OrderTourDTO[] orderDTO = (OrderTourDTO[]) session.getAttribute("orderINFO");
                        if (orderDTO != null) {
                    %>
                    <table width="500" border="0" id="contentTable">
                        <tr>
                            <th><div align="center">Order ID</div></th>
                            <th><div align="center">Order Date</div></th>


                            <th><div align="center">Total</div></th>

                            <th><div align="center">Status</div></th>

                            <th><div align="center">Detail</div></th>
                        </tr>
                        <%
                            for (int i = 0; i < orderDTO.length; i++) {
                                OrderTour[] order = orderDTO[i].getOrder();
                                for (int j = 0; j < order.length; j++) {

                        %>
                        <tr>
                            <td><div align="center"><%=order[j].getOrderTourID()%></div></td>
                                <%
                                    Date od = order[j].getOrderDate();
                                %>
                            <td><div align="center"><%=new SimpleDateFormat("yyyy-MM-dd").format(od)%></div></td>
                            <td><div align="center"><%=order[j].getTotalPrice()%> $</div></td>
                            <td><div align="center">
                                    <%
                                        String status = order[j].getStatus();
                                        if (status.equals("Depending")) {
                                    %>
                                    <form action="CustomerServlet" method="post">
                                        <input type="hidden" name="txtOrderTourIDHidden" value="<%=order[j].getOrderTourID()%>"/>
                                        <input type="submit" name="action" value="Cancel Order" id="btCancel2"/>
                                    </form>
                                    <%} else {%>
                                    <strong><%=status%></strong>
                                    <%
                                        }
                                    %>
                                </div></td>

                            <td><div align="center">
                                    <form action="CustomerServlet" method="post" target="_blank">
                                        <input type="hidden" name="txtOrderTourIDHiddenV" value="<%=order[j].getOrderTourID()%>"/>   
                                        <input  type="submit" name="action" value="View Order Detail" id="btViewDetail"/>
                                    </form>
                                </div></td>

                        </tr>
                        <%
                                }
                            }
                        %>
                    </table>
                    <%
                    } else {
                    %>
                    <div align="center">No order list result</div>
                    <%                }
                    %>
                </div>
            </div>
            <%@include file="templateFooter.jsp" %>
        </div>
    </body>
</html>
