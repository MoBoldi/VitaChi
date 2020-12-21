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

@ApplicationScoped
@Path("/vitaChi")
public class VitaChiService {

    @Inject
    DBRepository repo;

    @Path("test/{Entity}")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String test() {
        return "VitaChi is in the room!" + {{Entity}} + "grüßt seine Schwestern und Brüder!";
    }


    // Initialisiren der DB
    @Path("init/{Entity}")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String init() {
        repo.initDB();
        return "Datenbank Eingabe wurde initialisiert";
    }

    // Liste aller Trainings senden
    @Path("findAll/{Entity}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Training> findAll() {
        return repo.findAll();
    }

    // Ein Training senden
    @Path("find/{id}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Training findAll(@PathParam("id") long id) {
        return repo.find(id);
    }

    // Ein Training löschen
    @Path("delete/{id}")
    @DELETE
    public String deleteTraining(@PathParam("id") long id) {
        repo.delete(id);
        return "training deleted";
    }

    // Ein Training hinzufügen
    @Path("create")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Training createTraining(Training training) {
        repo.create(training);
        //System.out.println(training);
        return training;
    }

    // Ein Training ändern
    @Path("update")
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public String updateTraining(Training training) {
        repo.update(training);
        return "training updated";
    }
