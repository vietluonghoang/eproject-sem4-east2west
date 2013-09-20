/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package tuan.entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Anh Tuan
 */
@Entity
@Table(name = "Car", catalog = "E2W", schema = "dbo")
@NamedQueries({
    @NamedQuery(name = "Car.findAll", query = "SELECT c FROM Car c"),
    @NamedQuery(name = "Car.findByCarID", query = "SELECT c FROM Car c WHERE c.carID = :carID"),
    @NamedQuery(name = "Car.findByModel", query = "SELECT c FROM Car c WHERE c.model = :model"),
    @NamedQuery(name = "Car.findByType", query = "SELECT c FROM Car c WHERE c.type = :type"),
    @NamedQuery(name = "Car.findBySeat", query = "SELECT c FROM Car c WHERE c.seat = :seat"),
    @NamedQuery(name = "Car.findByAirConditioner", query = "SELECT c FROM Car c WHERE c.airConditioner = :airConditioner"),
    @NamedQuery(name = "Car.findByImage", query = "SELECT c FROM Car c WHERE c.image = :image"),
    @NamedQuery(name = "Car.findByQuantityStock", query = "SELECT c FROM Car c WHERE c.quantityStock = :quantityStock"),
    @NamedQuery(name = "Car.findByPrice", query = "SELECT c FROM Car c WHERE c.price = :price"),
    @NamedQuery(name = "Car.findByIsDeleted", query = "SELECT c FROM Car c WHERE c.isDeleted = :isDeleted")})
public class Car implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "carID", nullable = false)
    @GeneratedValue
    private Integer carID;
    @Basic(optional = false)
    @Column(name = "model", nullable = false, length = 50)
    private String model;
    @Basic(optional = false)
    @Column(name = "type", nullable = false, length = 50)
    private String type;
    @Basic(optional = false)
    @Column(name = "seat", nullable = false)
    private int seat;
    @Basic(optional = false)
    @Column(name = "airConditioner", nullable = false)
    private boolean airConditioner;
    @Basic(optional = false)
    @Lob
    @Column(name = "description", nullable = false, length = 2147483647)
    private String description;
    @Basic(optional = false)
    @Column(name = "image", nullable = false, length = 50)
    private String image;
    @Basic(optional = false)
    @Column(name = "quantityStock", nullable = false)
    private int quantityStock;
    @Basic(optional = false)
    @Column(name = "price", nullable = false)
    private int price;
    @Basic(optional = false)
    @Column(name = "isDeleted", nullable = false)
    private boolean isDeleted;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "car")
    private Collection<CarOrderDetail> carOrderDetailCollection;

    public Car() {
    }

    public Car(Integer carID) {
        this.carID = carID;
    }

    public Car(Integer carID, String model, String type, int seat, boolean airConditioner, String description, String image, int quantityStock, int price, boolean isDeleted) {
        this.carID = carID;
        this.model = model;
        this.type = type;
        this.seat = seat;
        this.airConditioner = airConditioner;
        this.description = description;
        this.image = image;
        this.quantityStock = quantityStock;
        this.price = price;
        this.isDeleted = isDeleted;
    }

    public Car(String model, String type, int seat, boolean airConditioner, String description, String image, int quantityStock, int price) {
        
        this.model = model;
        this.type = type;
        this.seat = seat;
        this.airConditioner = airConditioner;
        this.description = description;
        this.image = image;
        this.quantityStock = quantityStock;
        this.price = price;
    }

    public Integer getCarID() {
        return carID;
    }

    public void setCarID(Integer carID) {
        this.carID = carID;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getSeat() {
        return seat;
    }

    public void setSeat(int seat) {
        this.seat = seat;
    }

    public boolean getAirConditioner() {
        return airConditioner;
    }

    public void setAirConditioner(boolean airConditioner) {
        this.airConditioner = airConditioner;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantityStock() {
        return quantityStock;
    }

    public void setQuantityStock(int quantityStock) {
        this.quantityStock = quantityStock;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public boolean getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Collection<CarOrderDetail> getCarOrderDetailCollection() {
        return carOrderDetailCollection;
    }

    public void setCarOrderDetailCollection(Collection<CarOrderDetail> carOrderDetailCollection) {
        this.carOrderDetailCollection = carOrderDetailCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (carID != null ? carID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Car)) {
            return false;
        }
        Car other = (Car) object;
        if ((this.carID == null && other.carID != null) || (this.carID != null && !this.carID.equals(other.carID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "tuan.entity.Car[carID=" + carID + "]";
    }

}
