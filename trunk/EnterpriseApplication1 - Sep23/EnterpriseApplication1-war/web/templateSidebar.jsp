<%-- 
    Document   : templateSidebar
    Created on : Apr 26, 2013, 10:02:54 AM
    Author     : Anh Tuan
--%>

<%@page import="e2w.enitites.Tour"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="e2w.enitites.Customer"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
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
            <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css"/>
            <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
             <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
              <script src="jquery/jquery-ui.js"></script>
             <script src="jquery/jquery.tablePagination.0.js"></script>
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

#btViewDetail{
font-size: 0;
 width: 100px;
 height: 27px;
 border: none;
 margin: 0;
 padding: 0;
 background: url(images/button/view-detail-button.png) 0 0 no-repeat;
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
    </head>
    <body>
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
    <input type="submit" name="action" value="Login"/>
    <a href="Eregister.jsp">Register</a>
    </td>
  </tr>
</table>
                 <%
                 }else{
    String username = cusINFO.getUsername().toString();

%>
<table width="200" border="0">
  <tr>
    <td align="center">Hello <a href="#"><%=username %></a></td>
  </tr>
  <tr>
      <td align="right"><a href="#">Log out</a></td>
  </tr>
</table>
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
    </body>
</html>
