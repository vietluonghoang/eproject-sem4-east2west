/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package e2w.bean;

import e2w.dto.CartDTO;
import e2w.enitites.Tour;
import java.util.ArrayList;
import javax.ejb.Stateful;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author JAKE
 */
@Stateful
public class CartSessionBean implements CartSessionBeanRemote, CartSessionBeanLocal {
    @PersistenceContext(unitName = "east2west-ejbPU")
    private EntityManager em;
    
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    private ArrayList<CartDTO> cart;

    public ArrayList<CartDTO> getCart() {
        return cart;
    }

    public void setCart(ArrayList<CartDTO> cart) {
        this.cart = cart;
    }

    public void persist(Object object) {
        em.persist(object);
    }

    public CartSessionBean() {
        cart = new ArrayList();
    }
/*
 Function add tour to cart
 */
    public void addToCart(int tourID, int quantity) {
        try {
            boolean check = false;
            Tour tour = em.find(Tour.class, tourID);
            
            if(cart.isEmpty()){//check cart if cart is empty,create new a new dto
                CartDTO dto = new CartDTO(tour, quantity);
                cart.add(dto);
                System.out.println("Tour has been added to cart");
            }else{
                for (int i = 0; i < cart.size(); i++) {//if cart is all ready have tours,check tourID and current quantity of tour to add new
                    CartDTO dtoCheck = (CartDTO) cart.get(i);
                    if(dtoCheck.getTour().getTourID()==tourID && quantity<=dtoCheck.getTour().getQuantityCurrent()){
                        dtoCheck.setQuantity(dtoCheck.getQuantity()+quantity);//if the tour is already available in cart,quantity will be added by 1
                        System.out.println("quantity of the same tour has been add");
                        check = true;
                    }
                }
            if(!check){//if the tourID is different to the current tourID,the cart will add a new object tour to cart

                        CartDTO dto = new CartDTO(tour, quantity);
                        cart.add(dto);
                        System.out.println("Add new tour to cart");

            }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void removeFromCart(int tourID) {
        
        try {
            for (int i = 0; i < cart.size(); i++) {//get all the object tour in the cart
                CartDTO dtoCheck = (CartDTO) cart.get(i);
                if(dtoCheck.getTour().getTourID()==tourID){//get the current tourID in the cart and remove
                    cart.remove(dtoCheck);
                    System.out.println("Remove tourID :"+dtoCheck.getTour().getTourID() +" from cart is success");
                }else{
                    System.out.println("Cannot remove tour from cart");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateCart(int tourID, int quantity) {
        System.out.println("update cart sessionbean ");
        try {
                 for (int i = 0; i < cart.size(); i++) {//get all the object Tour in the cart
                     System.out.println("cart size in sessionbean "+i);
                    CartDTO dtoCheck = (CartDTO) cart.get(i);
                    if(dtoCheck.getTour().getTourID()==tourID){//checking the tourID
                        dtoCheck.setQuantity(quantity);//update the quantity in the Cart
                        System.out.println("Update quantity of tourID:"+tourID+" in cart");
                    }
        } 
        }catch (Exception e) {
            e.printStackTrace();
    }
    }

    public int getTotalPriceInCart() {
        int total = 0;
        try {
            for (int i = 0; i < cart.size(); i++) {//get all the price in the cart
                    CartDTO dtoCheck = (CartDTO) cart.get(i);
                    total+=dtoCheck.getQuantity()*dtoCheck.getTour().getPrice();//calculate for the total price
                }
        } catch (Exception e) {
           e.printStackTrace();
        }
        return total;
    }
}
