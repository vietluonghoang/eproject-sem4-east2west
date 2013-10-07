package ngoc.entity;

import e2w.enitites.Customer;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import ngoc.entity.CarOrderDetail;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2013-10-07T17:52:21")
@StaticMetamodel(CarOrder.class)
public class CarOrder_ { 

    public static volatile CollectionAttribute<CarOrder, CarOrderDetail> carOrderDetailCollection;
    public static volatile SingularAttribute<CarOrder, String> status;
    public static volatile SingularAttribute<CarOrder, Integer> refund;
    public static volatile SingularAttribute<CarOrder, Integer> carOrderID;
    public static volatile SingularAttribute<CarOrder, Date> endDate;
    public static volatile SingularAttribute<CarOrder, Date> createDate;
    public static volatile SingularAttribute<CarOrder, Customer> customer;
    public static volatile SingularAttribute<CarOrder, Integer> orderCost;

}