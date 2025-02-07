<%-- 
    Document   : insertCar
    Created on : Apr 14, 2013, 10:49:51 AM
    Author     : Anh Tuan
--%>

<%@page import="ngoc.entity.Hotel"%>
<%@page import="ngoc.bean.NgocStatelessRemote"%>
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
            NgocStatelessRemote statelessRemote = (NgocStatelessRemote) ctx.lookup("NgocStatelessRemote");
            int $hotelID = Integer.parseInt(request.getParameter("$hotelID"));
            Hotel hotel = statelessRemote.searchReturn1Hotel($hotelID);
        %>

        <form action="adminHotelUploadImage.jsp" method="post" enctype="multipart/form-data">
            <input type="hidden" name="$hotelID" value="<%= hotel.getHotelID()%>" />
            <input type="hidden" name="$which" value="update" />
            <table border="0" align="center" width="500">
                <tbody>
                    <tr align="center">
                        <td align="center"><strong>Name</strong></td>
                        <td align="left"><input type="text" name="$name" value="<%= hotel.getHotelName()%>" /></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Star</strong></td>
                        <td align="left"><input type="text" name="$star" value="<%= hotel.getHotelStar()%>" /></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Street</strong></td>
                        <td align="left"><input type="text" name="$street" value="<%= hotel.getHotelStreet()%>" /></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Description</strong></td>
                        <td align="left"><textarea rows="10" cols="30" name="$description"> <%= hotel.getHotelDescription()%></textarea></td>
                    </tr>
                    <tr align="center">
                        <td align="center"></td>
                        <td align="left"><img src="images/<%=hotel.getHotelImage()%>" width="200"/></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Image</strong></td>
                        <td align="left"><input type="file" accept="image/*" name="$image" /></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Price</strong></td>
                        <td align="left"><input type="text" name="$price" value="<%= hotel.getHotelPrice()%>" /> USD</td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="action" value="insert" id="btUpdate"/></td>
                        <td><input type="reset" value="reset" /></td>
                    </tr>
                </tbody>
            </table>
        </form>

        <%@include file="templateAdminFooter.jsp" %>
    </body>
</html>
