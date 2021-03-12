package service;

import entity.Eingabe;
import entity.Accessoire;
import entity.Arbeit;
import entity.Aufgaben;
import org.jboss.resteasy.annotations.Query;
import repository.DBRepository;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.json.JsonObject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

@ApplicationScoped
@Path("/vitaChi")
public class VitaChiService {
    @Inject
    DBRepository repo;

    VitaChiServiceAccessoire accessoire;
    VitaChiServiceArbeit arbeit;
    VitaChiServiceAufgaben aufgaben;
    VitaChiServiceEingabe eingabe;

    @Path("test/{Entity}")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String test(@PathParam("Entity") String entity) {
        if(entity.equals("Accessoire")) {
            return accessoire.test();
        } else if (entity.equals("Arbeit")) {
            return arbeit.test();
        } else if (entity.equals("Aufgaben")) {
            return aufgaben.test();
        } else if (entity.equals("Eingabe")) {
            return eingabe.test();
        } else {
            return "VitaChi is here, but there is no entity with this name!";
        }
    }

    // Liste aller Objekte je nach Entität senden
    @Path("findAll/{Entity}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Accessoire> findAll(@PathParam("Entity") String entity) {
        return repo.findAll(entity);
    }

    // Ein Objekt je nach Entität senden
    @Path("find/{Entity}/{id}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Object find(@PathParam("Entity") String entity, @PathParam("id") long id) {
        if(entity == "Accessoire") {
            return accessoire.find(id);
        } else if (entity == "Arbeit") {
            return arbeit.find(id);
        } else if (entity == "Aufgaben") {
            return aufgaben.find(id);
        } else if (entity == "Eingabe") {
            return eingabe.find(id);
        } else {
            return "VitaChi is here, but there is no entity with this name!";
        }
    }

    // Ein Objekt je nach Entität löschen
    @Path("delete/{Entity}/{id}")
    @DELETE
    public String deleteObject(@PathParam("Entity") String entity, @PathParam("id") long id) {
        if(entity == "Accessoire") {
            return accessoire.deleteAccessoire(id);
        } else if (entity == "Arbeit") {
            return arbeit.deleteArbeit(id);
        } else if (entity == "Aufgaben") {
            return aufgaben.deleteAufgabe(id);
        } else if (entity == "Eingabe") {
            return eingabe.deleteEingabe(id);
        } else {
            return "VitaChi is here, but there is no entity with this name!";
        }
    }

    // Ein Objekt je nach Typ des übergebenen Obejekts hinzufügen
    @Path("createEingabe")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public JsonObject createEingabe(JsonObject json) {

        repo.createEingabe(new Eingabe(
                json.getJsonObject("eingabe").getInt("bewertung1"),
                json.getJsonObject("eingabe").getInt("bewertung2"),
                json.getJsonObject("eingabe").getString("typ")
        ));

        return json;
    }

    // Ein Objekt je nach Typ des übergebenen Obejekts hinzufügen
    @Path("createAufgabe")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Object createAufgaben(Aufgaben newAufgabe) {
        repo.createAufgabe(newAufgabe);
        return newAufgabe;
    }

    // Ein Objekt je nach Typ des übergebenen Objekts ändern
    @Path("update")
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public String updateObject(Object updateObject) {
        repo.update(updateObject);
        return "Object updated";
    }

}
