/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package e2w.bean;

import e2w.dto.CartDTO;
import java.util.ArrayList;
import javax.ejb.Local;

/**
 *
 * @author JAKE
 */
@Local
public interface CartSessionBeanLocal {

    void addToCart(int tourID, int quantity);

    void removeFromCart(int tourID);

    ArrayList<CartDTO> getCart();

    void setCart(ArrayList<CartDTO> cart);

    void updateCart(int tourID, int quantity);

    int getTotalPriceInCart();

}
