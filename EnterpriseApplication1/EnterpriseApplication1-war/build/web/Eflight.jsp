<%-- 
    Document   : Eflight
    Created on : May 2, 2013, 1:56:00 PM
    Author     : JAKE
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="e2w.enitites.Tour"%>
<%@page import="e2w.enitites.Customer"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
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
                <h2>Flight Desk of East2West</h2>
                <p><strong>Flight Desk</strong> provides you schedules of famous Airline companies such as : American Airline,Japan Airline,Vietnam Airline
                </p>
            </div>
            <div>
                <form action="CustomerServlet" method="post">
                    <table border="0" width="400" align="left">
                        <tbody>
                            <tr align="center">
                                <td>
                                    <div align="center">
                                        <img src="images/item/American_Airlines_logo.png" width="400" height="200"/><br/><br/>
                                        <input type="submit" name="action" value="American Airline" id="btViewDetail"/>
                                    </div>
                            </tr>
                        </tbody>
                    </table><br/>
                    <table border="0" width="400" align="left">
                        <tbody>
                            <tr align="center">
                                <td>
                                    <div align="center">
                                        <img src="images/item/japan airlines.jpg " width="400" height="200"/><br/><br/>
                                        <input type="submit" name="action" value="Japan Airline" id="btViewDetail"/>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table><br/>
                    <table border="0" width="400" align="left">
                        <tbody>
                            <tr align="center">
                                <td>
                                    <div align="center">
                                        <img src="images/item/Vietnam Airlines.jpg " width="400" height="200"/><br/><br/>
                                        <input type="submit" name="action" value="Vietnam Airline" id="btViewDetail"/>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <%@include file="templateFooter.jsp" %>
        </div>
    </body>
</html>
