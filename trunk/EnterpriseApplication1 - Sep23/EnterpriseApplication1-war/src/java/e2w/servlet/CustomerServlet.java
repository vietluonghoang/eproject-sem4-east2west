/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package e2w.servlet;

import e2w.bean.CartSessionBeanRemote;
import e2w.bean.CustomerBeanRemote;
import e2w.dto.OrderTourDTO;
import e2w.dto.OrderTourDetailDTO;
import e2w.dto.ScheduleTourDTO;
import e2w.enitites.Customer;
import e2w.enitites.OrderTour;
import e2w.enitites.OrderTourDetail;
import e2w.enitites.Tour;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author JAKE
 */
public class CustomerServlet extends HttpServlet {

    @EJB
    CartSessionBeanRemote tourCart;
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
            out.println("<title>Servlet CustomerServlet</title>");  
            out.println("</head>");
            out.println("<body>");

            Context ctx = new InitialContext();
            UserTransaction ut = (UserTransaction) ctx.lookup("UserTransaction");
            CustomerBeanRemote remote = (CustomerBeanRemote) ctx.lookup("CustomerBeanJNDI");
            CartSessionBeanRemote cartRemote = (CartSessionBeanRemote)ctx.lookup("CartBeanJNDI");
            HttpSession session = request.getSession(true);            


            String action = request.getParameter("action");

