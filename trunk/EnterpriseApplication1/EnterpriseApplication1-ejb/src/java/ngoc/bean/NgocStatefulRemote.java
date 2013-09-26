/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ngoc.bean;

import e2w.enitites.Customer;
import javax.ejb.Remote;
import java.util.Date;
import ngoc.entity.Car;
import ngoc.entity.CarOrder;
import ngoc.entity.CarReportDTO;
import ngoc.entity.OrderDetailDTO;

/**
 *
 * @author Tuan Ngoc
 */
@Remote
public interface NgocStatefulRemote {
    public void addOrderItem(int $carID, String $model, int $price, int $quantity, int $inStock, Date $pickup, Date $dropoff, boolean $driver);
    public int $get$carID(int i);
    public int get$length();
    public String get$username();
    public ngoc.entity.$OrderDTO[] get$orderDTO();
    public int $get$price(int i);
    public Date insertOrder(int $userID, int $orderCost);
    public boolean insertOrderDetail(int $carOrderID, int $carID, int quantity, boolean driver, Date pickup, Date dropoff, int totalCost, Date orderDate);
    public CarOrder searchReturn1(Date $date);
    public Customer getBillingAddress(int $userID);
    public CarOrder[] searchCarOrder(int $userID, Date $from, Date $to);
    public void updateItem(int $length, int $quantity, Date $pickup, Date $dropoff, boolean $driver, boolean $deleted);
    public OrderDetailDTO getCarOrderDetail(int $carOrderID);
    public Car findByCarID(int $carID);
    public CarReportDTO[] report(Date $from, Date $to);
    public boolean checkQuantity(Date $pickup, Date $dropoff, int $quantity, int $carID);
    public void cancelOrder(int $carOrderDetailID);
    public void autoFinishOrder();
    public boolean adminLogin(String $username, String $password);
    public CarReportDTO[] getOrderTotal(Date $from, Date $to);
}
