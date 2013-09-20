<%-- 
    Document   : carDescription
    Created on : Apr 15, 2013, 2:18:50 PM
    Author     : Anh Tuan
--%>

<%@page import="tuan.entity.Hotel"%>
<%@page import="tuan.entity.Car"%>
<%@page import="tuan.bean.TuanStatelessRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
   <%@include file="templateAdminHead.jsp" %>
    </head>
        <body>

            <%
            $category = "hotel";
            $page = "search";
            %>

        <%@include file="templateAdminHeader.jsp" %>

        <%
            //Context ctx = new InitialContext();
            TuanStatelessRemote tuanStatelessRemote = (TuanStatelessRemote) ctx.lookup("TuanStatelessRemote");
            int $hotelID = Integer.parseInt(request.getParameter("$hotelID"));
            Hotel hotel = tuanStatelessRemote.searchReturn1Hotel($hotelID);
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
                    <tr>
                        <td>
                            
                        </td>
                        <td>
                            <form action="TuanServlet" method="post" onsubmit=
                            "return confirm(
                            'Do you really want to delete this car? This action cannot be undone!');">
                            <input type="hidden" name="$hotelID" value="<%= hotel.getHotelID() %>" />
                            <input type="submit" name="action" value="delete hotel" id="btDelete"/>
                        </form>
                        </td>
                    </tr>
                </tbody>
            </table>
        <br/><br/>
        <img width="450px" src="images/<%= hotel.getHotelImage() %>" />
        <br/><br/>
        <%= hotel.getHotelDescription() %>

<%@include file="templateAdminFooter.jsp" %>

    </body>
</html>
