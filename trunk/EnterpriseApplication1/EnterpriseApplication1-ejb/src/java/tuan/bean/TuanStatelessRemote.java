/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package tuan.bean;

import javax.ejb.Remote;
import tuan.entity.Car;
import tuan.entity.Hotel;

/**
 *
 * @author Anh Tuan
 */
@Remote
public interface TuanStatelessRemote {
    public boolean insert(String model, String type, int seat, boolean air, String description, String image, int stock, int price);
    public tuan.entity.Car[] search(String ejbQL);
    public Car searchReturn1(int $carID);
    public boolean deleteCar(int $carID);
    public boolean updateCarWithImage(int carID, String model, String type, int seat, boolean air, String description, String image, int stock, int price);
    public boolean updateCarNoImage(int carID, String model, String type, int seat, boolean air, String description, int stock, int price);
    public tuan.entity.Hotel[] searchHotel(String ejbQL);
    public Hotel searchReturn1Hotel (int $hotelID);
    public boolean insertHotel(String name, String street, int star, String description, String image, int price);
    public boolean deleteHotel(int $hotelID);
    
}
