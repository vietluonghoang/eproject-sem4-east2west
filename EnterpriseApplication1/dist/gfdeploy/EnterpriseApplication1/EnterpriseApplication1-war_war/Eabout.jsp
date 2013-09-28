<%-- 
    Document   : Eabout
    Created on : Apr 21, 2013, 5:50:05 PM
    Author     : JAKE
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="e2w.enitites.Tour"%>
<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="javax.naming.InitialContext"%>
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
                <h2>About Us</h2>
                <p><strong>East2West Tours and Travels</strong>  is a young and dynamic company run by dedicated professional’s committed to providing the highest standards of service to the travel industry. We place great emphasis on personalized service, meticulous attention to detail, innovative itineraries and excellent customer care. However, over the years, there have been few difficult situations or queries, which we have not been able to solve and look forward to improve upon in the future. We are on call, at your service, 7 days a week. Our rates are highly competitive, and if you are seeking a travel agency who can not only provide top quality service, but can also anticipate and fully understand your needs, then look no further.</p>
                <p>We are currently undergoing a 'face lift', so if you have any questions or would like more information about the services we provide please feel free to contact us.</p>
                <p><strong>East2West Tours</strong> and <strong>Travels</strong> involve manual booking of certain profit based services as given below: Package Tours and Car Rental
                <p>A package Tour is a travel plan of predefined places. We bundle this travel plan into packages consisting of:</p>
                ►	Touring arrangements to the places<br/>
                ►	Accommodation<br/>
                ►	Food<br/>
                ►	Local Travel<br/>
                <p>Each package is characterized by a fixed duration and one whole price. Each component is not charged separately.</p>

                <p>We are in industry for the past 10 years. This experience enables us to create packages, which could become popular. We also get our data leads from past records.</p>

                <p>Packages can be:</p>
                ►	Country wise tours<br/>
                ►	Activity based like treks, camps or safaris<br/>
                ►	Places of historical significance</br>

                <p>In the present system, when a customer comes to us for a complete holiday package, we show them the available package tours. The customer makes a selection and we book the customer for that package. Normally, the package rates are specified on a per person basis. Therefore, the amount to be charged is calculated depending on the number of tickets purchased. Hence, the manual system is very slow, as displaying the various package brochures, entering customer data and making the sales entry is time consuming and involves multiple books. Hence, the proposal is to build an alternate system that will quicken this process.</p>
                ►	Country wise tours<br/>
                ►	Activity based like treks, camps or safaris<br/>
                ►	Places of historical significance<br/>

                <p>In the present system, when a customer comes to us for a complete holiday package, we show them the available package tours. The customer makes a selection and we book the customer for that package. Normally, the package rates are specified on a per person basis. Therefore, the amount to be charged is calculated depending on the number of tickets purchased. Hence, the manual system is very slow, as displaying the various package brochures, entering customer data and making the sales entry is time consuming and involves multiple books. Hence, the proposal is to build an alternate system that will quicken this process.</p>
                ►	Model<br/>
                ►	Type<br/>
                ►	Seating Capacity<br/>
                ►	Driver required/not required<br/>
                ►	Air-conditioner required/not required<br/>
                ►	Pick-up date and Drop-off date<br/>

                <p>In the present system, when the customer comes to rent a car, a list of cars fitting into the customer’s requirements is displayed. The customer makes a selection and we book the car for that customer. Finding the appropriate car and making the sales entry is time consuming and involves multiple books.</p>

                <p>The above two services are billable. However, cancellations are possible. The refund is calculated based on the number of days remaining before the actual use of the service.</p>

                <p>The refund rules are given as below:</p>

                Before 1 day – 75%<br/>
                2 days – 80%<br/>
                3 days – 85%<br/>
                4 days – 90%<br/>
                5 days or more – 95%<br/>
            </div>
            <%@include file="templateFooter.jsp" %>
            </div>
        </div>
    </body>
</html>
