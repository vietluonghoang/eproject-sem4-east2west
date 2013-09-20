/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package e2w.enitites;

import java.io.Serializable;
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

/**
 *
 * @author JAKE
 */
@Entity
@Table(name = "OrderTourDetail", catalog = "E2W", schema = "dbo")
@NamedQueries({
    @NamedQuery(name = "OrderTourDetail.findAll", query = "SELECT o FROM OrderTourDetail o"),
    @NamedQuery(name = "OrderTourDetail.findByOrderTourDetailID", query = "SELECT o FROM OrderTourDetail o WHERE o.orderTourDetailID = :orderTourDetailID"),
    @NamedQuery(name = "OrderTourDetail.findByTourID", query = "SELECT o FROM OrderTourDetail o WHERE o.tourID = :tourID"),
    @NamedQuery(name = "OrderTourDetail.findByQuantity", query = "SELECT o FROM OrderTourDetail o WHERE o.quantity = :quantity")})
public class OrderTourDetail implements Serializable {
    private static final long serialVersionUID = 1L;
    @GeneratedValue
    @Id
    @Basic(optional = false)
    @Column(name = "orderTourDetailID", nullable = false)
    private Integer orderTourDetailID;
    @Column(name = "tourID")
    private Integer tourID;
    @Column(name = "quantity")
    private Integer quantity;
    @JoinColumn(name = "orderTourID", referencedColumnName = "orderTourID")
    @ManyToOne
    private OrderTour orderTour;

    public OrderTourDetail() {
    }

    public OrderTourDetail(Integer orderTourDetailID) {
        this.orderTourDetailID = orderTourDetailID;
    }

    public Integer getOrderTourDetailID() {
        return orderTourDetailID;
    }

    public void setOrderTourDetailID(Integer orderTourDetailID) {
        this.orderTourDetailID = orderTourDetailID;
    }

    public Integer getTourID() {
        return tourID;
    }

    public void setTourID(Integer tourID) {
        this.tourID = tourID;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public OrderTour getOrderTour() {
        return orderTour;
    }

    public void setOrderTour(OrderTour orderTour) {
        this.orderTour = orderTour;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderTourDetailID != null ? orderTourDetailID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderTourDetail)) {
            return false;
        }
        OrderTourDetail other = (OrderTourDetail) object;
        if ((this.orderTourDetailID == null && other.orderTourDetailID != null) || (this.orderTourDetailID != null && !this.orderTourDetailID.equals(other.orderTourDetailID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "e2w.enitites.OrderTourDetail[orderTourDetailID=" + orderTourDetailID + "]";
    }

}
