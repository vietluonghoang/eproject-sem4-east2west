/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package e2w.enitites;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author JAKE
 */
@Entity
@Table(name = "Tour", catalog = "E2W", schema = "dbo")
@NamedQueries({
    @NamedQuery(name = "Tour.findAll", query = "SELECT t FROM Tour t"),
    @NamedQuery(name = "Tour.findByTourID", query = "SELECT t FROM Tour t WHERE t.tourID = :tourID"),
    @NamedQuery(name = "Tour.findByTourName", query = "SELECT t FROM Tour t WHERE t.tourName = :tourName"),
    @NamedQuery(name = "Tour.findByStartDate", query = "SELECT t FROM Tour t WHERE t.startDate = :startDate"),
    @NamedQuery(name = "Tour.findByEndDate", query = "SELECT t FROM Tour t WHERE t.endDate = :endDate"),
    @NamedQuery(name = "Tour.findByStartLocation", query = "SELECT t FROM Tour t WHERE t.startLocation = :startLocation"),
    @NamedQuery(name = "Tour.findByEndLocation", query = "SELECT t FROM Tour t WHERE t.endLocation = :endLocation"),
    @NamedQuery(name = "Tour.findByQuantityMin", query = "SELECT t FROM Tour t WHERE t.quantityMin = :quantityMin"),
    @NamedQuery(name = "Tour.findByQuantityMax", query = "SELECT t FROM Tour t WHERE t.quantityMax = :quantityMax"),
    @NamedQuery(name = "Tour.findByPrice", query = "SELECT t FROM Tour t WHERE t.price = :price"),
    @NamedQuery(name = "Tour.findByStatus", query = "SELECT t FROM Tour t WHERE t.status = :status"),
    @NamedQuery(name = "Tour.findByQuantityCurrent", query = "SELECT t FROM Tour t WHERE t.quantityCurrent = :quantityCurrent")})
public class Tour implements Serializable {
    private static final long serialVersionUID = 1L;
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Id
    @Basic(optional = false)
    @Column(name = "tourID", nullable = false)
    private Integer tourID;
    @Column(name = "tourName", length = 50)
    private String tourName;
    @Lob
    @Column(name = "imageTour", length = 2147483647)
    private String imageTour;
    @Column(name = "startDate", length = 50)
    private String startDate;
    @Column(name = "endDate", length = 50)
    private String endDate;
    @Column(name = "startLocation", length = 50)
    private String startLocation;
    @Column(name = "endLocation", length = 50)
    private String endLocation;
    @Column(name = "quantityMin")
    private Integer quantityMin;
    @Column(name = "quantityMax")
    private Integer quantityMax;
    @Column(name = "price")
    private Integer price;
    @Column(name = "status", length = 50)
    private String status;
    @Column(name = "quantityCurrent")
    private Integer quantityCurrent;
    @Lob
    @Column(name = "description", length = 2147483647)
    private String descripton;
    @OneToMany(mappedBy = "tour")
    private Collection<ScheduleTour> scheduleTourCollection;

    public Tour() {
    }

    public Tour(Integer tourID) {
        this.tourID = tourID;
    }

    public Integer getTourID() {
        return tourID;
    }

    public void setTourID(Integer tourID) {
        this.tourID = tourID;
    }

    public String getTourName() {
        return tourName;
    }

    public void setTourName(String tourName) {
        this.tourName = tourName;
    }

    public String getImageTour() {
        return imageTour;
    }

    public void setImageTour(String imageTour) {
        this.imageTour = imageTour;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getStartLocation() {
        return startLocation;
    }

    public void setStartLocation(String startLocation) {
        this.startLocation = startLocation;
    }

    public String getEndLocation() {
        return endLocation;
    }

    public void setEndLocation(String endLocation) {
        this.endLocation = endLocation;
    }

    public Integer getQuantityMin() {
        return quantityMin;
    }

    public void setQuantityMin(Integer quantityMin) {
        this.quantityMin = quantityMin;
    }

    public Integer getQuantityMax() {
        return quantityMax;
    }

    public void setQuantityMax(Integer quantityMax) {
        this.quantityMax = quantityMax;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getQuantityCurrent() {
        return quantityCurrent;
    }

    public void setQuantityCurrent(Integer quantityCurrent) {
        this.quantityCurrent = quantityCurrent;
    }

    public String getDescripton() {
        return descripton;
    }

    public void setDescripton(String descripton) {
        this.descripton = descripton;
    }

    public Collection<ScheduleTour> getScheduleTourCollection() {
        return scheduleTourCollection;
    }

    public void setScheduleTourCollection(Collection<ScheduleTour> scheduleTourCollection) {
        this.scheduleTourCollection = scheduleTourCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (tourID != null ? tourID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tour)) {
            return false;
        }
        Tour other = (Tour) object;
        if ((this.tourID == null && other.tourID != null) || (this.tourID != null && !this.tourID.equals(other.tourID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "e2w.enitites.Tour[tourID=" + tourID + "]";
    }

}
