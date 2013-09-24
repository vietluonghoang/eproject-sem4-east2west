
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Random"%>
<%@page import="ngoc.bean.NgocStatelessRemote"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.Date"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

        <%

                try {
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
                        String image1 = "";
                        Iterator iter = items.iterator();
                        Hashtable params = new Hashtable();
                        while (iter.hasNext()) {
                            FileItem item = (FileItem) iter.next();
                            if (item.isFormField()) {
                                //todo
                                params.put(item.getFieldName(), item.getString());
                            } else {
                                //try {
                                    Random random = new Random();
                                    String itemName = item.getName();
                                    String fileName = random.nextInt(9999)+"-"+itemName.substring(
                                            itemName.lastIndexOf("\\") + 1);
                                    System.out.println("filename " + fileName);
                                    String RealPath = config.getServletContext().getRealPath("/")
                                            + "images\\car\\" + fileName;
                                    System.out.println("Rpath " + RealPath);
                                    if(itemName != ""){
                                        image1 = fileName;
                                        File savedFile = new File(RealPath);
                                        item.write(savedFile);
                                        }
                                    


                                //} catch (Exception e) {
                                    //e.printStackTrace();
                                //}
                            }
                        }
                        String $model = (String) params.get("$model");$model.equals("");
                        String $type = (String) params.get("$type");$type.equals("");
                        int $seat = Integer.parseInt((String) params.get("$seat"));if($seat==0){}
                        boolean $airConditioner = true;
                        if((String) params.get("$airConditioner")==null) {
                            $airConditioner = false;
                        }
                        String $description = (String) params.get("$description");$description.equals("");
                        String $image = "car/"+image1;
                        int $stock = Integer.parseInt((String) params.get("$stock"));
                        int $price = Integer.parseInt((String) params.get("$price"));
                        String $which = (String)params.get("$which");
                        int $carID=0;
                        if ($which.equals("update")) {
                            $carID = Integer.parseInt((String)params.get("$carID"));
                        }
                        if ($which.equals("insert")&&image1.equals("")) {
                            %>please fill out every field<%
                            return;
                        }
                        if ($model.equals("")||$type.equals("")||$seat==0||
                                $description.equals("")||$stock==0||$price==0) {
                            %>please fill out every field<%
                            return;
                        }


                        Context ctx = new InitialContext();
                        NgocStatelessRemote remote = (NgocStatelessRemote) ctx.lookup("NgocStatelessRemote");
                        if ($which.equals("insert")) {
                            remote.insert($model, $type, $seat, $airConditioner, $description, $image, $stock, $price);
                            request.getRequestDispatcher("adminCarSearch.jsp").forward(request, response);
                        } else if (image1.equals("")) {
                            remote.updateCarNoImage($carID, $model, $type, $seat, $airConditioner, $description, $stock, $price);
                            request.getRequestDispatcher("adminCarSearch.jsp").forward(request, response);
                        } else {
                            remote.updateCarWithImage($carID, $model, $type, $seat, $airConditioner, $description, $image, $stock, $price);
                            request.getRequestDispatcher("adminCarSearch.jsp").forward(request, response);
                        }
                    }


                    /*if (remote.insertNewLab(labName, labDetails, labImage, labCate, date)) {
                    request.getRequestDispatcher("ProcessServletVu?action=Search Lab&txtSearch=").forward(request, response);
                    } else {
                    out.println("Insert Failed");
                    }*/
                    //

                }catch(NumberFormatException e){
                    %>please don't input character into number only textfield<%
                }catch(ParseException e){
                    %>please input valid date into date only textfield. Date format: year/month/day<%
                }catch(Exception e){
                    %>unexpected error occured! Please report back to the admin<%
                    e.printStackTrace();
                }
%>
