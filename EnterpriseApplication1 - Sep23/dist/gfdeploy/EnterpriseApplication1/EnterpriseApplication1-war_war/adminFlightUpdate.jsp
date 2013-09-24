<%-- 
    Document   : adminFlightUpdate
    Created on : May 8, 2013, 12:25:23 AM
    Author     : JAKE
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="e2w.enitites.Flight"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="templateAdminHead.jsp" %>
                    <link rel="stylesheet" href="jquery/jquery-ui.css"/>
            <script src="jquery/jquery-1.9.1.js"></script>
            <script src="jquery/jquery-ui.js"></script>
        <script>
$(function() {
$("#datepicker5").datepicker({dateFormat: 'yy-mm-dd'});
$("#datepicker6").datepicker({dateFormat: 'yy-mm-dd'});
});
        </script>
    </head>
    <body>
        <%@include file="templateAdminHeader.jsp" %>
        <div align="center">
        <form action="flightServlet" method="post">
            <table border="2" width="500" align="center">
            <%
            CustomerBeanRemote remote = (CustomerBeanRemote) ctx.lookup("CustomerBeanJNDI");
            String flightID = request.getAttribute("flightID").toString();
            Flight result = remote.loadFlightByFlightID(Integer.parseInt(flightID));
                    %>
            <tbody>
                <tr>
                    <th align="center">Flight ID</th>
                    <td align="center"><%=result.getFlightID() %>
                        <input type="hidden" name="txtFlightIDHidden" value="<%=result.getFlightID() %>"/>
                    </td>
                </tr>
                <tr>
                    <th align="center">Flight Branch</th>
                    <td align="center"><select name="ddlFlightName">
                            <%
                           String flightB = result.getFlightBranch();
                             if(flightB.equals("American Airline")){
%>
                            <option value="American Airline">AA</option>
                            <option value="Japan Airline">JA</option>
                            <option value="Vietnam Airline">VA</option>
                            <%
                            }else if(flightB.equals("Japan Airline")){
%>
                        <option value="Japan Airline">JA</option>
                        <option value="American Airline">AA</option>
                        <option value="Vietnam Airline">VA</option>
                            <%
                            }if(flightB.equals("Vietnam Airline")){
%>
                        <option value="Vietnam Airline">VA</option>                            
                        <option value="American Airline">AA</option>
                        <option value="Japan Airline">JA</option>
                            
                            <%
                            }
%>
                        </select>

                    </td>
                </tr>
                    <%
                       Date aD = result.getAvailableDate();
                       Date eD = result.getExpiredDate();
%>
                    <tr>
                    <th align="center">Available Date</th>
                    <td align="center"><input type="text" name="txtAvailableDate" id="datepicker5" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(aD)%>" size="15"/></td>
                    </tr>
                    <tr>
                    <th align="center">Expired Date</th>
                    <td align="center"><input type="text" name="txtExpiredDate" id="datepicker6" value="<%= new SimpleDateFormat("yyyy-MM-dd").format(eD) %>" size="15"/></td>
                    </tr>
                    <tr>
                    <th align="center">Departure airport</th>
                    <td align="center"><input type="text" name="txtDepartureAirport" value="<%=result.getTakingOfAirP() %>" size="15"/></td>
                    </tr>
                    <tr>
                    <th align="center">Arrival airport</th>
                    <td align="center"><input type="text" name="txtArrivalAirport" value="<%=result.getLandingAirP() %>" size="15"/></td>
                    </tr>
                    <tr>
                    <th align="center">Departure time</th>
                    <td align="center"><input type="text" name="txtDepartureTime" value="<%=result.getTakingOfTime() %>"size="15" /></td>
                    </tr>
                    <tr>
                    <th align="center">Arrival time</th>
                    <td align="center"><input type="text" name="txtArrivalTime" value="<%=result.getLandingTime() %>" size="15"></td>
                    </tr>
                    <tr>
                    <th align="center">Price</th>
                    <td align="center"><input type="text" name="txtPrice" value="<%=result.getPrice() %>" size="15" /></td>
                    </tr>
                    <tr>
                        <td rowspan="2" colspan="2" align="center"><input type="submit" name="action" value="Update" id="btUpdate"/></td>
                </tr>
            </tbody>
        </table>
        </form>
        </div>
        <%@include file="templateAdminFooter.jsp" %>
    </body>
</html>
