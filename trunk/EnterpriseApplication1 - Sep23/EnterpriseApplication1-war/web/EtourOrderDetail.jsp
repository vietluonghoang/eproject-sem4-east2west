<%-- 
    Document   : EtourOrder
    Created on : Apr 21, 2013, 9:34:55 AM
    Author     : JAKE
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="e2w.enitites.CancelOrderTour"%>
<%@page import="e2w.dto.OrderTourCancelDTO"%>
<%@page import="e2w.enitites.Tour"%>
<%@page import="e2w.enitites.Tour"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="e2w.enitites.OrderTourDetail"%>
<%@page import="e2w.dto.OrderTourDetailDTO"%>
<%@page import="e2w.enitites.OrderTour"%>
<%@page import="e2w.dto.OrderTourDTO"%>
<%@page import="e2w.enitites.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta http-equiv="Content-Language" content="en-us" />

	    <meta http-equiv="imagetoolbar" content="no" />
	    <meta name="MSSmartTagsPreventParsing" content="true" />

	    <meta name="description" content="Description" />
	    <meta name="keywords" content="Keywords" />

	    <meta name="author" content="Enlighten Designs" />

	    <style type="text/css" media="all">@import "css/css-style.css";</style>
<style>
#OrderTourDetailTable,
#OrderTourDetailTable td,
#OrderTourDetailTable th
{
border:1px solid green;
}
#OrderTourDetailTable th
{
background-color:green;
color:white;
}

#OrderCancelTable,
#OrderCancelTable td,
#OrderCancelTable th
{
border:1px solid red;
}
#OrderCancelTable th
{
background-color: red;
color:white;
}
</style>
    </head>
    <body>
        <div align="center"><img src="images/e2w-logo.jpg" /></div><br/>
        <div align="center"><h2>Order Detail</h2></div><br/>
		   <%
                   Context ctx = new InitialContext();
CustomerBeanRemote remote = (CustomerBeanRemote) ctx.lookup("CustomerBeanJNDI");
%>

	<div id="cart" align="center">
            <form action="CustomerServlet" method="post">
                 <%
            Customer customer = (Customer)session.getAttribute("SessionCusINFO");
            OrderTourDetailDTO[] orderDetailDTO = (OrderTourDetailDTO[] )request.getAttribute("orderDetail");
    for (int i = 0; i < orderDetailDTO.length; i++){
        OrderTourDetail[] orderDetail =  orderDetailDTO[i].getDetail();
        OrderTour order =  orderDetailDTO[i].getOrder();
%>
    <table width="350" border="0">
  <tr>
      <td align="center"><strong>Create Date</strong></td>
    <%
    Date od=orderDetail[i].getOrderTour().getOrderDate();
%>
<td align="center"><%=new SimpleDateFormat("yyyy-MM-dd").format(od) %>
    </td>
  </tr>
  <tr>
      <td align="center"><strong>Customer ID</strong></td>
      <td align="center"><%=customer.getUserID() %>
    </td>
  </tr>
  <tr>
      <td align="center"><strong>Customer Name</strong></td>
      <td align="center"><%=customer.getFullname() %></td>
  </tr>
  <tr>
      <td height="20" align="center"><strong>Customer Address</strong></td>
      <td align="center"><%=customer.getAddress() %></td>
  </tr>
  <tr>
      <td align="center"><strong>Customer Phone</strong></td>
      <td align="center"><%=customer.getPhone() %></td>
  </tr>
</table><br/>
<table width="600" border="1" id="OrderTourDetailTable">
      <tr>
      <td colspan="5" align="center"><strong>Order Detail</strong> of Order <strong><%=order.getOrderTourID() %></strong></td>
      </tr>
      <tr>
          <th align="center"><strong>Tour ID</strong></th>
          <th align="center"><strong>Tour Name</strong></th>
          <th align="center"><strong>Quantity</strong></th>
          <th align="center"><strong>Price</strong></th>
          <th align="center"><strong>Total</strong></th>
      </tr>
        <%
        }
for (int i = 0; i < orderDetailDTO.length; i++){
OrderTourDetail[] orderDetail =  orderDetailDTO[i].getDetail();
OrderTour order =  orderDetailDTO[i].getOrder();
for (int j= 0; j < orderDetail.length; j++) {
Tour tourD = remote.loadTourByTourID(orderDetail[j].getTourID());
%>
  <tr>
    <td align="center"><%=tourD.getTourID() %></td>
    <td align="center"><%=tourD.getTourName() %></td>
    <td align="center"><%=orderDetail[j].getQuantity() %></td>
    <td align="center"><%=tourD.getPrice() %> $</td>
    <td align="center"><%=tourD.getPrice()*orderDetail[j].getQuantity() %> $</td>
  </tr>
  <%
}
%>
      <tr>
    <td align="center" colspan="4"><strong>Total</strong></td>
    <td align="center"><%=order.getTotalPrice() %>$</td>
  </tr>
</table><br/>
       <%
}
            for (int i = 0; i <  orderDetailDTO.length; i++) {
                OrderTour order = orderDetailDTO[i].getOrder();
                if(order.getStatus().equals("Canceled")){
                    OrderTourCancelDTO[] dto = remote.loadCancelOrderTourByOrderID(order.getOrderTourID());

%>
            <table width="400" border="1" id="OrderCancelTable">
      <tr>
      <td colspan="5" align="center"><strong>The order was canceled</strong></td>
      </tr>
      <tr>
          <th align="center"><strong>Cancel Date</strong></th>
          <th align="center"><strong>Refund</strong></th>
      </tr>
      <tr>
          <%
          for (int j= 0; j < dto.length; j++) {
                CancelOrderTour[] cancel = dto[i].getCancel();
                 for (int k= 0; k < cancel.length; k++) {
                
                        Date ctd = cancel[k].getCancelTourDate();
%>
    <td align="center"><%=new SimpleDateFormat("yyyy-MM-dd").format(ctd) %></td>
    <td align="center"><%=cancel[k].getRefund() %> $</td>
    <%
    }
    }
}    
%>
  </tr>
  </table>
  <%
}
           
%>
            </form>
    </div>
    </body>
</html>
