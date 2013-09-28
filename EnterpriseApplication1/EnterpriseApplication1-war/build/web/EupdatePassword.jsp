<%-- 
    Document   : EupdatePassword
    Created on : Apr 30, 2013, 11:07:40 AM
    Author     : JAKE
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="e2w.enitites.Tour"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
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
	    <h2>Customer's Information</h2>
	    <p><strong>Customer Information</strong> allow customer update the customer's information</p>
	 </div>
	<div id="register" align="center">

<form action="loginCustomerServlet" method="post" id="updateForm">
<table width="500" border="0">
  <tr>
    <td><div align="center">Old Password</div></td>
    <td>
      <div align="center">
          <input type="password" name="txtOldPassword" id="txtOldPassword"/>
      </div></td>
              <td>
        <span class="rq"> * </span>
    </td>
  </tr>
  <tr>
    <td><div align="center">New Password</div></td>
    <td><div align="center">
            <input type="password" name="txtNewPassword" id="txtNewPassword"/>
    </div></td>
            <td>
        <span class="rq"> * </span>
    </td>
  </tr>
  <tr>
    <td><div align="center">Confirm New Password</div></td>
    <td><div align="center">
            <input type="password" name="txtConfirmNewPassword" id="txtConfirmNewPassword"/>
    </div></td>
            <td>
        <span class="rq"> * </span>
    </td>
  </tr>
  <tr>
    <td><div align="center"></div></td>
    <td><div align="center"><input type="submit" name="action" value="Update Password" id="btUpdate"/></div></td>
  </tr>
</table>
</form>
    </div>
     <div id="footer">

	 <div id="altnav">
	        <a href="Ehome.jsp">Home</a>
	        <a href="Eabout.jsp">About</a>
	        <a href="Etour.jsp">Tour</a>
	        <a href="carSearch.jsp">Car</a>
	        <a href="EinformationDesk.jsp">Information Desk</a>
                <a href="Econtact.jsp">Contact</a>
                <a href="adminLogin.jsp">Admin</a>
	    </div>
		Copyright © East2West<br/>
	    Powered by <a href="http://www.facebook.com/quanganhbuingoc">Jake's Facebook</a>
	 </div>


	 </div>
    </body>
</html>
