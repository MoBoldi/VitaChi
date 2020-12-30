package repository;

import entity.Eingabe;
import entity.Accessoire;
import entity.Arbeit;
import entity.Aufgaben;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.transaction.Transactional;
import java.time.LocalDate;
import java.util.List;

@ApplicationScoped
public class DBRepository {

    @Inject
    private EntityManager em;

    // Initialisieren
    public void initDB() {
        this.create(new Eingabe(1, "Bewertung 1", 3, 4, LocalDate.of(2020, 11, 27), 1));
        //this.create(new Training("Training 2", LocalDate.of(2020, 11, 27), "2", "Schwimmen", false));
        //this.create(new Training("Training 3", LocalDate.of(2020, 11, 27), "2", "Kraftsport", false));
    }

    // Lesen aller Trainings
    public List findAll(String param) {
        var entity = param;

        return em.createQuery("select returnObject from entity as returnObject").getResultList();
    }

    // Löschen eines Trainings
    @Transactional
    public void delete(String param, long id) {
        em.remove(this.find(param, id));
    }

    // Einfügen eines Trainings
    @Transactional
    public void create(Object newObject) {
        em.persist(newObject);
    }

    // Lesen eines Trainings mit id
    public Object find(String entity, long id) {
        return em.find(Object.class, id);
    }

    // Ändern eines Trainings mit id
    @Transactional
    public void update(Object updateObject) {
        em.merge(updateObject);
    }
}
