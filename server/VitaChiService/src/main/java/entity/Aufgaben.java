package entity;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@NamedQueries({
        @NamedQuery(name = "Aufgaben.findAll", query = "SELECT t FROM Aufgaben t")
})
public class Aufgaben {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long aufgabenID;

    private String bezeichnung;
    private LocalDate erstelldatum;
    private LocalDate enddatum;
    private char status;
    private long userID;


    public Aufgaben(){}

    public Aufgaben(String bezeichnung, LocalDate erstelldatum, LocalDate enddatum, char status, long userID) {
        this.bezeichnung = bezeichnung;
        this.erstelldatum = erstelldatum;
        this.enddatum = enddatum;
        this.status =  status;
        this.userID = userID;
    }

    //<editor-fold desc="Getter und Setter">

    public String getBezeichnung() {
        return bezeichnung;
    }

    public void setBezeichnung(String bezeichnung) {
        this.bezeichnung = bezeichnung;
    }

    public LocalDate getErstelldatum() {
        return erstelldatum;
    }

    public void setErstelldatum(LocalDate erstelldatum) {
        this.erstelldatum = erstelldatum;
    }

    public LocalDate getEnddatum() {
        return enddatum;
    }

    public void setEnddatum(LocalDate enddatum) {
        this.enddatum = enddatum;
    }

    public char getStatus() {
        return status;
    }

    public void setStatus(char status) {
        this.status = status;
    }

    public long getUserID() {
        return userID;
    }

    public void setUserID(long userID) {
        this.userID = userID;
    }

    //</editor-fold>
}

