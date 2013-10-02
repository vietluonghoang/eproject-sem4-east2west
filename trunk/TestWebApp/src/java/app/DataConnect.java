/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package app;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author VietLH
 */
public class DataConnect {

    private String databaseName="E2W";
    private String server="localhost";
    private String port="1433";
    private String username="sa";
    private String password="123456";
    
    private String url="jdbc:sqlserver://"+server+":"+port+";databaseName="+databaseName;
    
    public void setDatabaseName(String databaseName) {
        this.databaseName = databaseName;
    }

    public void setServer(String server) {
        this.server = server;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public DataConnect() {
    }

    private Connection getConnection() {

        Connection conn = null;


        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DataConnect.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DataConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }

    public ResultSet getAllData(String tableName) {
        Connection conn = getConnection();
        Statement st = null;
        ResultSet rs = null;
        String qry = "select * from " + tableName;

        try {
            st = conn.createStatement();
            rs = st.executeQuery(qry);


        } catch (SQLException ex) {
            Logger.getLogger(DataConnect.class
                    .getName()).log(Level.SEVERE, null, ex);
        }

        return rs;
    }

    public ResultSet getSingleDataByID(String columnName,int id,String tableName) {

        Connection conn = getConnection();
        PreparedStatement prst = null;
        ResultSet rs=null;

        String qry = "select * from "+tableName+" where "+columnName+"=?";

        try {
            prst = conn.prepareStatement(qry);
            prst.setInt(1, id);
            prst.executeQuery();


        } catch (SQLException ex) {
            Logger.getLogger(DataConnect.class
                    .getName()).log(Level.SEVERE, null, ex);
        }

        return rs;
    }
    
    public ResultSet executeCustomQuery(String qry){
        Connection conn = getConnection();
        PreparedStatement prst = null;
        ResultSet rs=null;

        try {
            prst = conn.prepareStatement(qry);
            rs=prst.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(DataConnect.class
                    .getName()).log(Level.SEVERE, null, ex);
        }

        return rs;
    }
    public boolean executeCustomUpdateQuery(String qry){
        Connection conn = getConnection();
        PreparedStatement prst = null;
        int rs=0;

        try {
            prst = conn.prepareStatement(qry);
            rs=prst.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DataConnect.class
                    .getName()).log(Level.SEVERE, null, ex);
        }

        return rs>0;
    }
}