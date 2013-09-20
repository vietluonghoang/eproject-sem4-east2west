/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package tuan.entity;

/**
 *
 * @author Anh Tuan
 */
public class OrderDetailDTO {
    private CarOrder carOrder;
    private CarOrderDetail[] carOrderDetails;

    public OrderDetailDTO() {
    }

    public OrderDetailDTO(CarOrder carOrder, CarOrderDetail[] carOrderDetails) {
        this.carOrder = carOrder;
        this.carOrderDetails = carOrderDetails;
    }

    public CarOrder getCarOrder() {
        return carOrder;
    }

    public void setCarOrder(CarOrder carOrder) {
        this.carOrder = carOrder;
    }

    public CarOrderDetail[] getCarOrderDetails() {
        return carOrderDetails;
    }

    public void setCarOrderDetails(CarOrderDetail[] carOrderDetails) {
        this.carOrderDetails = carOrderDetails;
    }
    
}
