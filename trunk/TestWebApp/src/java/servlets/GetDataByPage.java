/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import app.DataConnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class GetDataByPage extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
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
            /* TODO output your page here. You may use following sample code. */
            String page = (String) request.getParameter("page");
            if(page==null){
                page="1";
            }
            ResultSet rs = (ResultSet) request.getAttribute("result");
            DataConnect dc = new DataConnect();
            rs = dc.executeCustomQuery("select o.orderTourID, o.userID, c.username, d.tourID, t.tourName"
                + ", d.quantity, o.totalPrice, o.orderDate,t.startDate,t.endDate"
                + " from OrderTour o join OrderTourDetail d on o.orderTourID=d.orderTourID"
                + " join Tour t on d.tourID=t.tourID join Customer c on o.userID=c.userID"
                + " order by t.startDate desc");
            request.setAttribute("pagenum", page);
            request.setAttribute("result", rs);
            request.getRequestDispatcher("ViewDetail.jsp").forward(request, response);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
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
     * Handles the HTTP
     * <code>POST</code> method.
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
