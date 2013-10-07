package e2w.enitites;

import e2w.enitites.OrderTour;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2013-10-07T17:52:21")
@StaticMetamodel(CancelOrderTour.class)
public class CancelOrderTour_ { 

    public static volatile SingularAttribute<CancelOrderTour, Date> cancelTourDate;
    public static volatile SingularAttribute<CancelOrderTour, OrderTour> orderTour;
    public static volatile SingularAttribute<CancelOrderTour, String> refund;
    public static volatile SingularAttribute<CancelOrderTour, Integer> cancelOrderTourID;

}