package e2w.enitites;

import e2w.enitites.OrderTour;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2013-10-07T17:52:21")
@StaticMetamodel(OrderTourDetail.class)
public class OrderTourDetail_ { 

    public static volatile SingularAttribute<OrderTourDetail, Integer> tourID;
    public static volatile SingularAttribute<OrderTourDetail, OrderTour> orderTour;
    public static volatile SingularAttribute<OrderTourDetail, Integer> quantity;
    public static volatile SingularAttribute<OrderTourDetail, Integer> orderTourDetailID;

}