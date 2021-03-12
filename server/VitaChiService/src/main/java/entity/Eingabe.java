package entity;
import java.time.LocalDate;
import java.time.LocalDateTime;
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
    private LocalDate datum;


    public Eingabe(){}

    public Eingabe(int bewertung1, int bewertung2, String typ) {
        this.typ = typ;
        this.bewertung1 = bewertung1;
        this.bewertung2 = bewertung2;
        this.datum = LocalDate.now();
    }

    //<editor-fold desc="Getter und Setter">

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

