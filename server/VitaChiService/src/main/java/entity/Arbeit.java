package entity;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@NamedQueries({
        @NamedQuery(name = "Arbeit.findAll", query = "SELECT w FROM Arbeit w")
})
public class Arbeit {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long arbeitID;

    private LocalDateTime startdatum;
    private LocalDateTime enddatum;
    private long userID;


    public Arbeit(){}

    public Arbeit(LocalDateTime startdatum, LocalDateTime enddatum) {
        this.startdatum = startdatum;
        this.enddatum = enddatum;
    }

    //<editor-fold desc="Getter und Setter">

    public LocalDateTime getStartdatum() {
        return startdatum;
    }

    public void setStartdatum(LocalDateTime startdatum) {
        this.startdatum = startdatum;
    }

    public LocalDateTime getEnddatum() {
        return enddatum;
    }

    public void setEnddatum(LocalDateTime enddatum) {
        this.enddatum = enddatum;
    }

    public long getUserID() {
        return userID;
    }

    public void setUserID(long userID) {
        this.userID = userID;
    }

    //</editor-fold>
}

