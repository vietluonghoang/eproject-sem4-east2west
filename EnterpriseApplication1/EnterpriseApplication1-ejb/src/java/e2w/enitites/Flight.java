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
@Table(name = "Flight", catalog = "E2W", schema = "dbo")
@NamedQueries({
    @NamedQuery(name = "Flight.findAll", query = "SELECT f FROM Flight f"),
    @NamedQuery(name = "Flight.findByFlightID", query = "SELECT f FROM Flight f WHERE f.flightID = :flightID"),
    @NamedQuery(name = "Flight.findByFlightBranch", query = "SELECT f FROM Flight f WHERE f.flightBranch = :flightBranch"),
    @NamedQuery(name = "Flight.findByAvailableDate", query = "SELECT f FROM Flight f WHERE f.availableDate = :availableDate"),
    @NamedQuery(name = "Flight.findByExpiredDate", query = "SELECT f FROM Flight f WHERE f.expiredDate = :expiredDate"),
    @NamedQuery(name = "Flight.findByTakingOfAirP", query = "SELECT f FROM Flight f WHERE f.takingOfAirP = :takingOfAirP"),
    @NamedQuery(name = "Flight.findByLandingAirP", query = "SELECT f FROM Flight f WHERE f.landingAirP = :landingAirP"),
    @NamedQuery(name = "Flight.findByTakingOfTime", query = "SELECT f FROM Flight f WHERE f.takingOfTime = :takingOfTime"),
    @NamedQuery(name = "Flight.findByLandingTime", query = "SELECT f FROM Flight f WHERE f.landingTime = :landingTime"),
    @NamedQuery(name = "Flight.findByPrice", query = "SELECT f FROM Flight f WHERE f.price = :price")})
public class Flight implements Serializable {
    private static final long serialVersionUID = 1L;
    @GeneratedValue
    @Id
    @Basic(optional = false)
    @Column(name = "flightID", nullable = false)
    private Integer flightID;
    @Column(name = "flightBranch", length = 50)
    private String flightBranch;
    @Column(name = "availableDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date availableDate;
    @Column(name = "expiredDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date expiredDate;
    @Column(name = "takingOfAirP", length = 20)
    private String takingOfAirP;
    @Column(name = "landingAirP", length = 20)
    private String landingAirP;
    @Column(name = "takingOfTime", length = 10)
    private String takingOfTime;
    @Column(name = "landingTime", length = 10)
    private String landingTime;
    @Column(name = "price")
    private Integer price;

    public Flight() {
    }

    public Flight(Integer flightID) {
        this.flightID = flightID;
    }

    public Integer getFlightID() {
        return flightID;
    }

    public void setFlightID(Integer flightID) {
        this.flightID = flightID;
    }

    public String getFlightBranch() {
        return flightBranch;
    }

    public void setFlightBranch(String flightBranch) {
        this.flightBranch = flightBranch;
    }

    public Date getAvailableDate() {
        return availableDate;
    }

    public void setAvailableDate(Date availableDate) {
        this.availableDate = availableDate;
    }

    public Date getExpiredDate() {
        return expiredDate;
    }

    public void setExpiredDate(Date expiredDate) {
        this.expiredDate = expiredDate;
    }

    public String getTakingOfAirP() {
        return takingOfAirP;
    }

    public void setTakingOfAirP(String takingOfAirP) {
        this.takingOfAirP = takingOfAirP;
    }

    public String getLandingAirP() {
        return landingAirP;
    }

    public void setLandingAirP(String landingAirP) {
        this.landingAirP = landingAirP;
    }

    public String getTakingOfTime() {
        return takingOfTime;
    }

    public void setTakingOfTime(String takingOfTime) {
        this.takingOfTime = takingOfTime;
    }

    public String getLandingTime() {
        return landingTime;
    }

    public void setLandingTime(String landingTime) {
        this.landingTime = landingTime;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (flightID != null ? flightID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Flight)) {
            return false;
        }
        Flight other = (Flight) object;
        if ((this.flightID == null && other.flightID != null) || (this.flightID != null && !this.flightID.equals(other.flightID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "e2w.enitites.Flight[flightID=" + flightID + "]";
    }

}
