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
            String tourID = request.getParameter("tourID");

            DataConnect dc = new DataConnect();

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
                String qryData = "";
                if ("Available".equals(status)) {
                    qry = qry + " WHERE t.status = 'available'";
                    qryData += "<input type=\"hidden\" name=\"status\" value=\"Available\" />";
                }
                if ("Disabled".equals(status)) {
                    qry = qry + " WHERE t.status = 'disable'";
                    qryData += "<input type=\"hidden\" name=\"status\" value=\"Disabled\" />";
                }
                if ("All".equals(status)) {
                    qry = qry + " WHERE t.status != 'all'";
                    qryData += "<input type=\"hidden\" name=\"status\" value=\"All\" />";
                }
                if (!"".equals(tourName)) {//if not blank
                    qry += " AND t.tourName LIKE '%" + tourName + "%'";//add to query;
                    qryData += "<input type=\"hidden\" name=\"txtTourName\" value=\"" + tourName + "\" />";
                }
                if (!"".equals(startDate)) {//if not blank
                    qry += " AND t.startDate > '" + startDate + "'";//add to query
                    qryData += "<input type=\"hidden\" name=\"txtStartDate\" value=\"" + startDate + "\" />";
                }
                if (!"".equals(endDate)) {//if not blank
                    qry += " AND t.endDate < '" + endDate + "'";//add to query
                    qryData += "<input type=\"hidden\" name=\"txtEndDate\" value=\"" + endDate + "\" />";
                }
                if (!"".equals(startLocation)) {//if not blank
                    qry += " and t.startLocation like '%" + startLocation + "%'";
                    qryData += "<input type=\"hidden\" name=\"txtStartLocation\" value=\"" + startLocation + "\"/>";
                }
                if (!"".equals(endLocation)) {//if not blank
                    qry += " and t.endLocation like '%" + endLocation + "%'";//add to query
                    qryData += "<input type=\"hidden\" name=\"txtEndLocation\" value=\"" + endLocation + "\"/>";
                }
                //it can search by price even if only 1 textfield is filled in
                if (!"".equals(minQty)) {
                    qry += " and quantityMin>=" + minQty;
                    qryData += "<input type=\"hidden\" name=\"txtMinQuantity\" value=\"" + minQty + "\"/>";

                }
                if (!"".equals(maxQty)) {
                    qry += " and quantityMax<=" + maxQty;
                    qryData += "<input type=\"hidden\" name=\"txtMaxQuantity\" value=\"" + maxQty + "\"/>";
                }
                if (!"".equals(price)) {
                    qry += " and price=" + price;
                    qryData += "<input type=\"hidden\" name=\"txtPrice\" value=\"" + price + "\"/>";
                }
                if (!"".equals(description)) {
                    qry += " and description like '%" + description + "%'";
                    qryData += "<input type=\"hidden\" name=\"txtDescription\" value=\"" + description + "\" />";
                }

                ResultSet rs = dc.executeCustomQuery(qry);
                int order = 0;
                int numOfElements = 0;
                String result = "";
                result += "<tr align=\"center\">"
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
                        + "<td align=\"center\"><strong></strong></td>"
                        + "</tr>";
                while (rs.next()) {
                    numOfElements++;
                    if ((numOfElements > (page - 1) * numOfEntitiesPerPages)
                            && (numOfElements < page * numOfEntitiesPerPages)) {
                        order++;
                        String des = (rs.getString("description"));
                        if ((rs.getString("description")).length() > 301) {
                            des = des.substring(0, 300) + "...";
                        }
                        result = result + "<tr align=\"center\">"
                                + "<td align=\"center\">" + order + "</td><td align=\"center\"><img src=\"images/" + rs.getString("imageTour")
                                + "\" width=\"100px\"/></td><td align=\"center\">" + rs.getString("tourName") + "</td><td align=\"center\">" + rs.getDate("startDate")
                                + "</td> <td align=\"center\">" + rs.getDate("endDate") + "</td> <td align=\"center\">" + rs.getString("startLocation")
                                + "</td><td align=\"center\">" + rs.getString("endLocation") + "</td><td align=\"center\">" + rs.getInt("quantityMin")
                                + "</td><td align=\"center\">" + rs.getInt("quantityMax") + "</td><td align=\"center\">" + rs.getInt("price")
                                + "</td><td align=\"center\">" + rs.getString("status") + "</td><td align=\"center\">" + des
                                + "</td><td align=\"center\"><form action=\"TourActionServlet\" method=\"post\">"
                                + "<input type=\"hidden\" name=\"tourID\" value=\"" + rs.getInt("tourID") + "\" />"
                                + "<input type=\"submit\" name=\"action\" value=\"viewDetail\" id=\"btViewDetail\"/>"
                                + "</form><br/>"
                                + "<form action=\"TourActionServlet\" method=\"post\">"
                                + "<input type=\"hidden\" name=\"tourID\" value=\"" + rs.getInt("tourID") + "\" />"
                                + "<input type=\"submit\" name=\"action\" value=\"update\" id=\"btUpdate\"/>"
                                + "</form><br/>"
                                + "<form action=\"TourActionServlet\" method=\"post\" onsubmit=\"return confirm("
                                + "'Do you really want to disable this tour?');\">"
                                + "<input type=\"hidden\" name=\"tourID\" value=\"" + rs.getInt("tourID") + "\" />"
                                + "<input type=\"submit\" name=\"action\" value=\"disable\" id=\"btDelete\" />"
                                + " </form></td> "
                                + "</tr>";
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
            if ("update".equals(action)) {
                String qry = "SELECT * FROM Tour t where t.tourID=" + tourID;//initial query
                ResultSet rs = dc.executeCustomQuery(qry);
                String result = "Failed to get data!";

                while (rs.next()) {
                    String tourStatus = "";
                    if ("available".equals(rs.getString("status"))) {
                        tourStatus = "<tr><td><input type=\"radio\" name=\"status\" value=\"available\" checked=\"true\"/>Available<br/></td></tr>"
                                + "<tr><td><input type=\"radio\" name=\"status\" value=\"disable\"/>Disabled<br/></td></tr>";
                    } else {
                        tourStatus = "<tr><td><input type=\"radio\" name=\"status\" value=\"available\"/>Available<br/></td></tr>"
                                + "<tr><td><input type=\"radio\" name=\"status\" value=\"disable\" checked=\"true\"/>Disabled<br/></td></tr>";
                    }
                    result = "<div id=\"tour-items\">"
                            + "<form action=\"AinsertTourProcess.jsp\" method=\"post\" enctype=\"multipart/form-data\" id=\"insertForm\">"
                            + "<input type=\"hidden\" name=\"tourID\" value=\""+rs.getInt("tourID")+"\"/>"
                            + "<table border=\"0\" align=\"center\" width=\"500\"><tbody>"
                            + "<tr><th >Tour Name</th>"
                            + "<td><input type=\"text\" name=\"txtTourName\" id=\"txtTourName\" value=\"" + rs.getString("tourName") + "\" /></td></tr>"
                            + "<tr><th >Image Tour</th><td><img width=\"300\" height=\"200\" src=\"images/" + rs.getString("imageTour") + "\" /></td></tr>"
                            + "<tr><td></td><td><input type=\"file\" accept=\"jpg|jpeg|gif|png\" name=\"fileImage\" /></td></tr>"
                            + "<tr><th>Start Date</th><td><input type=\"text\" name=\"txtStartDate\" id=\"datepicker7\" value=\"" + rs.getDate("startDate") + "\"/></td></tr>"
                            + "<tr><th>End Date</th><td><input type=\"text\" name=\"txtEndDate\" id=\"datepicker8\"value=\"" + rs.getDate("endDate") + "\"/></td></tr>"
                            + "<tr><th width=\"150\">Start Location</th><td width=\"350\"><input type=\"text\" name=\"txtStartLocation\" id=\"txtStartLocation\" value=\"" + rs.getString("startLocation") + "\" /></td></tr>"
                            + "<tr><th>End Location</th><td><input type=\"text\" name=\"txtEndLocation\" id=\"txtEndLocation\" value=\"" + rs.getString("endLocation") + "\"/></td></tr>"
                            + "<tr><th>Min Quantity</th><td><input type=\"text\" name=\"txtMinQuantity\" id=\"txtMinQuantity\" class=\"digits\" value=\"" + rs.getInt("quantityMin") + "\"/></td></tr>"
                            + "<tr><th>Max Quantity</th><td><input type=\"text\" name=\"txtMaxQuantity\" id=\"txtMaxQuantity\" class=\"digits\" value=\"" + rs.getInt("quantityMax") + "\"/></td></tr>"
                            + "<tr><th>Current Quantity</th><td><input type=\"text\" name=\"txtCurrentQuantity\" id=\"txtCurrentQuantity\" class=\"digits\" value=\"" + rs.getInt("quantityCurrent") + "\"/></td></tr>"
                            + "<tr><th>Price</th><td><input type=\"text\" name=\"txtPrice\" id=\"txtPrice\" class=\"digits\" value=\"" + rs.getInt("price") + "\" /></td></tr>"
                            + "<td><table>"
                            + tourStatus
                            + "</table></td>"
                            + "<tr><th>Description</th><td><textarea name=\"txtDescription\" rows=\"8\" cols=\"35\" >" + rs.getString("description") + "</textarea></td></tr>"
                            + "<tr><td colspan=\"2\" align=\"center\"><input type=\"submit\" name=\"type\" value=\"Update\" /></td></tr></tbody>"
                            + "</table>"
                            + "</form>"
                            + "</div>";
                }
                request.setAttribute("type", action);
                request.setAttribute("INFO", result);//set value
                request.setAttribute("pagesnum", 0);
                request.setAttribute("page", 0);
                request.setAttribute("qryData", "");
                request.getRequestDispatcher("AdminTourSearch.jsp").forward(request, response);
            }
//            if ("update".equals(action)) {
//                String qry = "SELECT * FROM Tour t where t.tourID=" + tourID;//initial query
//                ResultSet rs = dc.executeCustomQuery(qry);
//                String result = "Failed to get data!";
//
//                while (rs.next()) {
//                    String tourStatus = "";
//                    result = "<div id=\"tour-items\">"
//                            + "<form action=\"TourActionServlet\" method=\"post\">"
//                            + "<input type=\"hidden\" name=\"tourID\" value=\""+rs.getInt("tourID")+"\"/>"
//                            + "<table border=\"0\" align=\"center\" width=\"500\"><tbody>"
//                            + "<tr><th >Tour Name</th><td>" + rs.getString("tourName") + "</td></tr>"
//                            + "<tr><th >Image Tour</th><td><img width=\"300\" height=\"200\" src=\"images/" + rs.getString("imageTour") + "\" /></td></tr>"
//                            + "<tr><th>Start Date</th><td>" + rs.getDate("startDate") + "</td></tr>"
//                            + "<tr><th>End Date</th><td>" + rs.getDate("endDate") + "</td></tr>"
//                            + "<tr><th width=\"150\">Start Location</th><td width=\"350\">" + rs.getString("startLocation") + "</td></tr>"
//                            + "<tr><th>End Location</th><td>" + rs.getString("endLocation") + "</td></tr>"
//                            + "<tr><th>Min Quantity</th><td>" + rs.getInt("quantityMin") + "</td></tr>"
//                            + "<tr><th>Max Quantity</th><td>" + rs.getInt("quantityMax") + "</td></tr>"
//                            + "<tr><th>Current Quantity</th><td>" + rs.getInt("quantityCurrent") + "</td></tr>"
//                            + "<tr><th>Price</th><td>" + rs.getInt("price") + "</td></tr>"
//                            + "<tr><th>Status</th><td>"+rs.getString("status")+"</td></tr>"
//                            + "<tr><th>Description</th><td>" + rs.getString("description") + "</td></tr>"
//                            + "<tr><td colspan=\"2\" align=\"center\"><input type=\"submit\" name=\"action\" value=\"update\" /><input type=\"submit\" name=\"action\" value=\"disable\" id=\"btDelete\" />\"</td></tr></tbody>"
//                            + "</table>"
//                            + "</form>"
//                            + "</div>";
//                }
//                request.setAttribute("type", action);
//                request.setAttribute("INFO", result);//set value
//                request.setAttribute("pagesnum", 0);
//                request.setAttribute("page", 0);
//                request.setAttribute("qryData", "");
//                request.getRequestDispatcher("AdminTourSearch.jsp").forward(request, response);
//            }
            if ("viewDetail".equals(action)) {
                String qry = "SELECT * FROM Tour t where t.tourID=" + tourID;//initial query
                ResultSet rs = dc.executeCustomQuery(qry);
                String result = "Failed to view data!";

                while (rs.next()) {
                    String tourStatus = "";
                    result = "<div id=\"tour-items\">"
                            + "<form action=\"TourActionServlet\" method=\"post\">"
                            + "<input type=\"hidden\" name=\"tourID\" value=\""+rs.getInt("tourID")+"\"/>"
                            + "<table border=\"0\" align=\"center\" width=\"500\"><tbody>"
                            + "<tr><th >Tour Name</th><td>" + rs.getString("tourName") + "</td></tr>"
                            + "<tr><th >Image Tour</th><td><img width=\"300\" height=\"200\" src=\"images/" + rs.getString("imageTour") + "\" /></td></tr>"
                            + "<tr><th>Start Date</th><td>" + rs.getDate("startDate") + "</td></tr>"
                            + "<tr><th>End Date</th><td>" + rs.getDate("endDate") + "</td></tr>"
                            + "<tr><th width=\"150\">Start Location</th><td width=\"350\">" + rs.getString("startLocation") + "</td></tr>"
                            + "<tr><th>End Location</th><td>" + rs.getString("endLocation") + "</td></tr>"
                            + "<tr><th>Min Quantity</th><td>" + rs.getInt("quantityMin") + "</td></tr>"
                            + "<tr><th>Max Quantity</th><td>" + rs.getInt("quantityMax") + "</td></tr>"
                            + "<tr><th>Current Quantity</th><td>" + rs.getInt("quantityCurrent") + "</td></tr>"
                            + "<tr><th>Price</th><td>" + rs.getInt("price") + "</td></tr>"
                            + "<tr><th>Status</th><td>"+rs.getString("status")+"</td></tr>"
                            + "<tr><th>Description</th><td>" + rs.getString("description") + "</td></tr>"
                            + "<tr><td colspan=\"2\" align=\"center\"><input type=\"submit\" name=\"action\" value=\"update\" /><input type=\"submit\" name=\"action\" value=\"disable\" id=\"btDelete\" onclick=\"return confirm("
                                + "'Do you really want to disable this tour?');\" />\"</td></tr></tbody>"
                            + "</table>"
                            + "</form>"
                            + "</div>";
                }
                request.setAttribute("type", action);
                request.setAttribute("INFO", result);//set value
                request.setAttribute("pagesnum", 0);
                request.setAttribute("page", 0);
                request.setAttribute("qryData", "");
                request.getRequestDispatcher("AdminTourSearch.jsp").forward(request, response);
            }
            if ("disable".equals(action)) {
                String qry = "update Tour set status='disable' where tourID=" + tourID;//initial query
                boolean rs = dc.executeCustomUpdateQuery(qry);
                String result="Failed to update!";
                if(rs){
                    result="Update successfully!";
                }
                request.setAttribute("type", action);
                request.setAttribute("INFO", result);//set value
                request.setAttribute("pagesnum", 0);
                request.setAttribute("page", 0);
                request.setAttribute("qryData", "");
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
