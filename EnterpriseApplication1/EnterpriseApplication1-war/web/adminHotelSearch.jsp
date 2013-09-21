<%-- 
    Document   : adminCarSearch
    Created on : Apr 14, 2013, 11:54:35 AM
    Author     : Tuan Ngoc
--%>

<%@page import="ngoc.entity.Hotel"%>
<%@page import="ngoc.entity.Car"%>
<%@page import="ngoc.bean.NgocStatelessRemote"%>
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
            $category = "hotel";
            $page = "search";
            %>

        <%@include file="templateAdminHeader.jsp" %>

        <form action="NgocServlet" method="post">
            <input type="hidden" name="which" value="whatever" />
            <table border="0" align="center" width="300">
                <tbody>
                    <tr align="center">
                        <td align="center"><strong>Name</strong></td>
                        <td align="left"><input type="text" name="$name" /></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Star >=</strong></td>
                        <td align="left"><input type="text" name="$star" /></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Street</strong></td>
                        <td align="left"><input type="text" name="$street" /></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Price From</strong></td>
                        <td align="left"><input type="text" name="$from" /> USD</td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Price To</strong></td>
                        <td align="left"><input type="text" name="$to" /> USD</td>
                    </tr>
                    <tr align="center">
                        <td></td>
                        <td align="left"><input type="submit" name="action" value="search hotel" id="btSearch"/></td>
                    </tr>
                </tbody>
            </table>
        </form>
            <br/><br/>
        <%
        //Context ctx = new InitialContext();
        NgocStatelessRemote ngocStatelessRemote = (NgocStatelessRemote) ctx.lookup("NgocStatelessRemote");
        Hotel[] result;
        if(request.getAttribute("INFO") == null) {
            result = (Hotel[])ngocStatelessRemote.searchHotel("SELECT h FROM Hotel h WHERE h.isDeleted = false");
        } else {
            result = (Hotel[])request.getAttribute("INFO");
        }
        if (result.length==0) {
            %>
            No result found. Please broaden your search
            <%
        } else {
        %>
	<div id="testTable" align="center">
            <table border="2" width="800" id="menuTable" align="center">
            <tbody>
                <tr align="center">
                    <td align="center"><strong>Name</strong></td>
                    <td align="center"><strong>Image</strong></td>
                    <td align="center"><strong>Street</strong></td>
                    <td align="center"><strong>Star</strong></td>
                    <td align="center"><strong>Price</strong></td>
                </tr>

                <%
                for (int i=result.length-1;i>=0;i--) {
                %>
                <tr align="center">
                    <td align="center"><%= result[i].getHotelName() %></td>
                    <td align="center"><img src="images/<%= result[i].getHotelImage() %>" width="100px" /></td>
                    <td align="center"><%= result[i].getHotelStreet() %></td>
                    <td align="center">
                        <% for (int j=0; j<result[i].getHotelStar(); j++) {
                            %><img src="images/hotel/star.png" /><%
                            }
                        %>
                    </td>
                    <td align="center"><%=result[i].getHotelPrice() %> USD</td>
                    <td align="center"><form action="adminHotelDescription.jsp" method="post">
                            <input type="hidden" name="$hotelID" value="<%= result[i].getHotelID() %>" />
                            <input type="submit" name="action" value="description" id="btViewDetail" />
                            <br/>
                        </form>
                        <!--<form action="adminCarUpdate.jsp" method="post">
                            <input type="hidden" name="$hotelID" value="<%=result[i].getHotelID() %>" />
                            <input type="submit" name="action" value="update" />
                        </form>-->
                        <form action="NgocServlet" method="post" onsubmit=
                            "return confirm(
                            'Do you really want to delete this car? This action cannot be undone!');">
                            <input type="hidden" name="$hotelID" value="<%= result[i].getHotelID() %>" />
                            <input type="submit" name="action" value="delete hotel" id="btDelete"/>
                        </form>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
                <%}%>
        </div>
        <%@include file="templateAdminFooter.jsp" %>

    </body>
</html>
