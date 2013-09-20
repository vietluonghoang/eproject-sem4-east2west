/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package tuan.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Anh Tuan
 */
@Entity
@Table(name = "CarOrderDetail", catalog = "E2W", schema = "dbo")
@NamedQueries({
    @NamedQuery(name = "CarOrderDetail.findAll", query = "SELECT c FROM CarOrderDetail c"),
    @NamedQuery(name = "CarOrderDetail.findByCarOrderDetailID", query = "SELECT c FROM CarOrderDetail c WHERE c.carOrderDetailID = :carOrderDetailID"),
    @NamedQuery(name = "CarOrderDetail.findByQuantity", query = "SELECT c FROM CarOrderDetail c WHERE c.quantity = :quantity"),
    @NamedQuery(name = "CarOrderDetail.findByDriver", query = "SELECT c FROM CarOrderDetail c WHERE c.driver = :driver"),
    @NamedQuery(name = "CarOrderDetail.findByPickup", query = "SELECT c FROM CarOrderDetail c WHERE c.pickup = :pickup"),
    @NamedQuery(name = "CarOrderDetail.findByDropoff", query = "SELECT c FROM CarOrderDetail c WHERE c.dropoff = :dropoff"),
    @NamedQuery(name = "CarOrderDetail.findByTotalCost", query = "SELECT c FROM CarOrderDetail c WHERE c.totalCost = :totalCost"),
    @NamedQuery(name = "CarOrderDetail.findByOrderDate", query = "SELECT c FROM CarOrderDetail c WHERE c.orderDate = :orderDate"),
    @NamedQuery(name = "CarOrderDetail.findByStatus", query = "SELECT c FROM CarOrderDetail c WHERE c.status = :status")})
public class CarOrderDetail implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "carOrderDetailID", nullable = false)
    @GeneratedValue
    private Integer carOrderDetailID;
    @Basic(optional = false)
    @Column(name = "quantity", nullable = false)
    private int quantity;
    @Basic(optional = false)
    @Column(name = "driver", nullable = false)
    private boolean driver;
    @Basic(optional = false)
    @Column(name = "pickup", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date pickup;
    @Basic(optional = false)
    @Column(name = "dropoff", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date dropoff;
    @Basic(optional = false)
    @Column(name = "totalCost", nullable = false)
    private int totalCost;
    @Basic(optional = false)
    @Column(name = "orderDate", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date orderDate;
    @Basic(optional = false)
    @Column(name = "status", nullable = false, length = 50)
    private String status;
    @JoinColumn(name = "carOrderID", referencedColumnName = "carOrderID", nullable = false)
    @ManyToOne(optional = false)
    private CarOrder carOrder;
    @JoinColumn(name = "carID", referencedColumnName = "carID", nullable = false)
    @ManyToOne(optional = false)
    private Car car;

    public CarOrderDetail() {
    }

    public CarOrderDetail(Integer carOrderDetailID) {
        this.carOrderDetailID = carOrderDetailID;
    }

    public CarOrderDetail(Integer carOrderDetailID, int quantity, boolean driver, Date pickup, Date dropoff, int totalCost, Date orderDate, String status) {
        this.carOrderDetailID = carOrderDetailID;
        this.quantity = quantity;
        this.driver = driver;
        this.pickup = pickup;
        this.dropoff = dropoff;
        this.totalCost = totalCost;
        this.orderDate = orderDate;
        this.status = status;
    }

    public CarOrderDetail(int quantity, boolean driver, Date pickup, Date dropoff, int totalCost, Date orderDate, String status) {

        this.quantity = quantity;
        this.driver = driver;
        this.pickup = pickup;
        this.dropoff = dropoff;
        this.totalCost = totalCost;
        this.orderDate = orderDate;
        this.status = status;
    }

    public Integer getCarOrderDetailID() {
        return carOrderDetailID;
    }

    public void setCarOrderDetailID(Integer carOrderDetailID) {
        this.carOrderDetailID = carOrderDetailID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean getDriver() {
        return driver;
    }

    public void setDriver(boolean driver) {
        this.driver = driver;
    }

    public Date getPickup() {
        return pickup;
    }

    public void setPickup(Date pickup) {
        this.pickup = pickup;
    }

    public Date getDropoff() {
        return dropoff;
    }

    public void setDropoff(Date dropoff) {
        this.dropoff = dropoff;
    }

    public int getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(int totalCost) {
        this.totalCost = totalCost;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public CarOrder getCarOrder() {
        return carOrder;
    }

    public void setCarOrder(CarOrder carOrder) {
        this.carOrder = carOrder;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (carOrderDetailID != null ? carOrderDetailID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CarOrderDetail)) {
            return false;
        }
        CarOrderDetail other = (CarOrderDetail) object;
        if ((this.carOrderDetailID == null && other.carOrderDetailID != null) || (this.carOrderDetailID != null && !this.carOrderDetailID.equals(other.carOrderDetailID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "tuan.entity.CarOrderDetail[carOrderDetailID=" + carOrderDetailID + "]";
    }

}
