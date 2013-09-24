/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package e2w.servlet;

import e2w.bean.CustomerBeanRemote;
import e2w.dto.CustomerReportDTO;
import e2w.dto.CustomerTopReportDTO;
import e2w.enitites.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


/**
 *
 * @author JAKE
 */
public class reportServlet extends HttpServlet {
   
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
            out.println("<title>Servlet reportServlet</title>");  
            out.println("</head>");
            out.println("<body>");

            //get the from Date,to Date and type of the report from jsp

            String action = request.getParameter("action");
            String fromDate= request.getParameter("txtFromDateReport");
            String endDate = request.getParameter("txtToDateReport");
            String choose = request.getParameter("cbTypeReport");

            //format the date
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date fd = format.parse(fromDate);
            Date ed = format.parse(endDate);


             if(action.equals("View Report")){
                 //checking the type of the report
            if (choose.equals("r01")) {
                    Context ctx = new InitialContext();
                    DataSource data = (DataSource) ctx.lookup("JNDI_e2w");
                    Connection connect = data.getConnection();
                    //use prepare statement
                    PreparedStatement pst = connect.prepareStatement("select top 10 userID,count(userID) as total from OrderTour where orderDate>=? and orderDate<=? group by userID order by total desc ");
                    //set string
                    pst.setString(1, format.format(fd));
                    pst.setString(2, format.format(ed));
                    //executeQuery
                    ResultSet rs = pst.executeQuery();
                    //create an array list
                    ArrayList list = new ArrayList();
                    while (rs.next()) {
                        //get the userID and total from the result of the query
                        int userID = rs.getInt(1);
                        int total = rs.getInt(2);
                        //get user information from customerReportDTO by using userID
                        CustomerReportDTO user = getinfoCustomer(userID);
                        //create  anew CustomerTopReportDTO by using userID,total,and the user object
                        CustomerTopReportDTO dto = new CustomerTopReportDTO(userID, total, user);
                        // add the dto to list
                        list.add(dto);
                    }
                    rs.close();
                    pst.close();
                    connect.close();
                    //close connection,prepare statement and the result set
                    //create an array of CustomerTopReportDTO with the size of the list
                    CustomerTopReportDTO[] result = new CustomerTopReportDTO[list.size()];
                    //get all the item from list to the array
                    list.toArray(result);
                    //save all the necessary information by using setAttribute method and redirect to Ereport.jsp
                    request.setAttribute("Report", "R1");
                    request.setAttribute("CustomerTop", result);
                    request.setAttribute("fromDate", fromDate);
                    request.setAttribute("toDate", endDate);
                    request.getRequestDispatcher("Ereport.jsp").forward(request, response);
                }
            }else{

            }


            out.println("</body>");
            out.println("</html>");
        }catch(Exception e){
            e.printStackTrace();
        } finally { 
            out.close();
        }
    } 
    public CustomerReportDTO getinfoCustomer(int userID){

        try {
            Context ctx = new InitialContext();
            CustomerBeanRemote remote = (CustomerBeanRemote) ctx.lookup("CustomerBeanJNDI");

            CustomerReportDTO  cusInfo = null;
            Customer cus = remote.loadCustomerInfo(userID);

            String username = cus.getUsername();
            String fullname = cus.getFullname();
            String email = cus.getEmail();
            String phone = cus.getPhone();
            cusInfo = new CustomerReportDTO(username, fullname, email, phone);

           return cusInfo;
        } catch (Exception e) {e.printStackTrace();
        }
    return null;
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
