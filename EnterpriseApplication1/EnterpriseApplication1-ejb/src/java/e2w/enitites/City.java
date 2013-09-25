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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author JAKE
 */
@Entity
@Table(name = "city", catalog = "E2W", schema = "dbo")
@NamedQueries({
    @NamedQuery(name = "City.findAll", query = "SELECT c FROM City c"),
    @NamedQuery(name = "City.findByCityID", query = "SELECT c FROM City c WHERE c.cityID = :cityID"),
    @NamedQuery(name = "City.findByCityName", query = "SELECT c FROM City c WHERE c.cityName = :cityName"),
    @NamedQuery(name = "City.findByCityImage", query = "SELECT c FROM City c WHERE c.cityImage = :cityImage"),
    @NamedQuery(name = "City.findByCityDescription", query = "SELECT c FROM City c WHERE c.cityDescription = :cityDescription")})
public class City implements Serializable {
    private static final long serialVersionUID = 1L;
    @GeneratedValue (strategy = GenerationType.SEQUENCE)
    @Id
    @Basic(optional = false)
    @Column(name = "cityID", nullable = false)
    private Integer cityID;
    @Basic(optional = false)
    @Column(name = "cityName", nullable = false, length = 50)
    private String cityName;
    @Basic(optional = false)
    @Column(name = "cityImage", nullable = false, length = 500)
    private String cityImage;
    @Basic(optional = false)
    @Column(name = "cityDescription", nullable = false, length = 100)
    private String cityDescription;

    public City() {
    }

    public City(Integer cityID) {
        this.cityID = cityID;
    }

    public City(Integer cityID, String cityName, String cityImage, String cityDescription) {
        this.cityID = cityID;
        this.cityName = cityName;
        this.cityImage = cityImage;
        this.cityDescription = cityDescription;
    }

    public Integer getCityID() {
        return cityID;
    }

    public void setCityID(Integer cityID) {
        this.cityID = cityID;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getCityImage() {
        return cityImage;
    }

    public void setCityImage(String cityImage) {
        this.cityImage = cityImage;
    }

    public String getCityDescription() {
        return cityDescription;
    }

    public void setCityDescription(String cityDescription) {
        this.cityDescription = cityDescription;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cityID != null ? cityID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof City)) {
            return false;
        }
        City other = (City) object;
        if ((this.cityID == null && other.cityID != null) || (this.cityID != null && !this.cityID.equals(other.cityID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "e2w.enitites.City[cityID=" + cityID + "]";
    }

}
