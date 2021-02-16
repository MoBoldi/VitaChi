package service;

import repository.DBRepository;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

public class VitaChiServiceArbeit extends VitaChiService {

    @Inject
    DBRepository repo;

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public static String test() {
        return "VitaChi is in the room! Arbeit grüßt seine Schwestern und Brüder!";
    }

    // Eine Arbeit senden
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Object find(long id) {
        return repo.find("Arbeit", id);
    }

    // Eine Arbeit löschen
    @DELETE
    public String deleteArbeit(long id) {
        repo.delete("Arbeit", id);
        return "Arbeit deleted successfully!";
    }
}
