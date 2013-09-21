<%-- 
    Document   : carDescription
    Created on : Apr 15, 2013, 2:18:50 PM
    Author     : Tuan Ngoc
--%>

<%@page import="ngoc.entity.Hotel"%>
<%@page import="ngoc.entity.Car"%>
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
    </head>
    <body>
        <div id="page-container">
            <%@include file="templateHeader.jsp" %>
            <div id="content">


<!------------------------- CONTENT BEGIN ------------------------------>


        <%
            //Context ctx = new InitialContext();
            NgocStatelessRemote ngocStatelessRemote = (NgocStatelessRemote) ctx.lookup("NgocStatelessRemote");
            int $hotelID = Integer.parseInt(request.getParameter("$hotelID"));
            Hotel hotel = ngocStatelessRemote.searchReturn1Hotel($hotelID);
        %>
            <table border="0">
                <tbody>
                    <tr>
                        <td>Name</td>
                        <td><%= hotel.getHotelName() %></td>
                    </tr>
                    <tr>
                        <td>Star</td>
                        <td>
                            <% for (int j=0; j<hotel.getHotelStar(); j++) {
                                %><img src="images/hotel/star.png" /><%
                                }
                            %>
                        </td>
                    </tr>
                    <tr>
                        <td>Street</td>
                        <td><%= hotel.getHotelStreet() %></td>
                    </tr>
                    <tr>
                        <td>price</td>
                        <td><%= hotel.getHotelPrice() %> $/night</td>
                    </tr>
                </tbody>
            </table>
        <br/><br/>
        <img width="450px" src="images/<%= hotel.getHotelImage() %>" />
        <br/><br/>
        <div style=" text-wrap: normal; word-wrap:break-word;" >
        <%= hotel.getHotelDescription() %>
        </div>


<!------------------------- CONTENT BEGIN ------------------------------>


            </div>
            <%@include file="templateFooter.jsp" %>
        </div>
    </body>
</html>
