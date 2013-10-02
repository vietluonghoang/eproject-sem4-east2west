package e2w.enitites;

import e2w.enitites.OrderTour;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import ngoc.entity.CarOrder;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2013-10-01T15:47:13")
@StaticMetamodel(Customer.class)
public class Customer_ { 

    public static volatile SingularAttribute<Customer, Integer> userID;
    public static volatile SingularAttribute<Customer, String> username;
    public static volatile SingularAttribute<Customer, String> phone;
    public static volatile SingularAttribute<Customer, String> nationality;
    public static volatile SingularAttribute<Customer, String> email;
    public static volatile SingularAttribute<Customer, String> address;
    public static volatile SingularAttribute<Customer, String> gender;
    public static volatile CollectionAttribute<Customer, OrderTour> orderTourCollection;
    public static volatile CollectionAttribute<Customer, CarOrder> carOrderCollection;
    public static volatile SingularAttribute<Customer, String> password;
    public static volatile SingularAttribute<Customer, String> fullname;

}