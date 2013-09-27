<%-- 
    Document   : EupdateEmail
    Created on : Apr 30, 2013, 12:00:23 PM
    Author     : JAKE
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="e2w.enitites.Customer"%>
<%@page import="e2w.enitites.Tour"%>
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
                <h2>Customer's Information</h2>
                <p><strong>Customer Information</strong> allow customer update the customer's information</p>
            </div>
            <div id="Register" align="center">
                <form action="loginCustomerServlet" method="post" id="updateForm">
                    <table width="500" border="0">
                        <tr>
                            <td><div align="center">Old Email</div></td>
                            <td>
                                <div align="center">
                                    <input type="text" name="txtOldEmail" id="txtOldEmail" class="required email"/>
                                </div></td>
                            <td>
                                <span class="rq"> * </span>
                            </td>
                        </tr>
                        <tr>
                            <td><div align="center">New Email</div></td>
                            <td><div align="center">
                                    <input type="text" name="txtNewEmail" id="txtNewEmail" class="required email"/>
                                </div></td>
                            <td>
                                <span class="rq"> * </span>
                            </td>
                        </tr>
                        <tr>
                            <td><div align="center">Confirm New email</div></td>
                            <td><div align="center">
                                    <input type="text" name="txtConfirmNewEmail" id="txtConfirmNewEmail" class="required email"/>
                                </div></td>
                            <td>
                                <span class="rq"> * </span>
                            </td>
                        </tr>
                        <tr>
                            <td><div align="center"></div></td>
                            <td><div align="center"><input type="submit" name="action" value="Update Email" id="btUpdate" /></div></td>
                        </tr>
                    </table>
                </form>
            </div>
            <%@include file="templateFooter.jsp" %>
        </div>
    </body>
</html>
