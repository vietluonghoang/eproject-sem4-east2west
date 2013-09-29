<%-- 
    Document   : carReportShow
    Created on : Apr 25, 2013, 5:35:27 PM
    Author     : Tuan Ngoc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ngoc.entity.Car"%>
<%@page import="javax.management.Query"%>
<%@page import="ngoc.entity.CarReportDTO"%>
<%@page import="ngoc.bean.NgocStatefulRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="templateAdminHead.jsp" %>
        <style type="text/css">
            .auto-style1 {
                text-align: center;
                font-size: large;
                background-color: #C0C0C0;
            }
            .auto-style2 {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%
            $category = "report";
            $page = "car";
        %>
        <%@include file="templateAdminHeader.jsp" %>
        <%

            String rs = "";
            String type = (String) request.getAttribute("type");
            int pagesnum = (Integer) request.getAttribute("pagesnum");
            int pages = (Integer) request.getAttribute("page");
            String from = (String) request.getParameter("$from");
            String to = (String) request.getParameter("$to");
            if ("most".equals(type) || "available".equals(type) || "all".equals(type)) {
                rs = (String) request.getAttribute("INFO");
            }
            if (rs == null || "".equals(rs)) {
        %><a href="carReportSearch.jsp">Back to Car Report</a><br/><br/><center>No data available.</center><%            } else {
            %>
        <div align="center">
            <!--<img src="images/e2w-logo.jpg" align="center"/>-->
        </div>
        <a href="carReportSearch.jsp">Back to Car Report</a>
        <center>
            <table border="0" width="640px" align="center">
                <tr align="center">
                    <td class="auto-style1" style="height: 100px" align="center"><strong>
                            <%
                                if ("most".equals(type)) {
                            %>MOST BOOKED CAR REPORT
                            <%                                    }
                                if ("available".equals(type)) {
                            %>
                            AVAILABLE ORDERS REPORT
                            <%                                    }
                                if ("all".equals(type)) {
                            %>
                            ALL ORDERS REPORT
                            <%                                    }
                            %>
                        </strong></td>
                </tr>
                <tr align="center">
                    <td class="auto-style2" align="center">from <%=from%> to <%=to%></td>
                </tr>
                <tr align="center">
                    <td class="auto-style2" align="center">Report created at <%= new Date()%></td>
                </tr>
            </table>
            <br/><br/>
            <div id="pagingsection" align="center">
                
                <table><tr>
                        <%
                            for (int i = 0; i < pagesnum; i++) {
                        %>
                        <td>
                            <form action="CarReportServlet" method="POST" id="page<%=i%>">                
                                <input type="hidden" name="type" value="<%=type%>" />
                                <input type="hidden" name="$from" value="<%=from%>"/>
                                <input type="hidden" name="$to" value="<%=to%>"/>
                                <input type="hidden" name="page" value="<%=i + 1%>"/>
                                <a href="javascript:document.getElementById('page<%=i%>').submit();"><strong>&nbsp;<%if (pages == i + 1) {%><u><%}%><%=i + 1%><%if (pages == i + 1) {%></u><%}%>&nbsp;</strong></a>
                            </form>
                        </td>
                        <%}%>
                    </tr>
                </table>
            </div>
            <table border="1" width=640px align="center">
                <thead align="center">
                    <%
                        if ("most".equals(type)) {
                    %>
                    <tr align="center">
                        <th align="center">No.</th>
                        <th align="center">Car ID</th>
                        <th align="center">Model</th>
                        <th align="center">Type</th>
                        <th align="center">Capacity</th>
                        <th align="center">Air Conditioner</th>
                        <th align="center">Price</th>
                        <th align="center">Total Booked</th>
                    </tr>
                    <%                    }
                    %>
                    <%
                        if ("available".equals(type)) {
                    %>
                    <tr align="center">
                        <th align="center">No.</th>
                        <th align="center">Model</th>
                        <th align="center">Quantity</th>
                        <th align="center">Driver</th>
                        <th align="center">Pick Up</th>
                        <th align="center">Drop Off</th>
                        <th align="center">Order Date</th>
                    </tr>
                    <%                    }
                    %>
                    <%
                        if ("all".equals(type)) {
                    %>
                    <tr align="center">
                        <th align="center">No.</th>
                        <th align="center">Order Date</th>
                        <th align="center">Model</th>
                        <th align="center">Quantity</th>
                        <th align="center">Driver</th>
                        <th align="center">Pick Up</th>
                        <th align="center">Drop Off</th>
                        <th align="center">Total Cost</th>
                        <th align="center">Status</th>
                    </tr>
                    <%                    }
                    %>
                </thead>
                <tbody align="center">
                    <%
                        if ("most".equals(type)) {
                    %>
                    <%=rs%>

                    <%}%>

                    <%
                        if ("available".equals(type)) {
                    %>
                    <%=rs%>
                    <%}%>
                    <%
                        if ("all".equals(type)) {
                    %>
                    <%=rs%>
                    <%}%>
                </tbody>
            </table>
            <div id="pagingsection" align="center">

                <table><tr>
                        <%
                            for (int i = 0; i < pagesnum; i++) {
                        %>
                        <td>
                            <form action="CarReportServlet" method="POST" id="page<%=i%>">                
                                <input type="hidden" name="type" value="<%=type%>" />
                                <input type="hidden" name="$from" value="<%=from%>"/>
                                <input type="hidden" name="$to" value="<%=to%>"/>
                                <input type="hidden" name="page" value="<%=i + 1%>"/>
                                <a href="javascript:document.getElementById('page<%=i%>').submit();"><strong>&nbsp;<%if (pages == i + 1) {%><u><%}%><%=i + 1%><%if (pages == i + 1) {%></u><%}%>&nbsp;</strong></a>
                            </form>
                        </td>
                        <%}%>
                    </tr>
                </table>
            </div>
        </center>
        <%}%>
        <%@include file="templateAdminFooter.jsp" %>
    </body>
</html>
