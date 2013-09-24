/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package e2w.dto;

import e2w.enitites.OrderTour;
import e2w.enitites.OrderTourDetail;
import java.io.Serializable;

/**
 *
 * @author JAKE
 */
public class OrderTourDetailDTO implements Serializable{
private OrderTour order;
private OrderTourDetail[] detail;

    public OrderTourDetail[] getDetail() {
        return detail;
    }

    public void setDetail(OrderTourDetail[] detail) {
        this.detail = detail;
    }

    public OrderTour getOrder() {
        return order;
    }

    public void setOrder(OrderTour order) {
        this.order = order;
    }

    public OrderTourDetailDTO() {
    }

    public OrderTourDetailDTO(OrderTour order, OrderTourDetail[] detail) {
        this.order = order;
        this.detail = detail;
    }



}
