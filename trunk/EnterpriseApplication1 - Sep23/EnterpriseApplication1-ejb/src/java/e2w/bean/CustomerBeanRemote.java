/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package e2w.bean;

import e2w.dto.OrderTourDTO;
import e2w.enitites.Customer;
import e2w.enitites.Flight;
import e2w.enitites.OrderTour;
import e2w.enitites.Tour;
import javax.ejb.Remote;

/**
 *
 * @author JAKE
 */
@Remote
public interface CustomerBeanRemote {

    boolean registerCustomer(String username, String password, String fullname, String gender, String email, String nationality, String address, String phone);

    boolean checkLogin(String username, String password);

    e2w.enitites.Tour[] searchTourLocation(String location);

    Tour loadTourDetail(int tourID);

    e2w.dto.ScheduleTourDTO[] loadTourSchedules(int tourID);

    Customer loadCustomerInfo(int userID);

    Customer searchCustomerByUsername(String username);

    boolean insertOrderTour(int userID, String totalPrice, String status);

    boolean insertCancelOrderTour(String orderTourID, String refund);

    boolean insertOrderDetails(int orderID,int tourID, int quantity);

    OrderTourDTO searchOrderTourByUserID(int userID);

    e2w.dto.OrderTourDTO[] loadOrder(int userID);

    e2w.dto.OrderTourDetailDTO[] loadOrderTourDetailByOrderTourID(int orderTourID);

    boolean updateOrderStatusAfterBook(int tourID, int quantity);

    boolean updateOrderStatusAfterCancel(int tourID, int quantity);

    Tour loadTourByTourID(int tourID);

    OrderTour loadOrderTourByOrderTourID(int orderID);

    boolean cancelOrder(int orderID, String refund);

    e2w.enitites.Tour[] searchTourByStartEndDate(String startDate, String endDate);

    e2w.enitites.Tour[] searchTourByStartEndLocation(String startLocation, String endLocation);

    e2w.dto.OrderTourCancelDTO[] loadCancelOrderTourByOrderID(int orderID);

    boolean updateUserBasicInfo(int userID, String fullname, String gender, String address, String phone);

    boolean changePasswordCustomer(int userID, String password);

    boolean changeEmailCustomer(int userID, String email);

    e2w.enitites.Flight[] loadFlightDetailByFlightBranch(String flightBranch);

    e2w.enitites.Flight[] loadFlight();

    boolean insertFlight(String flightBranch, String availableDate, String expiredDate, String takingOfAirP, String landingAirP, String takingOfTime, String landingTime, int price);

    boolean updateFlight(int flightID, String flightBranch, String availableDate, String expiredDate, String takingOfAirP, String landingAirP, String takingOfTime, String landingTime, int price);

    boolean deleteFlight(int flightID);

    Flight loadFlightByFlightID(int flightID);

boolean insertTour(String tourName, String imageTour, String startDate, String endDate, String startLocation, String endLocation, int minQuantity, int maxQuantity, int price, String description);

    
}
