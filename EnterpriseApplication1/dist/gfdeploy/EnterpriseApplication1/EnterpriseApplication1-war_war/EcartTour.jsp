<%-- 
    Document   : EcartTour
    Created on : Apr 21, 2013, 9:25:34 AM
    Author     : JAKE
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="e2w.enitites.Tour"%>
<%@page import="e2w.enitites.Customer"%>
<%@page import="e2w.dto.CartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>East2West</title>
         <meta http-equiv="Content-Language" content="en-us" />
	     
	    <meta http-equiv="imagetoolbar" content="no" />
	    <meta name="MSSmartTagsPreventParsing" content="true" />
	     
	    <meta name="description" content="Description" />
	    <meta name="keywords" content="Keywords" />
	     
	    <meta name="author" content="Enlighten Designs" />
	     
	    <style type="text/css" media="all">@import "css/css-style.css";</style>
            <link rel="stylesheet" href="jquery/jquery-ui.css"/>
            <script src="jquery/jquery-1.7.2.js"></script>
            <script src="jquery/jquery.validate.min.js"></script>
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
#btCheckOut{
     font-size: 0;
 width: 120px;
 height: 51px;
 border: none;
 margin: 0;
 padding: 0;
 background: url(images/button/check-out-button.png) 0 0 no-repeat;
}
#btBookMore{
     font-size: 0;
 width: 80px;
 height: 26px;
 border: none;
 margin: 0;
 padding: 0;
 background: url(images/button/book-more-button.png) 0 0 no-repeat;
}
#btRemove{
     font-size: 0;
 width: 81px;
 height: 22px;
 border: none;
 margin: 0;
 padding: 0;
 background: url(images/button/remove-button.png) 0 0 no-repeat;
}
#btUpdate{
     font-size: 0;
 width: 100px;
 height: 26px;
 border: none;
 margin: 0;
 padding: 0;
 background: url(images/button/update-cart-button.png) 0 0 no-repeat;
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
</style>
              <script>
$(function() {
$("#datepicker1").datepicker({dateFormat: 'yy-mm-dd'});
$("#datepicker2").datepicker({dateFormat: 'yy-mm-dd'});
});

$(document).ready(function(){
    $("#cartForm").validate({
         errorElement :"tr",
         rules:{
             txtQuantity:{
                 required:true,
                 min:0
             }
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
                   Context ctx = new InitialContext();
CustomerBeanRemote remote = (CustomerBeanRemote) ctx.lookup("CustomerBeanJNDI");
Customer cusINFO = (Customer)session.getAttribute("SessionCusINFO");
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
	   <h2>Cart of Tour</h2>
	    <p><strong>The Cart of Tour</strong>
will show you the tour you the tour  have been booked and you can also remove or update the quantity of tour if you want.After that,you can book more or confirm the cart and take the order</p>
	 
	<div id="cart" align="left">
            <form action="CustomerServlet" method="post" id="cartForm">
            <%
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            ArrayList cartList = (ArrayList)session.getAttribute("cartList");
            if(cartList!=null && cartList.size()>0){
%>
    <table width="500" border="1" id="CartTable">
      <tr>
        <th width="28"><div align="center">Tour ID</div></th>
        <th width="45"><div align="center">Tour Name</div></th>
        <th width="28"><div align="center">Start Date</div></th>
        <th width="28"><div align="center">End Date</div></th>

        <th width="28"><div align="center">Price</div></th>
        <th width="10"><div align="center">Quantity</div></th>
        <th width="31"><div align="center">To Cash</div></th>
        <th width="37"><div align="center">Select</div></th>
      </tr>
      <%
      for (int i = 0; i < cartList.size(); i++) {
               CartDTO dto = (CartDTO)cartList.get(i);
%>
      <tr>
        <td><div align="center"><%=dto.getTour().getTourID() %>
            <input type="hidden" name="txtTourID" value="<%=dto.getTour().getTourID() %>"/>
            </div></td>
        <td><div align="center"><%=dto.getTour().getTourName() %></div></td>
        <%
        Date SD = format.parse(dto.getTour().getStartDate());
%>
        <td><div align="center"><%=new SimpleDateFormat("yyyy-mm-dd").format(SD)  %></div></td>
        <%
        Date ED = format.parse(dto.getTour().getEndDate());
%>
        <td><div align="center"><%=new SimpleDateFormat("yyyy-mm-dd").format(ED)  %></div></td>

        <td><div align="center"><%=dto.getTour().getPrice() %> $</div></td>
        <td><div align="center">
                <input type="text" name="txtQuantity" value="<%=dto.getQuantity() %>" size="2" class="required digits" id="quantity"/>
        </div></td>
        <td><div align="center"><%=dto.getTour().getPrice()*dto.getQuantity() %> $</div></td>
        <td><div align="center">
          <input name="cbSelect" type="checkbox" value="<%=dto.getTour().getTourID() %>" />
        </div></td>
      </tr>
      <%
}
%>
      <tr>
        <td colspan="5">
          <div>
        </div></td>
        <td>
        <div align="center">Total </div></td>
        <td><div align="center">
                <% int totalCash = (Integer)session.getAttribute("totalINFO");
    %>  <%=totalCash %> $
        </div></td>
        <td><div align="center">
          <input type="submit" name="action" value="Remove" id="btRemove"/>
        </div></td>
      </tr>
      <tr>
          <td colspan="8" align="center">
            <input type="submit" name="action" value="Check Out" id="btCheckOut"/>
            <input type="submit" name="action" value="Book more" id="btBookMore"/>
            <input type="submit" name="action" value="Update Cart" id="btUpdate"/>
      </td>
      </tr>
    </table>
<%
}else if(cartList==null || cartList.size()==0){
%>
<div align="center">Cart is empty</div>
            <%
}            
%>
            </form>
        </div>
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
