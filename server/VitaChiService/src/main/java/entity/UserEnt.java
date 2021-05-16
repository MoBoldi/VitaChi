package entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@NamedQueries({
        @NamedQuery(name = "UserEnt.findUser", query = "SELECT userId from UserEnt where keycloakId = :keycloakId"),
})
public class UserEnt implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long userId;

    private String keycloakId;

    public UserEnt() {}

    public UserEnt(String keycloakId) {
        this.keycloakId = keycloakId;
    }

    //<editor-fold desc="Getter und Setter">

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getKeycloakId() {
        return keycloakId;
    }

    public void setKeycloakId(String keycloakId) {
        this.keycloakId = keycloakId;
    }

    //</editor-fold>
}
