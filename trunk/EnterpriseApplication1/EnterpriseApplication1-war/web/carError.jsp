<%-- 
    Document   : adminCarSearch
    Created on : Apr 14, 2013, 11:54:35 AM
    Author     : Anh Tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


                <br/><br/><br/><br/>
                <div align="center">
                <span style="color:red"><%= request.getAttribute("ERROR") %></span><br/><br/>
                <FORM><INPUT Type="button" VALUE="Back" onClick="history.go(-1);return true;"></FORM>
                </div>


    </body>
</html>
