package repository;

import entity.Accessoire;
import entity.Arbeit;
import entity.Aufgaben;
import entity.Eingabe;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.List;

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

    public Double getWohlbefinden() {
        TypedQuery<Double> query = em.createNamedQuery("Eingabe.findAll", Double.class);
        Double e = query.getSingleResult();
        return e;
    }
    public Double getEssen() {
        TypedQuery<Double> query = em.createNamedQuery("Eingabe.findEssen", Double.class);
        Double e = query.getSingleResult();
        return e;
    }
    public Double getBewegung() {
        TypedQuery<Double> query = em.createNamedQuery("Eingabe.findBewegung", Double.class);
        Double e = query.getSingleResult();
        return e;
    }
    public Double getSchlaf() {
        TypedQuery<Double> query = em.createNamedQuery("Eingabe.findSchlaf", Double.class);
        Double e = query.getSingleResult();
        return e;
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
    public List<Arbeit> findLastEntry(){
        return em.createQuery("select a from Arbeit as a order by a.arbeitID desc").setMaxResults(1).getResultList();
    }

    @Transactional
    public Boolean activeArbeit(){
        LocalDateTime date = LocalDateTime.of(0,1,1,0,0,0,0);
        List<Arbeit> a = findLastEntry();
        if (a.isEmpty()==true){
            return true;
        }else{
            if (a.get(0).getDauer() == null) {
                return false;
            }
            else{
                return true;
            }
        }
    }


    //Wohlbefinden berechnen
    @Transactional
    public void getWohlbefinden(Eingabe newEingabe) {
        em.persist(newEingabe);
    }

    //Erste Testdatensätze einfügen
    public void initDB() {
        Eingabe e1 = new Eingabe(1,2,"Essen");
        Eingabe e2 = new Eingabe(1,3,"Essen");

        Eingabe e3 = new Eingabe(2,3,"Bewegung");
        Eingabe e4 = new Eingabe(1,1,"Bewegung");

        Eingabe e5 = new Eingabe(5,5,"Schlaf");
        Eingabe e6 = new Eingabe(5,4, "Schlaf");

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

        Arbeit a1 = new Arbeit(t1a, t1e);
        Arbeit a2 = new Arbeit(t2a, t2e);

        this.createArbeit(a1);
        this.createArbeit(a2);
    }

}
