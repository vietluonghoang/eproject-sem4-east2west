<%-- 
    Document   : carReportShow
    Created on : Apr 25, 2013, 5:35:27 PM
    Author     : Tuan Ngoc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.management.Query"%>
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
            $page = "tour";
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
            if ("".equals(rs)) {
        %><a href="AdminTourReport.jsp">Back to Tour Report</a><br/><br/><center>No data available.</center>
            <%            } else {
            %>
        <a href="AdminTourReport.jsp">Back to Tour Report</a>
        <center>
            
            <table border="0" width="640px" align="center">
                <tr align="center">
                    <td class="auto-style1" style="height: 100px" align="center"><strong>
                            <%
                                if ("most".equals(type)) {
                            %>MOST BOOKED TOUR REPORT
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
                            <form action="TourReportServlet" method="POST" id="page<%=i%>">                
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
            <table border="1" width=840px align="center">
                <thead align="center">
                    <%
                        if ("most".equals(type)) {
                    %>
                    <tr align="center">
                        <th align="center">No.</th>
                        <th align="center">Tour ID</th>
                        <th align="center">Tour Name</th>
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
                        <th align="center">Order Tour ID</th>
                        <th align="center">Customer ID</th>
                        <th align="center">Customer Name</th>
                        <th align="center">Tour ID</th>
                        <th align="center">Tour Name</th>
                        <th align="center">Quantity</th>
                        <th align="center">Total Price</th>
                        <th align="center">Order Date</th>
                        <th align="center">Start Date</th>
                        <th align="center">End Date</th>
                    </tr>
                    <%                    }
                    %>
                    <%
                        if ("all".equals(type)) {
                    %>
                    <tr align="center">
                        <th align="center">No.</th>
                        <th align="center">Order Tour ID</th>
                        <th align="center">Customer ID</th>
                        <th align="center">Customer Name</th>
                        <th align="center">Tour ID</th>
                        <th align="center">Tour Name</th>
                        <th align="center">Quantity</th>
                        <th align="center">Total Price</th>
                        <th align="center">Order Date</th>
                        <th align="center">Start Date</th>
                        <th align="center">End Date</th>
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
        </center>
        <%}%>
        <div id="pagingsection" align="center">
            <table><tr>
                    <%
                        for (int i = 0; i < pagesnum; i++) {
                    %>
                    <td>
                        <form action="TourReportServlet" method="POST" id="page<%=i%>">                
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
        <%@include file="templateAdminFooter.jsp" %>
    </body>
</html>
