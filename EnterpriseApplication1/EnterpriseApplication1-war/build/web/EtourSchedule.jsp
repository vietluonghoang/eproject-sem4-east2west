<%-- 
    Document   : EtourSchedule
    Created on : Apr 21, 2013, 9:29:30 AM
    Author     : JAKE
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="e2w.enitites.Tour"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="e2w.enitites.ScheduleTour"%>
<%@page import="e2w.dto.ScheduleTourDTO"%>
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
                <h2>Schedules of Tour</h2>
                <p><strong>The Schedules </strong>provides you the information of the tour as:Day,Description of Day,Images of Schedules</p>
            </div>
            <div id="tour-items">
                <table width="485" border="0" align="center" id="scheduleTable">
                    <form action="CustomerServlet" method="post">
                        <%
                            ScheduleTourDTO[] result = (ScheduleTourDTO[]) request.getAttribute("tourSchedulesInfo");
                            for (int i = 0; i < result.length; i++) {
                                ScheduleTour[] scheduleTour = result[i].getScheduleTour();
                        %>
                        <input type="hidden" name="txtTourIDHidden" value="<%=scheduleTour[i].getTour().getTourID()%>" />
                        <%
                            for (int j = 0; j < scheduleTour.length; j++) {

                        %>

                        <tr>

                            <td colspan="2"><div id="line"><img src="images/line.png" /></div><br/><h2>Day <%=j + 1%></h2></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td width="200" height="227"><img src="images/<%=scheduleTour[j].getImageSchedule()%>" width="200" height="155"/></td>
                            <td width="269"><%=scheduleTour[j].getDescription()%></td>
                        </tr>
                        <%
                                }
                            }
                        %>
                        <tr>
                            <td>&nbsp;</td>
                            <td align="center">
                                <input type="submit" name="action" value="Back to Tour Detail" id="btBack" />
                            </td>
                        </tr>
                    </form>
                </table>

                <div align="right"></div>
            </div>
            <div id="car-items"></div>
            <%@include file="templateFooter.jsp" %>
        </div>
    </body>
</html>
