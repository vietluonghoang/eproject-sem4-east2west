<%-- 
    Document   : EtourOrder
    Created on : Apr 24, 2013, 10:50:03 PM
    Author     : JAKE
--%>

<%@page import="e2w.dto.OrderTourDetailDTO"%>
<%@page import="e2w.enitites.OrderTourDetail"%>
<%@page import="e2w.enitites.Tour"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="e2w.enitites.OrderTour"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta http-equiv="Content-Language" content="en-us" />

        <meta http-equiv="imagetoolbar" content="no" />
        <meta name="MSSmartTagsPreventParsing" content="true" />

        <meta name="description" content="Description" />
        <meta name="keywords" content="Keywords" />

        <meta name="author" content="Enlighten Designs" />

        <style type="text/css" media="all">@import "css/css-style.css";</style>
        <style>
            #CancelOrderTable,
            #CancelOrderTable td,
            #CancelOrderTable th
            {
                border:1px solid red;
            }
            #CancelOrderTable th
            {
                background-color:red;
                color:white;
            }
            #btBack{
                font-size: 0;
                width: 76px;
                height: 30px;
                border: none;
                margin: 0;
                padding: 0;
                background: url(images/button/back-button.png) 0 0 no-repeat;
            }
            #btCancel2{
                font-size: 0;
                width: 100px;
                height: 26px;
                border: none;
                margin: 0;
                padding: 0;
                background: url(images/button/Cancel-button-2.png) 0 0 no-repeat;
            }

        </style>
    </head>
    <body>
        <div class="secondWrap">
        <div align="center">
            <%
                Context ctx = new InitialContext();
                CustomerBeanRemote remote = (CustomerBeanRemote) ctx.lookup("CustomerBeanJNDI");
                Customer cusINFO = (Customer) session.getAttribute("SessionCusINFO");
            %>
            <div align="center"><img src="images/e2w-logo.jpg" /></div><br/>
            <div align="center"><h2>Cancel Order</h2></div>
            <table width="500" border="0">
                <tr>
                    <td align="center"><strong>Create Date</strong></td>
                    <td align="center">
                        <%
                            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                            Date date = new Date();
                        %>
                        <%=format.format(date)%>
                    </td>
                </tr>
                <tr>
                    <td align="center"><strong>Customer ID</strong></td>
                    <td align="center"><%=cusINFO.getUserID()%></td>
                </tr>
                <tr>
                    <td align="center"><strong>Customer Name</strong></td>
                    <td align="center"><%=cusINFO.getFullname()%></td>
                </tr>
                <tr>
                    <td height="20" align="center"><strong>Customer Address</strong></td>
                    <td align="center"><%=cusINFO.getAddress()%></td>
                </tr>
                <tr>
                    <td align="center"><strong>Customer Phone</strong></td>
                    <td align="center"><%=cusINFO.getPhone()%></td>
                </tr>
            </table><br/><br/>

            <form action="CustomerServlet" method="post">
                <%
                    OrderTour orderTour = (OrderTour) request.getAttribute("orderTourINFO");
                %>
                <table width="500" border="1" id="CancelOrderTable">
                    <tr>
                        <th><div align="center"><strong>Order Tour ID</strong></div></th>
                        <th><div align="center"><strong>Order Date</strong></div></th>
                        <th><div align="center"><strong>Total</strong></div></th>
                    <tr>
                        <td><div align="center"><%=orderTour.getOrderTourID()%>
                                <input type="hidden" name="txtOrderID" value="<%=orderTour.getOrderTourID()%>"/>
                            </div></td>
                            <%
                                Date oD = orderTour.getOrderDate();
                            %>
                        <td><div align="center"><%=format.format(oD)%></div></td>
                        <td><div align="center"><%=orderTour.getTotalPrice()%> $</div></td>
                </table>
                <table width="200" border="0" align="center">
                    <tr>
                    </tr>
                    <tr>
                        <td><div align="center">Total Amount of invoice</div></td>
                        <td><div align="center"><%=orderTour.getTotalPrice()%> $</div></td>
                    </tr>
                    <tr>
                        <td align="center"><strong>Cancel Date</strong></td>
                        <td align="center">
                            <%
                                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                Date dateC = new Date();
                            %>
                            <%=new SimpleDateFormat("yyyy-MM-dd").format(dateC)%>
                        </td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Refund</strong></td>
                        <td align="center">
                            <%
                                String cancelDate = dateFormat.format(date);

                                Date cd = dateFormat.parse(cancelDate);


                                OrderTourDetailDTO[] orderDetailDTO = (OrderTourDetailDTO[]) request.getAttribute("orderDetail");
                                Date min = null;

                                for (int i = 0; i < orderDetailDTO.length; i++) {
                                    OrderTourDetail[] orderDetail = orderDetailDTO[i].getDetail();
                                    for (int j = 0; j < orderDetail.length; j++) {
                                        Tour tour = remote.loadTourByTourID(orderDetail[j].getTourID());
                                        if (min == null) {
                                            String sd = tour.getStartDate();
                                            Date sD = format.parse(sd);
                                            min = sD;
                                        } else {
                                            String sd = tour.getStartDate();
                                            Date sD = dateFormat.parse(sd);
                                            String miN = dateFormat.format(min);
                                            Date MIN = dateFormat.parse(miN);
                                            long result = (MIN.getTime() - sD.getTime()) / 86400000;

                                            if (result > 0) {
                                                min = sD;
                                            }

                                        }
                                    }
                                }

                                String miN = dateFormat.format(min);
                                Date MIN = dateFormat.parse(miN);


                                long day = (MIN.getTime() - cd.getTime()) / 86400000 + 1;
                                int totalCash = Integer.parseInt(orderTour.getTotalPrice());
                                int refund = 0;

                                if (day == 1) {
                                    refund = totalCash - (totalCash * 25 / 100);
                                } else if (day == 2) {
                                    refund = totalCash - (totalCash * 20 / 100);
                                } else if (day == 3) {
                                    refund = totalCash - (totalCash * 15 / 100);
                                } else if (day == 4) {
                                    refund = totalCash - (totalCash * 10 / 100);
                                } else if (day >= 5) {
                                    refund = totalCash - (totalCash * 5 / 100);
                                }
                            %>

                            <%=refund%> $
                            <input type="hidden" name="txtRefund" value="<%=refund%>"/>
                        </td>
                    </tr>
                    <tr>
                        <%
                            if (day <= 0) {
                        %>
                        <td colspan="2"><div align="center">
                                <input type="submit" name="action" value="Back to Order History" id="btBack"/>
                            </div></td>
                    </tr>
                    <%      } else {
                    %>
                    <td><div align="center">
                            <input type="submit" name="action" value="Confirm Cancel" id="btCancel2"/>
                        </div></td>
                    <td><div align="center">
                            <input type="submit" name="action" value="Back to Order History" id="btBack"/>
                        </div></td>
                    </tr>
                    <%      }
                    %>
                </table>

                <table width="200" border="0">
                    <tr>
                        <td colspan="2"><p align="center"><strong>Policy</strong></p></td>
                    </tr>
                    <tr>
                        <td colspan="2"><div align="center">From create date</div>      <div align="center"></div></td>
                    </tr>
                    <tr>
                        <td width="83"><div align="center">Before 1</div></td>
                        <td width="51"><div align="center">-25%</div></td>
                    </tr>
                    <tr>
                        <td><div align="center">Before 2</div></td>
                        <td><div align="center">-20%</div></td>
                    </tr>
                    <tr>
                        <td><div align="center">Before 3</div></td>
                        <td><div align="center">-15%</div></td>
                    </tr>
                    <tr>
                        <td><div align="center">Before 4</div></td>
                        <td><div align="center">-10%</div></td>
                    </tr>
                    <tr>
                        <td><div align="center">Before 5 and more</div></td>
                        <td><div align="center">-5%</div></td>
                    </tr>
                </table>
            </form>
        </div>
        </div>
    </body>
</html>
