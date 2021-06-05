package entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@NamedQueries({
        @NamedQuery(name = "UserEnt.findUser", query = "SELECT userId from UserEnt where keycloakId = :keycloakId"),
        @NamedQuery(name = "UserEnt.findUserById", query = "SELECT user from UserEnt as user where user.userId = :userId")
})
public class UserEnt implements Serializable {

    public static final String findUserById = "UserEnt.findUserById";

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long userId;

    private String keycloakId;

    private long coins;

    public UserEnt() {}

    public UserEnt(String keycloakId) {
        this.keycloakId = keycloakId;
        this.coins = 1000;
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

    public long getCoins() {
        return coins;
    }

    public void setCoins(long coins) {
        this.coins = coins;
    }

    //</editor-fold>
}
