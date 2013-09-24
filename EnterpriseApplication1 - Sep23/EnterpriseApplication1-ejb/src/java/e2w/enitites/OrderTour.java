/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package e2w.enitites;

import java.io.Serializable;
import java.util.Collection;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author JAKE
 */
@Entity
@Table(name = "OrderTour", catalog = "E2W", schema = "dbo")
@NamedQueries({
    @NamedQuery(name = "OrderTour.findAll", query = "SELECT o FROM OrderTour o"),
    @NamedQuery(name = "OrderTour.findByOrderTourID", query = "SELECT o FROM OrderTour o WHERE o.orderTourID = :orderTourID"),
    @NamedQuery(name = "OrderTour.findByOrderDate", query = "SELECT o FROM OrderTour o WHERE o.orderDate = :orderDate"),
    @NamedQuery(name = "OrderTour.findByTotalPrice", query = "SELECT o FROM OrderTour o WHERE o.totalPrice = :totalPrice"),
    @NamedQuery(name = "OrderTour.findByStatus", query = "SELECT o FROM OrderTour o WHERE o.status = :status")})
public class OrderTour implements Serializable {
    private static final long serialVersionUID = 1L;
    @GeneratedValue
    @Id
    @Basic(optional = false)
    @Column(name = "orderTourID", nullable = false)
    private Integer orderTourID;
    @Column(name = "orderDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date orderDate;
    @Column(name = "totalPrice", length = 20)
    private String totalPrice;
    @Column(name = "status", length = 10)
    private String status;
    @OneToMany(mappedBy = "orderTour")
    private Collection<CancelOrderTour> cancelOrderTourCollection;
    @JoinColumn(name = "userID", referencedColumnName = "userID")
    @ManyToOne
    private Customer customer;
    @OneToMany(mappedBy = "orderTour")
    private Collection<OrderTourDetail> orderTourDetailCollection;

    public OrderTour() {
    }

    public OrderTour(Integer orderTourID) {
        this.orderTourID = orderTourID;
    }

    public Integer getOrderTourID() {
        return orderTourID;
    }

    public void setOrderTourID(Integer orderTourID) {
        this.orderTourID = orderTourID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Collection<CancelOrderTour> getCancelOrderTourCollection() {
        return cancelOrderTourCollection;
    }

    public void setCancelOrderTourCollection(Collection<CancelOrderTour> cancelOrderTourCollection) {
        this.cancelOrderTourCollection = cancelOrderTourCollection;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Collection<OrderTourDetail> getOrderTourDetailCollection() {
        return orderTourDetailCollection;
    }

    public void setOrderTourDetailCollection(Collection<OrderTourDetail> orderTourDetailCollection) {
        this.orderTourDetailCollection = orderTourDetailCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderTourID != null ? orderTourID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderTour)) {
            return false;
        }
        OrderTour other = (OrderTour) object;
        if ((this.orderTourID == null && other.orderTourID != null) || (this.orderTourID != null && !this.orderTourID.equals(other.orderTourID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "e2w.enitites.OrderTour[orderTourID=" + orderTourID + "]";
    }

}
