/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package e2w.dto;

import e2w.enitites.Tour;
import java.io.Serializable;
import java.util.ArrayList;


/**
 *
 * @author JAKE
 */
public class CartDTO implements Serializable{
    private Tour tour;
    private int quantity;

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Tour getTour() {
        return tour;
    }

    public void setTour(Tour tour) {
        this.tour = tour;
    }

    public CartDTO() {
    }

    public CartDTO(Tour tour, int quantity) {
        this.tour = tour;
        this.quantity = quantity;
    }

    

}
