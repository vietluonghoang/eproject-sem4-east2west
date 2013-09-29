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
            String fromStr = request.getParameter("$from");
            String toStr = request.getParameter("$to");
            String type = request.getParameter("type");
            int page = 1;
            try {
                page = Integer.parseInt(request.getParameter("page"));
                if (page <= 0) {
                    page = 1;
                }
            } catch (Exception ex) {
                page = 1;
            }
            int numOfEntitiesPerPages = 50;
            Date from = new SimpleDateFormat("yyyy/MM/dd").parse(fromStr);//parse input value
            Date to = new SimpleDateFormat("yyyy/MM/dd").parse(toStr);
            if (from.after(to)) {
                request.setAttribute("ERROR", "from date cannot be after to date");
                request.getRequestDispatcher("carError.jsp").forward(request, response);
                return;
            }
            if ("most".equals(type)) {
                ResultSet rs = getOrderTotalByPeriod(fromStr, toStr);
                int order = 0;
                int numOfElements = 0;
                String result = "";
                while (rs.next()) {
                    numOfElements++;
                    if ((numOfElements > (page - 1) * numOfEntitiesPerPages) && (numOfElements < page * numOfEntitiesPerPages)) {
                        order++;
                        String air="";
                        if (rs.getBoolean("airConditioner")) {
                            air="Yes";
                        }else {
                            air="No";
                        }
                        result = result + "<tr align=\"center\"><td align=\"center\">"+order+"</td>" 
                                +"<td align=\"center\">"+rs.getInt("carID")+"</td><td align=\"center\">"+rs.getString("model")
                                +"<td align=\"center\">"+rs.getString("type")+"</td><td align=\"center\">"+rs.getInt("seat")
                                +"</td><td align=\"center\">"+air+"<td align=\"center\">"+rs.getInt("price")+" USD</td>" 
                                +"<td align=\"center\">"+rs.getInt("total")+"</td></tr>";
                    }
                }
                int numOfPages = 0;
                if (numOfElements % numOfEntitiesPerPages == 0) {
                    numOfPages = numOfElements / numOfEntitiesPerPages;
                } else {
                    numOfPages = (numOfElements / numOfEntitiesPerPages) + 1;
                }
                request.setAttribute("type", type);
                request.setAttribute("INFO", result);//set value
                request.setAttribute("$from", from);//set value
                request.setAttribute("$to", to);//set value
                request.setAttribute("pagesnum", numOfPages);
                request.setAttribute("page", page);
                request.getRequestDispatcher("carReportShow.jsp").forward(request, response);
            }
            if("available".equals(type)){
                ResultSet rs = getAvaiableOrderByPeriod(fromStr, toStr);    
                int order = 0;
                int numOfElements = 0;
                String result = "";
                while (rs.next()) {
                    numOfElements++;
                    if ((numOfElements > (page - 1) * numOfEntitiesPerPages) && (numOfElements < page * numOfEntitiesPerPages)) {
                        order++;
                        String driver="";
                        if (rs.getBoolean("driver")) {
                            driver="Yes";
                        }else {
                            driver="No";
                        }
                        result = result + "<tr align=\"center\"><td align=\"center\">"+order+"</td><td align=\"center\">"+rs.getString("model")
                                +"</td><td align=\"center\">"+rs.getInt("quantity")+"</td><td align=\"center\">"+driver
                                +"</td><td align=\"center\">"+rs.getDate("pickup")+"</td><td align=\"center\">"+rs.getDate("dropoff")
                                +"</td><td align=\"center\">"+rs.getDate("orderDate")+"</td></tr>";
                    }
                }
                int numOfPages = 0;
                if (numOfElements % numOfEntitiesPerPages == 0) {
                    numOfPages = numOfElements / numOfEntitiesPerPages;
                } else {
                    numOfPages = (numOfElements / numOfEntitiesPerPages) + 1;
                }
                request.setAttribute("type", type);
                request.setAttribute("INFO", result);//set value
                request.setAttribute("$from", from);//set value
                request.setAttribute("$to", to);//set value
                request.setAttribute("pagesnum", numOfPages);
                request.setAttribute("page", page);
                request.getRequestDispatcher("carReportShow.jsp").forward(request, response);
            }
            if("all".equals(type)){
                ResultSet rs = getAllOrderByPeriod(fromStr, toStr);  
                int order = 0;
                int numOfElements = 0;
                String result = "";
                while (rs.next()) {
                    numOfElements++;
                    if ((numOfElements > (page - 1) * numOfEntitiesPerPages)
                            && (numOfElements < page * numOfEntitiesPerPages)) {
                        order++;
                        String driver="";
                        if (rs.getBoolean("driver")) {
                            driver="Yes";
                        }else {
                            driver="No";
                        }
                        result = result + "<tr align=\"center\"><td align=\"center\">"+order+"</td><td align=\"center\">"+rs.getDate("orderDate")
                                +"</td><td align=\"center\">"+rs.getString("model")+"</td><td align=\"center\">"+rs.getInt("quantity")
                                +"</td><td align=\"center\">"+driver+" </td> <td align=\"center\">"+rs.getDate("pickup")
                                +"</td><td align=\"center\">"+rs.getDate("dropoff")+"</td><td align=\"center\">"+rs.getInt("totalCost")
                                +"</td><td align=\"center\">"+rs.getString("status")+"</td></tr>";
                    }
                }
                int numOfPages = 0;
                if (numOfElements % numOfEntitiesPerPages == 0) {
                    numOfPages = numOfElements / numOfEntitiesPerPages;
                } else {
                    numOfPages = (numOfElements / numOfEntitiesPerPages) + 1;
                }
                request.setAttribute("type", type);
                request.setAttribute("INFO", result);//set value
                request.setAttribute("$from", from);//set value
                request.setAttribute("$to", to);//set value
                request.setAttribute("pagesnum", numOfPages);
                request.setAttribute("page", page);
                request.getRequestDispatcher("carReportShow.jsp").forward(request, response);
            }
        } catch (ParseException ex) {
            Logger.getLogger(CarReportServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CarReportServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
        }
    }

    public ResultSet getOrderTotalByPeriod(String from, String to) {
        String qry = "select c.carID, c.model, c.type, c.seat, c.airConditioner, c.price, g.total "
                + "from Car c join (select c.carID as id, sum(c.quantity) as total from CarOrderDetail c" 
                +" where c.dropoff between '"+from+"' and '"+to+"' and c.status !='canceled' group by c.carID) g"
                + " on c.carID=g.id order by g.total desc";
        System.out.println(qry);
        DataConnect dc = new DataConnect();
        ResultSet rs = dc.executeCustomQuery(qry);
        return rs;
    }
    
    public ResultSet getAvaiableOrderByPeriod(String from, String to) {
        String qry = "select c.model, o.quantity, o.driver, o.pickup, o.dropoff, o.orderDate, o.status "
                + "from CarOrderDetail o join Car c on o.carID=c.carID where status ='waiting' "
                + "and o.pickup between '"+from+"' and '"+to+"' order by o.pickup asc";
        System.out.println(qry);
        DataConnect dc = new DataConnect();
        ResultSet rs = dc.executeCustomQuery(qry);
        return rs;
    }
    
    public ResultSet getAllOrderByPeriod(String from, String to) {
        String qry = "select c.model,o.* from CarOrderDetail o join Car c on o.carID=c.carID where status!='canceled' "
                + "and o.pickup between '"+from+"' and '"+to+"' order by orderDate desc";
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
