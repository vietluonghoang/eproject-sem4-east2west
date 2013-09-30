<%-- 
    Document   : carReportSearch
    Created on : Apr 25, 2013, 4:03:34 PM
    Author     : Tuan Ngoc
--%>

<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="ngoc.bean.NgocStatefulRemote"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="templateAdminHead.jsp" %>
        <meta http-equiv="Content-Language" content="en-us" />

        <meta http-equiv="imagetoolbar" content="no" />
        <meta name="MSSmartTagsPreventParsing" content="true" />

        <meta name="description" content="Description" />
        <meta name="keywords" content="Keywords" />

        <meta name="author" content="Enlighten Designs" />

        <!--<style type="text/css" media="all">@import "css/css-style-admin.css";</style>-->

        <link rel="stylesheet" href="jquery/jquery-ui.css"/>
        <script src="jquery/jquery-1.9.1.js"></script>
        <script src="jquery/jquery-ui.js"></script>
        <script>
            $(function() {
                $("#datepicker3").datepicker({dateFormat: 'yy/mm/dd'});
                $("#datepicker4").datepicker({dateFormat: 'yy/mm/dd'});
            });

        </script>
    </head>
    <body>
        <%
            $category = "report";
            $page = "tour";
        %>

        <%@include file="templateAdminHeader.jsp" %>
        <div id="page-container">
            <div id="page-container">
                <center>

                    <div id="header">

                    </div>
                    <div id="content">



                        <!------------------------- CONTENT BEGIN ------------------------------>
                        <div id="content">
                            <h2>Tour Report</h2>
                            <p><strong>Report</strong> will show the result of the type of report from date to date</p>
                        </div>

                        <%
                            Context ctx1 = new InitialContext();

                            NgocStatefulRemote statefulRemote = (NgocStatefulRemote) ctx1.lookup("NgocStatefulRemote");
                            statefulRemote = (NgocStatefulRemote) session.getAttribute("admin");
                            if (statefulRemote == null) {
                        %>
                        <meta http-equiv="refresh" content="1;url=adminLogin.jsp">
                        <script type="text/javascript">
                            window.location.href = "adminLogin.jsp"
                        </script>
                        <%                } else if (statefulRemote.get$username() == null) {
                        %>
                        <meta http-equiv="refresh" content="1;url=adminLogin.jsp">
                        <script type="text/javascript">
                            window.location.href = "adminLogin.jsp"
                        </script>
                        <%                } else {

                            String $today = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
                        %>
                        <form action="TourReportServlet" method="post">
                            <table>
                                <tr>
                                    <td><strong>Type: </strong>&nbsp;&nbsp;</td>
                                    <td>
                                        <select name="type">
                                            <option value="most">Most Ordered</option>
                                            <option value="available">Available Orders</option>
                                            <option value="all">All Orders</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>From: &nbsp;&nbsp;</strong></td>
                                    <td> <input name="$from" type="text" value="<%=$today%>" id="datepicker3" /></td>
                                </tr>
                                <tr>
                                    <td><strong>To: &nbsp;&nbsp;</strong> </td>
                                    <td><input name="$to" type="text" value="<%=$today%>" id="datepicker4" /></td>
                                </tr>
                                <tr>
                                    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="action" value="View Report" /></td>
                                </tr>
                            </table>
                        </form>


                        <!------------------------- CONTENT BEGIN ------------------------------>

                        <%}%>
                    </div>
                </center>
            </div>
        </div>
        <%@include file="templateAdminFooter.jsp" %>
    </body>
</html>
