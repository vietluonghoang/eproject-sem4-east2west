<%-- 
    Document   : EcartTour
    Created on : Apr 21, 2013, 9:25:34 AM
    Author     : Tuan Ngoc
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="e2w.enitites.Tour"%>
<%@page import="e2w.enitites.Customer"%>
<%@page import="e2w.dto.CartDTO"%>
<%@page import="java.util.ArrayList"%>
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
                <h2>Cart of Tour</h2>
                <p><strong>The Cart of Tour</strong>
                    will show you the tour you the tour  have been booked and you can also remove or update the quantity of tour if you want.After that,you can book more or confirm the cart and take the order</p>

                <div id="cart" align="left">
                    <form action="CustomerServlet" method="post" id="cartForm">
                        <%
                            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                            ArrayList cartList = (ArrayList) session.getAttribute("cartList");
                            if (cartList != null && cartList.size() > 0) {
                        %>
                        <table width="700" border="1" id="CartTable">
                            <tr>
                                <th width="28"><div align="center">Tour ID</div></th>
                                <th width="45"><div align="center">Tour Name</div></th>
                                <th width="28"><div align="center">Start Date</div></th>
                                <th width="28"><div align="center">End Date</div></th>

                                <th width="28"><div align="center">Price</div></th>
                                <th width="10"><div align="center">Quantity</div></th>
                                <th width="31"><div align="center">To Cash</div></th>
                                <th width="37"><div align="center">Select</div></th>
                            </tr>
                            <%
                                for (int i = 0; i < cartList.size(); i++) {
                                    CartDTO dto = (CartDTO) cartList.get(i);
                            %>
                            <tr>
                                <td><div align="center"><%=dto.getTour().getTourID()%>
                                        <input type="hidden" name="txtTourID" value="<%=dto.getTour().getTourID()%>"/>
                                    </div></td>
                                <td><div align="center"><%=dto.getTour().getTourName()%></div></td>
                                    <%
                                        Date SD = format.parse(dto.getTour().getStartDate());
                                    %>
                                <td><div align="center"><%=new SimpleDateFormat("yyyy-mm-dd").format(SD)%></div></td>
                                    <%
                                        Date ED = format.parse(dto.getTour().getEndDate());
                                    %>
                                <td><div align="center"><%=new SimpleDateFormat("yyyy-mm-dd").format(ED)%></div></td>

                                <td><div align="center"><%=dto.getTour().getPrice()%> $</div></td>
                                <td><div align="center">
                                        <input type="text" name="txtQuantity" value="<%=dto.getQuantity()%>" size="2" class="required digits" id="quantity"/>
                                    </div></td>
                                <td><div align="center"><%=dto.getTour().getPrice() * dto.getQuantity()%> $</div></td>
                                <td><div align="center">
                                        <input name="cbSelect" type="checkbox" value="<%=dto.getTour().getTourID()%>" />
                                    </div></td>
                            </tr>
                            <%
                                }
                            %>
                            <tr>
                                <td colspan="5">
                                    <div>
                                    </div></td>
                                <td>
                                    <div align="center">Total </div></td>
                                <td><div align="center">
                                        <% int totalCash = (Integer) session.getAttribute("totalINFO");
                                        %>  <%=totalCash%> $
                                    </div></td>
                                <td><div align="center">
                                        <input type="submit" name="action" value="Remove" id="btRemove"/>
                                    </div></td>
                            </tr>
                            <tr>
                                <td colspan="8" align="center">
                                    <input type="submit" name="action" value="Check Out" id="btCheckOut"/>
                                    <input type="submit" name="action" value="Book more" id="btBookMore"/>
                                    <input type="submit" name="action" value="Update Cart" id="btUpdate"/>
                                </td>
                            </tr>
                        </table>
                        <%
                        } else if (cartList == null || cartList.size() == 0) {
                        %>
                        <div align="center">Cart is empty</div>
                        <%                }
                        %>
                    </form>
                </div>
            </div>
            <%@include file="templateFooter.jsp" %>
        </div>
    </body>
</html>
