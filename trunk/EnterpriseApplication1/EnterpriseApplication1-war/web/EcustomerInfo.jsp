<%-- 
    Document   : EcustomerInfo
    Created on : Apr 29, 2013, 3:21:25 PM
    Author     : JAKE
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="e2w.enitites.Tour"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="e2w.enitites.Customer"%>
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

            </div>
            <div id="tour-items">
                <h2>Customer's Information</h2>
                <p><strong>Customer Information</strong> allow customer update the customer's information</p>
            </div>
            <%
                Customer cus = (Customer) session.getAttribute("SessionCusINFO");
            %>
            <form action="loginCustomerServlet" method="post" id="formUPDATE">
                <table width="500" border="0">

                    <tr>
                        <td><div align="center">Username</div></td>
                        <td>
                            <div align="left">
                                <%=cus.getUsername()%>
                            </div></td>
                    </tr>
                    <tr>
                        <td><div align="center">Password</div></td>
                        <td><div align="left">
                                <input type="submit" name="action" value="Change Password"/>
                            </div></td>
                    </tr>
                    <tr>
                        <td><div align="center">Full Name</div></td>
                        <td><div align="left">
                                <input type="text" name="txtFullName" id="txtFullName"  value="<%=cus.getFullname()%>" class="required"/>
                            </div></td>
                        <td>
                            <span class="rq"> * </span>
                        </td>
                    </tr>
                    <tr>
                        <td><div align="center">Gender</div></td>
                        <td>
                            <div align="left">
                                <select name="cbGender">
                                    <%
                                        if (cus.getGender().equals("Male")) {
                                    %>
                                    <option value="Male" checked>Male</option>
                                    <option value="Female">Female</option>
                                    <%          } else {
                                    %>
                                    <option value="Male">Male</option>
                                    <option value="Female" checked>Female</option>
                                    <%              }
                                    %>
                                </select>
                            </div></td>
                    </tr>
                    <tr>
                        <td><div align="center">Email</div></td>
                        <td><div align="left">
                                <input type="submit" name="action" value="Change Email"/>
                            </div></td>
                    </tr>
                    <tr>
                        <td><div align="center">Nationality</div></td>
                        <td>
                            <div align="left">
                                <%=cus.getNationality()%>
                            </div></td>
                    </tr>
                    <tr>
                        <td><div align="center">Address</div></td>
                        <td>
                            <div align="left">
                                <textarea rows="4" cols="30" name="txtAddress"  id="txtAddress" ><%=cus.getAddress()%></textarea>
                            </div></td>
                        <td>
                            <span class="rq"> * </span>
                        </td>
                    </tr>
                    <tr>
                        <td><div align="center">Phone</div></td>
                        <td><div align="left">
                                <input type="text" name="txtPhone" id="txtPhone"  value="<%=cus.getPhone()%>" class="required digits"/>
                            </div></td>
                        <td>
                            <span class="rq"> * </span>
                        </td>
                    </tr>
                    <tr>
                        <td><div align="center"></div></td>
                        <td><div align="center"><input type="submit" name="action" value="Update Information" id="btUpdate" /></div></td>
                    </tr>

                </table>
            </form>

            <%@include file="templateFooter.jsp" %>
        </div>
    </body>
</html>
