<%-- 
    Document   : ViewDetail
    Created on : Oct 2, 2013, 2:52:15 PM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ResultSet rs = null;
            int pagenum = 1;
            int numOfElements = 1;
            try {
                String num = (String) request.getAttribute("pagenum");
                pagenum = Integer.parseInt(num);
                rs = (ResultSet) request.getAttribute("result");
            } catch (Exception ex) {
                
        %>
        <jsp:forward page="GetDataByPage"/>
        <%}%>
        <div id="tour-items">
            <form action="TourActionServlet" method="post">
                <table border="0" align="center">
                    <tbody>
                        <tr>
                            <th>No.</th>
                            <th >Tour ID</th>
                            <th >User ID</th>
                            <th>User Name</th>
                            <th>Tour ID</th>
                            <th >Tour Name</th>
                            <th>Quantity</th>
                            <th>Total Price</th>
                            <th>Order Date</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                        </tr>
                        <%
                            int numOfEntitiesPerPages = 20;
                            while (rs.next()) {
                                if ((numOfElements > (pagenum - 1) * (numOfEntitiesPerPages))
                                        && (numOfElements <= pagenum * (numOfEntitiesPerPages))) {
                        %>

                        <tr>
                            <td><%=numOfElements%></td>
                            <td><%= rs.getInt("orderTourID")%></td>
                            <td><%=rs.getInt("userID")%></td>
                            <td><%= rs.getString("username")%></td>
                            <td><%= rs.getInt("tourID")%></td>
                            <td ><%= rs.getString("tourName")%></td>
                            <td><%= rs.getInt("quantity")%></td>
                            <td><%= rs.getInt("totalPrice")%></td>
                            <td><%= rs.getDate("orderDate")%></td>
                            <td><%= rs.getDate("startDate")%></td>
                            <td><%= rs.getDate("endDate")%></td>
                        </tr> 
                        <%
                                }
                                numOfElements++;
                            }
                        %> 
                    </tbody>
                </table>
            </form>
        </div>

        <div id="pagingsection" align="center">
            <table border="1" cellspacing="5"><tr>
                    <%
                        int numOfPages = 0;
                        if (numOfElements % numOfEntitiesPerPages == 0) {
                            numOfPages = numOfElements / numOfEntitiesPerPages;
                        } else {
                            numOfPages = (numOfElements / numOfEntitiesPerPages) + 1;
                        }
                        for (int i = 0; i < numOfPages; i++) {
                    %>
                    <td>
                        <form action="GetDataByPage" method="POST" id="page<%=i%>">  
                            <input type="hidden" name="page" value="<%=i + 1%>"/>
                            <a href="javascript:document.getElementById('page<%=i%>').submit();"><strong>&nbsp;<%if (numOfPages == i + 1) {%><u><%}%><%=i + 1%><%if (numOfPages == i + 1) {%></u><%}%>&nbsp;</strong></a>
                        </form>
                    </td>
                    <%}%>
                </tr>
            </table>
        </div>
    </body> 
</html>
