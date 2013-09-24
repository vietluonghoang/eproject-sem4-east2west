/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package e2w.dto;

import e2w.enitites.Customer;
import e2w.enitites.OrderTour;
import java.io.Serializable;

/**
 *
 * @author JAKE
 */
public class OrderTourDTO implements Serializable{
    private Customer cus;
    private OrderTour[] order;

    public Customer getCus() {
        return cus;
    }

    public void setCus(Customer cus) {
        this.cus = cus;
    }

    public OrderTour[] getOrder() {
        return order;
    }

    public void setOrder(OrderTour[] order) {
        this.order = order;
    }

    public OrderTourDTO() {
    }

    public OrderTourDTO(Customer cus, OrderTour[] order) {
        this.cus = cus;
        this.order = order;
    }




}
