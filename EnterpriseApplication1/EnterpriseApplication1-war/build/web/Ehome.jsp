<%-- 
    Document   : home
    Created on : Apr 21, 2013, 7:46:17 AM
    Author     : JAKE
--%>

<%@page import="ngoc.entity.Car"%>
<%@page import="ngoc.bean.NgocStatelessRemote"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="e2w.enitites.Tour"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="e2w.enitites.Customer"%>
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
                <h2>Welcome to East2West</h2>
                <p><strong>East2West Tours and Travels</strong>  is a young and dynamic company run by dedicated professional’s committed to providing the highest standards of service to the travel industry. We place great emphasis on personalized service, meticulous attention to detail, innovative itineraries and excellent customer care. However, over the years, there have been few difficult situations or queries, which we have not been able to solve and look forward to improve upon in the future. We are on call, at your service, 7 days a week. Our rates are highly competitive, and if you are seeking a travel agency who can not only provide top quality service, but can also anticipate and fully understand your needs, then look no further.</p>
                <p>We are currently undergoing a 'face lift', so if you have any questions or would like more information about the services we provide please feel free to contact us.</p>
            </div>

            <div id="tour-items">
                <h2>New Tour</h2>
                <div id="testTable">
                    
                        <div id="menuTable">
                            <%
                                Tour[] result = (Tour[]) remote.searchTourLocation("");
                                DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
                                DateFormat format = new SimpleDateFormat("yyyy-mm-dd");
                                for (int i = 0; i < result.length && i < 3; i++) {
                            %>
                            <div class="tableBackground">
                                <table width="400" border="0">
                                    <tbody>
                                    <form action="CustomerServlet" method="post">
                                        <tr>
                                            <td rowspan="6"><img src="images/<%=result[i].getImageTour()%>" height="150" width="195"/>
                                                <input type="hidden" name="txtHiddenTourID" value="<%=result[i].getTourID()%>" />
                                            </td>
                                            <td><strong>Tour Name</strong></td>
                                            <td><%=result[i].getTourName()%></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Start Date</strong></td>
                                            <td>
                                                <%
                                                    String sD = result[i].getStartDate();
                                                    Date SD = format.parse(sD);

                                                %>
                                                <%=new SimpleDateFormat("yyyy-mm-dd").format(SD)%></td>
                                        </tr>
                                        <tr>
                                            <td><strong>End Date</strong></td>
                                            <td>
                                                <%
                                                    String eD = result[i].getEndDate();
                                                    Date ED = format.parse(eD);
                                                %>
                                                <%=new SimpleDateFormat("yyyy-mm-dd").format(ED)%></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Duration</strong></td>
                                            <td>
                                                <%
                                                    String start = result[i].getStartDate();
                                                    String end = result[i].getEndDate();

                                                    Date s = dateFormat.parse(start);
                                                    Date e = dateFormat.parse(end);

                                                    long day = (e.getTime() - s.getTime()) / 86400000;


                                                %>
                                                <%=day%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><strong>Price</strong></td>
                                            <td><%=result[i].getPrice()%>$</td>
                                        </tr>
                                        <tr>
                                            <td colspan="1"><input type="submit"  name="action" value="View detail" align="right" id="btViewDetail"/></td>
                                            <td>
                                                <% if (result[i].getQuantityCurrent() <= 0 && cusINFO != null) {%>
                                                Out of Seat
                                                <% } else if (cusINFO != null && result[i].getQuantityCurrent() > 0) {%>
                                                <input type="submit"  name="action" value="Book" align="right" id="btBook"/>
                                                <% }%>
                                            </td>
                                        </tr>
                                    </form>
                                    </tbody>
                                </table>
                            </div>
                            <%
                                }
                            %>
                        </div>
                </div>
                <div align="right">
                    <a href="Etour.jsp" id="link">More tour...</a>
                </div>
            </div>

            <div id="car-items">
                <h2>New Car</h2>
                <div id="testTable2">
                    <div id="menuTable2">
                        <%
                            //for (int i = 0; i < result.length; i++) {
                            NgocStatelessRemote ngocStatelessRemote = (NgocStatelessRemote) ctx.lookup("NgocStatelessRemote");
                            Car[] resultCar;
                            if (request.getAttribute("INFO") == null) {
                                resultCar = (Car[]) ngocStatelessRemote.search("SELECT c FROM Car c WHERE c.isDeleted = false");
                            } else {
                                resultCar = (Car[]) request.getAttribute("INFO");
                            }
                            for (int i = resultCar.length - 1; i >= 0; i--) {
                        %>
                        <div class="carTableBackground">
                            <table border="0" >
                                <tr>
                                    <td rowspan="6"><img src="images/<%=resultCar[i].getImage()%>" width="195" height="150"/></td>
                                    <td>Model</td>
                                    <td><%=resultCar[i].getModel()%></td>
                                </tr>
                                <tr>
                                    <td>Type</td>
                                    <td><%= resultCar[i].getType()%></td>
                                </tr>
                                <tr>
                                    <td>Capacity</td>
                                    <td><%= resultCar[i].getSeat()%></td>
                                </tr>
                                <tr>
                                    <td>Quantity</td>
                                    <td><%= resultCar[i].getQuantityStock()%></td>
                                </tr>
                                <tr>
                                    <td>Price</td>
                                    <td><%=resultCar[i].getPrice()%> $/day</td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <form action="carDescription.jsp" method="post">
                                            <input type="hidden" name="$carID" value="<%=resultCar[i].getCarID()%>" />
                                            <input type="submit" name="action" value="description" align="right" id="btViewDetail"/>
                                        </form>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <%}%>
                    </div>
                </div>
                <div align="center">
                    <a href="carSearch.jsp" class="link">More car...</a>
                </div>
            </div>
            <%@include file  = "templateFooter.jsp" %>
        </div>
    </body>
</html>
