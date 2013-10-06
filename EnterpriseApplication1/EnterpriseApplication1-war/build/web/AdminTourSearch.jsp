<%-- 
    Document   : AdminTourSearch
    Created on : Sep 29, 2013, 2:15:00 PM
    Author     : VietLH
--%>

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
        <%
            String rs = "";
            String qryData = "";
            String type = "";
            int pagesnum = 1;
            int pages = 1;
            try {
                rs = (String) request.getAttribute("INFO");
                qryData = (String) request.getAttribute("qryData");
                type = (String) request.getAttribute("type");
                pagesnum = (Integer) request.getAttribute("pagesnum");
                if(pagesnum<0){
                    pagesnum=0;
                }
                pages = (Integer) request.getAttribute("page");
                if(pages<0){
                    pages=0;
                }
            } catch (Exception ex) {
                rs = "";
                qryData = "";
                type = "";
                pagesnum = 1;
                pages = 1;
            }
        %>
        <div id="tour-items"><center>
                <form action="TourActionServlet" method="post">
                    <table border="0" align="center" width="500">
                        <tbody>
                            <tr>
                                <th >Tour Name</th>
                                <td><input type="text" name="txtTourName" id="txtTourName" /></td>
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
                                <th>Status</th>
                                <td>
                                    <table>
                                        <tr><td><input type="radio" name="status" value="Available" checked="true"/>Available<br/></td></tr>
                                        <tr><td><input type="radio" name="status" value="Disabled"/>Disabled<br/></td></tr>
                                        <tr><td><input type="radio" name="status" value="All"/>All</td></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                        <input type="hidden" name="action" value="search" />
                        <td colspan="2" align="center"><input type="submit" value="Search" /></td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </center>
        </div>
        <%
            if (rs == null || "".equals(rs)) {
        %><br/><center>No data available.</center>
        <%            } else {
        %>
    <div id="pagingsection" align="center">
        <table border="1" cellspacing="5"><tr>
                <%
                    for (int i = 0; i < pagesnum; i++) {
                %>
                <td>
                    <form action="TourReportServlet" method="POST" id="page<%=i%>">   
                        <%=qryData%>
                        <input type="hidden" name="action" value="<%=type%>" />
                        <input type="hidden" name="page" value="<%=i + 1%>"/>
                        <a href="javascript:document.getElementById('page<%=i%>').submit();"><strong>&nbsp;<%if (pages == i + 1) {%><u><%}%><%=i + 1%><%if (pages == i + 1) {%></u><%}%>&nbsp;</strong></a>
                    </form>
                </td>
                <%}%>
            </tr>
        </table>
    </div>
    <table id="searchResult">
    <%=rs%>
    </table>
    <div id="pagingsection" align="center">
        <table><tr>
                <%
                    for (int i = 0; i < pagesnum; i++) {
                %>
                <td>
                    <form action="TourReportServlet" method="POST" id="page<%=i%>">   
                        <%=qryData%>
                        <input type="hidden" name="action" value="<%=type%>" />
                        <input type="hidden" name="page" value="<%=i + 1%>"/>
                        <a href="javascript:document.getElementById('page<%=i%>').submit();"><strong>&nbsp;<%if (pages == i + 1) {%><u><%}%><%=i + 1%><%if (pages == i + 1) {%></u><%}%>&nbsp;</strong></a>
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
