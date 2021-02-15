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
    public List findAll(@PathParam("Entity") String entity) {
        if(entity == "Accessoire") {
            return VitaChiServiceAccessoire.findAll();
        } else if (entity == "Arbeit") {
            return VitaChiServiceArbeit.findAll();
        } else if (entity == "Aufgaben") {
            return VitaChiServiceAufgaben.findAll();
        } else if (entity == "Eingabe") {
            return VitaChiServiceEingabe.findAll();
        } else {
            return "VitaChi is here, but there is no entity with this name!";
        }
        return repo.findAll(param);
    }

    // Ein Training senden
    @Path("find/{Entity}/{id}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Object findAll(@PathParam("Entity") String entity, @PathParam("id") long id) {
        if(entity == "Accessoire") {
            return VitaChiServiceAccessoire.find(id);
        } else if (entity == "Arbeit") {
            return VitaChiServiceArbeit.find(id);
        } else if (entity == "Aufgaben") {
            return VitaChiServiceAufgaben.find(id);
        } else if (entity == "Eingabe") {
            return VitaChiServiceEingabe.find(id);
        } else {
            return "VitaChi is here, but there is no entity with this name!";
        }
    }

    // Ein Training löschen
    @Path("delete/{Entity}/{id}")
    @DELETE
    public String deleteTraining(@PathParam("Entity") String entity, @PathParam("id") long id) {
        if(entity == "Accessoire") {
            return VitaChiServiceAccessoire.delete(id);
        } else if (entity == "Arbeit") {
            return VitaChiServiceArbeit.delete(id);
        } else if (entity == "Aufgaben") {
            return VitaChiServiceAufgaben.delete(id);
        } else if (entity == "Eingabe") {
            return VitaChiServiceEingabe.delete(id);
        } else {
            return "VitaChi is here, but there is no entity with this name!";
        }
    }

    // Ein Training hinzufügen
    @Path("create")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Object createTraining(Object newObject) {
        repo.create(newObject);
        //System.out.println(training);
        return newObject;
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
