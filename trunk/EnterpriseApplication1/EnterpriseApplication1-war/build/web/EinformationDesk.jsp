<%-- 
    Document   : EinformationDesk
    Created on : May 2, 2013, 10:16:16 AM
    Author     : JAKE
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="e2w.enitites.Tour"%>
<%@page import="e2w.enitites.Customer"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <%@include file="templateHeadTag.jsp" %>
    </head>
    <body>
        <div id="page-container">
            <%@include file="templateHeader.jsp" %>
            <div id="content">
                <h2>Information Desk of East2West</h2>
                <p><strong>East2West</strong> provides you the the Information Desk,which is provides flights,hotels and city of the tour
                </p>
            </div>
            <div align="center"><h2><strong>Flight Desk</strong></h2></div>
            <table border="0" width="500" align="center">
                <tbody>
                    <tr>
                <div align="center">
                    <a href="Eflight.jsp"><img src="images/item/Plane, Sky, Altitude, Flight.jpg" width="400" height="200"/></a><br/> 
                </div>
                </tr>
                </tbody>
            </table>
            <div align="center"><h2><strong>Hotel Desk</strong></h2></div>
            <table border="0" width="500" align="center">
                <tbody>
                    <tr>
                <div align="center">
                    <a href="hotelSearch.jsp"><img src="images/hotel/hotel1.jpg" width="400" /></a><br/>
                </div>
                </tr>
                </tbody>
            </table>
            <%@include file="templateFooter.jsp" %>
        </div>
    </body>
</html>
