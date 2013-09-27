<%-- 
    Document   : adminCarSearch
    Created on : Apr 14, 2013, 11:54:35 AM
    Author     : Tuan Ngoc
--%>

<%@page import="ngoc.entity.Hotel"%>
<%@page import="ngoc.bean.NgocStatelessRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="templateHeadTag.jsp" %>
    </head>
    <body>
        <div id="page-container">
            <%@include file="templateHeader.jsp" %>
            <div id="content">



<!------------------------- CONTENT BEGIN ------------------------------>


        <form action="NgocServlet" method="post">
            <table border="0">
                <tbody>
                    <tr>
                        <td><strong>Name</strong></td>
                        <td><input type="text" name="$name" /></td>
                    </tr>
                    <tr>
                        <td><strong>Star >=</strong></td>
                        <td><input type="text" name="$star" /></td>
                    </tr>
                    <tr>
                        <td><strong>Street</strong></td>
                        <td><input type="text" name="$street" /></td>
                    </tr>
                    <tr>
                        <td><strong>Price From</strong></td>
                        <td><input type="text" name="$from" /> USD</td>
                    </tr>
                    <tr>
                        <td><strong>Price To</strong></td>
                        <td><input type="text" name="$to" /> USD</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" name="action" value="search hotel" id="btSearch"/></td>
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
	


<div id="car-items">
<h2>Hotel</h2>
<div id="testTable">
    <div id="menuTable">
                <%
                //for (int i = 0; i < result.length; i++) {
                for (int i=result.length-1;i>=0;i--) {
                %>

                <table border="0">
  <tr>
      <td rowspan="6"><img src="images/<%=result[i].getHotelImage() %>" width="250" height="150"/></td>
    <td><strong>Name</strong></td>
    <td><%=result[i].getHotelName() %></td>
  </tr>
  <tr>
    <td><strong>Star</strong></td>
    <td>
        <% for (int j=0; j<result[i].getHotelStar(); j++) {
            %><img src="images/hotel/star.png" /><%
            }
        %>
    </td>
  </tr>
  <tr>
    <td><strong>Street</strong></td>
    <td><%= result[i].getHotelStreet() %></td>
  </tr>
  <tr>
    <td><strong>Price</strong></td>
    <td><%=result[i].getHotelPrice() %> $/day</td>
  </tr>
   <tr>
    <td colspan="3">
        <form action="hotelDescription.jsp" method="post">
            <input type="hidden" name="$hotelID" value="<%=result[i].getHotelID() %>" />
            <input type="submit" name="action" value="description" align="right" id="btViewDetail" />
        </form>
    </td>
  </tr>
</table>

            <%}%>
                </div>
</div>

<br/>
<div align="center">
</div>
</div>

                <%}%>


<!------------------------- CONTENT BEGIN ------------------------------>


            </div>
            <%@include file="templateFooter.jsp" %>
        </div>
    </body>
</html>
