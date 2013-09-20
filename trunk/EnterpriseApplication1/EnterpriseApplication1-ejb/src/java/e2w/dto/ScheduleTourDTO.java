/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package e2w.dto;

import e2w.enitites.ScheduleTour;
import e2w.enitites.Tour;
import java.io.Serializable;

/**
 *
 * @author JAKE
 */
public class ScheduleTourDTO  implements Serializable{
private Tour  tour;
private ScheduleTour[] scheduleTour;

    public ScheduleTour[] getScheduleTour() {
        return scheduleTour;
    }

    public void setScheduleTour(ScheduleTour[] scheduleTour) {
        this.scheduleTour = scheduleTour;
    }

    public Tour getTour() {
        return tour;
    }

    public void setTour(Tour tour) {
        this.tour = tour;
    }

    public ScheduleTourDTO() {
    }

    public ScheduleTourDTO(Tour tour, ScheduleTour[] scheduleTour) {
        this.tour = tour;
        this.scheduleTour = scheduleTour;
    }

}
