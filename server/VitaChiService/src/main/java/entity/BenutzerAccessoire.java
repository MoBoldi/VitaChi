package entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class BenutzerAccessoire {
    @Id
    @GeneratedValue
    private long benutzerAccessoireID;
    private long userID;
    private long accessoire;

    public BenutzerAccessoire() {
    }

    public BenutzerAccessoire(long userID, long accessoire) {
        this.userID = userID;
        this.accessoire = accessoire;
    }

    public long getBenutzerAccessoireID() {
        return benutzerAccessoireID;
    }

    public void setBenutzerAccessoireID(long benutzerAccessoireID) {
        this.benutzerAccessoireID = benutzerAccessoireID;
    }

    public long getUserID() {
        return userID;
    }

    public void setUserID(long userID) {
        this.userID = userID;
    }

    public long getAccessoire() {
        return accessoire;
    }

    public void setAccessoire(long accessoire) {
        this.accessoire = accessoire;
    }
}
