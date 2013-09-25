package e2w.enitites;

import e2w.enitites.ScheduleTour;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2013-09-25T16:09:09")
@StaticMetamodel(Tour.class)
public class Tour_ { 

    public static volatile SingularAttribute<Tour, String> descripton;
    public static volatile SingularAttribute<Tour, String> imageTour;
    public static volatile SingularAttribute<Tour, String> startDate;
    public static volatile SingularAttribute<Tour, String> status;
    public static volatile SingularAttribute<Tour, Integer> quantityCurrent;
    public static volatile SingularAttribute<Tour, String> endDate;
    public static volatile SingularAttribute<Tour, String> startLocation;
    public static volatile SingularAttribute<Tour, Integer> tourID;
    public static volatile SingularAttribute<Tour, Integer> quantityMin;
    public static volatile SingularAttribute<Tour, Integer> price;
    public static volatile SingularAttribute<Tour, String> tourName;
    public static volatile SingularAttribute<Tour, String> endLocation;
    public static volatile CollectionAttribute<Tour, ScheduleTour> scheduleTourCollection;
    public static volatile SingularAttribute<Tour, Integer> quantityMax;

}