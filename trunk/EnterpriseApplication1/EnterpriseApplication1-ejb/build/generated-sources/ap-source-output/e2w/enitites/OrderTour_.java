package e2w.enitites;

import e2w.enitites.CancelOrderTour;
import e2w.enitites.Customer;
import e2w.enitites.OrderTourDetail;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2013-09-25T16:09:09")
@StaticMetamodel(OrderTour.class)
public class OrderTour_ { 

    public static volatile SingularAttribute<OrderTour, String> status;
    public static volatile CollectionAttribute<OrderTour, OrderTourDetail> orderTourDetailCollection;
    public static volatile SingularAttribute<OrderTour, Date> orderDate;
    public static volatile CollectionAttribute<OrderTour, CancelOrderTour> cancelOrderTourCollection;
    public static volatile SingularAttribute<OrderTour, Integer> orderTourID;
    public static volatile SingularAttribute<OrderTour, Customer> customer;
    public static volatile SingularAttribute<OrderTour, String> totalPrice;

}