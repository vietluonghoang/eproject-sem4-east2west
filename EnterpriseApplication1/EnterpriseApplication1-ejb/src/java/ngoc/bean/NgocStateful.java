/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ngoc.bean;

import e2w.enitites.Customer;
import java.text.SimpleDateFormat;
import java.util.Collection;
import javax.ejb.Stateful;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import ngoc.entity.$OrderDTO;
import java.util.Date;
import java.util.List;
import javax.persistence.Query;
import ngoc.entity.Admin;
import ngoc.entity.Car;
import ngoc.entity.CarOrder;
import ngoc.entity.CarOrderDetail;
import ngoc.entity.CarReportDTO;
import ngoc.entity.OrderDetailDTO;

/**
 *
 * @author Tuan Ngoc
 */
@Stateful(name = "NgocStatefulRemote",mappedName = "NgocStatefulRemote")
public class NgocStateful implements NgocStatefulRemote, NgocStatefulLocal {
    @PersistenceContext(unitName = "east2west-ejbPU")
//    @PersistenceContext(unitName = "20130414eprojectSem4-ejbPU")
    private EntityManager em;

    public NgocStateful() {
    }

    public void persist(Object object) {
        em.persist(object);
    }

    private int $length=0;//number of all cart item
    private $OrderDTO[] $orderDTO = new $OrderDTO[99];//maximum 99 cart item
    private String $username;//admin username login

    public $OrderDTO[] get$orderDTO() {
        return $orderDTO;
    }

    public int get$length() {
        return $length;
    }

    public String get$username() {
        return $username;
    }

    //input: int $carID, String $model, int $price, int $quantity, int $inStock, Date $pickup, Date $dropoff, boolean $driver
    //create new dto in stateful session bean, in session not database
    //output:nothing
    public void addOrderItem(int $carID, String $model, int $price, int $quantity,
            int $inStock, Date $pickup, Date $dropoff, boolean $driver) {
        $orderDTO[$length] = new $OrderDTO($carID, $model, $price,
                $quantity, $inStock, $pickup, $dropoff, $driver);//new dto object
        $length++;      //increse cart array length
    }

    //input: index of cart item
    //output: carID
    public int $get$carID(int i) {//get carID
        return $orderDTO[i].get$carID();
    }

    //input: index of cart item
    //output: price
    public int $get$price(int i) {//get price
        return $orderDTO[i].get$price();
    }

    //input: int $userID, int $orderCost
    //insert new order to database then return order createDate
    //output: createDate
    public Date insertOrder(int $userID, int $orderCost) {
        Customer customer = em.find(Customer.class, $userID);//get Customer by id
        CarOrder carOrder = new CarOrder();// new object
        carOrder.setOrderCost($orderCost);//set orderCost
        Date $date = new Date();//get today
        carOrder.setCreateDate($date);//set createDate to today
        carOrder.setStatus("waiting");//new order status is waiting
        carOrder.setCustomer(customer);//set customer by userID
        customer.getCarOrderCollection().add(carOrder);//get all collection then add new
        return $date;// return order createDate
    }

    //input: int $carOrderID, int $carID, int quantity, boolean driver, Date pickup, Date dropoff, int totalCost, Date orderDate
    //insert new order detail which have 2 one-to-many relationship
    //output: nothing
    public boolean insertOrderDetail(int $carOrderID, int $carID, int quantity, boolean driver,
            Date pickup, Date dropoff, int totalCost, Date orderDate) {
        CarOrder carOrder = em.find(CarOrder.class, $carOrderID);//get carOrder by id
        Car car = em.find(Car.class, $carID);//get Car by id

        CarOrderDetail carOrderDetail = new CarOrderDetail(quantity, driver, pickup, dropoff,
                totalCost, orderDate, "waiting");//new object
        carOrderDetail.setCarOrder(carOrder);//set carOrder by carORderID
        carOrderDetail.setCar(car);//set car by carID

        carOrder.getCarOrderDetailCollection().add(carOrderDetail);//get all collection then add new
        return false;//do nothing, must have
    }

