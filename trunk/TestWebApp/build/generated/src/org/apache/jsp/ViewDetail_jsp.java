package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class ViewDetail_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            ResultSet rs = null;
            int pagenum = 1;
            int numOfElements = 1;
            try {
                String num = (String) request.getAttribute("pagenum");
                pagenum = Integer.parseInt(num);
                rs = (ResultSet) request.getAttribute("result");
            } catch (Exception ex) {
                
        
      out.write("\n");
      out.write("        ");
      if (true) {
        _jspx_page_context.forward("GetDataByPage");
        return;
      }
      out.write("\n");
      out.write("        ");
}
      out.write("\n");
      out.write("        <div id=\"tour-items\">\n");
      out.write("            <form action=\"TourActionServlet\" method=\"post\">\n");
      out.write("                <table border=\"0\" align=\"center\">\n");
      out.write("                    <tbody>\n");
      out.write("                        <tr>\n");
      out.write("                            <th>No.</th>\n");
      out.write("                            <th >Tour ID</th>\n");
      out.write("                            <th >User ID</th>\n");
      out.write("                            <th>User Name</th>\n");
      out.write("                            <th>Tour ID</th>\n");
      out.write("                            <th >Tour Name</th>\n");
      out.write("                            <th>Quantity</th>\n");
      out.write("                            <th>Total Price</th>\n");
      out.write("                            <th>Order Date</th>\n");
      out.write("                            <th>Start Date</th>\n");
      out.write("                            <th>End Date</th>\n");
      out.write("                        </tr>\n");
      out.write("                        ");

                            int numOfEntitiesPerPages = 20;
                            while (rs.next()) {
                                if ((numOfElements > (pagenum - 1) * (numOfEntitiesPerPages))
                                        && (numOfElements <= pagenum * (numOfEntitiesPerPages))) {
                        
      out.write("\n");
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("                            <td>");
      out.print(numOfElements);
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs.getInt("orderTourID"));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print(rs.getInt("userID"));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs.getString("username"));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs.getInt("tourID"));
      out.write("</td>\n");
      out.write("                            <td >");
      out.print( rs.getString("tourName"));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs.getInt("quantity"));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs.getInt("totalPrice"));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs.getDate("orderDate"));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs.getDate("startDate"));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs.getDate("endDate"));
      out.write("</td>\n");
      out.write("                        </tr> \n");
      out.write("                        ");

                                }
                                numOfElements++;
                            }
                        
      out.write(" \n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div id=\"pagingsection\" align=\"center\">\n");
      out.write("            <table border=\"1\" cellspacing=\"5\"><tr>\n");
      out.write("                    ");

                        int numOfPages = 0;
                        if (numOfElements % numOfEntitiesPerPages == 0) {
                            numOfPages = numOfElements / numOfEntitiesPerPages;
                        } else {
                            numOfPages = (numOfElements / numOfEntitiesPerPages) + 1;
                        }
                        for (int i = 0; i < numOfPages; i++) {
                    
      out.write("\n");
      out.write("                    <td>\n");
      out.write("                        <form action=\"GetDataByPage\" method=\"POST\" id=\"page");
      out.print(i);
      out.write("\">  \n");
      out.write("                            <input type=\"hidden\" name=\"page\" value=\"");
      out.print(i + 1);
      out.write("\"/>\n");
      out.write("                            <a href=\"javascript:document.getElementById('page");
      out.print(i);
      out.write("').submit();\"><strong>&nbsp;");
if (numOfPages == i + 1) {
      out.write("<u>");
}
      out.print(i + 1);
if (numOfPages == i + 1) {
      out.write("</u>");
}
      out.write("&nbsp;</strong></a>\n");
      out.write("                        </form>\n");
      out.write("                    </td>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("    </body> \n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
