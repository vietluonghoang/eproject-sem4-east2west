<%-- 
    Document   : adminCarDescription
    Created on : Apr 15, 2013, 1:54:57 PM
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
    <%@include file="templateAdminHead.jsp" %>
    </head>
        <body>

        <% $category="car"; %>

        <%@include file="templateAdminHeader.jsp" %>

        <%
            //Context ctx = new InitialContext();
            NgocStatelessRemote ngocStatelessRemote = (NgocStatelessRemote) ctx.lookup("NgocStatelessRemote");
            int $carID = Integer.parseInt(request.getParameter("$carID"));
            Car car = ngocStatelessRemote.searchReturn1($carID);
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
                        <td colspan="2"><img width="450px" src="images/<%=car.getImage()%>" /></td>
                    </tr>
                    <tr>
                        <td>stock quantity</td>
                        <td><%=car.getQuantityStock()%></td>
                    </tr>
                    <tr>
                        <td>price</td>
                        <td><%=car.getPrice()%> USD</td>
                    </tr>
                    <tr>
                        <td><form action="adminCarUpdate.jsp" method="post">
                            <input type="hidden" name="$carID" value="<%=car.getCarID() %>" />
                            <input type="submit" name="action" value="update" id="btUpdate" />
                            </form>
                        </td>
                        <td><form action="NgocServlet" method="post" onsubmit=
                            "return confirm(
                            'Do you really want to delete this car? This action cannot be undone!');">
                            <input type="hidden" name="$carID" value="<%=car.getCarID() %>" />
                            <input type="submit" name="action" value="delete" id="btDelete" />
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>
        <br/><br/><%=car.getDescription()%>

<%@include file="templateAdminFooter.jsp" %>
    </body>
</html>
