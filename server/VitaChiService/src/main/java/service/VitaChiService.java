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
    public String test(@PathParam("Entity") String entity) {
        if(entity == "Accessoire") {
            return VitaChiServiceAccessoire.test();
        } else if (entity == "Arbeit") {
            return VitaChiServiceArbeit.test();
        } else if (entity == "Aufgaben") {
            return VitaChiServiceAufgaben.test();
        } else if (entity == "Eingabe") {
            return VitaChiServiceEingabe.test();
        } else {
            return "VitaChi is here, but there is no entity with this name!";
        }
    }

    // Liste aller Trainings senden
    @Path("findAll/{Entity}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List findAll(@PathParam("Entity") String param) {
        return repo.findAll(param);
    }

    // Ein Training senden
    @Path("find/{id}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Object findAll(@PathParam("id") long id) {
        return repo.find(id);
    }

    // Ein Training löschen
    @Path("delete/{Entity}/{id}")
    @DELETE
    public String deleteTraining(@PathParam("Entity") String param, @PathParam("id") long id) {
        repo.delete(id);
        return "training deleted";
    }

    // Ein Training hinzufügen
    @Path("create")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Object createTraining(Object updateObject) {
        repo.create(updateObject);
        //System.out.println(training);
        return updateObject;
    }

    // Ein Training ändern
    @Path("update")
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public String updateTraining(Object updateObject) {
        repo.update(updateObject);
        return "training updated";
    }
}
