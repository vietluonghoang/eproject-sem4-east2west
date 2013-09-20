
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Random"%>
<%@page import="tuan.bean.TuanStatelessRemote"%>
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
                        String image1 = null;
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
                                    System.out.println("path " + fileName);
                                    String RealPath = config.getServletContext().getRealPath("/")
                                            + "images\\hotel\\" + fileName;
                                    System.out.println("Rpath " + RealPath);
                                    if(image1 == null){
                                        image1 = fileName;
                                        }
                                    File savedFile = new File(RealPath);
                                    item.write(savedFile);


                                //} catch (Exception e) {
                                    //e.printStackTrace();
                                //}
                            }
                        }
                        String $name = (String) params.get("$name");
                        String $street = (String) params.get("$street");;
                        int $star = Integer.parseInt((String) params.get("$star"));
                        String $description = (String) params.get("$description");
                        String $image = "hotel/"+image1;
                        int $price = Integer.parseInt((String) params.get("$price"));if($price==0){}
                        if ($star<0 || $star>5) {
                            %>star must be between 1 and 5<%
                            return;
                        }
                        if ($name.equals("")||$street.equals("")||$star==0||
                                $description.equals("")||$image.equals("")||$price==0) {
                            %>please fill out every field<%
                            return;
                        }


                        Context ctx = new InitialContext();
                        TuanStatelessRemote remote = (TuanStatelessRemote) ctx.lookup("TuanStatelessRemote");
                        remote.insertHotel($name, $street, $star, $description, $image, $price);
                        %>insert successfully<%
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
