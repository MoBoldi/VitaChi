package entity;

import javax.persistence.*;

@Entity
@NamedQueries(
        @NamedQuery(name = "AccessoircePlatz.findAllByUser", query = "SELECT ap FROM AccessoirePlatz ap where ap.benutzer_id = :benutzer_id")
)
public class AccessoirePlatz {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int ap_id;

    private int benutzer_id;
    private int slot_it;
    private int accessoire_id;

    public AccessoirePlatz() {

    }

    public int getAp_id() {
        return ap_id;
    }

    public void setAp_id(int ap_id) {
        this.ap_id = ap_id;
    }

    public int getBenutzer_id() {
        return benutzer_id;
    }

    public void setBenutzer_id(int benutzer_id) {
        this.benutzer_id = benutzer_id;
    }

    public int getSlot_it() {
        return slot_it;
    }

    public void setSlot_it(int slot_it) {
        this.slot_it = slot_it;
    }

    public int getAccessoire_id() {
        return accessoire_id;
    }

    public void setAccessoire_id(int accessoire_id) {
        this.accessoire_id = accessoire_id;
    }
}
