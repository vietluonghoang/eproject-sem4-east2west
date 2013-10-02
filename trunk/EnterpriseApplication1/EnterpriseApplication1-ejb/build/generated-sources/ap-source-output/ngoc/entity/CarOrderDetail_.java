package ngoc.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import ngoc.entity.Car;
import ngoc.entity.CarOrder;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2013-10-01T15:47:13")
@StaticMetamodel(CarOrderDetail.class)
public class CarOrderDetail_ { 

    public static volatile SingularAttribute<CarOrderDetail, Car> car;
    public static volatile SingularAttribute<CarOrderDetail, CarOrder> carOrder;
    public static volatile SingularAttribute<CarOrderDetail, Integer> totalCost;
    public static volatile SingularAttribute<CarOrderDetail, Date> pickup;
    public static volatile SingularAttribute<CarOrderDetail, String> status;
    public static volatile SingularAttribute<CarOrderDetail, Date> orderDate;
    public static volatile SingularAttribute<CarOrderDetail, Integer> quantity;
    public static volatile SingularAttribute<CarOrderDetail, Boolean> driver;
    public static volatile SingularAttribute<CarOrderDetail, Integer> carOrderDetailID;
    public static volatile SingularAttribute<CarOrderDetail, Date> dropoff;

}