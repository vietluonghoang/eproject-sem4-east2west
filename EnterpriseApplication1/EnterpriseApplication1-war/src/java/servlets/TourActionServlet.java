/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import app.DataConnect;
import e2w.enitites.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author VietLH
 */
public class TourActionServlet extends HttpServlet {

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
            String action = request.getParameter("action");
            HttpSession session = request.getSession();//get session
            Customer cusINFO = (Customer) session.getAttribute("SessionCusINFO");
            Date $today = new SimpleDateFormat("yyyy/MM/dd").parse(
                    new SimpleDateFormat("yyyy/MM/dd").format(new Date()));//get today
            String tourName = request.getParameter("txtTourName");
            String startDate = request.getParameter("txtStartDate");
            String endDate = request.getParameter("txtEndDate");
            String startLocation = request.getParameter("txtStartLocation");
            String endLocation = request.getParameter("txtEndLocation");
            String minQty = request.getParameter("txtMinQuantity");
            String maxQty = request.getParameter("txtMaxQuantity");
            String price = request.getParameter("txtPrice");
            String description = request.getParameter("txtDescription");
            String status = request.getParameter("status");

            int numOfEntitiesPerPages = 50;
            int page = 1;
            try {
                page = Integer.parseInt(request.getParameter("page"));
                if (page <= 0) {
                    page = 1;
                }
            } catch (Exception ex) {
                page = 1;
            }
            if ("search".equals(action)) {//if button is search
//                int paging = Integer.parseInt(request.getParameter("paging"));

                //if text field is not blank, criteria will be add to query to search
                String qry = "SELECT * FROM Tour t";//initial query
                String qryData="";
                if ("Available".equals(status)) {
                    qry = qry + " WHERE t.status = 'available'";
                    qryData+="<input type=\"hidden\" name=\"status\" value=\"Available\" />";
                }
                if ("Disabled".equals(status)) {
                    qry = qry + " WHERE t.status = 'disable'";
                    qryData+="<input type=\"hidden\" name=\"status\" value=\"Disabled\" />";
                }
                if ("All".equals(status)) {
                    qry = qry + " WHERE t.status != 'all'";
                    qryData+="<input type=\"hidden\" name=\"status\" value=\"All\" />";
                }
                if (!"".equals(tourName)) {//if not blank
                    qry += " AND t.tourName LIKE '%" + tourName + "%'";//add to query;
                    qryData+="<input type=\"hidden\" name=\"txtTourName\" value=\""+tourName+"\" />";
                }
                if (!"".equals(startDate)) {//if not blank
                    qry += " AND t.startDate > '" + startDate + "'";//add to query
                    qryData+="<input type=\"hidden\" name=\"txtStartDate\" value=\""+startDate+"\" />";
                }
                if (!"".equals(endDate)) {//if not blank
                    qry += " AND t.endDate < '" + endDate + "'";//add to query
                    qryData+="<input type=\"hidden\" name=\"txtEndDate\" value=\""+endDate+"\" />";
                }
                if (!"".equals(startLocation)) {//if not blank
                    qry += " and t.startLocation like '%" + startLocation + "%'";
                    qryData+="<input type=\"hidden\" name=\"txtStartLocation\" value=\""+startLocation+"\"/>";
                }
                if (!"".equals(endLocation)) {//if not blank
                    qry += " and t.endLocation like '%" + endLocation + "%'";//add to query
                    qryData+="<input type=\"hidden\" name=\"txtEndLocation\" value=\""+endLocation+"\"/>";
                }
                //it can search by price even if only 1 textfield is filled in
                if (!"".equals(minQty)) {
                    qry += " and quantityMin>=" + minQty;
                    qryData+="<input type=\"hidden\" name=\"txtMinQuantity\" value=\""+minQty+"\"/>";
                    
                }
                if (!"".equals(maxQty)) {
                    qry += " and quantityMax<=" + maxQty;
                    qryData+="<input type=\"hidden\" name=\"txtMaxQuantity\" value=\""+maxQty+"\"/>";
                }
                if (!"".equals(price)) {
                    qry += " and price=" + price;
                    qryData+="<input type=\"hidden\" name=\"txtPrice\" value=\""+price+"\"/>";
                }
                if (!"".equals(description)) {
                    qry += " and description like '%" + description + "%'";
                    qryData+="<input type=\"hidden\" name=\"txtDescription\" value=\""+description+"\" />";
                }

                DataConnect dc = new DataConnect();
                ResultSet rs = dc.executeCustomQuery(qry);
                int order = 0;
                int numOfElements = 0;
                String result = "";
                result+="<tr align=\"center\">"
                        + "<td align=\"center\"><strong></strong></td>"
                        + "<td align=\"center\"><strong>Image</strong></td>"
                        + "<td align=\"center\"><strong>Tour Name</strong></td>"
                        + "<td align=\"center\"><strong>Start Date</strong></td>"
                        + "<td align=\"center\"><strong>End Date</strong></td>"
                        + "<td align=\"center\"><strong>Start Location</strong></td>"
                        + "<td align=\"center\"><strong>End Location</strong></td>"
                        + "<td align=\"center\"><strong>Min Quantity</strong></td>"
                        + "<td align=\"center\"><strong>Max Quantity</strong></td>"
                        + "<td align=\"center\"><strong>Price</strong></td>"
                        + "<td align=\"center\"><strong>Status</strong></td>"
                        + "<td align=\"center\"><strong>Description</strong></td>"
                        + "</tr>";
                while (rs.next()) {
                    numOfElements++;
                    if ((numOfElements > (page - 1) * numOfEntitiesPerPages)
                            && (numOfElements < page * numOfEntitiesPerPages)) {
                        order++;
                        result = result + "<tr align=\"center\"><td align=\"center\">" + order + "</td><td align=\"center\"><img src=" + rs.getString("imageTour")
                                + " width=\"100px\"/></td><td align=\"center\">" + rs.getString("tourName") + "</td><td align=\"center\"" + rs.getDate("startDate")
                                + "</td> <td align=\"center\">" + rs.getDate("endDate") + "</td> <td align=\"center\">" + rs.getString("startLocation")
                                + "</td><td align=\"center\">" + rs.getString("endLocation") + "</td><td align=\"center\">" + rs.getInt("quantityMin")
                                + "</td><td align=\"center\">" + rs.getInt("quantityMax") + "</td><td align=\"center\">" + rs.getInt("price")
                                + "</td><td align=\"center\">" + rs.getString("status") + "</td><td align=\"center\">" + rs.getString("description") + "</td> </tr>";
                    }
                }
                int numOfPages = 0;
                if (numOfElements % numOfEntitiesPerPages == 0) {
                    numOfPages = numOfElements / numOfEntitiesPerPages;
                } else {
                    numOfPages = (numOfElements / numOfEntitiesPerPages) + 1;
                }
                request.setAttribute("type", action);
                request.setAttribute("INFO", result);//set value
                request.setAttribute("pagesnum", numOfPages);
                request.setAttribute("page", page);
                request.setAttribute("qryData", qryData);
                request.getRequestDispatcher("AdminTourSearch.jsp").forward(request, response);
            }
        } catch (ParseException ex) {
            Logger.getLogger(TourActionServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(TourActionServlet.class.getName()).log(Level.SEVERE, null, ex);
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
