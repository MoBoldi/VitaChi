package entity;
import java.sql.Date;
import javax.persistence.*;
import java.time.*;

@Entity
@NamedQueries({
        @NamedQuery(name = "Accessoire.findAll", query = "SELECT a FROM Accessoire a")
})
public class Accessoire {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long accessoireID;

    private String bezeichnung;
    private String beschreibung;
    private int preis;
    private String details;
    private String bild_pfad;


    public Accessoire(){}

    public Accessoire(String bezeichnung, String beschreibung,int preis,String details, String bildPfad) {
        this.bezeichnung = bezeichnung;
        this.beschreibung = beschreibung;
        this.preis = preis;
        this. details=  details;
    }

    //<editor-fold desc="Getter und Setter">

    public String getBezeichnung() {
        return bezeichnung;
    }

    public void setBezeichnung(String bezeichnung) {
        this.bezeichnung = bezeichnung;
    }

    public String getBeschreibung() {
        return beschreibung;
    }

    public void setBeschreibung(String beschreibung) {
        this.beschreibung = beschreibung;
    }

    public int getPreis() {
        return preis;
    }

    public void setPreis(int preis) {
        this.preis = preis;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getBild_pfad() {
        return bild_pfad;
    }

    public void setBild_pfad(String bild_pfad) {
        this.bild_pfad = bild_pfad;
    }
    //</editor-fold>
}

