<%-- 
    Document   : adminCarSearch
    Created on : Apr 14, 2013, 11:54:35 AM
    Author     : Anh Tuan
--%>

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
              firstArrow : (new Image()).src="images/paging/firstBlue.gif",
              prevArrow : (new Image()).src="images/paging/prevBlue.gif",
              lastArrow : (new Image()).src="images/paging/lastBlue.gif",
              nextArrow : (new Image()).src="images/paging/nextBlue.gif",
              topNav : false
            }

 	$('#menuTable').tablePagination(options);
 	});
         </script>
    </head>
        <body>

            <%
            $category = "car";
            $page = "search";
            %>

        <%@include file="templateAdminHeader.jsp" %>

        <form action="ActionServlet" method="post">
            <input type="hidden" name="which" value="whatever" />
            <table border="0" align="center" width="500">
                <tbody>
                    <tr align="center">
                        <td align="center"><strong>Model</strong></td>
                        <td align="left"><input type="text" name="$model" /></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Type</strong></td>
                        <td align="left"><input type="text" name="$type" /></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Seating Capacity</strong></td>
                        <td align="left"><input type="text" name="$seat" /></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Airconditioner</strong></td>
                        <td align="left"><input type="radio" name="$airConditioner" value="yes" /> Yes
                            <input type="radio" name="$airConditioner" value="no" /> No</td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Stock Quantity >=</strong></td>
                        <td align="left"><input type="text" name="$stock" /></td>
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
                        <td align="left"><input type="submit" name="action" value="search" id="btSearch"/></td>
                    </tr>
                </tbody>
            </table>
        </form>
            <br/><br/>
        <%
        
        NgocStatelessRemote statelessRemote = (NgocStatelessRemote) ctx.lookup("NgocStatelessRemote");
        Car[] result;
        if(request.getAttribute("INFO") == null) {
            result = (Car[])statelessRemote.search("SELECT c FROM Car c WHERE c.isDeleted = false");
        } else {
            result = (Car[])request.getAttribute("INFO");
        }
        if (result.length==0) {
            %>
            No result found. Please broaden your search!
            <%
        } else {
        %>
	<div id="testTable" align="center">
        <table border="2" width="500" id="menuTable" align="center">
            <tbody align="center">
                <tr align="center">
                    <td align="center"><strong>Model</strong></td>
                    <td align="center"><strong>Image</strong></td>
                    <td align="center"><strong>Type</strong></td>
                    <td align="center"><strong>Capacity</strong></td>
                    <td align="center"><strong>Air-conditioner</strong></td>
                    <td align="center"><strong>Stock Quantity</strong></td>
                    <td align="center"><strong>Price</strong></td>
                </tr>

                <%
                for (int i=result.length-1;i>=0;i--) {
                %>
                <tr align="center">
                    <td align="center"><%=result[i].getModel() %></td>
                    <td align="center"><img src="images/<%=result[i].getImage() %>" width="100px" /></td>
                    <td align="center"><%=result[i].getType() %></td>
                    <td align="center"><%=result[i].getSeat() %></td>
                    <td align="center"><%
                        if(result[i].getAirConditioner()) {
                            %>
                            <input type="checkbox" checked />
                            <%
                        } else {
                            %>
                            <input type="checkbox" />
                            <%
                        }
                        %>
                    </td>
                    <td align="center"><%=result[i].getQuantityStock() %></td>
                    <td align="center"><%=result[i].getPrice() %> USD</td>
                    <td align="center"><form action="adminCarDescription.jsp" method="post">
                            <input type="hidden" name="$carID" value="<%=result[i].getCarID() %>" />
                            <input type="submit" name="action" value="description" id="btViewDetail"/>
                            
                           
                        </form>
                            <br/>
                        <form action="adminCarUpdate.jsp" method="post">
                            <input type="hidden" name="$carID" value="<%=result[i].getCarID() %>" />
                            <input type="submit" name="action" value="update" id="btUpdate"/>
                        </form>
                            <br/>
                        <form action="TuanServlet" method="post" onsubmit=
                            "return confirm(
                            'Do you really want to delete this car? This action cannot be undone!');">
                            <input type="hidden" name="$carID" value="<%=result[i].getCarID() %>" />
                            <input type="submit" name="action" value="delete" id="btDelete" />
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
