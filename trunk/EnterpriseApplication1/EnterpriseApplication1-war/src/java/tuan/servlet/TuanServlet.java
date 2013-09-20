/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package tuan.servlet;

import e2w.enitites.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import tuan.bean.TuanStatefulRemote;
import tuan.bean.TuanStatelessRemote;
import tuan.entity.Car;
import tuan.entity.CarOrder;
import tuan.entity.CarReportDTO;
import tuan.entity.Hotel;

/**
 *
 * @author Anh Tuan
 */
public class TuanServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProcessServlet</title>");
            out.println("</head>");
            out.println("<body>");
            String action = request.getParameter("action");//get button action
            Context ctx = new InitialContext();
            UserTransaction ut = (UserTransaction) ctx.lookup("UserTransaction");
            TuanStatelessRemote remote = (TuanStatelessRemote) ctx.lookup("TuanStatelessRemote");
            TuanStatefulRemote tuanStatefulRemote = (TuanStatefulRemote) ctx.lookup("TuanStatefulRemote");
            HttpSession session = request.getSession();//get session
            Customer cusINFO = (Customer)session.getAttribute("SessionCusINFO");

            Date $today = new SimpleDateFormat("yyyy/MM/dd").parse(
                    new SimpleDateFormat("yyyy/MM/dd").format(new Date()));//get today

            if(action.equals("search")){//if button is search
//                int paging = Integer.parseInt(request.getParameter("paging"));

                //if text field is not blank, criteria will be add to query to search
                String ejbQL="SELECT c FROM Car c WHERE c.isDeleted = 0";//initial query
                if (!request.getParameter("$model").equals("")) {//if not blank
                    ejbQL+=" AND c.model LIKE '%"+request.getParameter("$model")+"%'";//add to query
                }
                if (!request.getParameter("$type").equals("")) {//if not blank
                        ejbQL+=" AND c.type = '"+request.getParameter("$type")+"'";//add to query
                }
                if (!request.getParameter("$seat").equals("")) {//if not blank
                    Integer.parseInt(request.getParameter("$seat"));//check if it is number
                    ejbQL+=" AND c.seat = "+request.getParameter("$seat");//add to query
                }
                if (request.getParameter("$airConditioner")!=null) {//if not blank
                        if (request.getParameter("$airConditioner").equals("yes")) {//if checked
                            ejbQL+=" AND c.airConditioner = true";//add to query
                        } else {//if unchecked
                            ejbQL+=" AND c.airConditioner = false";//add to query
                        }
                }
                if (!request.getParameter("$stock").equals("")) {//if not blank
                    Integer.parseInt(request.getParameter("$stock"));//check if it is number
                    ejbQL+=" AND c.quantityStock >= "+request.getParameter("$stock");//add to query
                }
                //it can search by price even if only 1 textfield is filled in
                if (!request.getParameter("$from").equals("") ||//if not blank
                        !request.getParameter("$to").equals("")) {
                    Integer.parseInt(request.getParameter("$from"));//check if it is number
                    Integer.parseInt(request.getParameter("$to"));//check if it is number
                    if (!request.getParameter("$from").equals("") &&
                            request.getParameter("$to").equals("")) {//if only from is fill
                            ejbQL+=" AND c.price >= "+request.getParameter("$from");//add to query
                    } else if (request.getParameter("$from").equals("") &&
                            !request.getParameter("$to").equals("")) {//if only to is fill
                            ejbQL+=" AND c.price <= "+request.getParameter("$to");//add to query
                    } else {//if both is fill
                            ejbQL+=" AND c.price BETWEEN "+request.getParameter("$from")+
                                    " AND "+request.getParameter("$to");//add to query
                    }
                }
                Car[] car = remote.search(ejbQL);//search by sending query and get result
                request.setAttribute("INFO", car);
//                request.setAttribute("$model", request.getParameter("$model"));
//                request.setAttribute("$type", request.getParameter("$type"));
//                request.setAttribute("$seat", request.getParameter("$seat"));
//                request.setAttribute("$airConditioner", request.getParameter("$airConditioner"));
//                request.setAttribute("$stock", request.getParameter("$stock"));
//                request.setAttribute("$from", request.getParameter("$from"));
//                request.setAttribute("$to", request.getParameter("$to"));
                
                //redirect to the right page
                if (request.getParameter("which") != null) {//if admin search page
                    request.getRequestDispatcher("adminCarSearch.jsp").forward(request, response);
                } else {//if user search page
                    request.getRequestDispatcher("carSearch.jsp").forward(request, response);
                }
}else if(action.equals("delete")){//if delete button
                int $carID = Integer.parseInt(request.getParameter("$carID"));//get carID
                remote.deleteCar($carID); //set car status to deleted
                request.getRequestDispatcher("adminCarSearch.jsp").forward(request, response);
}else if (action.equals("add to cart")) {//if button add to cart
                int $carID = Integer.parseInt(request.getParameter("$carID"));//parse input value
                String $model = request.getParameter("$model");//get input value
                int $price = Integer.parseInt(request.getParameter("$price"));//parse input value
                int $quantity = Integer.parseInt(request.getParameter("$quantity"));//parse input value
                boolean $driver = true;//checked
                int $inStock=0;
                if(request.getParameter("$driver")==null) {//if unchecked
                    $driver = false;//unchecked
                }
                Date $pickup = new SimpleDateFormat("yyyy/MM/dd").//parse input value
                        parse(request.getParameter("$pickup"));
                Date $dropoff = new SimpleDateFormat("yyyy/MM/dd").//parse input value
                        parse(request.getParameter("$dropoff"));
                if ($quantity==0) {//quantity is zero
                    request.setAttribute("ERROR", "your quantity cannot be zero");
                    request.getRequestDispatcher("carError.jsp").forward(request, response);
                    return;//stop method
                //in the pickup and dropoff date range there must be enough car to book
                } else if (tuanStatefulRemote.checkQuantity($pickup, $dropoff, $quantity, $carID)) {
                    request.setAttribute("ERROR", "there's not enough cars in stock to book");
                    request.getRequestDispatcher("carError.jsp").forward(request, response);
                    return;//stop method
                } else if ($pickup.before($today)) {//pickup date cannot be before today
                        request.setAttribute("ERROR", "pickup date cannot be before today");
                        request.getRequestDispatcher("carError.jsp").forward(request, response);
                        return;//stop method
                } else if ($pickup.after($dropoff)) {//dropoff date cannot be before pickup date
                    request.setAttribute("ERROR", "dropoff date cannot be before pickup date");
                    request.getRequestDispatcher("carError.jsp").forward(request, response);
                    return;//stop method
                }
                //cannot book a car twice
                if (session.getAttribute("carCart") != null) {//if theres item in cart
                    tuanStatefulRemote = (TuanStatefulRemote)session.getAttribute("carCart");//get cart
                    for (int i=0;i<tuanStatefulRemote.get$length();i++) {//get all cart item
                        if ($carID==tuanStatefulRemote.$get$carID(i)//if car existed and not removed
                                && !tuanStatefulRemote.get$orderDTO()[i].is$deleted()) {
                            request.setAttribute("ERROR", "you've already booked this car");
                            request.getRequestDispatcher("carError.jsp").forward(request, response);
                            return;//stop method
                        }
                    }
                }
                //add car order to shopping cart session
                tuanStatefulRemote.addOrderItem($carID, $model, $price, $quantity,
                        $inStock, $pickup, $dropoff, $driver);
                session.setAttribute("carCart", tuanStatefulRemote);//set session
                request.getRequestDispatcher("carShoppingCart.jsp").forward(request, response);//redirect
}else if (action.equals("update item")) {//if button update
                int i = Integer.parseInt(request.getParameter("i"));//index of cart item
                int $quantity = Integer.parseInt(request.getParameter("$quantity"));//parse input value
                boolean $driver = true;//checked
                if(request.getParameter("$driver")==null) {//if unchecked
                    $driver = false;//unchecked
                }
                Date $pickup = new SimpleDateFormat("yyyy/MM/dd").//parse input value
                        parse(request.getParameter("$pickup"));
                Date $dropoff = new SimpleDateFormat("yyyy/MM/dd").//parse input value
                        parse(request.getParameter("$dropoff"));

                tuanStatefulRemote = (TuanStatefulRemote)session.getAttribute("carCart");//get session
                int $carID = tuanStatefulRemote.get$orderDTO()[i].get$carID();//get carID

                if ($quantity==0) {//your quantity cannot be zero
                    request.setAttribute("ERROR", "your quantity cannot be zero");
                    request.getRequestDispatcher("carError.jsp").forward(request, response);
                    return;//stop method
                //in the pickup and dropoff date range there must be enough car to book
                } else if (tuanStatefulRemote.checkQuantity($pickup, $dropoff, $quantity, $carID)) {
                    request.setAttribute("ERROR", "there's not enough cars in stock to book");
                    request.getRequestDispatcher("carError.jsp").forward(request, response);
                    return;//stop method
                } else if ($pickup.before($today)) {//pickup date cannot be before today
                    request.setAttribute("ERROR", "pickup date cannot be before today");
                    request.getRequestDispatcher("carError.jsp").forward(request, response);
                    return;//stop method
                } else if ($pickup.after($dropoff)) {//dropoff date cannot be before pickup date
                    request.setAttribute("ERROR", "dropoff date cannot be before pickup date");
                    request.getRequestDispatcher("carError.jsp").forward(request, response);
                    return;//stop method
                }
                if (session.getAttribute("carCart") != null) {//if session not null
                    tuanStatefulRemote = (TuanStatefulRemote)session.getAttribute("carCart");//get cart
                    //update cart item in session
                    tuanStatefulRemote.updateItem(i, $quantity, $pickup, $dropoff, $driver, false);
                }
                session.setAttribute("carCart", tuanStatefulRemote);//set session
                request.getRequestDispatcher("carShoppingCart.jsp").forward(request, response);//redirect
}else if (action.equals("remove")) {//if remove button
                int i = Integer.parseInt(request.getParameter("i"));//get cart item index
                if (session.getAttribute("carCart") != null) {//if cart not null
                    tuanStatefulRemote = (TuanStatefulRemote)session.getAttribute("carCart");//get cart
                    //set cart item to default and deleted in session
                    tuanStatefulRemote.updateItem(i, 0, new Date(), new Date(), false, true);
                }
                session.setAttribute("carCart", tuanStatefulRemote);//set session
                request.getRequestDispatcher("carShoppingCart.jsp").forward(request, response);//redirect
}else if (action.equals("place order")) {
                if (session.getAttribute("carCart") != null) {//if cart not null
                    tuanStatefulRemote = (TuanStatefulRemote)session.getAttribute("carCart");//get cart
                }
                int $orderCost=0;//for calculating order cost
                int $userID = Integer.parseInt(request.getParameter("$userID"));//get input value
                int $quantity, $totalCost, $carID;//new variable
                Date $pickup, $dropoff;//new variable
                boolean $driver;//new variable
                for (int i=0;i<tuanStatefulRemote.get$length();i++) {//get all cart item
                    if (!tuanStatefulRemote.get$orderDTO()[i].is$deleted()) {//if item is not removed from cart
                        //get orderCost by all car totalCost (price*quantity*(number of date book))
                        int $driverCost=0;
                        if(tuanStatefulRemote.get$orderDTO()[i].is$driver()) {
                            $driverCost=10;
                        }
                        $orderCost+= (tuanStatefulRemote.$get$price(i)
                            *tuanStatefulRemote.get$orderDTO()[i].get$quantity()+$driverCost)*(int)(
                            (tuanStatefulRemote.get$orderDTO()[i].get$dropoff().getTime()
                            - tuanStatefulRemote.get$orderDTO()[i].get$pickup().getTime())
                            / (1000 * 60 * 60 * 24)+1);//get time then divine by millisecond of 1 day
                    }
                }
                //check if car already booked
                for (int i=0;i<tuanStatefulRemote.get$length();i++) {//get all cart item
                    if (!tuanStatefulRemote.get$orderDTO()[i].is$deleted()) {//if item is not removed from cart
                        $pickup = tuanStatefulRemote.get$orderDTO()[i].get$pickup();//get cart item value
                        $dropoff = tuanStatefulRemote.get$orderDTO()[i].get$dropoff();//get cart item value
                        $quantity = tuanStatefulRemote.get$orderDTO()[i].get$quantity();//get cart item value
                        $carID = tuanStatefulRemote.get$orderDTO()[i].get$carID();//get cart item value
			//re-check quantity in database
                        if (tuanStatefulRemote.checkQuantity($pickup, $dropoff, $quantity, $carID)) {
                            request.setAttribute("ERROR", "someone faster than you have already book a car");
                            request.getRequestDispatcher("carError.jsp").forward(request, response);
                            return;//stop method
                        }
                    }
                }
                //insert and get orderDate, orderDate is needed for orderDetail
                Date $orderDate = tuanStatefulRemote.insertOrder($userID, $orderCost);

		//get carOrderID by orderDate of the order just insert in database
                int $carOrderID = tuanStatefulRemote.searchReturn1($orderDate).getCarOrderID();
                //insert carOrderDetail
                for (int i=0;i<tuanStatefulRemote.get$length();i++) {//get all cart item
                    if (!tuanStatefulRemote.get$orderDTO()[i].is$deleted()) {//if item is not removed from cart
                        $carID = tuanStatefulRemote.get$orderDTO()[i].get$carID();//get cart item value
                        $quantity = tuanStatefulRemote.get$orderDTO()[i].get$quantity();//get cart item value
                        $driver = tuanStatefulRemote.get$orderDTO()[i].is$driver();//get cart item value
                        $pickup = tuanStatefulRemote.get$orderDTO()[i].get$pickup();//get cart item value
                        $dropoff = tuanStatefulRemote.get$orderDTO()[i].get$dropoff();//get cart item value
                        //get totalCost (price*quantity*(number of date book))
                        $totalCost = tuanStatefulRemote.$get$price(i)
                            *tuanStatefulRemote.get$orderDTO()[i].get$quantity()*(int)(
                            (tuanStatefulRemote.get$orderDTO()[i].get$dropoff().getTime()
                            - tuanStatefulRemote.get$orderDTO()[i].get$pickup().getTime())
                            / (1000 * 60 * 60 * 24)+1);//get time then divine by millisecond of 1 day

                        tuanStatefulRemote.insertOrderDetail($carOrderID, $carID, $quantity, $driver,
                                $pickup, $dropoff, $totalCost, $orderDate);//insert into database
                    }
                }
                session.setAttribute("carCart", null);//set session
                request.getRequestDispatcher("carOrderDetail.jsp?$userID="+cusINFO.getUserID()+"&$carOrderID="+$carOrderID).forward(request, response);
}else if (action.equals("search range")) {//if button search range
                int $userID = Integer.parseInt(request.getParameter("$userID"));//parse input value
                Date $from = new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("$from"));//parse input value
                Date $to = new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("$to"));//parse input value
                if ($from.after($to)) {
                    request.setAttribute("ERROR", "from date cannot be after to date");
                    request.getRequestDispatcher("carError.jsp").forward(request, response);
                    return;//stop method
                }
                //search CarOder where createDate between $from and $to
                CarOrder[] carOrder = (CarOrder[])tuanStatefulRemote.searchCarOrder($userID, $from, $to);
                request.setAttribute("INFO", carOrder);//set session
                request.getRequestDispatcher("carOrderSearch.jsp").forward(request, response);//redirect
}else if (action.equals("report")) {//if report button
                Date $from = new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("$from"));//parse input value
                Date $to = new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("$to"));//parse input value
                if ($from.after($to)) {
                    request.setAttribute("ERROR", "from date cannot be after to date");
                    request.getRequestDispatcher("carError.jsp").forward(request, response);
                    return;//stop method
                }

                //get top 10 most booked car
                CarReportDTO[] top10 = tuanStatefulRemote.report($from, $to);

                request.setAttribute("INFO", top10);//set value
                request.setAttribute("$from", $from);//set value
                request.setAttribute("$to", $to);//set value
                request.getRequestDispatcher("carReportShow.jsp").forward(request, response);//redirect
}else if (action.equals("cancel")) {
                int $carOrderID = Integer.parseInt(request.getParameter("$carOrderID"));//parse input value
                //set order status to canceled
                tuanStatefulRemote.cancelOrder($carOrderID);
                request.getRequestDispatcher("carOrderSearch.jsp").forward(request, response);
}else if (action.equals("login")) {
                String $username = request.getParameter("$username");//get input value
                String $password = request.getParameter("$password");//get input value
                if (session.getAttribute("admin") != null) {//if not login
                    tuanStatefulRemote = (TuanStatefulRemote)session.getAttribute("admin");//get session
                }
                //check login admin, if login successful redirect to admin page
                if (tuanStatefulRemote.adminLogin($username, $password)) {
                    session.setAttribute("admin", tuanStatefulRemote);//set session
                    request.getRequestDispatcher("adminHome.jsp").forward(request, response);//redirect
                }
                request.setAttribute("ERROR", "Login fail");
                request.getRequestDispatcher("carError.jsp").forward(request, response);
}else if (action.equals("logout")) {
                session.setAttribute("admin", null);//set session logout
                request.getRequestDispatcher("Ehome.jsp").forward(request, response);//redirect
}else if(action.equals("search hotel")){
//                int paging = Integer.parseInt(request.getParameter("paging"));

                //if text field is not blank, criteria will be add to query to search
                String ejbQL="SELECT h FROM Hotel h WHERE h.isDeleted = 0";//initial query
                if (!request.getParameter("$name").equals("")) {//if not blank
                    ejbQL+=" AND h.hotelName LIKE '%"+request.getParameter("$name")+"%'";//add to query
                }
                if (!request.getParameter("$street").equals("")) {//if not blank
                    ejbQL+=" AND h.hotelStreet LIKE '%"+request.getParameter("$street")+"%'";//add to query
                }
                if (!request.getParameter("$star").equals("")) {//if not blank
                    Integer.parseInt(request.getParameter("$star"));//check if it is number
                    ejbQL+=" AND h.hotelStar >= "+request.getParameter("$star");//add to query
                }
                //it can search by price even if only 1 textfield is filled in
                if (!request.getParameter("$from").equals("") ||//if not blank
                        !request.getParameter("$to").equals("")) {
                    Integer.parseInt(request.getParameter("$from"));//check if it is number
                    Integer.parseInt(request.getParameter("$to"));//check if it is number
                    if (!request.getParameter("$from").equals("") &&//if only from is filled
                            request.getParameter("$to").equals("")) {
                            ejbQL+=" AND h.hotelPrice >= "+request.getParameter("$from");//add to query
                    } else if (request.getParameter("$from").equals("") &&//if only to is filled
                            !request.getParameter("$to").equals("")) {
                            ejbQL+=" AND h.hotelPrice <= "+request.getParameter("$to");//add to query
                    } else {
                            ejbQL+=" AND h.hotelPrice BETWEEN "+request.getParameter("$from")+
                                    " AND "+request.getParameter("$to");//add to query
                    }
                }
                Hotel[] car = remote.searchHotel(ejbQL);//search hotel by sending query and get result
                request.setAttribute("INFO", car);//set session

                //redirect to the right page
                if (request.getParameter("which") != null) {//if from admin search page
                    request.getRequestDispatcher("adminHotelSearch.jsp").forward(request, response);//redirect
                } else {//if from user search page
                    request.getRequestDispatcher("hotelSearch.jsp").forward(request, response);//redirect
                }
}else if(action.equals("delete hotel")){
                int $hotelID = Integer.parseInt(request.getParameter("$hotelID"));//parse input value
                remote.deleteHotel($hotelID); //set hotel status to deleted
                request.getRequestDispatcher("adminHotelSearch.jsp").forward(request, response);//redirect
//}else if(action.equals("update car")){//if update button
//                ut.begin();//begin transaction
//                int $carID = Integer.parseInt(request.getParameter("$carID"));//parse input value
//                String $model = request.getParameter("$model");//get input value
//                String $type = request.getParameter("$type");//get input value
//                int $seat = Integer.parseInt(request.getParameter("$seat"));//parse input value
//                boolean $airConditioner = true;//checked
//                if(request.getParameter("$airConditioner")==null) {//if unchecked
//                    $airConditioner = false;//unchecked
//                }
//                String $description = request.getParameter("$description");//get input value
//                String $image = request.getParameter("$image");//get input value
//                int $stock = Integer.parseInt(request.getParameter("$stock"));//parse input value
//                int $price = Integer.parseInt(request.getParameter("$price"));//parse input value
//                remote.updateCar($carID, $model, $type, $seat, $airConditioner,
//                        $description, $image, $stock, $price);//update new detail to database
//                request.getRequestDispatcher("adminCarSearch.jsp").forward(request, response);
//                ut.commit();
            } else {
                request.setAttribute("ERROR", "Action is not support!!!");
                request.getRequestDispatcher("carError.jsp").forward(request, response);
            }
            out.println("</body>");
            out.println("</html>");
        }catch(NumberFormatException e){
            request.setAttribute("ERROR", "please don't input character into number only textfield");
            request.getRequestDispatcher("carError.jsp").forward(request, response);
        }catch(ParseException e){
            request.setAttribute("ERROR", "please input valid date into date only textfield. Date format: year/month/day");
            request.getRequestDispatcher("carError.jsp").forward(request, response);
        }catch(Exception e){
//            request.setAttribute("ERROR", "unexpected error occured! Please report back to the admin");
//            request.getRequestDispatcher("carError.jsp").forward(request, response);
            e.printStackTrace();
        } finally {
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
