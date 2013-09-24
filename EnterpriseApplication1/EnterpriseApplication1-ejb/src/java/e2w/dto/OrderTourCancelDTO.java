/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package e2w.dto;

import e2w.enitites.CancelOrderTour;
import e2w.enitites.OrderTour;
import java.io.Serializable;

/**
 *
 * @author JAKE
 */
public class OrderTourCancelDTO implements Serializable{
private OrderTour order;
private CancelOrderTour[] cancel;

    public CancelOrderTour[] getCancel() {
        return cancel;
    }

    public void setCancel(CancelOrderTour[] cancel) {
        this.cancel = cancel;
    }

    public OrderTour getOrder() {
        return order;
    }

    public void setOrder(OrderTour order) {
        this.order = order;
    }

    public OrderTourCancelDTO(OrderTour order, CancelOrderTour[] cancel) {
        this.order = order;
        this.cancel = cancel;
    }


}
