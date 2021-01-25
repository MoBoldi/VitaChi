package service;

import entity.Eingabe;
import repository.DBRepository;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

public class VitaChiServiceEingabe extends VitaChiService {
    @Inject
    DBRepository repo;

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public static String test() {
        return "VitaChi is in the room! Eingabe grüßt seine Schwestern und Brüder!";
    }

    // Liste aller Trainings senden
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List findAll() {
        return repo.findAll('Eingabe');
    }

    // Ein Training senden
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Object findAll(long id) {
        return repo.find('Eingabe', id);
    }

    // Ein Training löschen
    @DELETE
    public String deleteEingabe(long id) {
        repo.delete('Eingabe', id);
        return "Eingabe deleted successfully!";
    }

    // Ein Training hinzufügen
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Eingabe createEingabe(Eingabe newEingabe) {
        repo.create(newEingabe);
        return newEingabe;
    }

    // Ein Training ändern
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public String updateEingabe(Eingabe updateEingabe) {
        repo.update(updateEingabe);
        return "Eingabe updated successfully!";
    }
}
