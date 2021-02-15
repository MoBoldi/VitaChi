package service;

import entity.Aufgaben;
import repository.DBRepository;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

public class VitaChiServiceAufgaben extends VitaChiService {
    @Inject
    DBRepository repo;

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public static String test() {
        return "VitaChi is in the room! Aufgaben grüßt seine Schwestern und Brüder!";
    }

    // Liste aller Trainings senden
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List findAll() {
        return repo.findAll("Aufgaben");
    }

    // Ein Training senden
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Object findAll(long id) {
        return repo.find('Aufgaben', id);
    }

    // Ein Training löschen
    @DELETE
    public String deleteAufgabe(long id) {
        repo.delete('Aufgaben', id);
        return "Aufgaben deleted successfully!";
    }

    // Ein Training hinzufügen
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Aufgaben createAufgabe(Aufgaben newAufgabe) {
        repo.create(newAufgabe);
        return newAufgabe;
    }

    // Ein Training ändern
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public String updateAufgabe(Aufgaben updateAufgabe) {
        repo.update(updateAufgabe);
        return "Aufgabe updated successfully!";
    }
}
