package service;

import entity.Accessoire;
import repository.DBRepository;
import repository.DBRepositoryAccessoire;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

public class VitaChiServiceAccessoire extends VitaChiService {

    @Inject
    DBRepository repo;

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public static String test() {
        return "VitaChi is in the room! Accessoire grüßt seine Schwestern und Brüder!";
    }

    // Liste aller Trainings senden
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List findAll() {
        return repo.findAll("Accessoire");
    }

    // Ein Training senden
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Object find(long id) {
        return repo.find("Accessoire", id);
    }

    // Ein Training löschen
    @DELETE
    public String deleteAccessoire(long id) {
        repo.delete(Accessoire.class, id);
        return "Accessoire deleted successfully!";
    }
}