    //input: createDate
    //search by createDate then return single CarOrder
    //output: carOrder object
    public CarOrder searchReturn1(Date $date) {
        try {
            Query query = em.createNamedQuery("CarOrder.findByCreateDate");//find by createDate
            query.setParameter("createDate", $date);//set input to createDAte
            CarOrder carOrder = (CarOrder)(query.getSingleResult());//get single order
            return carOrder;//return carOrder object
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;//in case of error, return this(null/false/whatever)
    }

    //input: userID
    //search by userID then return single Customer
    //output: customer object
    public Customer getBillingAddress(int $userID) {
        try {
            Query query = em.createNamedQuery("Customer.findByUserID");//find by userID
            query.setParameter("userID", $userID);//set input to userID
            Customer customer = (Customer)query.getSingleResult();//get single customer
            return customer;//return customer object
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;//in case of error, return this(null/false/whatever)
    }

    //input: userID, date range
    //search carOrder within date range which have the needed userID
    //output: carOrder array
    public CarOrder[] searchCarOrder(int $userID, Date $from, Date $to) {
        try {
            Query query;//new query
            if ($from==null || $to ==null) {//if date range is null
                 query = em.createNamedQuery("CarOrder.findAll");//get all carOrder
            } else {
                query = em.createQuery("SELECT c FROM CarOrder c WHERE "
                        + "c.createDate BETWEEN :from AND :to");//get carOrder within range
                query.setParameter("from", $from);//set from date
                query.setParameter("to", $to);//set to date
            }
            List list = query.getResultList();//get result
            CarOrder[] carOrder = new CarOrder[list.size()];//new array
            list.toArray(carOrder);//result to array
            int $length2=0;//total CarOrder of a userID
            for (int i=0;i<carOrder.length;i++) {//get all carOrder
                //if carOrder belong to a specific customer
                if (carOrder[i].getCustomer().getUserID().equals($userID)) {
                    $length2++;//calculate array length
                }
            }
            CarOrder[] carOrder2 = new CarOrder[$length2];//new array
            $length2=0;//reset length
            for (int i=0;i<carOrder.length;i++) {//get all carORder
                //if carOrder belong to a specific customer
                if (carOrder[i].getCustomer().getUserID().equals($userID)) {
                    carOrder2[$length2] = carOrder[i];//get all CarOrder of unique userID
                    $length2++;//array length
                }
            }
            return carOrder2;//return carOrder array
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;//in case of error, return this(null/false/whatever)
    }

    //input: int $length, int $quantity, Date $pickup, Date $dropoff, boolean $driver, boolean $deleted
    //update cart item
    //void
    public void updateItem(int $length, int $quantity, Date $pickup,
            Date $dropoff, boolean $driver, boolean $deleted) {
        $orderDTO[$length].set$quantity($quantity);//set new value in stateful session bean
        $orderDTO[$length].set$driver($driver);//set new value in stateful session bean
        $orderDTO[$length].set$pickup($pickup);//set new value in stateful session bean
        $orderDTO[$length].set$dropoff($dropoff);//set new value in stateful session bean
        $orderDTO[$length].set$deleted($deleted);//set new value in stateful session bean
    }

    //input carOrderID
    //search by carOrderID then return carOrder and carOrderDetail by DTO
    //output: carOrder object and carOrderDetail array in DTO
    public OrderDetailDTO getCarOrderDetail(int $carOrderID) {
        try {
            Query query = em.createNamedQuery("CarOrder.findByCarOrderID");//find by carOrderID
            query.setParameter("carOrderID", $carOrderID);//set input carOrderID
            CarOrder carOrder = (CarOrder)query.getSingleResult();//get single carOrder
            Collection collection = carOrder.getCarOrderDetailCollection();//get carOrderDetail collection
            CarOrderDetail[] carOrderDetails = new CarOrderDetail[collection.size()];//new array
            collection.toArray(carOrderDetails);//cast carOrderDetail collection to array
            OrderDetailDTO dTO = new OrderDetailDTO(carOrder, carOrderDetails);//carOrder and carOrderDetail to DTO
            return dTO;//return carOrder object and carOrderDetail array in DTO
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;//in case of error, return this(null/false/whatever)
    }

    //input: carID
    //search by carID then return single Car
    //output: car object
    public Car findByCarID(int $carID) {
        try {
            Query query = em.createNamedQuery("Car.findByCarID");//find By CarID
            query.setParameter("carID", $carID);//set input to carID
            Car car = (Car)query.getSingleResult();//get single result
            return car;//car object
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;//in case of error, return this(null/false/whatever)
    }

    //input: date range
    //search CarOrderDetail between a range, then get all unique car in result,
    //then sort those unique car by totalOrderQuantity then return array of CarReportDTO
    //output: each unique car's carID and quantity in DTO, sorted
    public CarReportDTO[] report(Date $from, Date $to) {
        try {
            //get carOrderDetail within date range
            Query query = em.createQuery("SELECT c FROM CarOrderDetail c WHERE "
                    + "c.orderDate BETWEEN :from AND :to");
            query.setParameter("from", $from);//set input to from date
            query.setParameter("to", $to);//set input to to date
            List list = query.getResultList();//get result
            CarOrderDetail[] carOrderDetails = new CarOrderDetail[list.size()];//new array
            list.toArray(carOrderDetails);//result to arraay

            //new dto array to store all unique car within date range
            CarReportDTO[] carReportDTO = new CarReportDTO[99];
            int $length1 = 0;//dto length

            for (int j=0; j< carOrderDetails.length;j++) {//get all carOrderDetail
                if (!carOrderDetails[j].getStatus().equals("canceled")) {//if order not canceled
                boolean $flag =true;//not existed
                for (int k=0; k < $length1; k++) {//insert into carReportDTO
                    if (carOrderDetails[j].getCar().getCarID()==carReportDTO[k].getCarID()) {//if car existed
                        carReportDTO[k].setQuantityTotal(carOrderDetails[j].getQuantity()
                                +carReportDTO[k].getQuantityTotal());//add quantity to total
                        $flag=false;//existed
                    }
                }
                if($flag) {//if car is not existed
                    carReportDTO[$length1] = new CarReportDTO(carOrderDetails[j].getCar().getCarID()
                            , carOrderDetails[j].getQuantity());//create new dto
                    $length1++;//dto length
                }
                }
            }
            if ($length1 > 0) {//if result have anything

                // BUBBLE SORT----------------------------
                boolean swapped = true;
                int j = 0;
                CarReportDTO tmp;
                while (swapped) {
                    swapped = false;
                    j++;
                    for (int i = 0; i < $length1 - j; i++) {
                        if (carReportDTO[i].getQuantityTotal() >
                                carReportDTO[i + 1].getQuantityTotal()) {
                            tmp = carReportDTO[i];
                            carReportDTO[i] = carReportDTO[i + 1];
                            carReportDTO[i + 1] = tmp;
                            swapped = true;
                        }
                    }
                }
                // BUBBLE SORT END------------------------



                carReportDTO[0].setLength($length1);//total object in result DTO
                return carReportDTO;//return each unique car's carID and quantity in DTO
            }
            return null;//no result
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;//in case of error, return this(null/false/whatever)
    }

    //input: carID, quantity, date range
    //check car quantity in stock in a specify date range
    //output: have enough car in stock or not
    public boolean checkQuantity(Date $pickup, Date $dropoff, int $quantity, int $carID) {
        try {
            //get all carOrderDetail which have pickup and dropoff overlapse with date range
            Query query = em.createQuery("SELECT c FROM CarOrderDetail c WHERE "
                    + "c.pickup BETWEEN :pickup AND :dropoff OR c.dropoff BETWEEN :pickup AND :dropoff");
            query.setParameter("pickup", $pickup);//set input to pickup
            query.setParameter("dropoff", $dropoff);//set input to dropoff
            List list = query.getResultList();//get result
            CarOrderDetail[] carOrderDetails = new CarOrderDetail[list.size()];//new array
            list.toArray(carOrderDetails);//result to array

            //this method is not finshed so ill keep this portion of code

//            for (int j=0; j< carOrderDetails.length;j++) {
//                if (carOrderDetails[j].getCar().getCarID()==$carID) {
//                    if (!carOrderDetails[j].getStatus().equals("canceled")) {
//                        if (carOrderDetails[j].getQuantity()+$quantity>
//                                carOrderDetails[j].getCar().getQuantityStock()) {
//                            return true;
//                        }
//                    }
//                }
//            }


            Car car = findByCarID($carID);
            if ($quantity > car.getQuantityStock()) {
                return true;
            }

            //$pickup date will advance by 1 day until it pass dropoff date
            while ($pickup.equals($dropoff) || $pickup.before($dropoff)) {//if pickup is still before dropoff
                int $totalQuantity = $quantity;//total quantity booked of 1 car
                for (int j=0; j< carOrderDetails.length;j++) {//get of carOrderDetail
                    if (carOrderDetails[j].getCar().getCarID()==$carID) {//if its the car we looking for
                        if (carOrderDetails[j].getStatus().equals("waiting")) {//if order is still waiting
                            if ($pickup.equals(carOrderDetails[j].getPickup()) ||//if within date range
                                    $pickup.equals(carOrderDetails[j].getDropoff())) {
                                $totalQuantity += carOrderDetails[j].getQuantity();//add into totalQuantity
                                if ($totalQuantity>carOrderDetails[j].getCar().getQuantityStock()) {
                                    return true;//if total > stock order will not go through
                                }
                            } else if ($pickup.after(carOrderDetails[j].getPickup()) &&
                                    $pickup.before(carOrderDetails[j].getDropoff())) {//if within date range
                                $totalQuantity += carOrderDetails[j].getQuantity();//add into totalQuantity
                                if ($totalQuantity>carOrderDetails[j].getCar().getQuantityStock()) {
                                    return true;//if total > stock, order will not be proceed
                                }
                            }
                        }
                    }
                }
                $pickup = new Date($pickup.getTime()+(1000 * 60 * 60 * 24)+1);//advance pickup date by 1 day
            }
            return false;//have enough car in stock
        } catch (Exception e) {
            e.printStackTrace();
            return true;//error, order will not be proceeded
        }
    }

    //input: carID
    //search by carID then return single Car
    //output: car object
    public Car searchReturn1(int $carID) {
        try {
            Query query = em.createNamedQuery("Car.findByCarID");//find By CarID
            query.setParameter("carID", $carID);//set input to carID
            Car car = (Car)(query.getSingleResult());//get single result
            return car;//car object
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;//in case of error, return this(null/false/whatever)
    }

    //input: carID
    //set Car status to deleted in database
    //output: nothing
    public boolean deleteCar(int $carID) {
        try {
            Car car = searchReturn1($carID);//get 1 car by carID
            car.setIsDeleted(true);//set car status to deleted
            persist(car);//update to database
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;//must have
    }

    //input: carOrderID
    //set both CarOrder and CarOrderDetail status to canceled
    //void
    public void cancelOrder(int $carOrderID) {
        try {
            Date $today = new SimpleDateFormat("yyyy/MM/dd").parse(
                    new SimpleDateFormat("yyyy/MM/dd").format(new Date()));//get today
            Query query = em.createNamedQuery("CarOrder.findByCarOrderID");//find By CarOrderID
            query.setParameter("carOrderID", $carOrderID);//set input to carORderID
            CarOrder carOrder = (CarOrder)(query.getSingleResult());//get carOrder by id
            carOrder.setStatus("canceled");//set status to canceled
            carOrder.setEndDate(new Date());//set cancelDate
            //format createDate into yyyy/mm/dd
            Date $createDate = new SimpleDateFormat("yyyy/MM/dd").parse(
                    new SimpleDateFormat("yyyy/MM/dd").format(carOrder.getCreateDate()));
            //calculate refund: today 70%, yesterday 80%, beyond 90%
            if ($today.equals($createDate)) {//if today
                carOrder.setRefund(carOrder.getOrderCost()*70/100);//70%
            } else if (($today.getTime()-$createDate.getTime())/ (1000 * 60 * 60 * 24)+1==1) {//if yesterday
                carOrder.setRefund(carOrder.getOrderCost()*80/100);//80%
            } else {//if beyond
                carOrder.setRefund(carOrder.getOrderCost()*90/100);//90%
            }
            persist(carOrder);//update carOrder to canceled

            OrderDetailDTO dTO = getCarOrderDetail($carOrderID);//get carOrderDetail of a carOrderID
            CarOrderDetail carOrderDetail;//new object
            for (int i=0;i<dTO.getCarOrderDetails().length;i++) {//get all carORderDtail
                query = em.createNamedQuery("CarOrderDetail.findByCarOrderDetailID");//find By CarOrderDetailID
                query.setParameter("carOrderDetailID", dTO.getCarOrderDetails()[i].getCarOrderDetailID());
                carOrderDetail = (CarOrderDetail)(query.getSingleResult());//get by carOrderDetailID
                carOrderDetail.setStatus("canceled");//set carOrderDetail to canceled too
                persist(carOrderDetail);//update carOrderDetail
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //automatically finished order that pass today
    public void autoFinishOrder() {
        try {
            Date $today = new SimpleDateFormat("yyyy/MM/dd").parse(
                    new SimpleDateFormat("yyyy/MM/dd").format(new Date()));//get today
            Query query = em.createNamedQuery("CarOrder.findByStatus");//find By Status
            query.setParameter("status", "waiting");//get all waiting orders
            List list = query.getResultList();//get result
            CarOrder[] carOrders = new CarOrder[list.size()];//new array
            list.toArray(carOrders);//result to array
            Collection collection;//new collection
            CarOrderDetail[] carOrderDetails;//new array
            //get all carOrderDetail of carOrder to compare pickup date with today
            for (int i=0; i<carOrders.length; i++) {//get all carORder
                boolean $flag=false;//if carOrder have finished or not
                collection = carOrders[i].getCarOrderDetailCollection();//get CarOrderDetail Collection
                carOrderDetails = new CarOrderDetail[collection.size()];//initialize array
                collection.toArray(carOrderDetails);//collection to array
                CarOrderDetail carOrderDetail;//new object
                for (int j=0; j<carOrderDetails.length; j++) {//get all carOrderDetail
                    if (carOrderDetails[j].getPickup().before($today)) {//if pickup date has pass
                        $flag=true;//carOrder is finished
                        query = em.createNamedQuery("CarOrderDetail.findByCarOrderDetailID");//find By CarOrderDetailID
                        query.setParameter("carOrderDetailID", carOrderDetails[j].getCarOrderDetailID());
                        carOrderDetail = (CarOrderDetail)(query.getSingleResult());//get by carOrderDetailID
                        carOrderDetail.setStatus("finished");//set carOrderDetail to finished too
                        persist(carOrderDetail);//update carOrderDetail
                    }
                }
                if ($flag) {//if carORder is finished
                    CarOrder carOrder = searchReturn1(carOrders[i].getCreateDate());
                    carOrder.setStatus("finished");//set status to finished
                    persist(carOrder);//update to database
                }
            }

        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    //input: username password
    //check login admin
    //output: logon or rejected
    public boolean adminLogin(String $username, String $password) {
        try {
            Query query = em.createQuery("SELECT a FROM Admin a WHERE "
                    + "a.username = :username AND a.password = :password");//check login query
            query.setParameter("username", $username);//set username
            query.setParameter("password", $password);//set password
            List list = query.getResultList();//get result
            Admin[] admins = new Admin[list.size()];//new array
            list.toArray(admins);//result to array
            if (admins.length>0) {//if login detail is true
                this.$username = $username;//set user logon
                return true;//logon
            } else {//if not, login failed
                return false;//rejected
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;//rejected
        }
    }

}
