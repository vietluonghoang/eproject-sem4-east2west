<%-- 
    Document   : Eabout
    Created on : Apr 21, 2013, 5:50:05 PM
    Author     : JAKE
--%>

<%@page import="java.util.ArrayList"%>
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
        <link rel="stylesheet" href="css/reset.css"/>
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
                                    <a href="Eregister.jsp"><img src="images/button/register-button.png" /></a>
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
                <h2>About Us</h2>
                <p><strong>East2West Tours and Travels</strong>  is a young and dynamic company run by dedicated professional’s committed to providing the highest standards of service to the travel industry. We place great emphasis on personalized service, meticulous attention to detail, innovative itineraries and excellent customer care. However, over the years, there have been few difficult situations or queries, which we have not been able to solve and look forward to improve upon in the future. We are on call, at your service, 7 days a week. Our rates are highly competitive, and if you are seeking a travel agency who can not only provide top quality service, but can also anticipate and fully understand your needs, then look no further.</p>
                <p>We are currently undergoing a 'face lift', so if you have any questions or would like more information about the services we provide please feel free to contact us.</p>
                <p><strong>East2West Tours</strong> and <strong>Travels</strong> involve manual booking of certain profit based services as given below: Package Tours and Car Rental
                <p>A package Tour is a travel plan of predefined places. We bundle this travel plan into packages consisting of:</p>
                ►	Touring arrangements to the places<br/>
                ►	Accommodation<br/>
                ►	Food<br/>
                ►	Local Travel<br/>
                <p>Each package is characterized by a fixed duration and one whole price. Each component is not charged separately.</p>

                <p>We are in industry for the past 10 years. This experience enables us to create packages, which could become popular. We also get our data leads from past records.</p>

                <p>Packages can be:</p>
                ►	Country wise tours<br/>
                ►	Activity based like treks, camps or safaris<br/>
                ►	Places of historical significance</br>

                <p>In the present system, when a customer comes to us for a complete holiday package, we show them the available package tours. The customer makes a selection and we book the customer for that package. Normally, the package rates are specified on a per person basis. Therefore, the amount to be charged is calculated depending on the number of tickets purchased. Hence, the manual system is very slow, as displaying the various package brochures, entering customer data and making the sales entry is time consuming and involves multiple books. Hence, the proposal is to build an alternate system that will quicken this process.</p>
                ►	Country wise tours<br/>
                ►	Activity based like treks, camps or safaris<br/>
                ►	Places of historical significance<br/>

                <p>In the present system, when a customer comes to us for a complete holiday package, we show them the available package tours. The customer makes a selection and we book the customer for that package. Normally, the package rates are specified on a per person basis. Therefore, the amount to be charged is calculated depending on the number of tickets purchased. Hence, the manual system is very slow, as displaying the various package brochures, entering customer data and making the sales entry is time consuming and involves multiple books. Hence, the proposal is to build an alternate system that will quicken this process.</p>
                ►	Model<br/>
                ►	Type<br/>
                ►	Seating Capacity<br/>
                ►	Driver required/not required<br/>
                ►	Air-conditioner required/not required<br/>
                ►	Pick-up date and Drop-off date<br/>

                <p>In the present system, when the customer comes to rent a car, a list of cars fitting into the customer’s requirements is displayed. The customer makes a selection and we book the car for that customer. Finding the appropriate car and making the sales entry is time consuming and involves multiple books.</p>

                <p>The above two services are billable. However, cancellations are possible. The refund is calculated based on the number of days remaining before the actual use of the service.</p>

                <p>The refund rules are given as below:</p>

                Before 1 day – 75%<br/>
                2 days – 80%<br/>
                3 days – 85%<br/>
                4 days – 90%<br/>
                5 days or more – 95%<br/>






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
