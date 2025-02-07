<%-- 
    Document   : Ereport
    Created on : Apr 26, 2013, 7:31:06 PM
    Author     : JAKE
--%>

<%@page import="ngoc.bean.NgocStatefulRemote"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="e2w.dto.CustomerTopReportDTO"%>
<%@page import="e2w.enitites.Tour"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="e2w.enitites.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <%@include file="templateHeadTag.jsp" %>
    </head>
    <%
        String ab = "";
        if (request.getAttribute("Report") != null) {
            ab = request.getAttribute("Report").toString();
        }
        if (!ab.equals("")) {
    %>
    <body onload="printPage('contentReport');">
        <%} else {%>
    <body>
        <%   }
        %>

        <div id="page-container">
            <%
                Context ctx = new InitialContext();

                NgocStatefulRemote ngocStatefulRemote = (NgocStatefulRemote) ctx.lookup("NgocStatefulRemote");
                ngocStatefulRemote = (NgocStatefulRemote) session.getAttribute("admin");
                if (ngocStatefulRemote == null) {
            %>
            <meta http-equiv="refresh" content="1;url=adminLogin.jsp">
            <script type="text/javascript">
    window.location.href = "adminLogin.jsp"
            </script>
            <%                } else if (ngocStatefulRemote.get$username() == null) {
            %>
            <meta http-equiv="refresh" content="1;url=adminLogin.jsp">
            <script type="text/javascript">
                window.location.href = "adminLogin.jsp"
            </script>
            <%                    }
            %>

            <div id="content">
                <h2>Report</h2>
                <p><strong>Report</strong> will show the result of the type of report from date to date</p>
            </div>
            <div id="tour-items">
                <form action="reportServlet" method="post">
                    <table width="280" border="0">
                        <tr>
                            <td><div align="center">Type</div></td>
                            <td>
                                <div align="center">
                                    <select name="cbTypeReport">
                                        <option value="r01">Top 10 booking User</option>
                                    </select>
                                </div></td>
                        </tr>
                        <tr>
                            <td><div align="center">From Date</div></td>
                            <td><div align="center">
                                    <input type="text" name="txtFromDateReport" id="datepicker3"/>
                                </div></td>
                        </tr>
                        <tr>
                            <td><div align="center">To Date</div></td>
                            <td><div align="center">
                                    <input type="text" name="txtToDateReport" id="datepicker4"/>
                                </div></td>
                        </tr>

                        <tr>
                            <td><div align="center"></div></td>
                            <td><div align="center"><input type="submit" name="action" value="View Report" /></div></td>
                        </tr>
                    </table>
                </form>
            </div>

            <%
                CustomerTopReportDTO[] result = (CustomerTopReportDTO[]) request.getAttribute("CustomerTop");
                if (ab.equals("R1") && result.length != 0) {

            %>
            <div align="center"  id="contentReport" style="visibility: hidden; display:inline;">
                <%
                    DateFormat format = new SimpleDateFormat("yyyy-MM-dd");


                    String fromdate = request.getAttribute("fromDate").toString();
                    String todate = request.getAttribute("toDate").toString();

//Date fromDate = format.parse(fromdate);
//Date toDate = format.parse(todate);

                    Date date = new Date();

                %>
                <style>
                    #reportTable,
                    #reportTable td,
                    #reportTable th
                    {
                        border:1px solid green;
                    }
                    #reportTable th
                    {
                        background-color:green;
                        color:white;
                    }
                </style>
                <td colspan="6"><div align="center"><img src="images/e2w-logo.jpg" /></div></td><br/>
                <table border="1" align="center" id="reportTable">
                    <tbody>
                        <tr>
                            <td colspan="6"><div align="center"><strong><h1>Report Result Top 10 Booking Customer</h1></strong></div></td>
                        </tr>
                        <tr>
                            <td colspan="6"><div align="center"><strong>Report created date : <%=format.format(date)%></strong></div></td>
                        </tr>
                        <tr>
                            <%

                            %>
                            <td colspan="6"><p align="center"><strong>From </strong><%=fromdate%> <strong>To </strong><%=todate%></p>    </td>
                        </tr>
                        <tr>
                            <th align="center"><div align="center"><strong>No</strong></div></th>
                            <th align="center"><div align="center">Username</div></th>
                            <th align="center"><div align="center">Full Name</div></th>
                            <th align="center"><div align="center">email</div></th>
                            <th align="center"><div align="center">Phone</div></th>
                            <th align="center"><div align="center">Number of Order</div></th>
                        </tr>
                        <%
                            for (int i = 0; i < result.length; i++) {


                        %>
                        <tr align="center">
                            <td><div align="center"><%=i + 1%></div></td>
                            <td><div align="center"><%=result[i].getUser().getUsername()%></div></td>
                            <td><p align="center"><%=result[i].getUser().getFullname()%></p>    </td>
                            <td><div align="center"><%=result[i].getUser().getEmail()%></div></td>
                            <td><div align="center"><%=result[i].getUser().getPhone()%></div></td>
                            <td><div align="center"><%=result[i].getTotal()%></div></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <%
            } else {
            %>
            <div>No report Result</div>
            <%                 }
            %>

        </div>

    </body>
</html>
