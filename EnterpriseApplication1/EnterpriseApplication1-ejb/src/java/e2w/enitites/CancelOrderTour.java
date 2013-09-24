/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package e2w.enitites;

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
 * @author JAKE
 */
@Entity
@Table(name = "CancelOrderTour", catalog = "E2W", schema = "dbo")
@NamedQueries({
    @NamedQuery(name = "CancelOrderTour.findAll", query = "SELECT c FROM CancelOrderTour c"),
    @NamedQuery(name = "CancelOrderTour.findByCancelOrderTourID", query = "SELECT c FROM CancelOrderTour c WHERE c.cancelOrderTourID = :cancelOrderTourID"),
    @NamedQuery(name = "CancelOrderTour.findByCancelTourDate", query = "SELECT c FROM CancelOrderTour c WHERE c.cancelTourDate = :cancelTourDate"),
    @NamedQuery(name = "CancelOrderTour.findByRefund", query = "SELECT c FROM CancelOrderTour c WHERE c.refund = :refund")})
public class CancelOrderTour implements Serializable {
    private static final long serialVersionUID = 1L;
    @GeneratedValue
    @Id
    @Basic(optional = false)
    @Column(name = "cancelOrderTourID", nullable = false)
    private Integer cancelOrderTourID;
    @Column(name = "cancelTourDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date cancelTourDate;
    @Column(name = "refund", length = 10)
    private String refund;
    @JoinColumn(name = "orderTourID", referencedColumnName = "orderTourID")
    @ManyToOne
    private OrderTour orderTour;

    public CancelOrderTour() {
    }

    public CancelOrderTour(Integer cancelOrderTourID) {
        this.cancelOrderTourID = cancelOrderTourID;
    }

    public Integer getCancelOrderTourID() {
        return cancelOrderTourID;
    }

    public void setCancelOrderTourID(Integer cancelOrderTourID) {
        this.cancelOrderTourID = cancelOrderTourID;
    }

    public Date getCancelTourDate() {
        return cancelTourDate;
    }

    public void setCancelTourDate(Date cancelTourDate) {
        this.cancelTourDate = cancelTourDate;
    }

    public String getRefund() {
        return refund;
    }

    public void setRefund(String refund) {
        this.refund = refund;
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
        hash += (cancelOrderTourID != null ? cancelOrderTourID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CancelOrderTour)) {
            return false;
        }
        CancelOrderTour other = (CancelOrderTour) object;
        if ((this.cancelOrderTourID == null && other.cancelOrderTourID != null) || (this.cancelOrderTourID != null && !this.cancelOrderTourID.equals(other.cancelOrderTourID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "e2w.enitites.CancelOrderTour[cancelOrderTourID=" + cancelOrderTourID + "]";
    }

}
