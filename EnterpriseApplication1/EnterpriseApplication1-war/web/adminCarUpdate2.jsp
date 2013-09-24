<%-- 
    Document   : adminCarUpdate
    Created on : Apr 14, 2013, 9:37:13 PM
    Author     : Tuan Ngoc
--%>

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
        
        <%@include file="templateAdminHead.jsp" %>
    </head>
        <body>

        <% $category="car"; %>

        <%@include file="templateAdminHeader.jsp" %>

        <%
            //Context ctx = new InitialContext();
            NgocStatelessRemote ngocStatelessRemote = (NgocStatelessRemote) ctx.lookup("NgocStatelessRemote");
            int $carID = Integer.parseInt(request.getParameter("$carID"));
            Car car = ngocStatelessRemote.searchReturn1($carID);
        %>
        <form action="adminCarUploadImage.jsp" method="post" enctype="multipart/form-data">
            <input type="hidden" name="$carID" value="<%=car.getCarID()%>" />
            <input type="hidden" name="$which" value="update" />

            <table border="0" align="center" width="500">
                <tbody align="center">
                    <tr align="center">
                        <td align="center"><strong>Model</strong></td>
                        <td align="left"><input type="text" name="$model" value="<%=car.getModel()%>" /></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Type</strong></td>
                        <td align="left"><input type="text" name="$type" value="<%=car.getType()%>" /></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Seating capacity</strong></td>
                        <td align="left"><input type="text" name="$seat" value="<%=car.getSeat()%>" /></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Airconditioner required</strong></td>
                        <td align="left">
                        <%
                        if(car.getAirConditioner()) {
                            %>
                            <input type="checkbox" name="$airConditioner" value="whatever" checked />
                            <%
                        } else {
                            %>
                            <input type="checkbox" name="$airConditioner" value="whatever" />
                            <%
                        }
                        %>
                        </td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Description</strong></td>
                        <td align="left"><textarea rows="10" cols="30" name="$description"><%=car.getDescription()%></textarea></td>
                    </tr>
                    <tr align="center">
                        <td align="center"></td>
                        <td align="left"><img src="images/<%=car.getImage() %>" width="200"/></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Image</strong></td>
                        <td align="left"><input type="file" accept="image/*" name="$image" /></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Stock Quantity</strong></td>
                        <td align="left"><input type="text" name="$stock" value="<%=car.getQuantityStock()%>" /></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Price</strong></td>
                        <td align="left"><input type="text" name="$price" value="<%=car.getPrice()%>" /> USD</td>
                    </tr>
                    <tr align="center">
                        <td align="center"><input type="submit" name="action" value="update car" id="btUpdate"/></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </form>

            <%@include file="templateAdminFooter.jsp" %>

    </body>
</html>