            if(action.equals("View detail")){

               String tourID = request.getParameter("txtHiddenTourID");

               Tour result = remote.loadTourDetail(Integer.parseInt(tourID));

               System.out.println("tourID from search to tour detail:"+tourID);
               request.setAttribute("tourDetailResult", result);

               request.getRequestDispatcher("EtourDetail.jsp").forward(request, response);
               //Get the tourID on the jsp,use loadTourDetail function in CustomerBeanRemote to return the Tour object result
               //and set it in request.setAttribute and redirect to the EtourDetail.jsp



            }else if(action.equals("View Schedules")){

                 String tourID = request.getParameter("txtHiddenTourID");
                 ScheduleTourDTO[] result = remote.loadTourSchedules(Integer.parseInt(tourID));
                 request.setAttribute("tourSchedulesInfo", result);
                 request.getRequestDispatcher("EtourSchedule.jsp").forward(request, response);
                 //Get the tourID on the jsp,use loadTourSchedules function in CustomerBeanRemote to return an array of Schedule
                 //setAttribute the result and redirect to EtourSchedule.jsp



            }else if(action.equals("Back to Tour Detail")){
                String tourID = request.getParameter("txtTourIDHidden");
                Tour result = remote.loadTourDetail(Integer.parseInt(tourID));
                request.setAttribute("tourDetailResult", result);
                request.getRequestDispatcher("EtourDetail.jsp").forward(request, response);

                //Back to Tour detail,the function is the same as the View Detail function



            }else if(action.equals("Book")){
                //First,get the ArrayList cartCheck inf session
                ArrayList cartCheck = (ArrayList)session.getAttribute("cartList");
                //check it,if it is not null,it's mean the current cart after BOOK MORE,UPDATE,CHECK OUT has item,so we will set it to be the current cart
                 if(cartCheck!=null){
                     cartRemote.setCart(cartCheck);
                 }
                 //Second,get the tourID on the jsp,use addToCart function in CartSessionBeanRemote to add it to the cart with the default quantity is 1
                 String tourID = request.getParameter("txtHiddenTourID");
                 System.out.println("tourID book :"+tourID);
                 cartRemote.addToCart(Integer.parseInt(tourID), 1);
                 ArrayList cartList = cartRemote.getCart();
                 System.out.println("Add "+cartList.size()+" tour to cart successfully");
     
                 System.out.println("Cart list size :"+cartList.size());

                 //Finaly,calculate the total price and set attribute total price and save the cartList in session and then,redirect to EcartTour.jsp
                 int total = cartRemote.getTotalPriceInCart();
                 session.setAttribute("totalINFO", total);
                 session.setAttribute("cartList", cartList);
                 request.getRequestDispatcher("EcartTour.jsp").forward(request, response);

            }else if(action.equals("Remove")){
                //First,check the tourID which was checked,save it in an array tourID
                String tourID[] = request.getParameterValues("cbSelect");


                //Second,get the cartCheck array list in the session
                ArrayList cartCheck = (ArrayList)session.getAttribute("cartList");


                //Third,set the cartCheck is the current cart,it cannot be null so we don't have to check it is null or not
                cartRemote.setCart(cartCheck);


                //if the tourID is null,set it is 0
               if(tourID==null){
                   tourID = new String[0];
               }
                //Fourth,run the loop and remove the tourID in the tourID array
                for(int i=0;i<tourID.length;i++){
                    cartRemote.removeFromCart(Integer.parseInt(tourID[i]));
                    System.out.println("remove tour "+i+"form cart");
                }


                //Fifth,get the cartList after remove
                ArrayList cartList = cartRemote.getCart();


                //Finally,caculate the total price after remove and set attribute it,save the cartList in session and redirect to the EcartTour.jsp
                int total = cartRemote.getTotalPriceInCart();
                request.setAttribute("totalINFO", total);
                session.setAttribute("cartList", cartList);
                request.getRequestDispatcher("EcartTour.jsp").forward(request, response);

            }else if(action.equals("Book more")){
                //using searchTourLocation funtion in CustomerBeanRemote,to return an Array tour
                Tour[] tour = remote.searchTourLocation("");
                //set it in request.setAttribute and redirect to Etour
                request.setAttribute("resultSearchLocation", tour);
                System.out.println("Customer wanna book more");
                request.getRequestDispatcher("Etour.jsp").forward(request, response);

            }else if(action.equals("Update Cart")){
                //Declare an array of quantity and an array of tourID,to get all the quantity and tourID in the cart
                String quantity[] = request.getParameterValues("txtQuantity");
                String tourID[] = request.getParameterValues("txtTourID");
                //Get the cartList in session
                ArrayList cartList = (ArrayList)session.getAttribute("cartList");
                //set the cartList to be the current  cart
                cartRemote.setCart(cartList);
                //run the loop the with the tourID array length,set the tourID booked with the new quantity update
                    for(int i =0;i<tourID.length;i++){
                        System.out.println("tourID in cart update "+tourID[i]);
                            cartRemote.updateCart(Integer.parseInt(tourID[i]), Integer.parseInt(quantity[i]));
                    }

                //get the cart array list after it was updated
                ArrayList cartAfterUpdate = cartRemote.getCart();
                System.out.println("cart after update size :"+cartAfterUpdate.size());
                session.setAttribute("cartList", cartAfterUpdate);
                int total = cartRemote.getTotalPriceInCart();
                session.setAttribute("totalINFO", total);
                request.getRequestDispatcher("EcartTour.jsp").forward(request, response);
                //Save the cart list in session,calculate the total price after the cart has been update,save it in setAttribute and redirect to EcartTour.jsp
            }else if(action.equals("Check Out")){
                //get the cart list in session
                ArrayList cartList = (ArrayList)session.getAttribute("cartList");


                //set the cart list in session to be the current cart
                cartRemote.setCart(cartList);
                String quantity[] = request.getParameterValues("txtQuantity");
                String tourID[] = request.getParameterValues("txtTourID");


                //create a flag with false
                boolean check = false;
                //run the loop with the tourID array length
                for(int i =0;i<tourID.length;i++){
                    //find the tour by using the TourID
                     Tour tour = remote.loadTourByTourID(Integer.parseInt(tourID[i]));

                    //check if the current quantity of tour is more than the quantity input
                    if(tour.getQuantityCurrent()>=Integer.parseInt(quantity[i])){
                        //the check out function is include the update cart function to prevent user from input the quantity but didn't click update cart
                            System.out.println("tourID in cart update "+tourID[i]);
                            cartRemote.updateCart(Integer.parseInt(tourID[i]), Integer.parseInt(quantity[i]));
                        //update the new current quantity tour after checkout
                            remote.updateOrderStatusAfterBook(Integer.parseInt(tourID[i]), Integer.parseInt(quantity[i]));
                            check=true;
                        //turn the flag check true
                }else{
                         //if the current quantity is less than the quantity input,it will set a string error
                         System.out.println("Quantity of Tour is out of stock");
                          String error="The Quantity of Tour ID "+tourID[i]+" is out of stock.The current quantity of Tour ID "+tourID[i]+" is "+tour.getQuantityCurrent();
                          //set request attribute the error and redirect to error.jsp
                          request.setAttribute("error", error);
                          request.getRequestDispatcher("error.jsp").forward(request, response);
                }
             }
                //check the flag
                if(check==true){
                    //get the cart in session and set it to be the current cart

                ArrayList cartAfterUpdate = cartRemote.getCart();
                int total = cartRemote.getTotalPriceInCart();
                //calculate the total price and set attribute it,save the cart in session and redirect to EtourOrder.jsp
                session.setAttribute("cartList", cartAfterUpdate);
                session.setAttribute("totalINFO", total);
                request.getRequestDispatcher("EtourOrder.jsp").forward(request, response);
                }
            }else if(action.equals("Cancel")){
                //tget the cartList in session and set it to be the current cart
                ArrayList cartList = (ArrayList)session.getAttribute("cartList");
                cartRemote.setCart(cartList);
                //get the total price in getAttribute method
                int total = cartRemote.getTotalPriceInCart();

                //declare an array tourID and an array quantity,both of them was gotten from jsp
                String tourID[] = request.getParameterValues("txtHiddenTourID");
                String quantity[] = request.getParameterValues("txtQuantity");

                //run the loop with the size of cartList
                for (int i = 0; i < cartList.size(); i++){
                    //return the current quantity of tour back the old time,before the tour was booked
                        remote.updateOrderStatusAfterCancel(Integer.parseInt(tourID[i]),Integer.parseInt(quantity[i]));
                }
                //save the cartList in session and the total price with setAttribute method
                session.setAttribute("cartList", cartList);
                session.setAttribute("totalINFO", total);
                request.getRequestDispatcher("EcartTour.jsp").forward(request, response);
                //redirect to Ecarttour.jsp
            }else if(action.equals("Confirm")){
                //get the userID in session
                String userID = session.getAttribute("SessionUserID").toString();

                //declare an array of tourID and an array of quantity,both of them was gotten from jsp
                String tourID[] = request.getParameterValues("txtHiddenTourID");
                String quantity[] = request.getParameterValues("txtQuantity");

                //get the total price from the jsp
                String total =request.getParameter("txtTotal");


                //get the cartList from session
                ArrayList cartList = (ArrayList)session.getAttribute("cartList");

                
                System.out.println("insert Order to database success");
                //insert a new order with the userID,the total and the status is depending
                remote.insertOrderTour(Integer.parseInt(userID), total,"Depending");


                //load the orderTourDTO by using the userID
                OrderTourDTO orderDTO = remote.searchOrderTourByUserID(Integer.parseInt(userID));


                //create a array Ordertour to get Order tour
                OrderTour[] listTmpOrder = orderDTO.getOrder();
                System.out.println("get order list success");
                List list = Arrays.asList(listTmpOrder);
                int oi=0;
                boolean flag=false;
                for (int i = 0; i < listTmpOrder.length; i++) {
                    OrderTour tmpOrder = (OrderTour)list.get(i);
                        if(oi<tmpOrder.getOrderTourID()){
                            oi=tmpOrder.getOrderTourID();
                        }
                }

                //create a list to cast the array Order tour to list
                //run the loop with the list size
                for (int i = 0; i < list.size(); i++) {
                    
                    //create an OrderTour object
                    OrderTour tmpOrder = (OrderTour)list.get(i);
                    System.out.println("Start looking for the userID in OrderTour");


                    //check in the order if the userID is equals to the userID input and the totalprice in the order is the same as the total input
                    if(tmpOrder.getCustomer().getUserID()==Integer.parseInt(userID)){
                        System.out.println("Now is orderTourID "+tmpOrder.getOrderTourID());
                        System.out.println("Found userID "+userID);


                        //run another loop with the cartlist size
                        for(int j=0;j<cartList.size();j++){
                        System.out.println("Tour ID insert to Order detail :"+tourID[j]);
                        System.out.println("Quantity of Tour insert to Order detail : "+quantity[j]);


                        //using the insertOrderDetails in CustomerBeanRemote with the OrderTourID get from the Order,the single result of the tourID array and the quantity array
                        remote.insertOrderDetails(oi, Integer.parseInt(tourID[j]), Integer.parseInt(quantity[j]));
                        System.out.println("Insert OrderDetail successful");


                        }
                        flag=true;
                    }
                    if(flag=true){
                            break;
                    }
                }
                //load all of the order Tour of the customer by using loadOrder function in CustomerBeanRemote by using userID
                OrderTourDTO[] orderTour = remote.loadOrder(Integer.parseInt(userID));
                //set the orderTour in session and redirect to EtourOrderHistory.jsp
                session.setAttribute("orderINFO", orderTour);
                session.removeAttribute("cartList");
                request.getRequestDispatcher("EtourOrderHistory.jsp").forward(request, response);
        
            } else if (action.equals("View Order Detail")){
                //get the orderID from the jsp
                String orderID = request.getParameter("txtOrderTourIDHiddenV");
                System.out.println("OrderID --> Detail :"+orderID);

                //return an array of order tour detail dto
                OrderTourDetailDTO[] result = (OrderTourDetailDTO[]) remote.loadOrderTourDetailByOrderTourID(Integer.parseInt(orderID));
                System.out.println("result OrderDetailDTO length :"+result.length);

                //save the result by setAttribute method and redirect to EtourOrderDetail.jsp
                request.setAttribute("orderDetail",result);
                request.getRequestDispatcher("EtourOrderDetail.jsp").forward(request, response);
            }else if(action.equals("Cancel Order")){
                //Get the orderID from a hidden field on jsp
                String orderID = request.getParameter("txtOrderTourIDHidden");
                //return an OrderTour object
                OrderTour result = remote.loadOrderTourByOrderTourID(Integer.parseInt(orderID));
                OrderTourDetailDTO[] orderDetailDTO = (OrderTourDetailDTO[]) remote.loadOrderTourDetailByOrderTourID(Integer.parseInt(orderID));
                //save the result by using SetAttribute method and redirect to EtourOrderCancel.jsp
                request.setAttribute("orderTourINFO", result);
                request.setAttribute("orderDetail", orderDetailDTO);
                request.getRequestDispatcher("EtourOrderCancel.jsp").forward(request, response);

            }else if(action.equals("Confirm Cancel")){
                //get the userID form session,get the oredrID and refund from the hidden field in jsp
                String userID = session.getAttribute("SessionUserID").toString();
                String orderID = request.getParameter("txtOrderID");
                String refund = request.getParameter("txtRefund");
                //searching the orderDetail
                System.out.println("OrderID --> Detail :"+orderID);
                OrderTourDetailDTO[] orderDetailDTO = (OrderTourDetailDTO[]) remote.loadOrderTourDetailByOrderTourID(Integer.parseInt(orderID));
                //run the loop to find
                for (int i = 0; i < orderDetailDTO.length; i++){
                    //get the array of orderDetail
                        OrderTourDetail[] orderDetail =  orderDetailDTO[i].getDetail();
                        //run another lopp to get the tourID and quantity
                         for (int j = 0; j < orderDetail.length; j++) {
                         int tourID = orderDetail[j].getTourID();
                         int quantity = orderDetail[j].getQuantity();
                         //run the update status to return the quantity of tour
                         remote.updateOrderStatusAfterCancel(tourID, quantity);
                     }

                }
                //insert to cancelOrder the orderID and the refund
                remote.cancelOrder(Integer.parseInt(orderID), refund);
                //reload the orderTour and save it by using set attribute method,redirect to EtourOrderHistory.jsp
                OrderTourDTO[] orderTour = remote.loadOrder(Integer.parseInt(userID));


                


                
                session.setAttribute("orderINFO", orderTour);
                request.getRequestDispatcher("EtourOrderHistory.jsp").forward(request, response);

            }else if(action.equals("Back to Order History")){
                //get the userID in session
                String userID = session.getAttribute("SessionUserID").toString();
                //load an array of OrderTourDTO of an userID
                OrderTourDTO[] orderTour = remote.loadOrder(Integer.parseInt(userID));
                //save the result by using setAttribute method and redirect to EtourOrderHistory.jsp
                session.setAttribute("orderINFO", orderTour);
                request.getRequestDispatcher("EtourOrderHistory.jsp").forward(request, response);
            }else if(action.equals("American Airline")){
                //create a string of a flight branch
                String flightBranch ="American Airline";
                //save it by using setAttribute method
                request.setAttribute("flightBranch", flightBranch);
                //redirect to EflightDetail.jsp
                request.getRequestDispatcher("EflightDetail.jsp").forward(request, response);
            }else if(action.equals("Japan Airline")){
                //the same as the American Airline function
            String flightBranch ="Japan Airline";
                request.setAttribute("flightBranch", flightBranch);
                request.getRequestDispatcher("EflightDetail.jsp").forward(request, response);
            }else if(action.equals("Vietnam Airline")){
                //the same as the American Airline function
                String flightBranch ="Vietnam Airline";
                request.setAttribute("flightBranch", flightBranch);
                request.getRequestDispatcher("EflightDetail.jsp").forward(request, response);
            }else{
                //send an error String to error.jsp
                String error ="This action is not support in website";
                request.setAttribute("error", error);
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
            out.println("</body>");
            out.println("</html>");
        }catch(Exception e){
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
