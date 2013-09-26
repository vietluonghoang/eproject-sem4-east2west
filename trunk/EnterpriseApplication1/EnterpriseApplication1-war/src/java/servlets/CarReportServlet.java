/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import app.DataConnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ngoc.entity.CarReportDTO;

/**
 *
 * @author Admin
 */
public class CarReportServlet extends HttpServlet {

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
            Date from = new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("$from"));//parse input value
            Date to = new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("$to"));
            if (from.after(to)) {
                request.setAttribute("ERROR", "from date cannot be after to date");
                request.getRequestDispatcher("carError.jsp").forward(request, response);
                return;
            }
            ResultSet rs = getOrderTotalByPeriod(from, to);
            ArrayList<CarReportDTO> result=new ArrayList<CarReportDTO>();
            while (rs.next()) {
                CarReportDTO cr=new CarReportDTO(rs.getInt("id"),rs.getInt("total"));
                result.add(cr);
            }
            request.setAttribute("INFO", result);//set value
            request.setAttribute("$from", from);//set value
            request.setAttribute("$to", to);//set value
            request.getRequestDispatcher("carReportShow.jsp").forward(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(CarReportServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CarReportServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
        }
    }

    public ResultSet getOrderTotalByPeriod(Date from, Date to) {
        String qry = "select c.carID as id, sum(c.quantity) as total from CarOrderDetail c "
                + "where c.orderDate between '" + from.toString() + "' and '" + to.toString() + "' "
                + "and c.status !='canceled' group by c.carID order by total desc";
        System.out.println(qry);
        DataConnect dc = new DataConnect();
        ResultSet rs = dc.executeCustomQuery(qry);
        return rs;
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
