<%-- 
    Document   : tour
    Created on : Apr 21, 2013, 8:09:51 AM
    Author     : JAKE
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="e2w.enitites.Tour"%>
<%@page import="e2w.enitites.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>East2West</title>
        <%@include file="templateAdminHead.jsp" %>
        <meta http-equiv="Content-Language" content="en-us" />

        <meta http-equiv="imagetoolbar" content="no" />
        <meta name="MSSmartTagsPreventParsing" content="true" />

        <meta name="description" content="Description" />
        <meta name="keywords" content="Keywords" />

        <meta name="author" content="Enlighten Designs" />

        <!--<style type="text/css" media="all">@import "css/css-style-admin.css";</style>-->
        <link rel="stylesheet" href="jquery/jquery-ui.css"/>
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
    <script src="jquery/jquery-1.9.1.js"></script>
    <script src="jquery/jquery.validate.js"></script>
    <script src="jquery/jquery-ui.js"></script>

    <script>
        $(function() {
            $("#datepicker1").datepicker({dateFormat: 'yy-mm-dd'});
            $("#datepicker2").datepicker({dateFormat: 'yy-mm-dd'});
            $("#datepicker7").datepicker({dateFormat: 'yy-mm-dd'});
            $("#datepicker8").datepicker({dateFormat: 'yy-mm-dd'});
        });

        $(document).ready(function() {
            $("#insertForm").validate({
                errorElement: "tr",
                rules: {
                    txtTourName: {
                        required: true,
                        rangelength: [0, 50]
                    },
                    txtStartDate: {
                        required: true
                    },
                    txtEndDate: {
                        required: true
                    },
                    txtStartLocation: {
                        required: true,
                        rangelength: [0, 50]
                    },
                    txtEndLocation: {
                        required: true,
                        rangelength: [0, 50]
                    },
                    txtMinQuantity: {
                        required: true,
                        min: 0
                    },
                    txtMaxQuantity: {
                        required: true,
                        min: 0
                    },
                    txtPrice: {
                        required: true,
                        min: 0
                    },
                    txtDescription: {
                        required: true
                    }
                },
                errorPlacement: function(error, element) {
                    error.insertAfter(element);
                }
            });
        });
    </script>
<body>
    <%
        $category = "tour";
        $page = "insert";
    %>

    <%@include file="templateAdminHeader.jsp" %>
    <div id="page-container" align="center">
        <!--        <div id="main-nav">
                        <dl>
                                <dt id="home"><a href="Ehome.jsp">Home</a></dt>
                        <dt id="about"><a href="Eabout.jsp">About</a></dt>
                    <dt id="tour"><a href="Etour.jsp">Tour</a></dt>
                        <dt id="car"><a href="carSearch.jsp">Car</a></dt>
                        <dt id="informationDesk"><a href="EinformationDesk.jsp">Information Desk</a></dt>
                    <dt id="contact"><a href="Econtact.jsp">Contact</a></dt>
                </dl>
                 </div>-->
        <div id="header">
        </div>


        <div id="content">
            <h2>Insert New Tour</h2>
            <p><strong>Admin Page</strong> insert new tour

            </p>
        </div>
        <div id="tour-items">
            <form action="AinsertTourProcess.jsp" method="post" enctype="multipart/form-data" id="insertForm">
                <table border="0" align="center" width="500">
                    <tbody>
                        <tr>
                            <th >Tour Name</th>
                            <td><input type="text" name="txtTourName" id="txtTourName" /></td>
                        </tr>

                        <tr>
                            <th >Image Tour</th>
                            <td><input type="file" accept="jpg|jpeg|gif|png" name="fileImage" /></td>
                        </tr>
                        <tr>
                            <th>Start Date</th>
                            <td><input type="text" name="txtStartDate" id="datepicker7"/></td>
                        </tr>
                        <tr>
                            <th>End Date</th>
                            <td><input type="text" name="txtEndDate" id="datepicker8"/></td>
                        </tr>
                        <tr>
                            <th width="150">Start Location</th>
                            <td width="350"><input type="text" name="txtStartLocation" id="txtStartLocation"  /></td>
                        </tr>
                        <tr>
                            <th>End Location</th>
                            <td><input type="text" name="txtEndLocation" id="txtEndLocation"/></td>
                        </tr>
                        <tr>
                            <th>Min Quantity</th>
                            <td><input type="text" name="txtMinQuantity" id="txtMinQuantity" class="digits"/></td>
                        </tr>
                        <tr>
                            <th>Max Quantity</th>
                            <td><input type="text" name="txtMaxQuantity" id="txtMaxQuantity" class="digits"/></td>
                        </tr>
                        <tr>
                            <th>Price</th>
                            <td><input type="text" name="txtPrice" id="txtPrice" class="digits"  /></td>
                        </tr>
                        <tr>
                            <th>Description</th>
                            <td><textarea name="txtDescription" rows="8" cols="35" ></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center"><input type="submit" name="type" value="Insert" /></td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <!--     <div id="footer">
        
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
                 </div>-->

        <%@include file="templateAdminFooter.jsp" %>
    </div>
</body>
</html>
