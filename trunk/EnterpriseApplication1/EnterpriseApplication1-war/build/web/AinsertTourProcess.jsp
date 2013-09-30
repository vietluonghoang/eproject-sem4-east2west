<%@page import="e2w.bean.CustomerBeanRemote"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%
    //       String action = request.getParameter("action");
    //      if(action.equals("Update")){
    boolean isMultiPart = ServletFileUpload.isMultipartContent(request);

    if (!isMultiPart) {
        //todo
    } else {
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List items = null;

        try {
            items = upload.parseRequest(request);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }

        String image1 = null;
        Iterator iter = items.iterator();
        Hashtable params = new Hashtable();

        while (iter.hasNext()) {
            FileItem item = (FileItem) iter.next();
            if (item.isFormField()) {
                //todo
                params.put(item.getFieldName(), item.getString());
            } else {
                try {
                    String itemName = item.getName();
                    String fileName = itemName.substring(
                            itemName.lastIndexOf("\\") + 1);
                    System.out.println("path " + fileName);
                    String RealPath = config.getServletContext().getRealPath("/")
                            + "images\\" + fileName;
                    System.out.println("Rpath " + RealPath);
                    //   if(image1 == null){
                    if (!fileName.equals("")) {
                        image1 = fileName;
                    }
                    System.out.println("image1    " + image1);
                    //       }
                    File savedFile = new File(RealPath);
                    item.write(savedFile);


                } catch (Exception e) {
                    // e.printStackTrace();
                }
            }
        }
        String tourID = (String) params.get("tourID");
        String tourName = (String) params.get("txtTourName");
        String startDate = (String) params.get("txtStartDate");
        String packImage = image1;

        String endDate = (String) params.get("txtEndDate");
        String startLocation = (String) params.get("txtStartLocation");
        String endLocation = (String) params.get("txtEndLocation");
        String minQuantity = (String) params.get("txtMinQuantity");
        String maxQuantity = (String) params.get("txtMaxQuantity");
        String quantityCurrent = (String) params.get("txtCurrentQuantity");
        String description = (String) params.get("txtDescription");
        String price = (String) params.get("txtPrice");
        String status = (String) params.get("status");
        String type = (String) params.get("type");

        Context ctx = new InitialContext();
        CustomerBeanRemote remote = (CustomerBeanRemote) ctx.lookup("CustomerBeanJNDI");

        System.out.println("tourName :" + tourName);
        System.out.println("packImage: " + packImage);
        System.out.println("startDate:" + startDate);
        System.out.println("endDate: " + endDate);
        System.out.println("startLocation: " + startLocation);
        System.out.println("endLocation: " + endLocation);
        System.out.println("minQuantity: " + minQuantity);
        System.out.println("maxQuantity: " + maxQuantity);
        System.out.println("description: " + description);
        System.out.println("price: " + price);
        if ("Insert".equals(type)) {
            if (remote.insertTour(tourName, packImage, startDate, endDate, startLocation, endLocation, Integer.parseInt(minQuantity), Integer.parseInt(maxQuantity), Integer.parseInt(price), description)) {
                request.getRequestDispatcher("AdminTourSearch.jsp").forward(request, response);
            } else {
                String error = "Insert tour to database failed";
                request.setAttribute("error", error);
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        }
        if ("Update".equals(type)) {
            if (remote.updateTour(tourID, tourName, packImage, startDate, endDate, startLocation, endLocation, minQuantity, maxQuantity, quantityCurrent, price, description, status)) {
            } else {
                String error = "Insert tour to database failed";
                request.setAttribute("error", error);
                request.getRequestDispatcher("error.jsp").forward(request, response);

            }

        }

%>