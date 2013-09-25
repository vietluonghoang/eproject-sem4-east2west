<%-- 
    Document   : adminCarSearch
    Created on : Apr 14, 2013, 11:54:35 AM
    Author     : Tuan Ngoc
--%>

<%@page import="ngoc.entity.Car"%>
<%@page import="ngoc.bean.NgocStatelessRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="jquery/jquery-ui.css"/>
        <link rel="stylesheet" href="css/reset.css"/>
            <script src="jquery/jquery-1.9.1.js"></script>
             <script src="jquery/jquery-ui.js"></script>
        <script src="jquery/jquery.tablePagination.0.js"></script>
        
    </head>
    <body>
        <div id="page-container">
            <%@include file="templateHeader.jsp" %>
            <div id="content">


<!------------------------- CONTENT BEGIN ------------------------------>
<div id="wrapTopMenu">
            <div class="overlay"></div><!--overlay-->

            <div class="nav">
                <div class="wrap">
                    <ul class='navigation'>
                        <li><a href="Ehome.jsp">Home</a></li>
                        <li><a href="Eabout.jsp">About</a></li>
                        <li><a href="Etour.jsp">Tour</a></li>
                        <li><a href="carSearch.jsp">Car</a></li>
                        <li><a href="EinformationDesk.jsp">Information Desk</a></li>
                        <li><a href="Econtact.jsp">Contact</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!--stylesheet for fixed menu-->
    <style>

        #wrapTopMenu .overlay{
            position:fixed;
            left:0;
            top:0;
            height:60px;
            width:100%;
            background-color:transparent;
            z-index:1;
        }

        #wrapTopMenu .wrap{
            width:100%;
            margin:auto;
        }

        #wrapTopMenu .nav{
            background-color:#1e1e1e;
            height:60px;
            text-align:center;
            position:fixed;
            width:100%;
            left:0;
            top:-60px;
            z-index:999;
            -moz-transition:top 0.4s ease;
            -webkit-transition:top 0.4s ease;
            -o-transition:top 0.4s ease;
            -ms-transition:top 0.4s ease;
            transition:top 0.4s ease;
        }

        #wrapTopMenu .overlay:hover ~ .nav,#wrapTopMenu .nav:hover{
            top:0;
        }

        #wrapTopMenu .navigation{
            display:inline-block;
        }

        #wrapTopMenu .navigation li{
            display:inline;
        }

        #wrapTopMenu .navigation a{
            display:block;
            float:left;
            font-family:helvetica,arial,sans-serif;
            color:#fff;
            font-size:12px;
            height:100%;
            line-height:60px;
            text-transform:uppercase;
            padding:0 35px;
            font-weight:bold;
            -moz-transition:all 0.4s ease;
            -webkit-transition:all 0.4s ease;
            -o-transition:all 0.4s ease;
            -ms-transition:all 0.4s ease;
            transition:all 0.4s ease;
        }

        #wrapTopMenu .navigation li:nth-child(1) a:hover{
            background-color:#ffa32c;
        }

        #wrapTopMenu .navigation li:nth-child(2) a:hover{
            background-color:#73e900;
        }

        #wrapTopMenu .navigation li:nth-child(3) a:hover{
            background-color:#992ff3;
        }

        #wrapTopMenu .navigation li:nth-child(4) a:hover{
            background-color:#38eec5;
        }

        #wrapTopMenu .navigation li:nth-child(5) a:hover{
            background-color:#fff000;
        }

        #wrapTopMenu .navigation li:nth-child(6) a:hover{
            background-color:#008aff;
        }

        #wrapTopMenu .navigation li:nth-child(7) a:hover{
            background-color:#ff0096;
        }

        #wrapTopMenu .navigation li:nth-child(8) a:hover{
            background-color:#ff3939;
        }

    </style>
<!------------------------- CONTENT BEGIN ------------------------------>


        <form action="NgocServlet" method="post">
            <table border="0">
                <tbody>
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
                        <td>price from</td>
                        <td><input type="text" name="$from" /> USD</td>
                    </tr>
                    <tr>
                        <td>price to</td>
                        <td><input type="text" name="$to" /> USD</td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="action" value="search" id="btSearch" /></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </form>
            <br/><br/>
        <%
        //Context ctx = new InitialContext();
        NgocStatelessRemote ngocStatelessRemote = (NgocStatelessRemote) ctx.lookup("NgocStatelessRemote");
        Car[] result;
        if(request.getAttribute("INFO") == null) {
            result = (Car[])ngocStatelessRemote.search("SELECT c FROM Car c WHERE c.isDeleted = false");
        } else {
            result = (Car[])request.getAttribute("INFO");
        }
        if (result.length==0) {
            %>
            No result found. Please broaden your search
            <%
        } else {
        %>
	


<div id="car-items">
<h2>CAR</h2>
<div id="testTable">
    <div id="menuTable">
                <%
                //for (int i = 0; i < result.length; i++) {
                for (int i=result.length-1;i>=0;i--) {
                %>
<table border="0" >
  <tr>
    <td rowspan="6"><img src="images/<%=result[i].getImage() %>" width="250"/></td>
    <td><strong>Model</strong></td>
    <td><%=result[i].getModel() %></td>
  </tr>
  <tr>
    <td><strong>Type</strong></td>
    <td><%= result[i].getType() %></td>
  </tr>
  <tr>
    <td><strong>Capacity</strong></td>
    <td><%= result[i].getSeat() %></td>
  </tr>
  <tr>
    <td><strong>Quantity</strong></td>
    <td><%= result[i].getQuantityStock() %></td>
  </tr>
  <tr>
    <td><strong>Price</strong></td>
    <td><%=result[i].getPrice() %> $/day</td>
  </tr>
   <tr>
    <td colspan="3">
        <form action="carDescription.jsp" method="post">
            <input type="hidden" name="$carID" value="<%=result[i].getCarID() %>" />
            <input type="submit" name="action" value="description" align="right" id="btViewDetail" />
        </form>
    </td>
  </tr>
</table>
            <%}%>
</div>
</div>
<br/>
<div align="center">
</div>
</div>

                <%}%>


<!------------------------- CONTENT BEGIN ------------------------------>


            </div>
            <%@include file="templateFooter.jsp" %>
        </div>
    </body>
</html>
