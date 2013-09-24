<%-- 
    Document   : carSearch
    Created on : Apr 15, 2013, 2:16:21 PM
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
    </head>
    <body>
        <div id="page-container">
            <%@include file="templateHeader.jsp" %>
            <div id="content">


<!------------------------- CONTENT BEGIN ------------------------------>


        <form action="NgocServlet" method="post">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Model</td>
                        <td><input type="text" name="$model" value="<%=request.getAttribute("$model")%>" /></td>
                    </tr>
                    <tr>
                        <td>Type</td>
                        <td><input type="text" name="$type" value="<%=request.getAttribute("$type")%>" /></td>
                    </tr>
                    <tr>
                        <td>Seating capacity</td>
                        <td><input type="text" name="$seat" value="<%=request.getAttribute("$seat")%>" /></td>
                    </tr>
                    <tr>
                        <td>Airconditioner</td>
                        <td><input type="radio" name="$airConditioner" value="yes" /> Yes
                            <input type="radio" name="$airConditioner" value="no" /> No
                            <%
                            if (request.getAttribute("$airConditioner")!=null) {
                                if (request.getAttribute("$airConditioner").equals("yes")) {
                                    %>
                                    <input type="radio" name="$airConditioner" value="yes" checked /> Yes
                                    <input type="radio" name="$airConditioner" value="no" /> No
                                    <%
                                } else {
                                    %>
                                    <input type="radio" name="$airConditioner" value="yes" /> Yes
                                    <input type="radio" name="$airConditioner" value="no" checked /> No
                                    <%
                                }
                            } else {
                                %>
                                <input type="radio" name="$airConditioner" value="yes" /> Yes
                                <input type="radio" name="$airConditioner" value="no" /> No
                                <%
                            }
                            %>
                        </td>
                    </tr>
                    <tr>
                        <td>stock quantity >=</td>
                        <td><input type="text" name="$stock" value="<%=request.getAttribute("$stock")%>" /></td>
                    </tr>
                    <tr>
                        <td>price from</td>
                        <td><input type="text" name="$from" value="<%=request.getAttribute("$from")%>" /> USD</td>
                    </tr>
                    <tr>
                        <td>price to</td>
                        <td><input type="text" name="$to" value="<%=request.getAttribute("$to")%>" /> USD</td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="action" value="search" /></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </form>
            <br/><br/>
        <%
        Context ngocCtx = new InitialContext();
        NgocStatelessRemote ngocRemote = (NgocStatelessRemote) ngocCtx.lookup("NgocStatelessRemote");
        Car[] result = null;
        if(request.getAttribute("INFO") == null) {
            result = (Car[])ngocRemote.search("SELECT c FROM Car c WHERE c.isDeleted = false LIMIT 10");
        } else {
            result = (Car[])request.getAttribute("INFO");
        }
        if (result.length==0) {
            %>
            No result found. Please broaden your search
            <%
        } else {
        %>
	<table border="1">
            <thead>
                <tr>
                    <th>model</th>
                    <th>image</th>
                    <th>type</th>
                    <th>capacity</th>
                    <th>aircondition</th>
                    <th>stock quantitiy</th>
                    <th>quantitiy left</th>
                    <th>price</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <%
                int paging;
                if (request.getParameter("paging")==null) {
                    paging=1;
                } else {
                    paging = Integer.parseInt(request.getParameter("paging"));
                }
                int pages = result.length/5;
                if (result.length%5>0) {
                    pages++;
                }
                int j;
                if (paging<pages) {
                    j = paging*5;
                } else {
                    j = result.length;
                }
                for (int i = (paging-1)*5; i < j; i++) {
                %>
                <tr>
                    <td><%=result[i].getModel() %></td>
                    <td><img src="images/<%=result[i].getImage() %>" width="50px" height="50px" /></td>
                    <td><%=result[i].getType() %></td>
                    <td><%=result[i].getSeat() %></td>
                    <td><%
                        if(result[i].getAirConditioner()) {
                            %>
                            <input type="checkbox" checked />
                            <%
                        } else {
                            %>
                            <input type="checkbox" />
                            <%
                        }
                        %>
                    </td>
                    <td><%=result[i].getQuantityStock() %></td>
                    <td>2</td>
                    <td><%=result[i].getPrice() %> USD</td>
                    <td><form action="carDescription.jsp" method="post">
                            <input type="hidden" name="$carID" value="<%=result[i].getCarID() %>" />
                            <input type="submit" name="action" value="description" />
                        </form>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
        <%
            for (int i = 1; i <= pages; i++) {
                if (i==paging) {
                    %>
                    _<%=i%>_
                    <%
                } else {
                    %>
                    <a href="carSearch.jsp?paging=<%=i%>">_<%=i%>_</a>
                    <form action="carSearch.jsp" method="post">
                        <input type="hidden" name="paging" value="<%=i%>" />
                        <input type="submit"
                    </form>
                    <%
                }
            }
        }
        %>


<!------------------------- CONTENT BEGIN ------------------------------>


            </div>
            <%@include file="templateFooter.jsp" %>
        </div>
    </body>
</html>
