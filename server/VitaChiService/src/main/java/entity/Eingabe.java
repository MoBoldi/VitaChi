package entity;
import java.time.LocalDate;
import java.time.LocalDateTime;
import javax.inject.Named;
import javax.persistence.*;

@Entity
@NamedQueries({
        @NamedQuery(name = "Eingabe.findAll", query = "SELECT (avg(e.bewertung1) + avg(e.bewertung2))/2 FROM Eingabe e where e.userid=?1"),
        @NamedQuery(name = "Eingabe.findEssen", query = "SELECT (avg(e.bewertung1) + avg(e.bewertung2))/2 FROM Eingabe e where e.typ='Essen' and e.userid=?1"),
        @NamedQuery(name = "Eingabe.findBewegung", query = "SELECT (avg(e.bewertung1) + avg(e.bewertung2))/2 FROM Eingabe e where e.typ='Bewegung'and e.userid= :uid"),
        @NamedQuery(name = "Eingabe.findSchlaf", query = "SELECT (avg(e.bewertung1) + avg(e.bewertung2))/2 FROM Eingabe e where e.typ='Schlaf'and e.userid= :uid"),
        @NamedQuery(name = "Eingabe.findByType", query = "SELECT e from Eingabe e where e.typ = :type and e.userid = :userID"),
        @NamedQuery(name = "Eingabe.getStats", query = "SELECT count(e.bewertung1), count(e.bewertung2) FROM Eingabe e where e.typ = :type"),
})
public class Eingabe {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long eingabeID;

    private String typ;
    private int bewertung1;
    private int bewertung2;
    private LocalDate datum;
    private int userid;


    public Eingabe(){}

    public Eingabe(int bewertung1, int bewertung2, String typ, int userid) {
        this.typ = typ;
        this.bewertung1 = bewertung1;
        this.bewertung2 = bewertung2;
        this.datum = LocalDate.now();
        this.userid = userid;
    }

    //<editor-fold desc="Getter und Setter">


    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getTyp() {
        return typ;
    }

    public void setTyp(String typ) {
        this.typ = typ;
    }

    public double getBewertung1() {
        return bewertung1;
    }

    public void setBewertung1(int bewertung1) {
        this.bewertung1 = bewertung1;
    }

    public double getBewertung2() {
        return bewertung2;
    }

    public void setBewertung2(int bewertung2) {
        this.bewertung2 = bewertung2;
    }

    public LocalDate getDatum() {
        return datum;
    }

    public void setDatum(LocalDate datum) {
        this.datum = datum;
    }

    //</editor-fold>
}

