<%-- 
    Document   : EtourDetail
    Created on : Apr 21, 2013, 9:27:08 AM
    Author     : JAKE
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.Format"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="e2w.enitites.Tour"%>
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
                <h2>Tour Details</h2>
                <p><strong>Details of the Tour </strong> will let you know the name of the tour, start date and end date of the tour,the minimum, maximum and the current of participants,the price of the tour	 </p>
            </div>
            <div id="tour-items">
                <form action="CustomerServlet" method="post">
                    <%
                        Tour result = (Tour) request.getAttribute("tourDetailResult");
                        DateFormat format = new SimpleDateFormat("yyyy-mm-dd");
                    %>
                    <table width="700" border="0" align="center">
                        <tr>
                            <td colspan="3"><img src="images/<%=result.getImageTour()%>" width="600" height="395"/>
                                <input type="hidden" name="txtHiddenTourID" value="<%=result.getTourID()%>"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="160"><div align="center"><strong>Tour Name</strong></div></td>
                            <td colspan="2"><div align="center"><%=result.getTourName()%></div></td>
                        </tr>
                        <tr>
                            <td><div align="center"><strong>Start Location</strong></div></td>
                            <td colspan="2"> <div align="center"><%=result.getStartLocation()%></div></td>
                        </tr>
                        <tr>
                            <td><div align="center"><strong>End Location</strong></div></td>
                            <td colspan="2"><div align="center"><%=result.getEndLocation()%></div></td>
                        </tr>
                        <tr>
                            <%
                                String sD = result.getStartDate();
                                Date SD = format.parse(sD);

                            %>
                            <td><div align="center"><strong>Start Date</strong></div></td>
                            <td colspan="2"><div align="center"><%=new SimpleDateFormat("yyyy-mm-dd").format(SD)%></div></td>
                        </tr>
                        <tr>
                            <%
                                String eD = result.getEndDate();
                                Date ED = format.parse(eD);

                            %>
                            <td><div align="center"><strong>End Date</strong></div></td>
                            <td colspan="2"><div align="center"><%=new SimpleDateFormat("yyyy-mm-dd").format(ED)%></div></td>
                        </tr>
                        <tr>
                            <td><div align="center"><strong>Current Tour Quantity</strong></div></td>
                            <td colspan="2"><div align="center"><%=result.getQuantityCurrent()%></div></td>
                        </tr>
                        <tr>
                            <td><div align="center"><strong>Price</strong></div></td>
                            <td colspan="2"><div align="center"><%=result.getPrice()%> $</div></td>
                        </tr>
                    </table>
                    <div id="description-tour" style=" text-wrap: normal; word-wrap:break-word;" >
                        <p><%=result.getDescripton()%></p>
                    </div>
                    <table width="150" border="0" align="right">
                        <tr>
                            <td><input type="submit" name="action" value="View Schedules" id="btViewSchedule"/>
                            </td>
                            <td><%if (cusINFO != null && result.getQuantityCurrent() > 0) {%>
                                <input  type="submit" name="action" value="Book" id="btBook"/>
                                <%} else if (result.getQuantityCurrent() <= 0 && cusINFO != null) {%>
                                Out of Quantity
                                <%}%>
                            </td>
                        </tr>
                    </table>
                </form>

            </div>
            <%@include file="templateFooter.jsp" %>

        </div>
    </body>
</html>
