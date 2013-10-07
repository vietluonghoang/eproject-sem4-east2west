<%-- 
    Document   : tour
    Created on : Apr 21, 2013, 8:09:51 AM
    Author     : JAKE
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="javax.naming.InitialContext"%>
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
                <h2>Tour of East2West</h2>
                <p><strong>East2West</strong> provides you the most of best tour with the reasonable price

                </p>
            </div>
            <div id="tour-items">
                <div id="testTable">
                    <div id="isPaging">
                        <div id="menuTable">
                            
                                <%
                                    Tour[] result = (Tour[]) remote.searchTourLocation("");
                                    DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
                                    DateFormat format = new SimpleDateFormat("yyyy-mm-dd");
                                    for (int i = 0; i < result.length; i++) {
                                %>
                                <table width="400" border="0">
                                    <tbody>
                                    <form action="CustomerServlet" method="post">
                                        <tr>
                                            <td rowspan="6"><img src="images/<%=result[i].getImageTour()%>" height="150" width="195"/>
                                                <input type="hidden" name="txtHiddenTourID" value="<%=result[i].getTourID()%>" />
                                            </td>
                                            <td><strong>Tour Name</strong></td>
                                            <td><%=result[i].getTourName()%></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Start Date</strong></td>
                                            <td>
                                                <%
                                                    String sD = result[i].getStartDate();
                                                    Date SD = format.parse(sD);
                                                %>
                                                <%=new SimpleDateFormat("yyyy-mm-dd").format(SD)%></td>
                                        </tr>
                                        <tr>
                                            <td><strong>End Date</strong></td>
                                            <td>
                                                <%
                                                    String eD = result[i].getEndDate();
                                                    Date ED = format.parse(eD);
                                                %>
                                                <%=new SimpleDateFormat("yyyy-mm-dd").format(ED)%></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Duration</strong></td>
                                            <td>
                                                <%
                                                    String start = result[i].getStartDate();
                                                    String end = result[i].getEndDate();

                                                    Date s = format.parse(start);
                                                    Date e = format.parse(end);

                                                    long day = (e.getTime() - s.getTime()) / 86400000;


                                                %>
                                                <%=day%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><strong>Price</strong></td>
                                            <td><%=result[i].getPrice()%>$</td>
                                        </tr>
                                        <tr>
                                            <td colspan="1"><input type="submit"  name="action" value="View detail" align="right" id="btViewDetail"/></td>
                                            <td>
                                                <% if (result[i].getQuantityCurrent() <= 0 && cusINFO != null) {%>
                                                Out of Seat
                                                <% } else if (cusINFO != null && result[i].getQuantityCurrent() > 0) {%>
                                                <input type="submit"  name="action" value="Book" align="right" id="btBook"/>
                                                <% }%>
                                            </td>
                                        </tr>
                                    </form>
                                    </tbody>
                                </table>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%@include file="templateFooter.jsp" %>
                </div>
                </body>
                </html>
