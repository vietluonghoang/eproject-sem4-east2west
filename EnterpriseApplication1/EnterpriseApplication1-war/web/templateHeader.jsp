<%-- 
    Document   : templateHeader
    Created on : Apr 26, 2013, 12:18:25 AM
    Author     : Anh Tuan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="e2w.enitites.Tour"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="e2w.enitites.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
<div id="header">

</div>

<div id="sidebar-a">
    <div class="padding">
        <%
            Customer cusINFO = (Customer) session.getAttribute("SessionCusINFO");
            Context ctx = new InitialContext();
            CustomerBeanRemote remote = (CustomerBeanRemote) ctx.lookup("CustomerBeanJNDI");
            if (cusINFO == null) {
        %>

        <form action="loginCustomerServlet" method="post">
            <table width="200" border="0">
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="txtUsername"></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txtPassword" /></td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="action" value="Login" id="btLogin"/>
                    </td>
                    <td>
                        <a href="Eregister.jsp">Register</a>
                    </td>
                </tr>
            </table>
            <%                 } else {
                String username = cusINFO.getUsername().toString();

            %>
            <form action="loginCustomerServlet" method="post">
                <table width="200" border="0">
                    <tr>
                        <td align="center"><strong>Welcome <%=username%></strong></td>
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
                            ArrayList cartCheck = (ArrayList) session.getAttribute("cartList");
                            int cartItem;
                            if (cartCheck == null) {
                                cartItem = 0;
                            } else {
                                cartItem = cartCheck.size();
                            }
                        %>
                        <td align="center"><a href="EcartTour.jsp"><img src="images/button/view_cart_button.png" /></a></td>
                    </tr>
                    <tr>
                        <td align="center"><strong>Item in cart :<%=cartItem%></strong></td>
                    </tr>
                </table>
            </form>
            <%
                }
            %>
        </form>
    </div>
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
                        <option><%=tour[i].getStartLocation()%></option>
                        <%
                            }
                        %>
                    </select><br/>
                    End Location :
                    <select name="txtEndLocation">
                        <%
                            for (int i = 0; i < tour.length; i++) {


                        %>
                        <option><%=tour[i].getEndLocation()%></option>
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
                <td><input type="submit" name="action" value="Search Time" id="btSearch"/></td>
                <td> </td>
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
