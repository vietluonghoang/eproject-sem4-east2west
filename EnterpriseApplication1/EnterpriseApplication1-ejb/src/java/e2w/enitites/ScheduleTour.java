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
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author JAKE
 */
@Entity
@Table(name = "ScheduleTour", catalog = "E2W", schema = "dbo")
@NamedQueries({
    @NamedQuery(name = "ScheduleTour.findAll", query = "SELECT s FROM ScheduleTour s"),
    @NamedQuery(name = "ScheduleTour.findByScheduleID", query = "SELECT s FROM ScheduleTour s WHERE s.scheduleID = :scheduleID")})
public class ScheduleTour implements Serializable {
    private static final long serialVersionUID = 1L;
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Id
    @Basic(optional = false)
    @Column(name = "scheduleID", nullable = false)
    private Integer scheduleID;
    @Lob
    @Column(name = "imageSchedule", length = 2147483647)
    private String imageSchedule;
    @Lob
    @Column(name = "description", length = 2147483647)
    private String description;
    @JoinColumn(name = "tourID", referencedColumnName = "tourID")
    @ManyToOne
    private Tour tour;

    public ScheduleTour() {
    }

    public ScheduleTour(Integer scheduleID) {
        this.scheduleID = scheduleID;
    }

    public Integer getScheduleID() {
        return scheduleID;
    }

    public void setScheduleID(Integer scheduleID) {
        this.scheduleID = scheduleID;
    }

    public String getImageSchedule() {
        return imageSchedule;
    }

    public void setImageSchedule(String imageSchedule) {
        this.imageSchedule = imageSchedule;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Tour getTour() {
        return tour;
    }

    public void setTour(Tour tour) {
        this.tour = tour;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (scheduleID != null ? scheduleID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ScheduleTour)) {
            return false;
        }
        ScheduleTour other = (ScheduleTour) object;
        if ((this.scheduleID == null && other.scheduleID != null) || (this.scheduleID != null && !this.scheduleID.equals(other.scheduleID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "e2w.enitites.ScheduleTour[scheduleID=" + scheduleID + "]";
    }

}
