/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ngoc.bean;

import javax.ejb.Remote;
import ngoc.entity.Car;
import ngoc.entity.Hotel;

/**
 *
 * @author Tuan Ngoc
 */
@Remote
public interface NgocStatelessRemote {
    public boolean insert(String model, String type, int seat, boolean air, String description, String image, int stock, int price);
    public ngoc.entity.Car[] search(String ejbQL);
    public Car searchReturn1(int $carID);
    public boolean deleteCar(int $carID);
    public boolean updateCarWithImage(int carID, String model, String type, int seat, boolean air, String description, String image, int stock, int price);
    public boolean updateCarNoImage(int carID, String model, String type, int seat, boolean air, String description, int stock, int price);
    public ngoc.entity.Hotel[] searchHotel(String ejbQL);
    public Hotel searchReturn1Hotel (int $hotelID);
    public boolean insertHotel(String name, String street, int star, String description, String image, int price);
    public boolean deleteHotel(int $hotelID);
    
}
