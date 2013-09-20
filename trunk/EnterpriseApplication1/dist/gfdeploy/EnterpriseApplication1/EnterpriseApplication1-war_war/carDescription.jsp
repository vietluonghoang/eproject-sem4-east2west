<%-- 
    Document   : carDescription
    Created on : Apr 15, 2013, 2:18:50 PM
    Author     : Anh Tuan
--%>

<%@page import="tuan.entity.Car"%>
<%@page import="tuan.bean.TuanStatelessRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            //Context ctx = new InitialContext();
            TuanStatelessRemote tuanStatelessRemote = (TuanStatelessRemote) ctx.lookup("TuanStatelessRemote");
            int $carID = Integer.parseInt(request.getParameter("$carID"));
            Car car = tuanStatelessRemote.searchReturn1($carID);
        %>
            <input type="hidden" name="$carID" value="<%=car.getCarID()%>" />
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
                    <tr>
                        <td><form action="carBook.jsp" method="post">
                            <input type="hidden" name="$carID" value="<%=car.getCarID() %>" />
                            <input type="submit" name="action" value="book this car" id="btBook" />
                            </form>
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        <br/><br/>
        <img width="450px" src="images/<%=car.getImage()%>" />
        <br/><br/>
        <div style=" text-wrap; word-wrap:break-word;" >
        <%=car.getDescription()%>
        </div>

<!------------------------- CONTENT BEGIN ------------------------------>


            </div>
            <%@include file="templateFooter.jsp" %>
        </div>
    </body>
</html>
