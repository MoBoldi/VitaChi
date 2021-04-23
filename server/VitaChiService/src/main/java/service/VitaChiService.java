package service;

import entity.*;
import org.apache.derby.client.am.DateTime;
import org.jboss.resteasy.annotations.Query;
import org.jboss.resteasy.annotations.jaxrs.PathParam;
import repository.DBRepository;
import org.jboss.resteasy.annotations.jaxrs.*;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.json.JsonObject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
        return repo.find(entity, id);
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

    @Path("createArbeit")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public JsonObject createArbeit(JsonObject json) {

        LocalDateTime start = LocalDateTime.parse(json.getJsonObject("arbeit").getString("start"), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSSSSS"));
        LocalDateTime date = LocalDateTime.of(2001,1,1,0,0,0,0);

        repo.createArbeit(new Arbeit(
                start,
                null
        ));

        return json;
    }

    // Ein Objekt je nach Typ des übergebenen Objekts ändern
    @Path("update")
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public String updateObject(Object updateObject) {
        repo.update(updateObject);
        return "Updated";
    }

    @Path("getWorkingTime")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getWorkingTime() {
        return repo.getWorkingTime();
    }

    @Path("updateArbeit")
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public String updateArbeit(JsonObject json) {
        List<Arbeit> l = repo.findLastEntry();
        Arbeit a = l.get(0);
        LocalDateTime dauer = LocalDateTime.parse(json.getJsonObject("arbeit").getString("dauer"), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSSSSS"));
        Arbeit aa = new Arbeit(a.getArbeitID(),a.getStartdatum(), dauer);
        repo.updateArbeit(aa);
        return "Object updated";
    }

    @Path("getWohlbefinden")
    @GET
    public Double getWohlbefinden() {
        return repo.getWohlbefinden();
    }

    @Path("init")
    @GET
    public void init() {
        repo.initDB();
    }

    @Path("getEssenAVG")
    @GET
    public Double getEssen() {

        return repo.getEssen();
    }

    @Path("activeArbeit")
    @GET
    public String activeArbeit() {
        return repo.activeArbeit();
    }

    @Path("getBewegungAVG")
    @GET
    public Double getBewegung() {
        return repo.getBewegung();
    }

    @Path("getSchlafAVG")
    @GET
    public Double getSchlaf() {
        return repo.getSchlaf();
    }

    @Path("getWokringPerWeek")
    @GET
    public Double getWokringPerWeek(){
        return repo.getWorkingPerWeek();
    }

    @Path("createBenutzerAccessoire")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public JsonObject createBenutzerAccessoire(JsonObject benutzerAccessoire) {
        repo.createBenutzerAccessoire(new BenutzerAccessoire(benutzerAccessoire.getJsonObject("BenutzerAccessoire").getInt("userID"), benutzerAccessoire.getJsonObject("BenutzerAccessoire").getInt("accessoire")));
        return benutzerAccessoire;
    }

    @Path("getOpenAccessoire/{userid}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Accessoire> getOpenAccessoire (@PathParam long userid){
        return repo.getOpenAccessoires(userid);
    }

}
