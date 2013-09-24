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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        	    <meta http-equiv="imagetoolbar" content="no" />
	    <meta name="MSSmartTagsPreventParsing" content="true" />

	    <meta name="description" content="Description" />
	    <meta name="keywords" content="Keywords" />

	    <meta name="author" content="Enlighten Designs" />

	    <style type="text/css" media="all">@import "css/css-style.css";</style>
            <link rel="stylesheet" href="jquery/jquery-ui.css"/>
            
            <script src="jquery/jquery-1.9.1.js" ></script>
            <script src="jquery/jquery-ui.js"></script>
            <script src="jquery/jquery.validate.js"></script>
            <style>
                 #btLogin{
 font-size: 0;
 width: 140px;
 height: 36px;
 border: none;
 margin: 0;
 padding: 0;
 background: url(images/button/login-button.png) 0 0 no-repeat;
}
#btLogOut{
 font-size: 0;
 width: 88px;
 height: 40px;
 border: none;
 margin: 0;
 padding: 0;
 background: url(images/button/log_out_button.png) 0 0 no-repeat;
}
#btViewOrder{
     font-size: 0;
 width: 72px;
 height: 27px;
 border: none;
 margin: 0;
 padding: 0;
 background: url(images/button/view-order-button.png) 0 0 no-repeat;
}
#btSearch{
font-size: 0;
 width: 77px;
 height: 28px;
 border: none;
 margin: 0;
 padding: 0;
 background: url(images/button/search-button.png) 0 0 no-repeat;
}
#btUpdate{
font-size: 0;
 width: 100px;
 height: 36px;
 border: none;
 margin: 0;
 padding: 0;
 background: url(images/button/update-button.png) 0 0 no-repeat;
}

             </style>
             <script>

$(function() {
$("#datepicker1").datepicker({dateFormat: 'yy-mm-dd'});
$("#datepicker2").datepicker({dateFormat: 'yy-mm-dd'});
});

$(document).ready(function(){
    $("#formUPDATE").validate({

        errorElement :"tr",
        rules:{
            txtFullName:{
                required:true
            },
            txtAddress:{
                required:true
            },
            txtPhone:{
                required:true,
                rangelength: [10,11]
            }
        },
        errorPlacement:function(error,element){
            error.insertAfter(element);
        }
    });
});


</script>
    </head>
    <body>
        <div id="page-container">

	 <div id="main-nav">
		<dl>
			<dt id="home"><a href="Ehome.jsp">Home</a></dt>
	        <dt id="about"><a href="Eabout.jsp">About</a></dt>
            <dt id="tour"><a href="Etour.jsp">Tour</a></dt>
	        <dt id="car"><a href="carSearch.jsp">Car</a></dt>
	        <dt id="informationDesk"><a href="EinformationDesk.jsp">Information Desk</a></dt>
            <dt id="contact"><a href="Econtact.jsp">Contact</a></dt>
        </dl>
	 </div>
	 <div id="header">

	 </div>

	 <div id="sidebar-a">
	 <div class="padding">
             <%
Customer cusINFO = (Customer)session.getAttribute("SessionCusINFO");
Context ctx = new InitialContext();
CustomerBeanRemote remote = (CustomerBeanRemote) ctx.lookup("CustomerBeanJNDI");
if(cusINFO==null){
%>

             <form action="loginCustomerServlet" method="post">
		<table width="200" border="0">
  <tr>
    <td>Username</td>
    <td><input type="text" name="txtUsername"/></td>
  </tr>
  <tr>
    <td>Password</td>
    <td><input type="password" name="txtPassword" /></td>
  </tr>
  <tr>
    <td></td>
    <td>
<input type="submit" name="action" value="Login" id="btLogin"/>
    <a href="Eregister.jsp"><img src="images/button/register-button.png" width="140" height="49"/></a>
    </td>
  </tr>
</table>
                 <%
                 }else{
    String username = cusINFO.getUsername().toString();
%>
<form action="loginCustomerServlet" method="post">
<table width="200" border="0">
<tr>
    <td align="center"><strong>Welcome <%=username %></strong></td>
  </tr>
  <tr>
      <td align="center"><a href="EcustomerInfo.jsp"><img src="images/button/view_profile_button-original.gif" /></a></td>
  </tr>
  <tr>
    <td align="center"><input type="submit" name="action" value="View Order" id="btViewOrder"/></td>
  </tr>
    <tr>
    <td align="center"><input type="submit" name="action" value="Log Out" id="btLogOut" /></td>
  </tr>
  <tr>
      <%
 ArrayList cartCheck = (ArrayList)session.getAttribute("cartList");
 int cartItem;
 if(cartCheck==null){
cartItem=0;
}else{
cartItem=cartCheck.size();
}
%>
<td align="center"><a href="EcartTour.jsp"><img src="images/button/view_cart_button.png" /></a></td>
  </tr>
  <tr>
      <td align="center"><strong>Item in cart :<%=cartItem %></strong></td>
  </tr>
</table>
</form>
<%
}
%>
             </form>
	 </div>

     <table width="200" border="0" align="center">
  <tr>
    <td align="center"><img src="images/item/American_Airlines_logo.png" width="200" height="100" /></td>
  </tr>
  <tr>
    <td align="center"><img src="images/item/japan airlines.jpg" width="200" height="100"/></td>
  </tr>
  <tr>
  <td align="center"><img src="images/item/Vietnam Airlines.jpg" width="200" height="100" /></td>
  </tr>
