package service;

import entity.Eingabe;
import entity.Accessoire;
import entity.Arbeit;
import entity.Aufgaben;
import org.jboss.resteasy.annotations.Query;
import repository.DBRepository;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

public class VitaChiServiceAccessoire extends VitaChiService {

    @Inject
    DBRepository repo;

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String test(String param) {
        return "VitaChi is in the room! " + param + " grüßt seine Schwestern und Brüder!";
    }

    // Liste aller Trainings senden
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List findAll(String param) {
        return repo.findAll(param);
    }

    // Ein Training senden
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Object findAll(long id) {
        return repo.find(Accessoire.class, id);
    }

    // Ein Training löschen
    @DELETE
    public String deleteTraining(long id) {
        repo.delete(id);
        return "training deleted";
    }

    // Ein Training hinzufügen
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Object createTraining(Object updateObject) {
        repo.create(updateObject);
        //System.out.println(training);
        return updateObject;
    }

    // Ein Training ändern
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public String updateTraining(Object updateObject) {
        repo.update(updateObject);
        return "training updated";
    }
}
