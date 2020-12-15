package entity;

import javax.persistence.Id;
import java.sql.Date;

public class Aufgaben {

    @Id
    private long aufgabenID;
    private String bezeichnung;
    private Date erstelldatum;
    private Date enddatum;
    private char status;



    public Aufgaben(){}

    public Aufgaben(long aufgabenID, String bezeichnung, Date erstelldatum, Date enddatum, char status) {
        this.aufgabenID = aufgabenID;
        this.bezeichnung = bezeichnung;
        this.erstelldatum = erstelldatum;
        this.enddatum = enddatum;
        this.status =  status;
    }

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
}

