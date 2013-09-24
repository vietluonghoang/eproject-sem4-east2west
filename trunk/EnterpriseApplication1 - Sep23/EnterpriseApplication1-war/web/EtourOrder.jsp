<%-- 
    Document   : EtourOrder
    Created on : Apr 24, 2013, 10:50:03 PM
    Author     : JAKE
--%>

<%@page import="e2w.enitites.Tour"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="e2w.dto.CartDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="e2w.enitites.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <meta http-equiv="Content-Language" content="en-us" />

	    <meta http-equiv="imagetoolbar" content="no" />
	    <meta name="MSSmartTagsPreventParsing" content="true" />

	    <meta name="description" content="Description" />
	    <meta name="keywords" content="Keywords" />

	    <meta name="author" content="Enlighten Designs" />

	    <style type="text/css" media="all">@import "css/css-style.css";</style>
            <link rel="stylesheet" href="jquery/jquery-ui.css"/>
            <script src="jquery/jquery-1.9.1.js"></script>
             <script src="jquery/jquery-ui.js"></script>

              <style>
#CartTable,
#CartTable td,
#CartTable th
{
border:1px solid green;
}
#CartTable th
{
background-color: green;
color:white;
}

#vatTable,
#vatTable td,
#vatTable th
{
border:1px solid red;
}
#vatTable th
{
background-color: red;
color:white;
}
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
#btConfirm{
         font-size: 0;
 width: 100px;
 height: 44px;
 border: none;
 margin: 0;
 padding: 0;
 background: url(images/button/confirm-button.png) 0 0 no-repeat;
}
#btCancel{
         font-size: 0;
 width: 100px;
 height: 42px;
 border: none;
 margin: 0;
 padding: 0;
 background: url(images/button/cancel-button.png) 0 0 no-repeat;
}
</style>
              <script>

$(function() {
$("#datepicker1").datepicker({dateFormat: 'yy-mm-dd'});
$("#datepicker2").datepicker({dateFormat: 'yy-mm-dd'});
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
     <input type="submit" name="action" value="Search Location" align="right"/>

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
      <input type="submit" name="action" value="Search Time"/>
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
                        <td><input type="submit" name="action" value="search" /></td>
                    </tr>
                </form>
</table>



	 </div>

	 <div id="content">
	   <h2>Order</h2>
	 </div>
	<div id="orderTourDetail" align="center">
            <%
            Customer customer = (Customer)session.getAttribute("SessionCusINFO");
            ArrayList cartList = (ArrayList)session.getAttribute("cartList");

%>
    <table width="350" border="0">
  <tr>
      <td align="center"><strong>Create Date</strong></td>
      <td align="center"><%
            Date date = new Date();
%>
    <%=new SimpleDateFormat("yyyy/MM/dd").format(date) %>
    </td>
  </tr>
  <tr>
      <td align="center"><strong>Customer Name</strong></td>
      <td align="center"><%=customer.getFullname() %></td>
  </tr>
  <tr>
      <td height="20" align="center"><strong>Customer Address</strong></td>
      <td align="center"><%=customer.getAddress() %></td>
  </tr>
  <tr>
      <td align="center"><strong>Customer Phone</strong></td>
      <td align="center"><strong><%=customer.getPhone() %></strong></td>
  </tr>
</table>
    <form action="CustomerServlet" method="post">
<%
for (int i = 0; i < cartList.size(); i++) {
               CartDTO dto = (CartDTO)cartList.get(i);
%>
<table width="500" border="1" id="CartTable">
      <tr>
        <th><div align="center"><strong>No</strong></div></th>
        <th><div align="center"><strong>Tour Name</strong></div></th>


        <th><div align="center"><strong>Quantity</strong></div></th>
        <th><div align="center"><strong>Price</strong></div></th>
        <th><div align="center"><strong>Total</strong></div></th>

      <tr>
        <td><div align="center">
                <%=i+1 %>

                <input type="hidden" name="txtHiddenTourID" value="<%=dto.getTour().getTourID() %>"/>

            </div></td>
        <td><div align="center"><%=dto.getTour().getTourName() %></div></td>

        <td><div align="center">
            <%=dto.getQuantity() %>
            <input type="hidden" name="txtQuantity" value="<%=dto.getQuantity() %>"/>
            </div></td>
        <td><div align="center"><%=dto.getTour().getPrice() %></div></td>
        <td><div align="center"><%=dto.getQuantity()*dto.getTour().getPrice() %></div></td>
      </table>
      <%
}
%>
		<table width="300" border="0" align="center" id="vatTable">
  <tr>
    <th><div align="center">VAT(10%)</div></th>
    <td><div align="center">
            <% int totalCash = (Integer)session.getAttribute("totalINFO");
    %> <%=totalCash*10/100 %> $
        </div></td>
  </tr>
  <tr>
    <th><div align="center">Total Amount of invoice</div></th>
    <td><div align="center">
            <% 
int total = totalCash*10/100+totalCash;            
%>
            <%=total %>
            <input type="hidden" name="txtTotal" value="<%=total %>"/>
        </div></td>
  </tr>
  <tr align="center">
      <td colspan="2"><div align="center">
      <input type="submit" name="action" value="Confirm" id="btConfirm"/>
      <input type="submit" name="action" value="Cancel" id="btCancel"/>
    </div></td>
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
