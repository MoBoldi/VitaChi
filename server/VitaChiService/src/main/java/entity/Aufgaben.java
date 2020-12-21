package entity;

import javax.persistence.*;
import java.sql.Date;

@Entity
@NamedQueries({
        @NamedQuery(name = "Aufgaben.findAll", query = "SELECT t FROM Aufgaben t")
})
public class Aufgaben {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long aufgabenID;

    private String bezeichnung;
    private Date erstelldatum;
    private Date enddatum;
    private char status;
    private long userID;


    public Aufgaben(){}

    public Aufgaben(long aufgabenID, String bezeichnung, Date erstelldatum, Date enddatum, char status, long userID) {
        this.aufgabenID = aufgabenID;
        this.bezeichnung = bezeichnung;
        this.erstelldatum = erstelldatum;
        this.enddatum = enddatum;
        this.status =  status;
        this.userID = userID;
    }

    //<editor-fold desc="Getter und Setter">
    public long getAufgabenID() {
        return aufgabenID;
    }

    public void setAufgabenID(long aufgabenID) {
        this.aufgabenID = aufgabenID;
    }

    public String getBezeichnung() {
        return bezeichnung;
    }

    public void setBezeichnung(String bezeichnung) {
        this.bezeichnung = bezeichnung;
    }

    public Date getErstelldatum() {
        return erstelldatum;
    }

    public void setErstelldatum(Date erstelldatum) {
        this.erstelldatum = erstelldatum;
    }

    public Date getEnddatum() {
        return enddatum;
    }

    public void setEnddatum(Date enddatum) {
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

