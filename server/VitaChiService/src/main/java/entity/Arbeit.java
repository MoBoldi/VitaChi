package entity;

import javax.persistence.*;
import java.sql.Date;

@Entity
@NamedQueries({
        @NamedQuery(name = "Arbeit.findAll", query = "SELECT w FROM Arbeit w")
})
public class Arbeit {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long arbeitID;

    private Date startdatum;
    private Date enddatum;


    public Arbeit(){}

    public Arbeit(long arbeitID, Date startdatum, Date enddatum) {
        this.arbeitID = arbeitID;
        this.startdatum = startdatum;
        this.enddatum = enddatum;
    }

    //<editor-fold desc="Getter und Setter">
    public long getArbeitID() {
        return arbeitID;
    }

    public void setArbeitID(long arbeitID) {
        this.arbeitID = arbeitID;
    }

    public Date getStartdatum() {
        return startdatum;
    }

    public void setStartdatum(Date startdatum) {
        this.startdatum = startdatum;
    }

    public Date getEnddatum() {
        return enddatum;
    }

    public void setEnddatum(Date enddatum) {
        this.enddatum = enddatum;
    }
    //</editor-fold>
}

