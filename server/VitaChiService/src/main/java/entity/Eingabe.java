package entity;
import java.sql.Date;
import javax.persistence.*;

@Entity
@NamedQueries({
        @NamedQuery(name = "Eingabe.findAll", query = "SELECT e FROM Eingabe e")
})
public class Eingabe {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long eingabeID;
    
    private String typ;
    private int bewertung1;
    private int bewertung2;
    private Date datum;


    public Eingabe(){}

    public Eingabe(long eingabeID, String typ, int bewertung1, int bewertung2, Date datum) {
        this.eingabeID = eingabeID;
        this.typ = typ;
        this.bewertung1 = bewertung1;
        this.bewertung2 = bewertung2;
        this.datum =  datum;
    }

    //<editor-fold desc="Getter und Setter">
    public long getEingabeID() {
        return eingabeID;
    }

    public void setEingabeID(long eingabeID) {
        this.eingabeID = eingabeID;
    }

    public String getTyp() {
        return typ;
    }

    public void setTyp(String typ) {
        this.typ = typ;
    }

    public int getBewertung1() {
        return bewertung1;
    }

    public void setBewertung1(int bewertung1) {
        this.bewertung1 = bewertung1;
    }

    public int getBewertung2() {
        return bewertung2;
    }

    public void setBewertung2(int bewertung2) {
        this.bewertung2 = bewertung2;
    }

    public Date getDatum() {
        return datum;
    }

    public void setDatum(Date datum) {
        this.datum = datum;
    }
    //</editor-fold>
}

