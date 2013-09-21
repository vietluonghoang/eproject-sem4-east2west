/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ngoc.entity;

import e2w.enitites.Customer;
import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Anh Tuan
 */
@Entity
@Table(name = "CarOrder", catalog = "E2W", schema = "dbo")
@NamedQueries({
    @NamedQuery(name = "CarOrder.findAll", query = "SELECT c FROM CarOrder c"),
    @NamedQuery(name = "CarOrder.findByCarOrderID", query = "SELECT c FROM CarOrder c WHERE c.carOrderID = :carOrderID"),
    @NamedQuery(name = "CarOrder.findByCreateDate", query = "SELECT c FROM CarOrder c WHERE c.createDate = :createDate"),
    @NamedQuery(name = "CarOrder.findByEndDate", query = "SELECT c FROM CarOrder c WHERE c.endDate = :endDate"),
    @NamedQuery(name = "CarOrder.findByStatus", query = "SELECT c FROM CarOrder c WHERE c.status = :status"),
    @NamedQuery(name = "CarOrder.findByOrderCost", query = "SELECT c FROM CarOrder c WHERE c.orderCost = :orderCost"),
    @NamedQuery(name = "CarOrder.findByRefund", query = "SELECT c FROM CarOrder c WHERE c.refund = :refund")})
public class CarOrder implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "carOrderID", nullable = false)
    @GeneratedValue
    private Integer carOrderID;
    @Basic(optional = false)
    @Column(name = "createDate", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "endDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date endDate;
    @Basic(optional = false)
    @Column(name = "status", nullable = false, length = 50)
    private String status;
    @Basic(optional = false)
    @Column(name = "orderCost", nullable = false)
    private int orderCost;
    @Column(name = "refund")
    private Integer refund;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "carOrder")
    private Collection<CarOrderDetail> carOrderDetailCollection;
    @JoinColumn(name = "userID", referencedColumnName = "userID", nullable = false)
    @ManyToOne(optional = false)
    private Customer customer;

    public CarOrder() {
    }

    public CarOrder(Integer carOrderID) {
        this.carOrderID = carOrderID;
    }

    public CarOrder(Integer carOrderID, Date createDate, String status, int orderCost) {
        this.carOrderID = carOrderID;
        this.createDate = createDate;
        this.status = status;
        this.orderCost = orderCost;
    }

    public Integer getCarOrderID() {
        return carOrderID;
    }

    public void setCarOrderID(Integer carOrderID) {
        this.carOrderID = carOrderID;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getOrderCost() {
        return orderCost;
    }

    public void setOrderCost(int orderCost) {
        this.orderCost = orderCost;
    }

    public Integer getRefund() {
        return refund;
    }

    public void setRefund(Integer refund) {
        this.refund = refund;
    }

    public Collection<CarOrderDetail> getCarOrderDetailCollection() {
        return carOrderDetailCollection;
    }

    public void setCarOrderDetailCollection(Collection<CarOrderDetail> carOrderDetailCollection) {
        this.carOrderDetailCollection = carOrderDetailCollection;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (carOrderID != null ? carOrderID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CarOrder)) {
            return false;
        }
        CarOrder other = (CarOrder) object;
        if ((this.carOrderID == null && other.carOrderID != null) || (this.carOrderID != null && !this.carOrderID.equals(other.carOrderID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "tuan.entity.CarOrder[carOrderID=" + carOrderID + "]";
    }

}
