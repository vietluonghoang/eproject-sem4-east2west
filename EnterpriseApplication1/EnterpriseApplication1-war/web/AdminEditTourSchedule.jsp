<%-- 
    Document   : AdminEditTourSchedule
    Created on : Oct 6, 2013, 10:22:18 PM
    Author     : VietLH
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <%@include file="templateAdminHead.jsp" %>
    </head>
    <body>
        <%
            $category = "tour";
            $page = "search";
        %>
        <%@include file="templateAdminHeader.jsp" %>
        <br/><br/><a href="AdminTourSearch.jsp">Back to Tour Search.</a>
        <%
            ResultSet rs = null;
            int pagenum = 1;
            int numOfElements = 1;
            int tourID = 0;
            String type = "";
            try {
                String num = (String) request.getAttribute("pagenum");
                pagenum = Integer.parseInt(num);
                rs = (ResultSet) request.getAttribute("result");
                tourID = (Integer) request.getAttribute("id");
                type = (String) request.getAttribute("type");
            } catch (Exception ex) {

        %>
    <center>No data available.</center>
        <%}%>
        <%
            if ("addnew".equals(type)) {
        %>
    <div>
        <center>
            <form action="AdminEditTourScheduleServlet" method="post">
                <table>
                    <tr>
                        <th >Image Tour</th>
                        <td><input type="file" accept="jpg|jpeg|gif|png" name="fileImage" /></td>
                    </tr>
                    <tr>
                        <th>Description</th>
                        <td><textarea name="description"></textarea></td>
                    </tr>
                    <tr colspan="2">
                    <input type="hidden" name="type" value="commitadd"/>
                    <input type="submit" value="Add New"/>
                    </tr>
                </table>
            </form>
        </center>
    </div>
    <%
            }else if ("update".equals(type)) {
        %>
    <div>
        <center>
            <form action="AdminEditTourScheduleServlet" method="post">
                <table>
                    <tr>
                        <th >Image Tour</th>
                        <td>
                            <img src="images/<%=rs.getString("imageSchedule")%>" width="300" height="200"/><br/>
                            <input type="file" accept="jpg|jpeg|gif|png" name="fileImage" /></td>
                    </tr>
                    <tr>
                        <th>Description</th>
                        <td><textarea name="description"><%= rs.getString("description")%></textarea></td>
                    </tr>
                    <tr colspan="2">
                    <input type="hidden" name="type" value="commitupdate"/>
                    <input type="submit" value="Update"/>
                    </tr>
                </table>
            </form>
        </center>
    </div>
    <%                    } else {
    %>
    <div id="tour-items">        
        <table border="1" align="center">
            <tbody>
                <tr>
                    <th>Day No.</th>
                    <th>Image</th>
                    <th>Description</th>
                    <th></th>
                </tr>
                <%
                    int numOfEntitiesPerPages = 3;
                    while (rs.next()) {
                        if ((numOfElements > (pagenum - 1) * (numOfEntitiesPerPages))
                                && (numOfElements <= pagenum * (numOfEntitiesPerPages))) {
                %>

                <tr>

                    <td><%=numOfElements%></td>
                    <td><img src="<%= rs.getString("imageSchedule")%>" width="150"/> </td>
                    <td><%= rs.getString("description")%></td>

                    <td>
                        <form action="AdminEditTourScheduleServlet" method="post">
                            <input type="hidden" name="scheduleID" value="<%=rs.getInt("scheduleID")%>"/>
                            <input type="hidden" name="id" value="<%=tourID%>"/>
                            <input type="hidden" name="type" value="update"/>
                            <input type="submit" value="Update"/>
                        </form>
                        <br/>
                        <form action="AdminEditTourScheduleServlet" method="post" onsubmit=
                              "return confirm('Do you really want to delete this schedule? This action cannot be undone!');">
                            <input type="hidden" name="scheduleID" value="<%=rs.getInt("scheduleID")%>"/>
                            <input type="hidden" name="id" value="<%=tourID%>"/>
                            <input type="hidden" name="type" value="delete"/>
                            <input type="submit" value="Update"/>
                        </form>
                    </td>
                </tr> 
                <%
                        }
                        numOfElements++;
                    }
                %> 
            </tbody>
        </table>
        <form action="AdminEditTourScheduleServlet" method="post">
            <input type="hidden" name="id" value="<%=tourID%>"/>
            <input type="hidden" name="type" value="addnew"/>
            <input type="submit" value="Add new Schedule"/>
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
                    <form action="AdminEditTourScheduleServlet" method="POST" id="page<%=i%>">  
                        <input type="hidden" name="pagenum" value="<%=i + 1%>"/>
                        <input type="hidden" name="id" value="<%=tourID%>"/>                        
                        <input type="hidden" name="type" value="pagechange"/>
                        <a href="javascript:document.getElementById('page<%=i%>').submit();"><strong>&nbsp;<%if (numOfPages == i + 1) {%><u><%}%><%=i + 1%><%if (numOfPages == i + 1) {%></u><%}%>&nbsp;</strong></a>
                    </form>
                </td>
                <%}%>
            </tr>
        </table>
    </div>
    <%}%>
    <%@include file="templateAdminFooter.jsp" %>
</body>
</html>
