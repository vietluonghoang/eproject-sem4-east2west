<%-- 
    Document   : EflightDetail
    Created on : May 2, 2013, 10:36:36 PM
    Author     : JAKE
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="e2w.enitites.Flight"%>
<%@page import="e2w.enitites.Tour"%>
<%@page import="e2w.enitites.Customer"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="javax.naming.Context"%>
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
                <h2>Flight Desk of East2West</h2>
                <p><strong>Flight Detail</strong> provides you The Available Date/Expired Date,Taking off/Landing Airport,Taking of/Landing Time
                </p>
            </div>
            <%
                String flightBranch = request.getAttribute("flightBranch").toString();
                Flight[] result = remote.loadFlightDetailByFlightBranch(flightBranch);
                if (flightBranch.equals("American Airline")) {
            %>
            <div align="center"><img src="images/item/American_Airlines_logo.png" width="515" height="186" /></div><br/>
                <%} else if (flightBranch.equals("Japan Airline")) {
                %>
            <div align="center"><img src="images/item/japan airlines.jpg" width="515" height="186" /></div><br/>
                <%} else if (flightBranch.equals("Vietnam Airline")) {
                %>
            <div align="center"><img src="images/item/Vietnam Airlines.jpg" width="515" height="186" /></div><br/>
                <%    }
                %>
            <div id="testTable">
                <table border="1" id="flightTable">
                    <thead>
                        <tr>
                            <th align="center"><strong>Flight ID</strong></th>
                            <th align="center"><strong>From Date</strong></th>
                            <th align="center"><strong>To Date</strong></th>
                            <th align="center"><strong>Departure airport</strong></th>
                            <th align="center"><strong>Arrival airport</strong></th>
                            <th align="center"><strong>Departure time<</strong></th>
                            <th align="center"><strong>Arrival time</strong></th>
                            <th align="center"><strong>Price</strong></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%

                            for (int i = 0; i < result.length; i++) {
                        %>
                        <tr>
                            <td align="center"><%=result[i].getFlightID()%></td>
                            <%
                                Date aD = result[i].getAvailableDate();
                                Date eD = result[i].getExpiredDate();
                            %>
                            <td align="center"><%=new SimpleDateFormat("yyyy-MM-dd").format(aD)%></td>
                            <td align="center"><%=new SimpleDateFormat("yyyy-MM-dd").format(eD)%></td>
                            <td align="center"><%=result[i].getTakingOfAirP()%></td>
                            <td align="center"><%=result[i].getLandingAirP()%></td>
                            <td align="center"><%=result[i].getTakingOfTime()%></td>
                            <td align="center"><%=result[i].getLandingTime()%></td>
                            <td align="center"><%=result[i].getPrice()%></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <%@include file="templateFooter.jsp" %>
        </div>
    </body>
</html>
