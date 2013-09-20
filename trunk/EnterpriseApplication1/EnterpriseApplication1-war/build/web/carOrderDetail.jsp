<%-- 
    Document   : carOrderDetail
    Created on : Apr 23, 2013, 8:52:43 AM
    Author     : Anh Tuan
--%>

<%@page import="e2w.enitites.Customer"%>
<%@page import="tuan.entity.OrderDetailDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="tuan.entity.CarOrderDetail"%>
<%@page import="tuan.bean.TuanStatefulRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
		<style type="text/css">
		.auto-style1 {
			text-align: center;
			font-size: large;
			background-color: #C0C0C0;
		}
		.auto-style2 {
			text-align: center;
		}
		</style>
    </head>
    <body>
        <%
        Context ctx = new InitialContext();
        TuanStatefulRemote tuanStateful = (TuanStatefulRemote) ctx.lookup("TuanStatefulRemote");
        int $carOrderID = Integer.parseInt(request.getParameter("$carOrderID"));
        OrderDetailDTO dTO = tuanStateful.getCarOrderDetail($carOrderID);
        Customer customer = tuanStateful.getBillingAddress(Integer.parseInt(request.getParameter("$userID")));
        %>
                <img src="images/e2w-logo.jpg" />
                <table border="0" width="640px">
			<tbody>
				<tr>
					<td class="auto-style1" style="height: 50px" colspan="2"><strong>User's car order</strong></td>
				</tr>
				<tr>
					<td>
						order number: <%=dTO.getCarOrder().getCarOrderID()%><br/>
						order date: <%=dTO.getCarOrder().getCreateDate()%><br/>
						status: <%=dTO.getCarOrder().getStatus()%>
					</td>
					<td>name: <%=customer.getFullname()%><br/>
                                            Address: <%=customer.getAddress()%><br/>
                                            phone: <%=customer.getPhone()%>
					</td>
				</tr>
			</tbody>
		</table><br/><br/>
        <table border="1" width="640px">
            <thead>
                <tr>
                    <th>model</th>
                    <th>quantity</th>
                    <th>with driver</th>
                    <th>pickup date</th>
                    <th>dropoff date</th>
                    <th>Total cost</th>
                </tr>
            </thead>
            <tbody>
                <%
                for (int i=0;i<dTO.getCarOrderDetails().length;i++) {
                    String $pickup = new SimpleDateFormat("yyyy/MM/dd").format(dTO.getCarOrderDetails()[i].getPickup());
                    String $dropoff = new SimpleDateFormat("yyyy/MM/dd").format(dTO.getCarOrderDetails()[i].getDropoff());

                %>

                <tr>
                    <td><%=dTO.getCarOrderDetails()[i].getCar().getModel()%></td>
                    <td><%=dTO.getCarOrderDetails()[i].getQuantity()%></td>
                    <td><%
                        if(dTO.getCarOrderDetails()[i].getDriver()) {
                            %>
                            yes
                            <%
                        } else {
                            %>
                            no
                            <%
                        }
                        %>
                    </td>
                    <td><%=$pickup%></td>
                    <td><%=$dropoff%></td>
                    <td><%=dTO.getCarOrderDetails()[i].getTotalCost()%> USD</td>
                </tr>
                <%}%>
            </tbody>
        </table>
        <br/>
        <span style="color:red">
            Order cost: <%=dTO.getCarOrder().getOrderCost()%> USD<br/><br/>
            <% if (dTO.getCarOrder().getStatus().equals("canceled")) { %>
            cancel date: <%= dTO.getCarOrder().getEndDate() %><br/>
            refund: <%= dTO.getCarOrder().getRefund() %> USD
            <% } %>
        </span>
    </body>
</html>
