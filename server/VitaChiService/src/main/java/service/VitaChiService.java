package service;

import entity.*;
import org.jboss.resteasy.annotations.jaxrs.PathParam;
import org.jose4j.json.internal.json_simple.JSONObject;
import org.jose4j.json.internal.json_simple.parser.JSONParser;
import org.jose4j.json.internal.json_simple.parser.ParseException;
import repository.DBRepository;
import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.json.JsonObject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
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

    // Liste aller Objekte je nach Entität senden
    @Path("findInputByType/{Type}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Eingabe> findInputByType(@PathParam("Type") String type) {
        return repo.findInputByType(type);
    }

    @Path("getWellbeingStats")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Object> getWellbeingStats() {return repo.getWellbeingStats();}

    // Ein Objekt je nach Entität senden
    @Path("find/{Entity}/{id}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Object find(@PathParam("Entity") String entity, @PathParam("id") long id) {
        return repo.find(entity, id);
    }

    // Daten für Statistikseite senden
    @Path("getStats/{type}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Object> getStats(@PathParam("type") String type) {
        return repo.getStats(type);
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
                json.getJsonObject("eingabe").getString("typ"),
                json.getJsonObject("eingabe").getInt("userid")
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
        int userid = json.getJsonObject("arbeit").getInt("userid");

        repo.createArbeit(new Arbeit(
                start,
                null,
                userid
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

    @Path("getWorkingTime/{id}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getWorkingTime(@PathParam long id) {
        return repo.getWorkingTime(id);
    }

    @Path("updateArbeit/{id}")
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.TEXT_PLAIN)
    public String updateArbeit(@PathParam("id") long id, JsonObject json) {
        List<Arbeit> l = repo.findLastEntry(id);
        Arbeit a = l.get(0);
        LocalDateTime dauer = LocalDateTime.parse(json.getJsonObject("arbeit").getString("dauer"), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSSSSS"));
        int userid = json.getJsonObject("arbeit").getInt("userid");
        Arbeit aa = new Arbeit(a.getArbeitID(),a.getStartdatum(), dauer, userid);
        repo.updateArbeit(aa);
        return "Object updated";
    }

    @Path("getWohlbefinden/{id}")
    @GET
    public Double getWohlbefinden(@PathParam int id) {
        return repo.getWohlbefinden(id);
    }

    @Path("init")
    @GET
    public void init() {
        repo.initDB();
    }

    @Path("getEssenAVG/{id}")
    @GET
    public Double getEssen(@PathParam int id) {

        return repo.getEssen(id);
    }

    @Path("activeArbeit/{id}")
    @GET
    public String activeArbeit(@PathParam long id) {
        return repo.activeArbeit(id);
    }

    @Path("getBewegungAVG/{id}")
    @GET
    public Double getBewegung(@PathParam int id) {
        return repo.getBewegung(id);
    }

    @Path("getSchlafAVG/{id}")
    @GET
    public Double getSchlaf(@PathParam int id) {
        return repo.getSchlaf(id);
    }

    @Path("getWokringPerWeek/{id}")
    @GET
    public Double getWokringPerWeek(@PathParam long id){
        return repo.getWorkingPerWeek(id);
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

    @Path("getStartOfWorking")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Arbeit> getStartOfWorking(){
        return repo.findLastEntry(2);
    }

    @Path("newUser")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public JsonObject newUser(JsonObject json) {

        String token = json.getString("token");

        String[] chunks = token.split("\\.");
        Base64.Decoder decoder = Base64.getDecoder();
        String payload = new String(decoder.decode(chunks[1]));

        JSONParser parser = new JSONParser();
        JSONObject payloadObject = new JSONObject();
        try {
            payloadObject = (JSONObject) parser.parse(payload);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        repo.newUser(payloadObject.get("sub").toString());

        return json;
    }

    @Path("getUser")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public int getUser(JsonObject json) {

        String token = json.getString("token");

        String[] chunks = token.split("\\.");
        Base64.Decoder decoder = Base64.getDecoder();
        String payload = new String(decoder.decode(chunks[1]));

        JSONParser parser = new JSONParser();
        JSONObject payloadObject = new JSONObject();
        try {
            payloadObject = (JSONObject) parser.parse(payload);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return repo.getUser(payloadObject.get("sub").toString());

    }

}
