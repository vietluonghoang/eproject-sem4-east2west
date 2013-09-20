<%-- 
    Document   : adminFlight
    Created on : May 7, 2013, 10:31:42 PM
    Author     : JAKE
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
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
         <script type="text/css" src="css/screen.css"/>
         <script src="jquery/jquery-1.9.1.js"></script>
             <script src="jquery/jquery-ui.js"></script>
             <script src="jquery/jquery.tablePagination.0.js"></script>
         <style>
             td {
            border: 1px;
          }

          table {
            border:1 px; width: 100%;
          }

          #testTable {
            width : 1000px;
            margin-left: 20px;
            margin-right: auto;
            border: 0;
          }

          #tablePagination {
            background-color: #DCDCDC;
            font-size: 0.8em;
            padding: 0px 5px;
            height: 20px
          }

          #tablePagination_paginater {
            margin-left: auto;
            margin-right: auto;
          }

          #tablePagination img {
            padding: 0px 2px;
          }

          #tablePagination_perPage {
            float: left;
            visibility: hidden;
          }

          #tablePagination_paginater {
            float: right;
          }
          <script>

         </style>
         <script>
             $(document).ready(
 	function() {
            $('tbody tr:odd', $('#menuTable')).show(); //hiding rows for test
            var options = {
              rowsPerPage : 5,
              optionsForRows:[5],
              firstArrow : (new Image()).src="./images/paging/firstBlue.gif",
              prevArrow : (new Image()).src="./images/paging/prevBlue.gif",
              lastArrow : (new Image()).src="./images/paging/lastBlue.gif",
              nextArrow : (new Image()).src="./images/paging/nextBlue.gif",
              topNav : false
            }

 	$('#menuTable').tablePagination(options);
 	});
         </script>
    </head>
    <body>

        <%
            $category = "flight";
            $page = "search";
            %>

        <%@include file="templateAdminHeader.jsp" %>

        

        <div id="testTable" align="center">
        <form action="flightServlet" method="post">
            <table border="2" width="500" id="menuTable" align="center">
                 <tbody>
                    <tr align="center">
                        <td align="center"><strong>Flight ID</strong></td>
                        <td align="center"><strong>Flight Branch</strong></td>
                        <td align="center"><strong>Available Date</strong></td>
                        <td align="center"><strong>Expired Date</strong></td>
                        <td align="center"><strong>Departure airport</strong></td>
                        <td align="center"><strong>Arrival airport</strong></td>
                        <td align="center"><strong>Departure time</strong></td>
                        <td align="center"><strong>Arrival time</strong></td>
                        <td align="center"><strong>Price</strong></td>
                        <td align="center"><strong>Action</strong></td>
                    </tr>
               
                    <%
                    CustomerBeanRemote remote = (CustomerBeanRemote) ctx.lookup("CustomerBeanJNDI");
                    Flight[] result = remote.loadFlight();
for (int i = 0; i < result.length; i++) {
%>
                    <tr align="center">
                        <td align="center"><%=result[i].getFlightID() %></td>
                        <td align="center"><%=result[i].getFlightBranch() %></td>
                        <%
                       Date aD = result[i].getAvailableDate();
                       Date eD = result[i].getExpiredDate();
%>
                        <td align="center"><%= new SimpleDateFormat("yyyy-MM-dd").format(aD) %></td>
                        <td align="center"><%= new SimpleDateFormat("yyyy-MM-dd").format(eD) %></td>
                        <td align="center"><%=result[i].getTakingOfAirP() %></td>
                        <td align="center"><%=result[i].getLandingAirP() %></td>
                        <td align="center"><%=result[i].getTakingOfTime() %></td>
                        <td align="center"><%=result[i].getLandingTime() %></td>
                        <td align="center"><%=result[i].getPrice() %> $</td>
                        <td align="center">
                            <input type="hidden" name="flightIDHidden" value="<%=result[i].getFlightID() %>"/>
                            <input type="submit" name="action" value="UpdateFlight" id="btUpdate"/><br/><br/>
                            <input type="submit" name="action" value="DeleteFlight" id="btDelete"/>
                        </td>
                    </tr>
                    <%
                    }
%>
                </tbody>
            </table>
                        </form>
            </div>
        <%@include file="templateAdminFooter.jsp" %>

    </body>
</html>
