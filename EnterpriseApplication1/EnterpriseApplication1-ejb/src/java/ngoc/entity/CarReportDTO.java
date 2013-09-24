/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ngoc.entity;

/**
 *
 * @author Anh Tuan
 */
public class CarReportDTO {
    private int carID, quantityTotal, length;

    public CarReportDTO() {
    }

    public CarReportDTO(int carID, int quantityTotal) {
        this.carID = carID;
        this.quantityTotal = quantityTotal;
    }

    public int getCarID() {
        return carID;
    }

    public void setCarID(int carID) {
        this.carID = carID;
    }

    public int getQuantityTotal() {
        return quantityTotal;
    }

    public void setQuantityTotal(int quantityTotal) {
        this.quantityTotal = quantityTotal;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }
    
}
