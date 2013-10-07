/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import app.DataConnect;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author VietLH
 */
public class AdminEditTourScheduleServlet extends HttpServlet {

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
            int tourID = 1;
            int scheduleID = 1;
            String type = "pagechange";
            int pagenum = 1;
            try {
                try {
                    tourID = Integer.parseInt(request.getParameter("id"));
                } catch (Exception ex) {
                }
                try {
                    scheduleID = Integer.parseInt(request.getParameter("scheduleID"));
                } catch (Exception ex) {
                }
                try {
                    type = request.getParameter("type");
                } catch (Exception ex) {
                }
                try {
                    pagenum = Integer.parseInt(request.getParameter("pagenum"));
                } catch (Exception ex) {
                }
            } catch (Exception ex) {
            }
            if (type == null) {
                if (makeChange(request, response)) {
                    request.getRequestDispatcher("AdminTourSearch.jsp").forward(request, response);
                } else {
                    String error = "Make change to database failed";
                    request.setAttribute("error", error);
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            }
            DataConnect dc = new DataConnect();
            ResultSet rs = null;
            if ("pagechange".equals(type) || "Edit Schedule".equals(type)) {
                String qry = "select * from ScheduleTour where tourID=" + tourID;
                rs = dc.executeCustomQuery(qry);
                request.setAttribute("id", tourID);
                request.setAttribute("pagenum", pagenum);
                request.setAttribute("result", rs);
                request.setAttribute("type", type);
                request.getRequestDispatcher("AdminEditTourSchedule.jsp").forward(request, response);
            }
            if ("delete".equals(type)) {
                String qry = "delete from ScheduleTour where scheduleID=" + scheduleID;
                dc.executeCustomUpdateQuery(qry);
                qry = "select * from ScheduleTour where tourID=" + tourID;
                rs = dc.executeCustomQuery(qry);
                request.setAttribute("id", tourID);
                request.setAttribute("pagenum", pagenum);
                request.setAttribute("result", rs);
                request.setAttribute("type", type);
                request.getRequestDispatcher("AdminEditTourSchedule.jsp").forward(request, response);
            }
            if ("addnew".equals(type)) {
                String qry = "select * from ScheduleTour where tourID=" + tourID;
                rs = dc.executeCustomQuery(qry);
                request.setAttribute("id", tourID);
                request.setAttribute("pagenum", pagenum);
                request.setAttribute("result", rs);
                request.setAttribute("type", type);
                request.getRequestDispatcher("AdminEditTourSchedule.jsp").forward(request, response);
            }
            if ("update".equals(type)) {
                String qry = "select * from ScheduleTour where scheduleID=" + scheduleID;
                rs = dc.executeCustomQuery(qry);
                request.setAttribute("id", tourID);
                request.setAttribute("pagenum", pagenum);
                request.setAttribute("result", rs);
                request.setAttribute("type", type);
                request.getRequestDispatcher("AdminEditTourSchedule.jsp").forward(request, response);
            }

        } catch (Exception ex) {
        }
    }

    private boolean makeChange(HttpServletRequest request, HttpServletResponse response) {
        boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
        if (!isMultiPart) {
            return false;
        } else {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List items = null;

            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException e) {
                e.printStackTrace();
            }

            String image1 = "";
            Iterator iter = items.iterator();
            Hashtable pars = new Hashtable();

            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                if (item.isFormField()) {
                    //todo
                    pars.put(item.getFieldName(), item.getString());
                } else {
                    try {
                        Random random = new Random();
                        String itemName = item.getName();
                        String fileName = random.nextInt(9999) + "-" + itemName.substring(
                                itemName.lastIndexOf("\\") + 1);
                        System.out.println("filename " + fileName);
                        String RealPath = getServletContext().getRealPath("/")
                                + "images\\" + fileName;
                        System.out.println("Rpath " + RealPath);
                        if (itemName != "") {
                            image1 = fileName;
                            File savedFile = new File(RealPath);
                            item.write(savedFile);
                        }

                    } catch (Exception e) {
                        // e.printStackTrace();
                    }
                }
            }


            String packImage = image1;
            int pagenum = 1;
            String type = "pagechange";
            int tourID = 1;
            int scheduleID = 1;
            String description = "";
            try {
                pagenum = Integer.parseInt((String)pars.get("pagenum"));
            } catch (Exception ex) {
            }
            try {
                type = (String) pars.get("type");
            } catch (Exception ex) {
            }
            try {
                tourID = Integer.parseInt((String) pars.get("id"));
            } catch (Exception ex) {
            }
            try {
                scheduleID = Integer.parseInt((String) pars.get("scheduleID"));
            } catch (Exception ex) {
            }
            try {
                description = (String) pars.get("description");
            } catch (Exception ex) {
            }

            System.out.println("packImage: " + packImage);

            DataConnect dc = new DataConnect();

            if ("commitupdate".equals(type)) {
                String qry = "update ScheduleTour set description='" + description + "'";
                if (!"".equals(image1)) {
                    qry = qry + ", imageSchedule='" + image1 + "'";
                }
                qry = qry + " where scheduleID=" + scheduleID;
                if (dc.executeCustomUpdateQuery(qry)) {
                    ResultSet rs = dc.executeCustomQuery("select * from ScheduleTour where tourID=" + tourID);
                    request.setAttribute("id", tourID);
                    request.setAttribute("pagenum", pagenum);
                    request.setAttribute("result", rs);
                    request.setAttribute("type", type);
                    return true;
                } else {
                    return false;
                }
            }
            if ("commitadd".equals(type)) {
                String qry = "";
                if (!"".equals(image1)&&!"".equals(description)) {
                    qry = "insert into ScheduleTour value(" + tourID + ",'" + image1 + "', '" + description + "')";
                }else{
                    return false;
                }
                if (dc.executeCustomUpdateQuery(qry)) {
                    ResultSet rs = dc.executeCustomQuery("select * from ScheduleTour where tourID=" + tourID);
                    request.setAttribute("id", tourID);
                    request.setAttribute("pagenum", pagenum);
                    request.setAttribute("result", rs);
                    request.setAttribute("type", type);
                    return true;
                } else {
                    return false;
                }
            }
        }
        return false;
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
