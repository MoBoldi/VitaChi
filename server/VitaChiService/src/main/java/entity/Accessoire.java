package entity;
import java.sql.Date;
import javax.persistence.*;
import java.time.*;

public class Accessoire {

    @Id
    private long accessoireID;
    private String bezeichnung;
    private String beschreibung;
    private int preis;
    private String details;
    private String bild_pfad;



    public Accessoire(){}

    public Accessoire(long accessoireID, String bezeichnung, String beschreibung,int preis,String details, String bildPfad) {
        this.accessoireID = accessoireID;
        this.bezeichnung = bezeichnung;
        this.beschreibung = beschreibung;
        this.preis = preis;
        this. details=  details;
    }

    public long getAccessoireID() {
        return accessoireID;
    }

    public void setAccessoireID(long accessoireID) {
        this.accessoireID = accessoireID;
    }

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
}

