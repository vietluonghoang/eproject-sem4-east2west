<%-- 
    Document   : adminInsertFlight
    Created on : May 8, 2013, 10:03:47 AM
    Author     : JAKE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="jquery/jquery-ui.css"/>
            <script src="jquery/jquery-1.9.1.js"></script>
             <script src="jquery/jquery-ui.js"></script>
             <script>
                 $(function() {
$("#datepicker7").datepicker({dateFormat: 'yy-mm-dd'});
$("#datepicker8").datepicker({dateFormat: 'yy-mm-dd'});
});
             </script>
        <%@include file="templateAdminHead.jsp" %>
    </head>
    <body>

        <%
            $category = "flight";
            $page = "insert";
            %>

        <%@include file="templateAdminHeader.jsp" %>

        

        <form action="flightServlet" method="post">
            <table border="0" width="500" align="center">
            <tbody>
                <tr>
                    <th align="center">Flight Branch</th>
                    <td><select name="ddlFlightName" align="left">
                            <option value="American Airline">AA</option>
                            <option value="Japan Airline">JA</option>
                            <option value="Vietnam Airline">VA</option>
                        </select>
                    </td>
                </tr>
                <tr align="center">
                    <th align="center">Available Date</th>
                    <td align="left"><input type="text" name="txtAvailableDate" id="datepicker7" /></td>
                    <tr/>
                    <tr align="center">
                    <th align="center">Expired Date</th>
                    <td align="left"><input type="text" name="txtExpiredDate" id="datepicker8" /></td>
                    </tr>
                    <tr>
                    <th align="center">Departure airport</th>
                    <td align="left"><input type="text" name="txtDepartureAirport" /></td>
                    <tr align="center">
                    <th align="center">Arrival airport</th>
                    <td align="left"><input type="text" name="txtArrivalAirport"/></td>
                    </tr>
                    <tr align="center">
                    <th align="center">Departure time</th>
                    <td align="left"><input type="text" name="txtDepartureTime" /></td>
                    </tr>
                    <tr align="center">
                     <th align="center">Arrival time</th>
                    <td align="left"><input type="text" name="txtArrivalTime"/></td>
                    </tr>
                    <tr align="center">
                    <th align="center">Price</th>
                    <td align="left"><input type="text" name="txtPrice"/></td>
                    </tr>
                    <tr>
                    <td align="center"></td>
                    <td align="left"><input type="submit" name="action" value="Insert" id="btInsert" /></td>
                    </tr>
            </tbody>
        </table>
        </form>
         <%@include file="templateAdminFooter.jsp" %>
    </body>
</html>
