package service;

import repository.DBRepository;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

public class VitaChiServiceAccessoire extends VitaChiService {

    @Inject
    DBRepository repo;

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public static String test() {
        return "VitaChi is in the room! Accessoire grüßt seine Schwestern und Brüder!";
    }

    // Ein Accessoire senden
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Object find(long id) {
        return repo.find("Accessoire", id);
    }

    // Ein Accessoire löschen
    @DELETE
    public String deleteAccessoire(long id) {
        repo.delete("Accessoire", id);
        return "Accessoire deleted successfully!";
    }
}
