<%-- 
    Document   : EtourOrder
    Created on : Apr 24, 2013, 10:50:03 PM
    Author     : JAKE
--%>

<%@page import="e2w.enitites.Tour"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="e2w.dto.CartDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="e2w.enitites.Customer"%>
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
                <h2>Order</h2>
            </div>
            <div id="orderTourDetail" align="center">
                <%
                    Customer customer = (Customer) session.getAttribute("SessionCusINFO");
                    ArrayList cartList = (ArrayList) session.getAttribute("cartList");

                %>
                <table width="350" border="0">
                    <tr>
                        <td align="center"><strong>Create Date</strong></td>
                        <td align="center"><%
                            Date date = new Date();
                            %>
                            <%=new SimpleDateFormat("yyyy/MM/dd").format(date)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="center"><strong>Customer Name</strong></td>
                        <td align="center"><%=customer.getFullname()%></td>
                    </tr>
                    <tr>
                        <td height="20" align="center"><strong>Customer Address</strong></td>
                        <td align="center"><%=customer.getAddress()%></td>
                    </tr>
                    <tr>
                        <td align="center"><strong>Customer Phone</strong></td>
                        <td align="center"><strong><%=customer.getPhone()%></strong></td>
                    </tr>
                </table>
                <form action="CustomerServlet" method="post">
                    <%
                        for (int i = 0; i < cartList.size(); i++) {
                            CartDTO dto = (CartDTO) cartList.get(i);
                    %>
                    <table width="500" border="1" id="CartTable">
                        <tr>
                            <th><div align="center"><strong>No</strong></div></th>
                            <th><div align="center"><strong>Tour Name</strong></div></th>


                            <th><div align="center"><strong>Quantity</strong></div></th>
                            <th><div align="center"><strong>Price</strong></div></th>
                            <th><div align="center"><strong>Total</strong></div></th>

                        <tr>
                            <td><div align="center">
                                    <%=i + 1%>

                                    <input type="hidden" name="txtHiddenTourID" value="<%=dto.getTour().getTourID()%>"/>

                                </div></td>
                            <td><div align="center"><%=dto.getTour().getTourName()%></div></td>

                            <td><div align="center">
                                    <%=dto.getQuantity()%>
                                    <input type="hidden" name="txtQuantity" value="<%=dto.getQuantity()%>"/>
                                </div></td>
                            <td><div align="center"><%=dto.getTour().getPrice()%></div></td>
                            <td><div align="center"><%=dto.getQuantity() * dto.getTour().getPrice()%></div></td>
                    </table>
                    <%
                        }
                    %>
                    <table width="300" border="0" align="center" id="vatTable">
                        <tr>
                            <th><div align="center">VAT(10%)</div></th>
                            <td><div align="center">
                                    <% int totalCash = (Integer) session.getAttribute("totalINFO");
                                    %> <%=totalCash * 10 / 100%> $
                                </div></td>
                        </tr>
                        <tr>
                            <th><div align="center">Total Amount of invoice</div></th>
                            <td><div align="center">
                                    <%
                                        int total = totalCash * 10 / 100 + totalCash;
                                    %>
                                    <%=total%>
                                    <input type="hidden" name="txtTotal" value="<%=total%>"/>
                                </div></td>
                        </tr>
                        <tr align="center">
                            <td colspan="2"><div align="center">
                                    <input type="submit" name="action" value="Confirm" id="btConfirm"/>
                                    <input type="submit" name="action" value="Cancel" id="btCancel"/>
                                </div></td>
                        </tr>
                    </table>
                </form>
            </div>
            <%@include file="templateFooter.jsp" %>
        </div>
    </body>
</html>
