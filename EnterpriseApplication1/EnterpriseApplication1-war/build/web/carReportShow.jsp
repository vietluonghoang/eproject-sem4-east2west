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
        <%@include file="templateAdminHeader.jsp" %>
        <%
            Context ctx1 = new InitialContext();
            NgocStatefulRemote ngocStateful = (NgocStatefulRemote) ctx1.lookup("NgocStatefulRemote");
//        CarReportDTO[] top10 = (CarReportDTO[])request.getAttribute("INFO");
            Object result = null;
            Car car;
            String type = (String) request.getAttribute("type");
            if ("most".equals(type)) {
                result = (ArrayList<CarReportDTO>) request.getAttribute("INFO");
            }
            if ("available".equals(type)||"all".equals(type)) {
                result = (ResultSet) request.getAttribute("INFO");
            }
            if (result == null) {
        %><center>No data available.</center><%            } else {
            %>
        <div align="center">
            <!--<img src="images/e2w-logo.jpg" align="center"/>-->
        </div>
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
                    <td class="auto-style2" align="center">from <%=request.getParameter("$from")%> to <%=request.getParameter("$to")%></td>
                </tr>
                <tr align="center">
                    <td class="auto-style2" align="center">Report created at <%= new Date()%></td>
                </tr>
            </table>
            <br/><br/>
            <table border="1" width=640px align="center">
                <thead align="center">
                    <%
                        if ("most".equals(type)) {
                    %>
                    <tr align="center">
                        <th align="center">No.</th>
                        <th align="center">CarID</th>
                        <th align="center">Model</th>
                        <th align="center">Type</th>
                        <th align="center">Capacity</th>
                        <th align="center">Aircondition</th>
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
                    <%
                        int no = 0;
                        for (int i = 0; i < ((ArrayList<CarReportDTO>) result).size(); i++) {
                            car = ngocStateful.findByCarID(((ArrayList<CarReportDTO>) result).get(i).getCarID());
                            no++;
                    %>
                    <tr align="center">
                        <td align="center"><%= no%></td>
                        <td align="center"><%= car.getCarID()%></td>
                        <td align="center"><%= car.getModel()%></td>
                        <td align="center"><%= car.getType()%></td>
                        <td align="center"><%= car.getSeat()%></td>
                        <td align="center">
                            <%
                                if (car.getAirConditioner()) {
                            %>yes<%                            } else {
                            %>no<%                                }
                            %>
                        </td>
                        <td align="center"><%= car.getPrice()%> USD</td>
                        <td align="center"><%= ((ArrayList<CarReportDTO>) result).get(i).getQuantityTotal()%></td>
                    </tr>
                    <%}%>
                    <%
                        }
                    %>
                    <%
                        if ("available".equals(type)) {
                            int no = 0;
                            while (((ResultSet) result).next()) {
                                no++;
                    %>
                    <tr align="center">
                        <td align="center"><%= no%></td>
                        <td align="center"><%= ((ResultSet) result).getString("model")%></td>
                        <td align="center"><%= ((ResultSet) result).getInt("quantity")%></td>
                        <td align="center"><%
                            if (((ResultSet) result).getBoolean("driver")) {
                            %>yes<%                            } else {
                            %>no<%                                }
                            %> </td>
                        <td align="center"><%= ((ResultSet) result).getDate("pickup")%></td>
                        <td align="center"><%=((ResultSet) result).getDate("dropoff")%></td>
                        <td align="center"><%= ((ResultSet) result).getDate("orderDate")%></td>
                    </tr>
                    <%}
                        }%>
                    <%
                        if ("all".equals(type)) {
                            int no = 0;
                            while (((ResultSet) result).next()) {
                                no++;
                    %>
                    <tr align="center">
                        <td align="center"><%= no%></td>
                        <td align="center"><%= ((ResultSet) result).getDate("orderDate")%></td>
                        <td align="center"><%= ((ResultSet) result).getString("model")%></td>
                        <td align="center"><%= ((ResultSet) result).getInt("quantity")%></td>
                        <td align="center"><%
                            if (((ResultSet) result).getBoolean("driver")) {
                            %>yes<%                            } else {
                            %>no<%                                }
                            %> </td>
                        <td align="center"><%= ((ResultSet) result).getDate("pickup")%></td>
                        <td align="center"><%=((ResultSet) result).getDate("dropoff")%></td>
                        <td align="center"><%=((ResultSet) result).getInt("totalCost")%></td>
                        <td align="center"><%=((ResultSet) result).getString("status")%></td>
                    </tr>
                    <%}
                        }%>
                </tbody>
            </table>
        </center>
        <%}%>
        <%@include file="templateAdminFooter.jsp" %>
    </body>
</html>
