package ngoc.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import ngoc.entity.CarOrderDetail;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2013-10-01T15:47:13")
@StaticMetamodel(Car.class)
public class Car_ { 

    public static volatile SingularAttribute<Car, Boolean> airConditioner;
    public static volatile CollectionAttribute<Car, CarOrderDetail> carOrderDetailCollection;
    public static volatile SingularAttribute<Car, String> model;
    public static volatile SingularAttribute<Car, Integer> carID;
    public static volatile SingularAttribute<Car, Integer> price;
    public static volatile SingularAttribute<Car, Integer> seat;
    public static volatile SingularAttribute<Car, Integer> quantityStock;
    public static volatile SingularAttribute<Car, String> description;
    public static volatile SingularAttribute<Car, String> image;
    public static volatile SingularAttribute<Car, String> type;
    public static volatile SingularAttribute<Car, Boolean> isDeleted;

}