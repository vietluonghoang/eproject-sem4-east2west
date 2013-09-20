/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package e2w.servlet;

import e2w.bean.CartSessionBeanRemote;
import e2w.bean.CustomerBeanRemote;
import java.io.IOException;
import java.io.PrintWriter;
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
public class flightServlet extends HttpServlet {
   
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
            out.println("<title>Servlet flightServlet</title>");  
            out.println("</head>");
            out.println("<body>");

            Context ctx = new InitialContext();
            UserTransaction ut = (UserTransaction) ctx.lookup("UserTransaction");
            CustomerBeanRemote remote = (CustomerBeanRemote) ctx.lookup("CustomerBeanJNDI");
            CartSessionBeanRemote cartRemote = (CartSessionBeanRemote)ctx.lookup("CartBeanJNDI");
            HttpSession session = request.getSession(true);
            
            String action = request.getParameter("action");
            if(action.equals("UpdateFlight")){
                //get the flightID from a hidden field in jsp name flightIDHidden
                String flightID = request.getParameter("flightIDHidden");
                //set attribute the flightID and redirect to adminFlightUpdate.jsp
                request.setAttribute("flightID", flightID);
                request.getRequestDispatcher("adminFlightUpdate.jsp").forward(request, response);
            }else if(action.equals("deleteFlight")){
                //get the flightID from a hidden field in jsp name flightIDHidden
                String flightID = request.getParameter("flightIDHidden");
                //using deleteFlight function in CustomerBeanRemote
                remote.deleteFlight(Integer.parseInt(flightID));
                //after that redirect to adminFlight.jsp
                request.getRequestDispatcher("adminFlight.jsp").forward(request, response);
            }else if(action.equals("Insert")){
                //get all the input flight information from the jsp form
                //flightBranch,availableDate,expiredDate,departureAirport,arrivalAirport,departureTime,arrivalTime,price
                String flightBranch = request.getParameter("ddlFlightName");
                String availableDate = request.getParameter("txtAvailableDate");
                String expiredDate= request.getParameter("txtExpiredDate");
                String departureAirport = request.getParameter("txtDepartureAirport");
                String arrivalAirport = request.getParameter("txtArrivalAirport");
                String departureTime = request.getParameter("txtDepartureTime");
                String arrivalTime = request.getParameter("txtArrivalTime");
                String price = request.getParameter("txtPrice");
                //using insertFlight function in CustomerBeanRemote
                remote.insertFlight(flightBranch, availableDate, expiredDate, departureAirport, arrivalAirport, departureTime, arrivalTime, Integer.parseInt(price));
                //after that redirect to adminFlight.jsp
                response.sendRedirect("adminFlight.jsp");

            }else if(action.equals("Update")){
                 //get all the input flight information from the jsp form
                //flightBranch,availableDate,expiredDate,departureAirport,arrivalAirport,departureTime,arrivalTime,price
                String flightID = request.getParameter("txtFlightIDHidden");
                String flightBranch = request.getParameter("ddlFlightName");
                String availableDate = request.getParameter("txtAvailableDate");
                String expiredDate= request.getParameter("txtExpiredDate");
                String departureAirport = request.getParameter("txtDepartureAirport");
                String arrivalAirport = request.getParameter("txtArrivalAirport");
                String departureTime = request.getParameter("txtDepartureTime");
                String arrivalTime = request.getParameter("txtArrivalTime");
                String price = request.getParameter("txtPrice");
                //using updateFlight function in CustomerBeanRemote
                remote.updateFlight(Integer.parseInt(flightID), flightBranch, availableDate, expiredDate, departureAirport, arrivalAirport, departureTime, arrivalTime, Integer.parseInt(price));
                //after that redirect to adminFlight.jsp
                response.sendRedirect("adminFlight.jsp");
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
