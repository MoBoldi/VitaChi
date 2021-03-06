package repository;

import entity.*;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NamedQuery;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.transaction.Transactional;
import java.awt.geom.Area;
import java.lang.reflect.Type;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.LinkedList;
import java.time.temporal.IsoFields;
import java.util.List;
import java.util.concurrent.TimeUnit;

@ApplicationScoped
public class DBRepository {

    @Inject
    private EntityManager em;

    // Lesen aller Trainings
    public List findAll(String entity) {

        if(entity.equals("Accessoire")) {
            return em.createQuery("select accessoire from Accessoire as accessoire").getResultList();
        } else if (entity.equals("Arbeit")) {
            return em.createQuery("select returnObject from Arbeit as returnObject").getResultList();
        } else if (entity.equals("Aufgaben")) {
            return em.createQuery("select returnObject from Aufgaben as returnObject").getResultList();
        } else if (entity.equals("Eingabe")) {
            return em.createQuery("select returnObject from Eingabe as returnObject").getResultList();
        } else {
            return em.createQuery("select returnObjectAc, returnObjectAr, returnObjectAu, returnObjectEi " +
                    "from Accessoire as returnObjectAc, Arbeit as returnObjectAr, Aufgaben as returnObjectAu, Eingabe as returnObjectEi").getResultList();
        }
    }

    public Double getWohlbefinden(int id) {
        TypedQuery<Double> query = em.createNamedQuery("Eingabe.findAll", Double.class);
        query.setParameter(1, id);
        Double e = query.getSingleResult();
        return e;
    }
    public Double getEssen(int id) {
        TypedQuery<Double> query = em.createNamedQuery("Eingabe.findEssen", Double.class);
        query.setParameter(1, id);
        Double e = query.getSingleResult();
        return e;
    }
    public Double getBewegung(int id) {
        TypedQuery<Double> query = em.createNamedQuery("Eingabe.findBewegung", Double.class);
        query.setParameter("uid", id);
        Double e = query.getSingleResult();
        return e;
    }
    public Double getSchlaf(int id) {
        TypedQuery<Double> query = em.createNamedQuery("Eingabe.findSchlaf", Double.class);
        query.setParameter("uid", id);
        Double e = query.getSingleResult();
        return e;
    }

    public Long getUser(String keycloakId) {
        TypedQuery<Long> query = em.createNamedQuery("UserEnt.findUser", Long.class);
        query.setParameter("keycloakId", keycloakId);
        return query.getSingleResult();
    }

    // Löschen eines Trainings
    @Transactional
    public void delete(String entity, long id) {
        if(entity == "Accessoire") {
            em.remove(this.find("Accessoire", id));
        } else if (entity == "Arbeit") {
            em.remove(this.find("Arbeit", id));
        } else if (entity == "Aufgaben") {
            em.remove(this.find("Aufgaben", id));
        } else if (entity == "Eingabe") {
            em.remove(this.find("Eingabe", id));
        }
    }

    // Einfügen eines Trainings
    @Transactional
    public void createEingabe(Eingabe newEingabe) {
        em.persist(newEingabe);
    }

    // Einfügen eines Trainings
    @Transactional
    public void createAufgabe(Aufgaben newAufgabe) {
        em.persist(newAufgabe);
    }

    @Transactional
    public void createArbeit(Arbeit newArbeit) {
        em.persist(newArbeit);
    }

    @Transactional
    public void newUser(String keycloakId) { em.persist(new UserEnt(keycloakId)); }

    // Lesen eines Trainings mit id
    public Object find(String entity, long id) {
        if(entity.equals("Accessoire")) {
            return em.find(Accessoire.class, id);
        } else if (entity.equals("Arbeit")) {
            return em.find(Arbeit.class, id);
        } else if (entity.equals("Aufgaben")) {
            return em.find(Aufgaben.class, id);
        } else if (entity.equals("Eingabe")) {
            return em.find(Eingabe.class, id);
        }
        return null;
    }

    // Ändern eines Trainings mit id
    @Transactional
    public void update(Object updateObject) {
        em.merge(updateObject);
    }

    @Transactional
    public void updateArbeit(Object updateObject) {
        em.merge(updateObject);
    }

    @Transactional
    public List<Arbeit> findLastEntry(long id){
        TypedQuery<Arbeit> query = em.createQuery("select a from Arbeit as a where a.userID=:uid order by a.arbeitID desc", Arbeit.class);
        query.setParameter("uid", id);
        return query.setMaxResults(1).getResultList();
    }

