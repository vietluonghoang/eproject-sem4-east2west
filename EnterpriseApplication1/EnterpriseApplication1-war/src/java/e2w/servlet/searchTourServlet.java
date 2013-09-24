/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package e2w.servlet;

import e2w.bean.CustomerBeanRemote;
import e2w.enitites.Tour;
import java.io.IOException;
import java.io.PrintWriter;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author JAKE
 */
public class searchTourServlet extends HttpServlet {
   
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
            out.println("<title>Servlet searchTourServlet</title>");  
            out.println("</head>");
            out.println("<body>");
           
             Context ctx = new InitialContext();
             CustomerBeanRemote remote = (CustomerBeanRemote) ctx.lookup("CustomerBeanJNDI");
             HttpSession session = request.getSession(true);
             String action= request.getParameter("action");
             if(action.equals("Search Location")){
                //get the start location and the end location from jsp
                 String startLocation = request.getParameter("txtStartLocation");
                 String endLocation = request.getParameter("txtEndLocation");
                 //load a array of Tour by using searchTourByStartEndLocation function in CustomerBeanRemote
                 Tour[] result = remote.searchTourByStartEndLocation(startLocation, endLocation);
                 //set the result by using setAttribute method and redirect to EtourSearch.jsp
                 request.setAttribute("tourResultSearch", result);
                 request.getRequestDispatcher("EtourSearch.jsp").forward(request, response);

             }else if(action.equals("Search Time")){
                //get the start date and the end date from jsp
                 String startDate = request.getParameter("txtStartDate");
                 String endDate = request.getParameter("txtEndDate");
                 //load a array of Tour by using searchTourByStartEndDate function in CustomerBeanRemote
                  Tour[] result = remote.searchTourByStartEndDate(startDate, endDate);
                    //set the result by using setAttribute method and redirect to EtourSearch.jsp
                 request.setAttribute("tourResultSearch", result);
                 request.getRequestDispatcher("EtourSearch.jsp").forward(request, response);

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
