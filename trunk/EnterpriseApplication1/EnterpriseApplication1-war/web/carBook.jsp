<%--
    Document   : carDescription
    Created on : Apr 15, 2013, 2:18:50 PM
    Author     : Tuan Ngoc
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="ngoc.entity.Car"%>
<%@page import="ngoc.bean.NgocStatelessRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <%@include file="templateHeadTag.jsp" %>
    </head>
    <body>
        <div id="page-container">
            <%@include file="templateHeader.jsp" %>
            <div id="content">


<!------------------------- CONTENT BEGIN ------------------------------>
<br/><div style="text-align: center;"><a href="carSearch.jsp">Car Search</a> | <a href="carShoppingCart.jsp">Shopping Cart</a> |
    <a href="carOrderSearch.jsp">Order Search</a></div>
 <br/><br/>
<!------------------------- CONTENT BEGIN ------------------------------>


        <%
            if(cusINFO==null) {
                %>you have to login in<%
            } else {
            //Context ctx = new InitialContext();
            NgocStatelessRemote ngocStatelessRemote = (NgocStatelessRemote) ctx.lookup("NgocStatelessRemote");
            //if (request.getParameter("$carID")==null) {
                //request.getRequestDispatcher("carSearch.jsp").forward(request, response);
            //}
            int $carID = Integer.parseInt(request.getParameter("$carID"));
            Car car = ngocStatelessRemote.searchReturn1($carID);
            String $today = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
        %>
            <table border="0">
                <tbody>
                    <tr>
                        <td>Model</td>
                        <td><%=car.getModel()%></td>
                    </tr>
                    <tr>
                        <td>Type</td>
                        <td><%=car.getType()%></td>
                    </tr>
                    <tr>
                        <td>Seating capacity</td>
                        <td><%=car.getSeat()%></td>
                    </tr>
                    <tr>
                        <td>Airconditioner required</td>
                        <td>
                        <%
                        if(car.getAirConditioner()) {
                            %>
                            <input type="checkbox" name="$airConditioner" value="whatever" checked />
                            <%
                        } else {
                            %>
                            <input type="checkbox" name="$airConditioner" value="whatever" />
                            <%
                        }
                        %>
                        </td>
                    </tr>
                    <tr>
                        <td>stock quantity</td>
                        <td><%= car.getQuantityStock() %></td>
                    </tr>
                    <tr>
                        <td>price</td>
                        <td><%=car.getPrice()%> USD</td>
                    </tr>
                    <form action="NgocServlet" method="post">
                            <input type="hidden" name="$carID" value="<%=car.getCarID() %>" />
                            <input type="hidden" name="$model" value="<%=car.getModel() %>" />
                            <input type="hidden" name="$price" value="<%=car.getPrice()%>" />
                    <tr>
                        <td>quantity</td>
                        <td><input type="text" name="$quantity" /></td>
                    </tr>
                    <tr>
                        <td>hire a driver (10$/day)</td>
                        <td><input type="checkbox" name="$driver" value="whatever" /></td>
                    </tr>
                    <tr>
                        <td>pickup date</td>
                        <td><input type="text" name="$pickup" value="<%=$today%>" id="datepicker3" /></td>
                    </tr>
                    <tr>
                        <td>dropoff date</td>
                        <td><input type="text" name="$dropoff" value="<%=$today%>" id="datepicker4" /></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" name="action" value="add to cart" id="btBook" />
                        </td>
                        <td></td>
                    </tr>
                    </form>
                </tbody>
            </table>
                    <%}%>


<!------------------------- CONTENT BEGIN ------------------------------>


            </div>
            <%@include file="templateFooter.jsp" %>
        </div>
    </body>
</html>