</table>

<table width="200" border="0" align="center">
    <form action="searchTourServlet" method="post">
  <tr>
  <td colspan="2" align="center"><h3>Search Tour By Location</h3></td>
  </tr>
  <tr>
    <tr>
     <td colspan="2">
         Start Location :<select name="txtStartLocation">
             <%
Tour[] tour = remote.searchTourLocation("");
for (int i = 0; i < tour.length; i++) {

%>
     	<option><%=tour[i].getStartLocation() %></option>
        <%
}
%>
     </select><br/>
     End Location :
     <select name="txtEndLocation">
         <%
for (int i = 0; i < tour.length; i++) {


%>
     	<option><%=tour[i].getEndLocation() %></option>
        <%
        }
%>
     </select><br/>
     <input type="submit" name="action" value="Search Location" align="right" id="btSearch"/>

     </td>
  </tr>
  </tr>
    <tr>
  <td colspan="2" align="center"><h3>Search Tour By Time</h3></td>
  </tr>
  <tr>
      <td> From Date:</td>
      <td><input type="text" name="txtStartDate" id="datepicker1"/></td>
  </tr>
  <tr>
  <td>
      To Date:
  </td>
  <td>
      <input type="text" name="txtEndDate" id="datepicker2"/>
  </td>
  </tr>
  <tr>
  <td></td>
  <td>
      <input type="submit" name="action" value="Search Time" id="btSearch"/>
  </td>
  </tr>
               </form>
    <tr>
  <td colspan="2" align="center"><h3>SEARCH CAR</h3></td>
  </tr>
                <form action="TuanServlet" method="post">
                    <tr>
                        <td>Model</td>
                        <td><input type="text" name="$model" /></td>
                    </tr>
                    <tr>
                        <td>Type</td>
                        <td><input type="text" name="$type" /></td>
                    </tr>
                    <tr>
                        <td>Seating capacity</td>
                        <td><input type="text" name="$seat" /></td>
                    </tr>
                    <tr>
                        <td>Airconditioner</td>
                        <td><input type="radio" name="$airConditioner" value="yes" /> Yes
                            <input type="radio" name="$airConditioner" value="no" /> No</td>
                    </tr>
                    <tr>
                        <td>stock quantity >=</td>
                        <td><input type="text" name="$stock" /></td>
                    </tr>
                    <tr>
                        <td>price from $</td>
                        <td><input type="text" name="$from" /></td>
                    </tr>
                    <tr>
                        <td>price to $</td>
                        <td><input type="text" name="$to" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="action" value="search" id="btSearch"/></td>
                    </tr>
                </form>
</table>



	 </div>

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
		<%=cus.getUsername() %>
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
            <input type="text" name="txtFullName" id="txtFullName"  value="<%=cus.getFullname() %>" class="required"/>
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
if(cus.getGender().equals("Male")){
%>
<option value="Male" checked>Male</option>
<option value="Female">Female</option>
          <%
}else{
%>
<option value="Male">Male</option>
<option value="Female" checked>Female</option>
          <%
}
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
       <%=cus.getNationality() %>
      </div></td>
  </tr>
  <tr>
    <td><div align="center">Address</div></td>
    <td>
      <div align="left">
          <textarea rows="4" cols="30" name="txtAddress"  id="txtAddress" ><%=cus.getAddress() %></textarea>
      </div></td>
              <td>
        <span class="rq"> * </span>
    </td>
  </tr>
  <tr>
    <td><div align="center">Phone</div></td>
    <td><div align="left">
            <input type="text" name="txtPhone" id="txtPhone"  value="<%=cus.getPhone() %>" class="required digits"/>
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
