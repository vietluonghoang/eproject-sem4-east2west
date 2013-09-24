/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package e2w.bean;

import e2w.dto.OrderTourCancelDTO;
import e2w.dto.ScheduleTourDTO;
import e2w.dto.OrderTourDTO;
import e2w.dto.OrderTourDetailDTO;
import e2w.enitites.CancelOrderTour;
import e2w.enitites.Customer;
import e2w.enitites.Flight;
import e2w.enitites.OrderTour;
import e2w.enitites.OrderTourDetail;
import e2w.enitites.ScheduleTour;
import e2w.enitites.Tour;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author JAKE
 */
@Stateless(name = "CustomerBeanJNDI",mappedName = "CustomerBeanJNDI")
public class CustomerBean implements CustomerBeanRemote, CustomerBeanLocal {
    @PersistenceContext(unitName = "east2west-ejbPU")
    private EntityManager em;

    public void persist(Object object) {
        em.persist(object);
    }

    public boolean registerCustomer(String username, String password, String fullname, String gender, String email, String nationality, String address, String phone) {
        try {
            Customer cus = new Customer();
            cus.setUsername(username);
            cus.setPassword(password);
            cus.setFullname(fullname);
            cus.setGender(gender);
            cus.setEmail(email);
            cus.setNationality(nationality);
            cus.setAddress(address);
            cus.setPhone(phone);
           //set the entities from Customer entity :username,password,fullname,gende,email,nationality,address,address,phone

            em.persist(cus);
            //get all the customer input information and set to the entity class and persist it to database
            // return true
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        //return false if the error orcur
        return false;
    }

    public boolean checkLogin(String username, String password) {
        try {//checking the username and password in database for login
            //return boolean :true or false
            String ejbQL="SELECT c FROM Customer c WHERE c.username = :username and c.password = :password";
            Query query = em.createQuery(ejbQL);
            //set query parameter
            query.setParameter("username", username);
            query.setParameter("password", password);
            List list = query.getResultList();
            if(list.size()>0){
                //if the size of the list is more than 0,return true
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        //if the size of list less or equals to 0,return false
        return false;
    }

    public e2w.enitites.Tour[] searchTourLocation(String location) {
        try {//search tour by start location,it is not a main core query
            //the function return an array of Tour consist many Tour object
            //Tour object information is:tourID,tourName,imageTour,startDate,endDate,startLocation,endLocation,quantityMin,quantityMax,quantityCurrent,price,status,description

            String ejbQL="SELECT t FROM Tour t WHERE t.startLocation Like :startLocation";

            Query query = em.createQuery(ejbQL);
            //set query parameter
            query.setParameter("startLocation", "%"+location+"%");
            //create a list
            List list = query.getResultList();
            //create a array of tour with the size of the list
            Tour[] result = new Tour[list.size()];
            //cast the list in to array result
            list.toArray(result);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Tour loadTourDetail(int tourID) {
        try {//load the tour detail by the tourID
            //return an Tour object
             //Tour object information is:tourID,tourName,imageTour,startDate,endDate,startLocation,endLocation,quantityMin,quantityMax,quantityCurrent,price,status,description
            String ejbQL = "SELECT t FROM Tour t WHERE t.tourID = :tourID";
            //create query
            Query query = em.createQuery(ejbQL);

            //set the query parameter
            query.setParameter("tourID", tourID);
            Tour result = (Tour)query.getSingleResult();
            //return an Tour object
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        //if an error orcur,the function will return null
        return null;
    }

    public e2w.dto.ScheduleTourDTO[] loadTourSchedules(int tourID) {
        try {//load the schedule of the tour through the ScheduleTourDTO
            //return an array of ScheduleTourDTO
            //ScheduleTourDTO consist : an object Tour,an array of ScheduleTour

        String ejbQL="SELECT t FROM Tour t WHERE t.tourID = :tourID";
        Query query = em.createQuery(ejbQL);
        //set query parameter
        query.setParameter("tourID", tourID);
        //create  a list
        List listTour = query.getResultList();
        //create  an array list
        ArrayList list = new ArrayList();
        //run a loop with the size of the list
            for (int i = 0; i < listTour.size(); i++) {
                //create a Tour object to get the current Tour from the list
                Tour tour = (Tour) listTour.get(i);
                //create a collection to get the scheduleTourCollection from the current Tour
                Collection listScheduleTour = tour.getScheduleTourCollection();
                //create an array of ScheduleTour with the size of the collection
                ScheduleTour[] scheduleTour = new ScheduleTour[listScheduleTour.size()];
                //cast the collection in to the array
                listScheduleTour.toArray(scheduleTour);
                //create a ne ScheduleTourDTO with the Tour object and the array of scheduleTour
                ScheduleTourDTO dto = new ScheduleTourDTO(tour, scheduleTour);
                //add the dto in to list
                list.add(dto);
            }
        //create and array of ScheduleTourDTO with the size of the list
        ScheduleTourDTO[] result = new ScheduleTourDTO[list.size()];
        //cast the list in to the array
        list.toArray(result);
        //return the array of ScheduleTourDTO
        return result;

        } catch (Exception e) {
            e.printStackTrace();
        }
        //if the error orcurs,the function will return null
        return null;
    }

    public Customer loadCustomerInfo(int userID) {
        try {//load the Customer Information by looking the userID in Customer table in database
            //return an Customer object
            String ejbQL="SELECT c FROM Customer c WHERE c.userID = :userID";
            //create the query
            Query query = em.createQuery(ejbQL);
            //set the query parameter
            query.setParameter("userID", userID);
            //create a Customer object consist:username,password,fullname,gende,email,nationality,address,address,phone
            Customer result = (Customer)query.getSingleResult();
            //return the Customer object
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        //if error occurs,the function will return null
        return null;
    }

    public Customer searchCustomerByUsername(String username) {
        try {//load the Customer Information by looking the username in Customer table in database
            //return a Customer object
            String ejbQL="SELECT c FROM Customer c WHERE c.username = :username";
            //create a querry
            Query query = em.createQuery(ejbQL);
            //set query parameter
            query.setParameter("username", username);

             //create a Customer object consist:username,password,fullname,gende,email,nationality,address,address,phone
            Customer result = (Customer)query.getSingleResult();
            //return the Customter object
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        //if error occurs,the function will return null
        return null;
    }

    public boolean insertOrderTour(int userID, String totalPrice, String status) {
        try {//Insert a new Order Tour to database by looking the Customer by userID and add the total Price and Status to the OrderTour Table
            // return boolean:true or false
            System.out.println("Start to insert to Order");
            //return a Customer object by using em.find
            Customer customer = em.find(Customer.class, userID);
            System.out.println("have found customer ID :"+customer.getUserID());
            //create a new OrderTour object
            OrderTour order = new OrderTour();
            Date date = new Date();
            //set the OrderDate,TotalPrice,Status,Customer object(set userID from the Customer Object)
            order.setOrderDate(date);
            order.setTotalPrice(totalPrice);
            order.setStatus("Depending");
            order.setCustomer(customer);

            System.out.println("inserting order detail to database");
            //add a new OrderTour object to customer
            customer.getOrderTourCollection().add(order);
            //persist OrderTour object
            persist(order);
            System.out.println("finish insert order");
            //return true
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
        //if error occurs,the function will return false
    }

    public boolean insertCancelOrderTour(String orderTourID, String refund) {
        try {//insert a cancel of Order Tour by looking for the Order Tour by using orderTourID and then insert the refund after cancel the order
             // return boolean:true or false
            //find the OrderTour object by using orderTourID
            OrderTour order = em.find(OrderTour.class, orderTourID);
            //create a new CancelOrderTour
            CancelOrderTour cancelOrder = new CancelOrderTour();
            //set the refund
            cancelOrder.setRefund(refund);
            order.getCancelOrderTourCollection().add(cancelOrder);
            //return true after add the CancelOrderTour to CancelOrderTourCollection of OrderTour object
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
        //if error occurs,the function will return false
    }

    public boolean insertOrderDetails(int orderID,int tourID, int quantity) {
        try {//insert the tourID and quantity to Order Detail table by looking for the Order by using the orderID
            // return boolean:true or false
            System.out.println("Start to insert to Order Detail");
            //find the OrderTour object by using orderID
            OrderTour order = em.find(OrderTour.class, orderID);
            System.out.println("have found orderID :"+order.getOrderTourID());
            //create a new OrderTourDetail Object
            OrderTourDetail detail = new OrderTourDetail();
            //set the tourID,quantity,and the OrderTour object(set the orderID)
            detail.setTourID(tourID);
            detail.setQuantity(quantity);
            detail.setOrderTour(order);
            System.out.println("inserting order detail to database");
            //add the OrderTourDetail object to the OrderTourDetailCollection from OrderTour object
            order.getOrderTourDetailCollection().add(detail);
            persist(detail);
            System.out.println("finish insert order detail;");
            //after persist the OrderTourDetail object,return true
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        //if error occurs,the function will return false
        return false;
    }

    public OrderTourDTO searchOrderTourByUserID(int userID) {
        try {//load the OrderTour by using the userID for searching the Customer who have many orders.This function only return 1 result
            //return an OrderTourDTO object
            //OrderTourDTO object consist : a Customer object,an array of OrderTour

            //find the Customer object by using userID
            Customer cus = em.find(Customer.class, userID);
            //get the OrderTourCollection of the Customer object
            Collection listOrderTour = cus.getOrderTourCollection();
            //create a array of OrderTour with the size of the list
            OrderTour[] orderTour = new OrderTour[listOrderTour.size()];
            //cast the list in to array
            listOrderTour.toArray(orderTour);
            //create a new OrderTourDTO with the Customer object and an array of OrderTour
            OrderTourDTO dto = new OrderTourDTO(cus, orderTour);

            //return the OrderTourDTO
            return dto;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
        //if error occurs,the function will return null
    }

    public e2w.dto.OrderTourDTO[] loadOrder(int userID) {
        try {//load a array of OrderTour by using the userID for searching the customer who have many order.This function returns an array of OrderTourDTO
             //the fact that it will return a list of Order of the customer
             //return an array of OrderTourDTO
            //OrderTourDTO object consist : a Customer object,an array of OrderTour
            String ejbQL="SELECT c FROM Customer c WHERE c.userID = :userID";
            //create query
            Query query = em.createQuery(ejbQL);
            //set the query parameter
            query.setParameter("userID", userID);
            //create a list
            List listCus = query.getResultList();
            //create an array list with the result that query return
            ArrayList list = new ArrayList();
            //run a loop with the list size
            for (int i = 0; i < listCus.size(); i++) {
                //get the current Customer object
                Customer cus = (Customer) listCus.get(i);
                //get the OrderTourCollection from the Customer object
                Collection listOrderTour = cus.getOrderTourCollection();
                //create an array of OrderTour with the size of the collection
                OrderTour[] orderTour = new OrderTour[listOrderTour.size()];
                //cast the collection to array
                listOrderTour.toArray(orderTour);
                //create a new OrderTourDTO with Customer object and an array of OrderTour
                OrderTourDTO dto = new OrderTourDTO(cus, orderTour);
                //add the OrderTourDTO to the list
                list.add(dto);
            }
            //create a new array of OrderTourDTO with the size of the list
        OrderTourDTO[] result = new OrderTourDTO[list.size()];
        //cast the list to array
        list.toArray(result);
        //return the array of the OrderTourDTO

        return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        //if error occurs,the function will return null
        return null;
    }

    public e2w.dto.OrderTourDetailDTO[] loadOrderTourDetailByOrderTourID(int orderTourID) {
        try {
        // Using orderTourID to load the OrderTourDetail
        //Searching the OrderTour where orderTourID equals to the OrderTourID input
        //return an array of OrderTorDetailDTO
            String ejbQL="SELECT o FROM OrderTour o WHERE o.orderTourID = :orderTourID";
            //create the query
            Query query = em.createQuery(ejbQL);
            //set query parameter
            query.setParameter("orderTourID", orderTourID);
            //create a list with the result which returned by the query
            List listOrder = query.getResultList();
            //create an array list
            ArrayList list=  new ArrayList();
            //run the loop with the size of the list
            for (int i = 0; i < listOrder.size(); i++) {
                //get the current OrderTour object from the list
                OrderTour order = (OrderTour)listOrder.get(i);
                // get the OrderTourDetailCollection from the OrderTour object
                Collection listOrderDetail = order.getOrderTourDetailCollection();
                //create an array of OrderTourDetail with the collection size
                OrderTourDetail[] orderDetail = new OrderTourDetail[listOrderDetail.size()];
                //cast the collection to array
                listOrderDetail.toArray(orderDetail);
                //create an OrderTourDetailDTO object with the OrderTour object and an array of OrderTourDetail
                OrderTourDetailDTO dto = new OrderTourDetailDTO(order, orderDetail);
                list.add(dto);//After add the orderTour object and orderDetail object in to the dto,add the combination object to the list
            }
            OrderTourDetailDTO[] result= new OrderTourDetailDTO[list.size()];//create a array of dto and cast the list to array and return the result
            list.toArray(result);
            return result;

        } catch (Exception e) {
            e.printStackTrace();
        }
        //if error occurs,the function will return null
        return null;
    }

    public boolean updateOrderStatusAfterBook(int tourID, int quantity) {
        try {//update the current quantity of tour after the tour has been booked
            // return boolean:true or false
            //find the Tour object by using tourID
            Tour tour = em.find(Tour.class, tourID);
            //set the current quantity again after book
            tour.setQuantityCurrent(tour.getQuantityCurrent()-quantity);

            persist(tour);
            //after persist the Tour object,return true
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        //if error occurs,the function will return false
        return false;
    }

    public boolean updateOrderStatusAfterCancel(int tourID, int quantity) {
        try {//update the tour quantity after the order has been canceled
            // return boolean:true or false
            //find the Tour object by using tourID
            Tour tour = em.find(Tour.class, tourID);
            //set the current quantity again after cancel book
            tour.setQuantityCurrent(tour.getQuantityCurrent()+quantity);

            persist(tour);
            return true;
            //after persist the Tour object,return true
        } catch (Exception e) {
            e.printStackTrace();
        }
        //if error occurs,the function will return false
        return false;
    }

    public Tour loadTourByTourID(int tourID) {
        try {//load the tour information by using the tourID
            //return a Tour object
            //find the Tour object by using tourID
            Tour tour = em.find(Tour.class, tourID);
           //return the Tour Object
            return tour;
        } catch (Exception e) {
            e.printStackTrace();
        }
        //if error occurs,the function will return null
        return null;
    }

    public OrderTour loadOrderTourByOrderTourID(int orderID) {
        try {//load the orderTour by using the orderID
            //return an OrderTour object
            //find the OrderTour object by using orderID
            OrderTour result = em.find(OrderTour.class, orderID);
            //return the OrderTour object
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        //if error occurs,the function will return null
        return null;
    }

    public boolean cancelOrder(int orderID, String refund) {
        try {//canceled order by using the orderID and add the refund to database
            // return boolean:true or false
            Date date = new Date();
            OrderTour order = em.find(OrderTour.class, orderID); //searching for the Order by using orderID
            order.setStatus("Canceled");//update status order
            
            CancelOrderTour cancelOrder = new CancelOrderTour();
            cancelOrder.setCancelTourDate(date);//set the cancel order date
            cancelOrder.setRefund(refund);//set the refund
            cancelOrder.setOrderTour(order);//set the OrderTour object(set orderID)

            order.getCancelOrderTourCollection().add(cancelOrder);//add a ne CancelOrderTour Object to the CancelOrderTourCollection of OrderTour Object
            persist(cancelOrder);
            //after persist the CancelOrderTour Object,return true
            return true;


        } catch (Exception e) {
            e.printStackTrace();
        }
        //if error occurs,the function will return false
        return false;
    }

    public e2w.enitites.Tour[] searchTourByStartEndDate(String startDate, String endDate) {
        try {//searching tour by using the startDate and endDate,return a list of Tour
            //return an array of Tour Object
            String ejbQL="SELECT t FROM Tour t WHERE t.startDate >= :startDate and t.endDate <= :endDate";
            //create the query
            Query query = em.createQuery(ejbQL);
            //set query parameter
            query.setParameter("startDate", startDate);
            query.setParameter("endDate",endDate);
            //create a list with the result list which was return by the query
            List list = query.getResultList();
            //create an array of Tour object with the size of the list
            Tour[] result = new Tour[list.size()];
            //cast the list to array of Tour object
            list.toArray(result);
            //return the array of Tour object
            return result;

        } catch (Exception e) {
            e.printStackTrace();
        }
        //if error occurs,the function will return null
        return null;
    }

    public e2w.enitites.Tour[] searchTourByStartEndLocation(String startLocation, String endLocation) {
        try {//searching tour by using the startLocation and endLocation,return a list of Tour
            //return an array of Tour
            String ejbQL="SELECT t FROM Tour t WHERE t.startLocation = :startLocation and t.endLocation = :endLocation";
            //create the query
            Query query = em.createQuery(ejbQL);
            //set query parameter
            query.setParameter("startLocation", startLocation);
            query.setParameter("endLocation",endLocation);
            //create a list with the list of result which was returned by the query
            List list = query.getResultList();
            //create an array of Tour with the size of the list

            Tour[] result = new Tour[list.size()];
            //cast the list to array
            list.toArray(result);
            //return the array of Tour object
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public e2w.dto.OrderTourCancelDTO[] loadCancelOrderTourByOrderID(int orderID) {
        try {//load the cancel order by using the orderID
            //return an array of OrderTourCancelDTO
            String ejbQL = "SELECT o FROM OrderTour o WHERE o.orderTourID = :orderTourID";//searching the orderTour by using orderID
            Query query = em.createQuery(ejbQL);
            query.setParameter("orderTourID", orderID);
            
            List listOrder = query.getResultList();
            ArrayList list = new ArrayList();
            //run the loop to find the OrderTour
            for (int i = 0; i < listOrder.size(); i++) {
                OrderTour order = (OrderTour) listOrder.get(i);
                Collection listCancelOrder = order.getCancelOrderTourCollection();
                CancelOrderTour[] cancel = new CancelOrderTour[listCancelOrder.size()];
                listCancelOrder.toArray(cancel);//get all the cancelOrder in the list and return to the array
                OrderTourCancelDTO dto = new OrderTourCancelDTO(order, cancel);//add the order object and cancel order object to a dto
                list.add(dto);//add the dto to the list
            }

        OrderTourCancelDTO[] result = new OrderTourCancelDTO[list.size()];//create an Array of cancel order tour with the size of the list
        list.toArray(result);//cast the list to array and return the array of OrderTourCancelDTO
        return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        //if error occurs,the function will return null
        return null;

    }

    public boolean updateUserBasicInfo(int userID, String fullname, String gender, String address, String phone) {
        try {//update user information,very simple
            //return boolean: true or false
            //find the Customer object by using userID
            Customer cus = em.find(Customer.class, userID);
            //set the Customer Object parameter
            cus.setFullname(fullname);
            cus.setGender(gender);
            cus.setAddress(address);
            cus.setPhone(phone);
            //persist the Customer Object to apply the update
            persist(cus);
            //return true after that
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
       //if error occurs,the function will return false
        return false;
    }

    public boolean changePasswordCustomer(int userID, String password) {
        try {//change password of user by looking the userID and update the password,the information will be validate in the jsp and servlet
            //return boolean: true or false
            //find the Customer object by using userID
            Customer cus = em.find(Customer.class, userID);
            //set the new password for the Customer object
            cus.setPassword(password);
            //persist the Customer object to apply the update
            persist(cus);
            //after that,return true
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        //if error occurs,the function will return false
        return false;
    }

    public boolean changeEmailCustomer(int userID, String email) {
        try {//change email of user by looking the userID and update the email,the information will be validate in the jsp and servlet
             //find the Customer object by using userID
            Customer cus = em.find(Customer.class, userID);
            //set the new email for the Customer object
            cus.setEmail(email);

            persist(cus);
            //persist the Customer object to apply the update
            //after that,return true
            return true;
        } catch (Exception e) {
        e.printStackTrace();
        }
        //if error occurs,the function will return false
        return false;
    }

    public e2w.enitites.Flight[] loadFlightDetailByFlightBranch(String flightBranch) {
        try {//load the flight detail by using flightBranch,return a list of detail
            //return an array of Flight
            String ejbQL="SELECT f FROM Flight f WHERE f.flightBranch = :flightBranch";
            //create the query
            Query query = em.createQuery(ejbQL);
            //set query parameter
            query.setParameter("flightBranch", flightBranch);
            //create  a list with the result which was returned by the query
            List list = query.getResultList();
            //create an array of Flight object with the size of the list
            Flight[] result = new Flight[list.size()];
            //cast the list to array of Flight object
            list.toArray(result);
            //return the array of Flight object
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        //if error occurs,the function will return null
        return null;
    }

    public e2w.enitites.Flight[] loadFlight() {
        try {//this function return an array of fligh with no parameter : flightID,AvailableDate,ExpiredDate,takingOfAirP,landingAirP,takingOfTime,landingTime,price
            String ejbQL="SELECT f FROM Flight f";
            //create the query
            Query query = em.createQuery(ejbQL);
            //create  a list with the result which was returned by the query
            List list = query.getResultList();
             //create an array of Flight object with the size of the list
            Flight[] result = new Flight[list.size()];
            list.toArray(result);
             //cast the list to array of Flight object
            //return the array of Flight object
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
         //if error occurs,the function will return null
        return null;
    }

    public boolean insertFlight(String flightBranch, String availableDate, String expiredDate, String takingOfAirP, String landingAirP, String takingOfTime, String landingTime, int price) {
        try {
            //insert new flight to database
            //return boolean : true or false
            //create a new Flight object
            Flight f = new Flight();
            //set the Flight object parameter
            //flightBranch,AvailableDate,ExpiredDate,takingOfAirP,landingAirP,takingOfTime,landingTime,price
            f.setFlightBranch(flightBranch);
            f.setAvailableDate(new SimpleDateFormat("yyyy-MM-dd").parse(availableDate));
            f.setExpiredDate(new SimpleDateFormat("yyyy-MM-dd").parse(expiredDate));
            f.setTakingOfAirP(takingOfAirP);
            f.setLandingAirP(landingAirP);
            f.setTakingOfTime(takingOfTime);
            f.setLandingTime(landingTime);
            f.setPrice(price);
            //persist the Flight object
            persist(f);
            //after that return true
            return true;


        } catch (Exception e) {
            e.printStackTrace();
        }
        //if error occurs,the function will return false
        return false;
    }

    public boolean updateFlight(int flightID, String flightBranch, String availableDate, String expiredDate, String takingOfAirP, String landingAirP, String takingOfTime, String landingTime, int price) {
        try {
            //update flight in database
            //return boolean : true or false

            //looking for the Flight by using flightID
            Flight f = em.find(Flight.class, flightID);
            //set the Flight object parameter
            //flightBranch,AvailableDate,ExpiredDate,takingOfAirP,landingAirP,takingOfTime,landingTime,price
            f.setFlightBranch(flightBranch);
            f.setAvailableDate(new SimpleDateFormat("yyyy-MM-dd").parse(availableDate));
            f.setExpiredDate(new SimpleDateFormat("yyyy-MM-dd").parse(expiredDate));
            f.setTakingOfAirP(takingOfAirP);
            f.setLandingAirP(landingAirP);
            f.setTakingOfTime(takingOfTime);
            f.setLandingTime(landingTime);
            f.setPrice(price);
            //persist the Flight object to apply the update
            persist(f);
            //after that return true
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
         //if error occurs,the function will return false
        return false;
    }

    public boolean deleteFlight(int flightID) {
        try {
            //delete flight by using flightID
            //return boolean : true or false;
            //find the Flight object by using flightID
            Flight f = em.find(Flight.class, flightID);
            //remove the Flight object
            em.remove(f);
            //after that return true
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
         //if error occurs,the function will return false
        return false;
    }

    public Flight loadFlightByFlightID(int flightID) {
        try {
            //this function return a Flight object by using flightID
            //find the Flight object by using flightID
            Flight f = em.find(Flight.class, flightID);
            //return the Flight object
            return f;
        } catch (Exception e) {
            e.printStackTrace();
        }
         //if error occurs,the function will return null
        return null;
    }

    public boolean insertTour(String tourName, String imageTour, String startDate, String endDate, String startLocation, String endLocation, int minQuantity, int maxQuantity, int price, String description) {
        try {
            Tour tour = new Tour();
            tour.setTourName(tourName);
            tour.setImageTour(imageTour);
            String a = new SimpleDateFormat("yyyy-MM-dd").parse(startDate).toString();
            String b =new SimpleDateFormat("yyyy-MM-dd").parse(endDate).toString();
            tour.setStartDate(new SimpleDateFormat("yyyy-MM-dd").format(a));
            tour.setEndDate(new SimpleDateFormat("yyyy-MM-dd").format(b));
            tour.setStartLocation(startLocation);
            tour.setEndLocation(endLocation);
            tour.setQuantityMin(minQuantity);
            tour.setQuantityMax(maxQuantity);
            tour.setQuantityCurrent(maxQuantity);
            tour.setPrice(price);
            tour.setDescripton(description);
            tour.setStatus("disable");

            persist(tour);
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }









 







    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
 
}
