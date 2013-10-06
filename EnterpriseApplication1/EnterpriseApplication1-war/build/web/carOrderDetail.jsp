<%-- 
    Document   : carOrderDetail
    Created on : Apr 23, 2013, 8:52:43 AM
    Author     : Tuan Ngoc
--%>

<%@page import="e2w.enitites.Customer"%>
<%@page import="ngoc.entity.OrderDetailDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ngoc.entity.CarOrderDetail"%>
<%@page import="ngoc.bean.NgocStatefulRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
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
            <%
                NgocStatefulRemote ngocStateful = (NgocStatefulRemote) ctx.lookup("NgocStatefulRemote");
                int $carOrderID = Integer.parseInt(request.getParameter("$carOrderID"));
                OrderDetailDTO dTO = ngocStateful.getCarOrderDetail($carOrderID);
                Customer customer = ngocStateful.getBillingAddress(Integer.parseInt(request.getParameter("$userID")));
            %>
            <style type="text/css" >
                #orderDetail{
                    padding: 10px;
                    border-collapse: collapse;
                }
                #orderDetail td{
                    border: 1px solid #333;
                }
                #orderDetail th{
                    border: 1px solid #333;
                }
            </style>
            <div id="orderDetail">
                <table border="0" width="640px">
                    <tbody>
                        <tr>
                            <td class="auto-style1" style="height: 50px" colspan="2"><strong>User's car order</strong></td>
                        </tr>
                        <tr>
                            <td>
                                order number: <%=dTO.getCarOrder().getCarOrderID()%><br/>
                                order date: <%=dTO.getCarOrder().getCreateDate()%><br/>
                                status: <%=dTO.getCarOrder().getStatus()%>
                            </td>
                            <td>name: <%=customer.getFullname()%><br/>
                                Address: <%=customer.getAddress()%><br/>
                                phone: <%=customer.getPhone()%>
                            </td>
                        </tr>
                    </tbody>
                </table><br/><br/>
                <table border="1" width="640px">
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
                            for (int i = 0; i < dTO.getCarOrderDetails().length; i++) {
                                String $pickup = new SimpleDateFormat("yyyy/MM/dd").format(dTO.getCarOrderDetails()[i].getPickup());
                                String $dropoff = new SimpleDateFormat("yyyy/MM/dd").format(dTO.getCarOrderDetails()[i].getDropoff());

                        %>

                        <tr>
                            <td><%=dTO.getCarOrderDetails()[i].getCar().getModel()%></td>
                            <td><%=dTO.getCarOrderDetails()[i].getQuantity()%></td>
                            <td><%
                                if (dTO.getCarOrderDetails()[i].getDriver()) {
                                %>
                                yes
                                <%                            } else {
                                %>
                                no
                                <%                                }
                                %>
                            </td>
                            <td><%=$pickup%></td>
                            <td><%=$dropoff%></td>
                            <td><%=dTO.getCarOrderDetails()[i].getTotalCost()%> USD</td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
                <br/>
                <span style="color:red">
                    Order cost: <%=dTO.getCarOrder().getOrderCost()%> USD<br/><br/>
                    <% if (dTO.getCarOrder().getStatus().equals("canceled")) {%>
                    cancel date: <%= dTO.getCarOrder().getEndDate()%><br/>
                    refund: <%= dTO.getCarOrder().getRefund()%> USD
                    <% }%>
                </span>
            </div>
        </div>
    </body>
</html>
