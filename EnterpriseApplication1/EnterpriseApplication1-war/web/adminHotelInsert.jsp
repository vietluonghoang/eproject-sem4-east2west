<%-- 
    Document   : insertCar
    Created on : Apr 14, 2013, 10:49:51 AM
    Author     : Anh Tuan
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
            $category = "hotel";
            $page = "insert";
            %>

        <%@include file="templateAdminHeader.jsp" %>


        <form action="adminHotelUploadImage.jsp" method="post" enctype="multipart/form-data">
            <table border="0" align="center" width="500">
                <tbody>
                    <tr align="center">
                        <td align="center"><strong>Name</strong></td>
                        <td align="left"><input type="text" name="$name" /></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Star</strong></td>
                        <td align="left"><input type="text" name="$star" /></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Street</strong></td>
                        <td align="left"><input type="text" name="$street" /></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Description</strong></td>
                        <td align="left"><textarea rows="10" cols="30" name="$description"></textarea></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Image</strong></td>
                        <td align="left"><input type="file" name="$image" /></td>
                    </tr>
                    <tr align="center">
                        <td align="center"><strong>Price</strong></td>
                        <td align="left"><input type="text" name="$price" /> USD</td>
                    </tr>
                    <tr align="center">
                        <td align="center"><input type="submit" name="action" value="insert" id="btInsert"/></td>
                        <td align="left"><input type="reset" value="reset" /></td>
                    </tr>
                </tbody>
            </table>
        </form>

<%@include file="templateAdminFooter.jsp" %>
    </body>
</html>
