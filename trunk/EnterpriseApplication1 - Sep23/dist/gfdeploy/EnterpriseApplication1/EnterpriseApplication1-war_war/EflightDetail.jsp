<%-- 
    Document   : EflightDetail
    Created on : May 2, 2013, 10:36:36 PM
    Author     : JAKE
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="e2w.enitites.Flight"%>
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
             <script src="jquery/jquery.tablePagination.0.js"></script>
                         <style>

#flightTable,
#flightTable td,
#flightTable th
{
border:1px solid green;
}
#flightTable th
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
</style>
              <script>
$(function() {
$("#datepicker1").datepicker({dateFormat: 'yy-mm-dd'});
$("#datepicker2").datepicker({dateFormat: 'yy-mm-dd'});
});

$(document).ready(
 	function() {
            $('tbody tr:odd', $('#flightTable')).show(); //hiding rows for test
            var options = {
              rowsPerPage : 4,
              optionsForRows:[4],
              firstArrow : (new Image()).src="./images/paging/firstBlue.gif",
              prevArrow : (new Image()).src="./images/paging/prevBlue.gif",
              lastArrow : (new Image()).src="./images/paging/lastBlue.gif",
              nextArrow : (new Image()).src="./images/paging/nextBlue.gif",
              topNav : false
            }

 	$('#flightTable').tablePagination(options);
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
	   <h2>Flight Desk of East2West</h2>
	    <p><strong>Flight Detail</strong> provides you The Available Date/Expired Date,Taking off/Landing Airport,Taking of/Landing Time
        </p>
	 </div>
     <%
             String flightBranch=request.getAttribute("flightBranch").toString();
             Flight[] result = remote.loadFlightDetailByFlightBranch(flightBranch);
                if(flightBranch.equals("American Airline")){
        %>
        <div align="center"><img src="images/item/American_Airlines_logo.png" width="515" height="186" /></div><br/>
<%
}else if(flightBranch.equals("Japan Airline")){    
%>
<div align="center"><img src="images/item/japan airlines.jpg" width="515" height="186" /></div><br/>
<%
}else if(flightBranch.equals("Vietnam Airline")){
%>
<div align="center"><img src="images/item/Vietnam Airlines.jpg" width="515" height="186" /></div><br/>
<%
}
%>
<div id="testTable">
    <table border="1" id="flightTable">
         <thead>
             <tr>
                 <th align="center"><strong>Flight ID</strong></th>
                 <th align="center"><strong>From Date</strong></th>
                 <th align="center"><strong>To Date</strong></th>
                 <th align="center"><strong>Departure airport</strong></th>
                 <th align="center"><strong>Arrival airport</strong></th>
                 <th align="center"><strong>Departure time<</strong></th>
                 <th align="center"><strong>Arrival time</strong></th>
                 <th align="center"><strong>Price</strong></th>
             </tr>
         </thead>
         <tbody>
             <%

for (int i = 0; i < result.length; i++) {
%>
             <tr>
                 <td align="center"><%=result[i].getFlightID() %></td>
                 <%
                 Date aD = result[i].getAvailableDate();
                 Date eD = result[i].getExpiredDate();
%>
<td align="center"><%=new SimpleDateFormat("yyyy-MM-dd").format(aD) %></td>
                 <td align="center"><%=new SimpleDateFormat("yyyy-MM-dd").format(eD)  %></td>
                 <td align="center"><%=result[i].getTakingOfAirP() %></td>
                 <td align="center"><%=result[i].getLandingAirP() %></td>
                 <td align="center"><%=result[i].getTakingOfTime() %></td>
                 <td align="center"><%=result[i].getLandingTime() %></td>
                 <td align="center"><%=result[i].getPrice() %></td>
             </tr>
             <%
             }
%>
         </tbody>
     </table>
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
