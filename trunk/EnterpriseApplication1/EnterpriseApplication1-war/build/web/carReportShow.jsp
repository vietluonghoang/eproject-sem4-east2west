<%-- 
    Document   : carReportShow
    Created on : Apr 25, 2013, 5:35:27 PM
    Author     : Tuan Ngoc
--%>

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
        Context ctx = new InitialContext();
        NgocStatefulRemote ngocStateful = (NgocStatefulRemote) ctx.lookup("NgocStatefulRemote");
//        CarReportDTO[] top10 = (CarReportDTO[])request.getAttribute("INFO");
            ArrayList<CarReportDTO> result = (ArrayList<CarReportDTO>) request.getAttribute("INFO");
            Car car;
            if (result == null) {
        %><center>No data available.</center><%            } else {
            %>
        <div align="center">
            <!--<img src="images/e2w-logo.jpg" align="center"/>-->
        </div>
        <table border="0" width="640px" align="center">
            <tr align="center">
                <td class="auto-style1" style="height: 100px" align="center"><strong>BOOKED CAR IN TOTAL
                        REPORT</strong></td>
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
            </thead>
            <tbody align="center">
                <%
                    int no = 0;
                    for (int i = 0; i <result.size(); i++) {
                        car = ngocStateful.findByCarID(result.get(i).getCarID());
//                        no++;
//                        if (no == 11) {
//                            return;
//                        }
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
                    <td align="center"><%= result.get(i).getQuantityTotal()%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
        <%}%>
    </body>
</html>
