/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package tuan.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author Anh Tuan
 */
@Entity
@Table(name = "Hotel", catalog = "E2W", schema = "dbo")
@NamedQueries({
    @NamedQuery(name = "Hotel.findAll", query = "SELECT h FROM Hotel h"),
    @NamedQuery(name = "Hotel.findByHotelID", query = "SELECT h FROM Hotel h WHERE h.hotelID = :hotelID"),
    @NamedQuery(name = "Hotel.findByHotelName", query = "SELECT h FROM Hotel h WHERE h.hotelName = :hotelName"),
    @NamedQuery(name = "Hotel.findByHotelStar", query = "SELECT h FROM Hotel h WHERE h.hotelStar = :hotelStar"),
    @NamedQuery(name = "Hotel.findByHotelStreet", query = "SELECT h FROM Hotel h WHERE h.hotelStreet = :hotelStreet"),
    @NamedQuery(name = "Hotel.findByHotelImage", query = "SELECT h FROM Hotel h WHERE h.hotelImage = :hotelImage"),
    @NamedQuery(name = "Hotel.findByHotelDescription", query = "SELECT h FROM Hotel h WHERE h.hotelDescription = :hotelDescription"),
    @NamedQuery(name = "Hotel.findByHotelPrice", query = "SELECT h FROM Hotel h WHERE h.hotelPrice = :hotelPrice"),
    @NamedQuery(name = "Hotel.findByIsDeleted", query = "SELECT h FROM Hotel h WHERE h.isDeleted = :isDeleted")})
public class Hotel implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "hotelID", nullable = false)
    @GeneratedValue
    private Integer hotelID;
    @Basic(optional = false)
    @Column(name = "hotelName", nullable = false, length = 50)
    private String hotelName;
    @Basic(optional = false)
    @Column(name = "hotelStar", nullable = false)
    private int hotelStar;
    @Basic(optional = false)
    @Column(name = "hotelStreet", nullable = false, length = 100)
    private String hotelStreet;
    @Basic(optional = false)
    @Column(name = "hotelImage", nullable = false, length = 50)
    private String hotelImage;
    @Basic(optional = false)
    @Column(name = "hotelDescription", nullable = false, length = 1000)
    private String hotelDescription;
    @Basic(optional = false)
    @Column(name = "hotelPrice", nullable = false)
    private int hotelPrice;
    @Basic(optional = false)
    @Column(name = "isDeleted", nullable = false)
    private boolean isDeleted;

    public Hotel() {
    }

    public Hotel(Integer hotelID) {
        this.hotelID = hotelID;
    }

    public Hotel(Integer hotelID, String hotelName, int hotelStar, String hotelStreet, String hotelImage, String hotelDescription, int hotelPrice, boolean isDeleted) {
        this.hotelID = hotelID;
        this.hotelName = hotelName;
        this.hotelStar = hotelStar;
        this.hotelStreet = hotelStreet;
        this.hotelImage = hotelImage;
        this.hotelDescription = hotelDescription;
        this.hotelPrice = hotelPrice;
        this.isDeleted = isDeleted;
    }

    public Hotel(String hotelName, int hotelStar, String hotelStreet, String hotelImage, String hotelDescription, int hotelPrice) {

        this.hotelName = hotelName;
        this.hotelStar = hotelStar;
        this.hotelStreet = hotelStreet;
        this.hotelImage = hotelImage;
        this.hotelDescription = hotelDescription;
        this.hotelPrice = hotelPrice;

    }

    public Integer getHotelID() {
        return hotelID;
    }

    public void setHotelID(Integer hotelID) {
        this.hotelID = hotelID;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public int getHotelStar() {
        return hotelStar;
    }

    public void setHotelStar(int hotelStar) {
        this.hotelStar = hotelStar;
    }

    public String getHotelStreet() {
        return hotelStreet;
    }

    public void setHotelStreet(String hotelStreet) {
        this.hotelStreet = hotelStreet;
    }

    public String getHotelImage() {
        return hotelImage;
    }

    public void setHotelImage(String hotelImage) {
        this.hotelImage = hotelImage;
    }

    public String getHotelDescription() {
        return hotelDescription;
    }

    public void setHotelDescription(String hotelDescription) {
        this.hotelDescription = hotelDescription;
    }

    public int getHotelPrice() {
        return hotelPrice;
    }

    public void setHotelPrice(int hotelPrice) {
        this.hotelPrice = hotelPrice;
    }

    public boolean getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (hotelID != null ? hotelID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Hotel)) {
            return false;
        }
        Hotel other = (Hotel) object;
        if ((this.hotelID == null && other.hotelID != null) || (this.hotelID != null && !this.hotelID.equals(other.hotelID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "tuan.entity.Hotel[hotelID=" + hotelID + "]";
    }

}
