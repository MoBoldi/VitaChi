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
    private LocalDateTime dauer;
    private long userID;


    public Arbeit(){}

    public Arbeit(LocalDateTime startdatum, LocalDateTime dauer, int userID) {
        this.startdatum = startdatum;
        this.dauer = dauer;
        this.userID = userID;
    }

    public Arbeit(long arbeitID, LocalDateTime startdatum, LocalDateTime dauer, int userID) {
        this.arbeitID = arbeitID;
        this.startdatum = startdatum;
        this.dauer = dauer;
        this.userID = userID;
    }
    //<editor-fold desc="Getter und Setter">

    public LocalDateTime getStartdatum() {
        return startdatum;
    }

    public void setStartdatum(LocalDateTime startdatum) {
        this.startdatum = startdatum;
    }

    public LocalDateTime getDauer() {
        return dauer;
    }

    public void setDauer(LocalDateTime dauer) {
        this.dauer = dauer;
    }

    public long getUserID() {
        return userID;
    }

    public void setUserID(long userID) {
        this.userID = userID;
    }

    public long getArbeitID() {
        return arbeitID;
    }

    //</editor-fold>
}

