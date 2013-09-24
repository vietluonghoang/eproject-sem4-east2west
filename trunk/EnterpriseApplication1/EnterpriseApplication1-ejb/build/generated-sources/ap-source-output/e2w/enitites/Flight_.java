package e2w.enitites;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2013-09-24T14:52:07")
@StaticMetamodel(Flight.class)
public class Flight_ { 

    public static volatile SingularAttribute<Flight, String> takingOfAirP;
    public static volatile SingularAttribute<Flight, Date> availableDate;
    public static volatile SingularAttribute<Flight, String> flightBranch;
    public static volatile SingularAttribute<Flight, Integer> flightID;
    public static volatile SingularAttribute<Flight, Date> expiredDate;
    public static volatile SingularAttribute<Flight, Integer> price;
    public static volatile SingularAttribute<Flight, String> landingTime;
    public static volatile SingularAttribute<Flight, String> takingOfTime;
    public static volatile SingularAttribute<Flight, String> landingAirP;

}