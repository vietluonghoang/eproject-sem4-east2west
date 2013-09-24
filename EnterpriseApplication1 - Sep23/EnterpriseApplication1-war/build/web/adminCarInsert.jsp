<%-- 
    Document   : insertCar
    Created on : Apr 14, 2013, 10:49:51 AM
    Author     : Tuan Ngoc
--%>

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
            $category = "car";
            $page = "insert";
            %>

        <%@include file="templateAdminHeader.jsp" %>


        <form action="adminCarUploadImage.jsp" method="post" enctype="multipart/form-data">
            <input type="hidden" name="$which" value="insert" />

            <table border="0" align="center" width="500">
                <tbody align="center">
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
                        <td align="center"><strong>Airconditioner Required</strong></td>
                        <td align="left"><input type="checkbox" name="$airConditioner" value="whatever" /></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Description</strong></td>
                        <td align="left"><textarea rows="10" cols="30" name="$description"></textarea></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Image</strong></td>
                        <td align="left"><input type="file" accept="image/*" name="$image" /></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Stock Quantity</strong></td>
                        <td align="left"><input type="text" name="$stock" /></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Price</strong></td>
                        <td align="left"><input type="text" name="$price" /> USD</td>
                    </tr>
                    <tr align="center">
                        <td align="center"><input type="submit" name="action" value="insert" id="btInsert" /></td>
                        <td align="left"></td>
                    </tr>
                </tbody>
            </table>
        </form>

<%@include file="templateAdminFooter.jsp" %>
    </body>
</html>
