package service;

import repository.DBRepository;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

public class VitaChiServiceEingabe extends VitaChiService {

    @Inject
    DBRepository repo;

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public static String test() {
        return "VitaChi is in the room! Eingabe grüßt seine Schwestern und Brüder!";
    }

    // Eine Eingabe senden
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Object find(long id) {
        return repo.find("Eingabe", id);
    }

    // Eine Eingabe löschen
    @DELETE
    public String deleteEingabe(long id) {
        repo.delete("Eingabe", id);
        return "Eingabe deleted successfully!";
    }
}
