package service;

import entity.Eingabe;
import entity.Accessoire;
import entity.Arbeit;
import entity.Aufgaben;
import org.apache.derby.client.am.DateTime;
import org.jboss.resteasy.annotations.Query;
import org.jboss.resteasy.client.jaxrs.ResteasyClientBuilder;
import org.jboss.resteasy.plugins.providers.jackson.ResteasyJackson2Provider;
import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.KeycloakBuilder;
import org.keycloak.representations.idm.CredentialRepresentation;
import org.keycloak.representations.idm.UserRepresentation;
import repository.DBRepository;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.json.JsonObject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
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

    @Path("registerNewUser")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public boolean registerNewUser(JsonObject json) {

        Keycloak kc = KeycloakBuilder.builder()
                .serverUrl("http://localhost:8010/auth")
                .realm("master")
                .username("admin")
                .password("Pa55w0rd")
                .clientId("admin-cli")
                .clientSecret("df8dab35-291e-486a-a3ee-f743566b9ad5")
                .resteasyClient(new ResteasyClientBuilder().connectionPoolSize(10).build()).build();

        CredentialRepresentation credential = new CredentialRepresentation();
        credential.setType(CredentialRepresentation.PASSWORD);
        credential.setValue(json.getString("password"));

        UserRepresentation user = new UserRepresentation();
        user.setUsername(json.getString("username"));
        user.setFirstName(json.getString("vorname"));
        user.setLastName(json.getString("nachname"));
        user.setEmail(json.getString("email"));
        user.setCredentials(Arrays.asList(credential));
        user.setEnabled(true);
        user.setEmailVerified(true);
        //user.setRealmRoles(Arrays.asList("user"));

        System.out.println(user.getEmail());

        // Create testuser
        Response result = kc.realm("vitachi").users().create(user);
        if (result.getStatus() != 201) {
            System.out.println("Hansi");
            return true;
        }else{
            System.out.println("Hinterseer");
            return false;
        }
    }

}
