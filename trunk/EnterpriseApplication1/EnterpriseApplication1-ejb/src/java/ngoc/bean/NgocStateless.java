/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ngoc.bean;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import ngoc.entity.Car;
import ngoc.entity.Hotel;

/**
 *
 * @author tuan ngoc
 */
@Stateless(name = "NgocStatelessRemote",mappedName = "NgocStatelessRemote") 
public class NgocStateless implements NgocStatelessRemote, NgocStatelessLocal {
    @PersistenceContext(unitName = "east2west-ejbPU")
//    @PersistenceContext(unitName = "20130414eprojectSem4-ejbPU")
    private EntityManager em;

    public void persist(Object object) {
        em.persist(object);
    }

    //insert new car
    //input: String model, String type, int seat, boolean air, String description, String image, int stock, int price
    //output: nothing
    public boolean insert(String model, String type, int seat, boolean air, String description, String image, int stock, int price) {
        try {
            Car car = new Car(model, type, seat, air, description, image, stock, price);//new object
            persist(car);//insert into database
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;//do nothing
    }

    //get ejbQL from servlet, search then return array of Car
    //input: EJB3/Hibernate query come from servlet
    //output: Car array(Integer carID, String model, String type, int seat, boolean airConditioner, String description, String image, int quantityStock, int price, boolean isDeleted)
    public ngoc.entity.Car[] search(String ejbQL) {
        try {
            Query query = em.createQuery(ejbQL);//query is sent from servlet
            List list = query.getResultList();//get result
            Car[] result = new Car[list.size()];//new array
            list.toArray(result);//result to array
            return result;//return Car array(Integer carID, String model, String type, int seat, boolean airConditioner, String description, String image, int quantityStock, int price, boolean isDeleted)
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;//in case of error, return this(null/false/whatever)
    }

    //search by carID return single Car
    //input: carID
    //output: Car object(Integer carID, String model, String type, int seat, boolean airConditioner, String description, String image, int quantityStock, int price, boolean isDeleted)
    public Car searchReturn1(int $carID) {
        try {
            Query query = em.createNamedQuery("Car.findByCarID");//find by carID
            query.setParameter("carID", $carID);//input carID
            Car car = (Car)(query.getSingleResult());//get single result
            return car;//return car obejct(Integer carID, String model, String type, int seat, boolean airConditioner, String description, String image, int quantityStock, int price, boolean isDeleted)
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;//in case of error, return this(null/false/whatever)
    }

    //set car status to deleted
    //input: carID
    //output: nothing
    public boolean deleteCar(int $carID) {
        try {
            Car car = searchReturn1($carID);//get 1 car by carID
            car.setIsDeleted(true);//set status to deleted
            persist(car);//update database
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;//must have
    }

    //update car detail to database
    //input: int carID, String model, String type, int seat, boolean air, String description, String image, int stock, int price
    //output: nothing
    public boolean updateCarWithImage(int carID, String model, String type, int seat, boolean air, String description, String image, int stock, int price) {
        try {
            Car car = searchReturn1(carID);//get Car that need to update
            car.setModel(model);//set new value
            car.setType(type);//set new value
            car.setSeat(seat);//set new value
            car.setAirConditioner(air);//set new value
            car.setDescription(description);//set new value
            car.setImage(image);//set new value
            car.setQuantityStock(stock);//set new value
            car.setPrice(price);//set new value
            persist(car);//update to database
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;//must have
    }

    //update car detail to database
    //input: int carID, String model, String type, int seat, boolean air, String description, int stock, int price
    //output: nothing
    public boolean updateCarNoImage(int carID, String model, String type, int seat, boolean air, String description, int stock, int price) {
        try {
            Car car = searchReturn1(carID);//get Car that need to update
            car.setModel(model);//set new value
            car.setType(type);//set new value
            car.setSeat(seat);//set new value
            car.setAirConditioner(air);//set new value
            car.setDescription(description);//set new value
            car.setQuantityStock(stock);//set new value
            car.setPrice(price);//set new value
            persist(car);//update to database
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;//must have
    }

    //get ejbQL from servlet, search then return array of Hotel
    //input: EJB3/Hibernate query come from servlet
    //output: Hotel array(Integer hotelID, String hotelName, int hotelStar, String hotelStreet, String hotelImage, String hotelDescription, int hotelPrice, boolean isDeleted)
    public ngoc.entity.Hotel[] searchHotel(String ejbQL) {
        try {
            Query query = em.createQuery(ejbQL);//query is sent from servlet
            List list = query.getResultList();//get result
            Hotel[] result = new Hotel[list.size()];//new array
            list.toArray(result);//result to array
            return result;//return hotel array
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;//in case of error, return this(null/false/whatever)
    }

    //search by hotelID then return single Hotel
    //input: hotelID
    //output: hotel object
    public Hotel searchReturn1Hotel (int $hotelID) {
        try {
            Query query = em.createNamedQuery("Hotel.findByHotelID");//find by hotelID
            query.setParameter("hotelID", $hotelID);//set input to hotelID
            Hotel hotel = (Hotel)(query.getSingleResult());//set single result
            return hotel;//return hotel objnect
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;//in case of error, return this(null/false/whatever)
    }

    //insert new hotel
    //input: String name, String street, int star, String description, String image, int price
    //output: nothing
    public boolean insertHotel(String name, String street, int star, String description, String image, int price) {
        try {
            Hotel hotel = new Hotel(name, star, street, image, description, price);//new object
            persist(hotel);//insert object to database
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;//must have
    }

    //set hotel status to deleted
    //input: hotelID
    //output: nothing
    public boolean deleteHotel(int $hotelID) {
        try {
            Hotel hotel = searchReturn1Hotel($hotelID);//get Hotel
            hotel.setIsDeleted(true);//set status to deleted
            persist(hotel);//update hotel
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;//must have
    }
}
