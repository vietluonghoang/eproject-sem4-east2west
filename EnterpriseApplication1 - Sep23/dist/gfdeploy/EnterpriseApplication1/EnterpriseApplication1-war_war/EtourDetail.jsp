<%-- 
    Document   : EtourDetail
    Created on : Apr 21, 2013, 9:27:08 AM
    Author     : JAKE
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.Format"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="e2w.enitites.Tour"%>
<%@page import="e2w.enitites.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

#btBook{
 font-size: 0;
 width: 80px;
 height: 26px;
 border: none;
 margin: 0;
 padding: 0;
 background: url(images/button/book-button.png) 0 0 no-repeat;
}
#btViewSchedule{
 font-size: 0;
 width: 80px;
 height: 26px;
 border: none;
 margin: 0;
 padding: 0;
 background: url(images/button/view-schedule-button.png) 0 0 no-repeat;
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
                        <td><input type="submit" name="action" value="search" id="btSearch" /></td>
                    </tr>
                </form>
</table>



	 </div>

	 <div id="content">
	   <h2>Tour Details</h2>
	    <p><strong>Details of the Tour </strong> will let you know the name of the tour, start date and end date of the tour,the minimum, maximum and the current of participants,the price of the tour	 </p>
	 </div>
      <div id="tour-items">
          <form action="CustomerServlet" method="post">
              <%
Tour result = (Tour)request.getAttribute("tourDetailResult");
          DateFormat format = new SimpleDateFormat("yyyy-mm-dd");
%>
      <table width="150" border="0" align="center">
  <tr>
    <td colspan="3"><img src="images/<%=result.getImageTour() %>" width="400" height="295"/>
        <input type="hidden" name="txtHiddenTourID" value="<%=result.getTourID() %>"/>
    </td>
  </tr>
  <tr>
    <td width="160"><div align="center"><strong>Tour Name</strong></div></td>
    <td colspan="2"><div align="center"><%=result.getTourName() %></div></td>
  </tr>
  <tr>
    <td><div align="center"><strong>Start Location</strong></div></td>
    <td colspan="2"> <div align="center"><%=result.getStartLocation() %></div></td>
  </tr>
  <tr>
    <td><div align="center"><strong>End Location</strong></div></td>
    <td colspan="2"><div align="center"><%=result.getEndLocation() %></div></td>
  </tr>
  <tr>
      <%
       String sD = result.getStartDate();
       Date SD = format.parse(sD);

%>
    <td><div align="center"><strong>Start Date</strong></div></td>
    <td colspan="2"><div align="center"><%=new SimpleDateFormat("yyyy-mm-dd").format(SD)  %></div></td>
  </tr>
  <tr>
      <%
      String eD= result.getEndDate();
      Date ED = format.parse(eD);

%>
    <td><div align="center"><strong>End Date</strong></div></td>
    <td colspan="2"><div align="center"><%=new SimpleDateFormat("yyyy-mm-dd").format(ED) %></div></td>
  </tr>
  <tr>
    <td><div align="center"><strong>Current Tour Quantity</strong></div></td>
    <td colspan="2"><div align="center"><%=result.getQuantityCurrent() %></div></td>
  </tr>
  <tr>
    <td><div align="center"><strong>Price</strong></div></td>
    <td colspan="2"><div align="center"><%=result.getPrice() %> $</div></td>
  </tr>
</table>
<div id="description-tour" style=" text-wrap: normal; word-wrap:break-word;" >
    <p><%=result.getDescripton() %></p>
</div>
<table width="150" border="0" align="right">
  <tr>
    <td><input type="submit" name="action" value="View Schedules" id="btViewSchedule"/>
    </td>
    <td><%if(cusINFO!=null && result.getQuantityCurrent()>0 ){%>
        <input  type="submit" name="action" value="Book" id="btBook"/>
        <%}else if(result.getQuantityCurrent()<=0 && cusINFO!=null){ %>
            Out of Quantity
        <%}%>
    </td>
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
