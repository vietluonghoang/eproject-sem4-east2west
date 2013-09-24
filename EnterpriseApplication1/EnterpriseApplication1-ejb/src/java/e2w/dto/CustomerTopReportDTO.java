/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package e2w.dto;

import java.io.Serializable;

/**
 *
 * @author JAKE
 */
public class CustomerTopReportDTO implements Serializable{

    private int userID,total;
    private CustomerReportDTO user;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public CustomerReportDTO getUser() {
        return user;
    }

    public void setUser(CustomerReportDTO user) {
        this.user = user;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public CustomerTopReportDTO(int userID, int total, CustomerReportDTO user) {
        this.userID = userID;
        this.total = total;
        this.user = user;
    }
    


}
