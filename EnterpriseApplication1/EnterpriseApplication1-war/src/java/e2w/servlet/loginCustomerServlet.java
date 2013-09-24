/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package e2w.servlet;

import e2w.bean.CustomerBeanRemote;
import e2w.dto.OrderTourDTO;
import e2w.enitites.Customer;
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
public class loginCustomerServlet extends HttpServlet {
   
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
            out.println("<title>Servlet loginCustomerServlet</title>");  
            out.println("</head>");
            out.println("<body>");

            String action = request.getParameter("action");

            Context ctx = new InitialContext();
            UserTransaction ut = (UserTransaction) ctx.lookup("UserTransaction");
            CustomerBeanRemote remote = (CustomerBeanRemote) ctx.lookup("CustomerBeanJNDI");
            HttpSession session = request.getSession(true);

            if(action.equals("Login")){
                //get the username and password from the field in jsp
                String username = request.getParameter("txtUsername");
                String password = request.getParameter("txtPassword");
                //checking the username and password
                if(remote.checkLogin(username, password)){
                    //if it return true,load the Customer information by using searchCustomerByUsername in CustomerBeanRemote
                    //get the userID
                    Customer cusInfo = remote.searchCustomerByUsername(username);
                    int userID = cusInfo.getUserID();
                    //save the customerInfo and userID in session
                    session.setAttribute("SessionCusINFO", cusInfo);
                    session.setAttribute("SessionUserID",userID );
                    //redirect to Ehome.jsp
                    System.out.println("Login successfully as userID :"+userID);
                    request.getRequestDispatcher("Ehome.jsp").forward(request, response);

                }else{
                    //redirect to Ehome.jsp automatically when login fail
                    System.out.println("Login fail");
                    response.sendRedirect("Ehome.jsp");
                }


            }else if(action.equals("Register")){

                String username = request.getParameter("txtUsername");
                String password = request.getParameter("txtPassword");
                String fullname = request.getParameter("txtFullName");
                String gender = request.getParameter("cbGender");
                String email = request.getParameter("txtEmail");
                String nationality = request.getParameter("ddlNationality");
                String address = request.getParameter("txtAddress");
                String phone = request.getParameter("txtPhone");

                //get the input information in jsp

                ut.begin();

                Customer cus = remote.searchCustomerByUsername(username);

                if(cus==null){
                //insert into database
                if(remote.registerCustomer(username, password, fullname, gender, email, nationality, address, phone)){
                    //if checking return true,return to Ehome.jsp
                    System.out.println("Register successful");
                    response.sendRedirect("Ehome.jsp");
                }else{
                    //if checking return false,return to register.jsp
                    System.out.println("Register fail");
                    response.sendRedirect("register.jsp");
                }
                }else{
                    String error = "Username is already exist";
                    request.setAttribute("error", error);
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
                ut.commit();

            }else if(action.equals("Log Out")){
                //clear all session and redirect to Ehome.jsp
                session.invalidate();
                response.sendRedirect("Ehome.jsp");
            }else if(action.equals("View Order")){

                //get the userID from session

                int userID = Integer.parseInt(session.getAttribute("SessionUserID").toString());
                //load all of the order through the userID
                OrderTourDTO[] orderTour = remote.loadOrder(userID);
                //save it in session,and redirect to EtourOrderHistory.jsp
                session.setAttribute("orderINFO", orderTour);
                request.getRequestDispatcher("EtourOrderHistory.jsp").forward(request, response);
            }else if(action.equals("Update Information")){
                //get the information input from the form in jsp

                String userID = session.getAttribute("SessionUserID").toString();
                String fullname = request.getParameter("txtFullName");
                String genger = request.getParameter("cbGender");
                String address = request.getParameter("txtAddress");
                String phone = request.getParameter("txtPhone");

                //update the information in database
                if(remote.updateUserBasicInfo(Integer.parseInt(userID), fullname, genger, address, phone)){
                    System.out.println("Update customer information successfully");
                    Customer cus = remote.loadCustomerInfo(Integer.parseInt(userID));
                    session.setAttribute("SessionCusINFO", cus);
                    request.getRequestDispatcher("EcustomerInfo.jsp").forward(request, response);
                }else{
                    String error = "Cannot update customer information";
                    request.setAttribute("error", error);
                    Customer cus = remote.loadCustomerInfo(Integer.parseInt(userID));
                    session.setAttribute("SessionCusINFO", cus);
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }

            }else if(action.equals("Change Password")){


                request.getRequestDispatcher("EupdatePassword.jsp").forward(request, response);
            }else if(action.equals("Update Password")){

                //get the old and the new password from the field in jsp

                String oldPass = request.getParameter("txtOldPassword");
                String newPass = request.getParameter("txtNewPassword");

                //get the userID from session
                int userID = Integer.parseInt(session.getAttribute("SessionUserID").toString());

                //get the customer information from session
                Customer cus = (Customer)session.getAttribute("SessionCusINFO");

                //check the old password
                if(cus.getPassword().equals(oldPass)){
                    //if the input old password is the same as the password in database
                    //cange the password and redirect to EcustomerInfo

                    remote.changePasswordCustomer(userID, newPass);
                    System.out.println("update userID: "+userID+" password successful");
                    request.getRequestDispatcher("EcustomerInfo.jsp").forward(request, response);
                }else{


                    String error = "Fail to update password userID: "+userID;
                    request.setAttribute("error", error);
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
                }else if(action.equals("Change Email")){
                    //redirect to EupdateEmail.jsp

                    request.getRequestDispatcher("EupdateEmail.jsp").forward(request, response);
                }else if(action.equals("Update Email")){
                    //get the old email and new email from the jsp

                String oldEmail = request.getParameter("txtOldEmail");
                String newEmail = request.getParameter("txtNewEmail");
                int userID = Integer.parseInt(session.getAttribute("SessionUserID").toString());
                //get userID from session
                Customer cus = (Customer)session.getAttribute("SessionCusINFO");
                //check the old email
                if(cus.getEmail().equals(oldEmail)){

                //if the old input email is the same as the email in the database
                    // update email with the new one and redirect to EcustomerInfo.jsp
                    remote.changeEmailCustomer(userID, newEmail);
                    System.out.println("update userID :"+userID+" email successful");
                    request.getRequestDispatcher("EcustomerInfo.jsp").forward(request, response);
                }else{

                //if it's fail,send an error String to error.jsp
                    String error = "Fail to update email userID: "+userID;
                    request.setAttribute("error", error);
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }


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
