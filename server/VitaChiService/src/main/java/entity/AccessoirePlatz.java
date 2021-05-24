package entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@NamedQuery(name = AccessoirePlatz.FINDALLBYUSER, query = "SELECT ap FROM AccessoirePlatz as ap where ap.benutzer_id = :benutzer_id")
public class AccessoirePlatz implements Serializable {

    public static final String FINDALLBYUSER = "AccessoirePlatz.findAllByUser";

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long ap_id;

    private long benutzer_id;
    private long slot_it;
    private long accessoire_id;

    public AccessoirePlatz() {

    }

    public AccessoirePlatz(int userID, int slot_it, int accessoire_id) {
        this.benutzer_id = userID;
        this.slot_it = slot_it;
        this.accessoire_id = accessoire_id;
    }

    public long getAp_id() {
        return ap_id;
    }

    public void setAp_id(long ap_id) {
        this.ap_id = ap_id;
    }

    public long getBenutzer_id() {
        return benutzer_id;
    }

    public void setBenutzer_id(long benutzer_id) {
        this.benutzer_id = benutzer_id;
    }

    public long getSlot_it() {
        return slot_it;
    }

    public void setSlot_it(long slot_it) {
        this.slot_it = slot_it;
    }

    public long getAccessoire_id() {
        return accessoire_id;
    }

    public void setAccessoire_id(long accessoire_id) {
        this.accessoire_id = accessoire_id;
    }
}
