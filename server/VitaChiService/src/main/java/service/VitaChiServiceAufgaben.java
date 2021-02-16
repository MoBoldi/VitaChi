package service;

import repository.DBRepository;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

public class VitaChiServiceAufgaben extends VitaChiService {

    @Inject
    DBRepository repo;

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public static String test() {
        return "VitaChi is in the room! Aufgabe grüßt seine Schwestern und Brüder!";
    }

    // Eine Aufgabe senden
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Object find(long id) {
        return repo.find("Aufgaben", id);
    }

    // Eine Aufgabe löschen
    @DELETE
    public String deleteAufgabe(long id) {
        repo.delete("Aufgaben", id);
        return "Aufgabe deleted successfully!";
    }
}