    @Transactional
    public String getWorkingTime(long id){
        List<Arbeit> a = findLastEntry(id);

        LocalDateTime start = a.get(0).getStartdatum();
        LocalDateTime ende = a.get(0).getDauer();
        //new
        if (ende!=null){

            long millis = Duration.between(start, ende).toMillis();

            long minutes = Duration.between(start, ende).toMinutes();
            long CoinsNew= minutes;

            TypedQuery<Long> query2 = em.createQuery("Select ue.coins from UserEnt as ue where ue.userId = :userId", Long.class);
            query2.setParameter("userId", id);
            Long coinsOld = query2.getSingleResult();

            Query query = em.createQuery("update UserEnt as ue set ue.coins = :newcoins where ue.userId = :userId");
            query.setParameter("newcoins", coinsOld + CoinsNew);
            query.setParameter("userId", id);
            query.executeUpdate();

             /*Alternative
             List<UserEnt> lue = getUserID(id);
             UserEnt ue = lue.get(0);
             ue.setCoins(CoinsNew);
             em.merge(ue);
             */



            String result = String.format("%02d:%02d:%02d",
                    TimeUnit.MILLISECONDS.toHours(millis),
                    TimeUnit.MILLISECONDS.toMinutes(millis) - TimeUnit.HOURS.toMinutes(TimeUnit.MILLISECONDS.toHours(millis)),
                    TimeUnit.MILLISECONDS.toSeconds(millis) - TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS.toMinutes(millis)));
            return result;
        }else{
            return "Started at " + a.get(0).getStartdatum().getHour() + ":" + a.get(0).getStartdatum().getMinute() + ":" + a.get(0).getStartdatum().getSecond();
        }





    }
    //new
    @Transactional
    public List<UserEnt> getUserID(long id){
        TypedQuery<UserEnt> query = em.createNamedQuery(UserEnt.findUserById, UserEnt.class);
        query.setParameter("userId", id);
        return query.getResultList();
    }
    //new
    @Transactional
    public String updateUserEnt(long id, long coins){
        List<UserEnt> lue = getUserID(id);
        UserEnt ue = lue.get(0);
        long aktcoins = ue.getCoins();
        long newCoins=aktcoins-coins;
        ue.setCoins(newCoins);
        em.merge(ue);
        return "done";
    }

    //new
    @Transactional
    public String getCoinsByUser(long id){
        Query query = em.createQuery("Select ue.coins from UserEnt as ue where ue.userId = :userId");
        query.setParameter("userId", id);
        Object coins = query.getSingleResult();
        return "" + coins + "";
    }

    public double getWorkingPerWeek(long id){
        double workingHours = 0.0;
        LocalDateTime localDateTime = LocalDateTime.now();
        int kalenderWoche = localDateTime.get(IsoFields.WEEK_OF_WEEK_BASED_YEAR);
        TypedQuery query = em.createQuery("select a from Arbeit as a where a.userID=:id", Arbeit.class);
        query.setParameter("id",id);
        List<Arbeit> al = query.getResultList();
        for (Arbeit a : al){
            if(a.getStartdatum().get(IsoFields.WEEK_OF_WEEK_BASED_YEAR)==kalenderWoche){
                workingHours += Duration.between(a.getStartdatum(), a.getDauer()).toHours();
            }
        }
        return workingHours;
    }

    @Transactional
    public List<AccessoirePlatz> getSetAccessoire(long userID) {
        TypedQuery<AccessoirePlatz> query = em.createNamedQuery(AccessoirePlatz.FINDALLBYUSER, AccessoirePlatz.class);
        query.setParameter("benutzer_id", userID);

        return query.getResultList();
    }

    @Transactional
    public String activeArbeit(long id){
        LocalDateTime date = LocalDateTime.of(0,1,1,0,0,0,0);
        List<Arbeit> a = findLastEntry(id);
        if (a.isEmpty()==true){
            return "empty";
        }else{
            if (a.get(0).getDauer() == null) {
                return "false";
            }
            else{
                return "true";
            }
        }
    }

    @Transactional
    public BenutzerAccessoire createBenutzerAccessoire(BenutzerAccessoire benutzerAccessoire){
        em.persist(benutzerAccessoire);
        return benutzerAccessoire;
    }

    @Transactional
    public AccessoirePlatz createAccessoirePlatz(AccessoirePlatz accessoirePlatz) {
        Query query = em.createQuery("Select ap from AccessoirePlatz as ap where ap.benutzer_id = :benutzer_id and ap.slot_it = :slot_it");
        query.setParameter("benutzer_id", accessoirePlatz.getBenutzer_id());
        query.setParameter("slot_it", accessoirePlatz.getSlot_it());

        List<AccessoirePlatz> aplist = query.getResultList();

        if(aplist.size() == 0) {
            em.persist(accessoirePlatz);
        } else {
            em.remove(aplist.get(0));
            em.persist(accessoirePlatz);
        }

        return accessoirePlatz;
    }

    @Transactional
    public List<Accessoire> getOpenAccessoires(long userid){
        Query q =  em.createQuery("select a from Accessoire as a where a NOT IN (select ba.accessoire from BenutzerAccessoire as ba where ba.userID = ?1) AND a.preis < (Select ue.coins from UserEnt as ue where ue.userId = :id)");
        q.setParameter(1, userid);
        q.setParameter("id", userid);
        return q.getResultList();
    }

    @Transactional
    public List<Accessoire> getBoughtAccessoire(long userid) {
        Query q = em.createQuery("select a from Accessoire as a where a IN (select ba.accessoire from BenutzerAccessoire as ba where ba.userID = ?1)");
        q.setParameter(1, userid);
        return q.getResultList();
    }



    //Wohlbefinden berechnen
    @Transactional
    public void getWohlbefinden(Eingabe newEingabe) {
        em.persist(newEingabe);
    }

    //Erste Testdatensätze einfügen
    public void initDB() {
        Eingabe e1 = new Eingabe(1,2,"Essen",2);
        Eingabe e2 = new Eingabe(1,3,"Essen",2);

        Eingabe e3 = new Eingabe(2,3,"Bewegung",2);
        Eingabe e4 = new Eingabe(1,1,"Bewegung",2);

        Eingabe e5 = new Eingabe(5,5,"Schlaf",2);
        Eingabe e6 = new Eingabe(5,4, "Schlaf",2);

        this.createEingabe(e1);
        this.createEingabe(e2);
        this.createEingabe(e3);
        this.createEingabe(e4);
        this.createEingabe(e5);
        this.createEingabe(e6);

        LocalDateTime t1a = LocalDateTime.of(2020, 12, 24, 15, 0, 0,0);
        LocalDateTime t1e = LocalDateTime.of(2020, 12, 24, 18, 0, 0,0);
        LocalDateTime t2a = LocalDateTime.of(2020, 12, 25, 10, 0, 0,0);
        LocalDateTime t2e = LocalDateTime.of(2020, 12, 25, 14, 0, 0,0);

        LocalDateTime t3a = LocalDateTime.of(2021, 4, 4, 15, 0, 0,0);
        LocalDateTime t3e = LocalDateTime.of(2021, 4, 4, 18, 0, 0,0);
        LocalDateTime t4a = LocalDateTime.of(2021, 4, 8, 10, 0, 0,0);
        LocalDateTime t4e = LocalDateTime.of(2021, 4, 8, 14, 0, 0,0);

        Arbeit a1 = new Arbeit(t1a, t1e,2);
        Arbeit a2 = new Arbeit(t2a, t2e,2);
        Arbeit a3 = new Arbeit(t3a, t3e,2);
        Arbeit a4 = new Arbeit(t4a, t4e,2);

        this.createArbeit(a1);
        this.createArbeit(a2);
        this.createArbeit(a3);
        this.createArbeit(a4);
    }

    public List<Eingabe> findInputByType(String type, int userID) {
        TypedQuery<Eingabe> query = em.createNamedQuery("Eingabe.findByType", Eingabe.class);
        query.setParameter("type", type);
        query.setParameter("userID", userID);
        List<Eingabe> e = query.getResultList();
        return e;
    }

    public List<Object> getStats(String type, int userID) {
        String bewertung11 = "SELECT (count(e.bewertung1)) from Eingabe e where e.typ = '"+type+"' and e.bewertung1 = 1 and e.userid = " + userID;
        String bewertung21 = "SELECT (count(e.bewertung2)) from Eingabe e where e.typ = '"+type+"' and e.bewertung2 = 1 and e.userid = " + userID;
        String bewertung15 = "SELECT (count(e.bewertung1)) from Eingabe e where e.typ = '"+type+"' and e.bewertung1 = 5 and e.userid = " + userID;
        String bewertung25 = "SELECT (count(e.bewertung2)) from Eingabe e where e.typ = '"+type+"' and e.bewertung2 = 5 and e.userid = " + userID;
        String ges = "SELECT count(e.bewertung1) + count(e.bewertung2) from Eingabe e where e.typ = '" + type + "' and e.userid = " + userID;
        Query query11 = em.createNativeQuery(bewertung11);
        Query query21 = em.createNativeQuery(bewertung15);
        Query query15 = em.createNativeQuery(bewertung21);
        Query query25 = em.createNativeQuery(bewertung25);
        Query queryGes = em.createNativeQuery(ges);
        Object result11 = query11.getSingleResult();
        Object result15 = query15.getSingleResult();
        Object result21 = query21.getSingleResult();
        Object result25 = query25.getSingleResult();
        Object resultGes = queryGes.getSingleResult();

        List<Object> result = new LinkedList<>();
        result.add((int) result11 + (int) result21);
        result.add((int) result15 + (int) result25);
        result.add((int) resultGes);
        return result;
    }

    public List<Object> getWellbeingStats(int userID) {
        String sql1 = "SELECT SUM((bewertung1 + BEWERTUNG2) / 2.0)/Count(*), DATUM from EINGABE where userid = " + userID + " group by DATUM";
        Query query1 = em.createNativeQuery(sql1);
        List<Object> result = query1.getResultList();
        return result;
    }
}
