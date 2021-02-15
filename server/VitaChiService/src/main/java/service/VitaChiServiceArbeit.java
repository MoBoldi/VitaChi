package service;

import entity.Arbeit;
import repository.DBRepository;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

public class VitaChiServiceArbeit extends VitaChiService {
    @Inject
    DBRepository repo;

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public static String test() {
        return "VitaChi is in the room! Arbeit grüßt seine Schwestern und Brüder!";
    }

    // Liste aller Trainings senden
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List findAll() {
        return repo.findAll("Arbeit");
    }

    // Ein Training senden
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Object find(long id) {
        return repo.find("Arbeit", id);
    }

    // Ein Training löschen
    @DELETE
    public String deleteArbeit(long id) {
        repo.delete("Arbeit", id);
        return "Arbeit deleted successfully!";
    }

    // Ein Training hinzufügen
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Arbeit createArbeit(Arbeit newArbeit) {
        repo.create(newArbeit);
        return newArbeit;
    }

    // Ein Training ändern
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public String updateArbeit(Arbeit updateArbeit) {
        repo.update(updateArbeit);
        return "Arbeit updated successfully!";
    }
}
