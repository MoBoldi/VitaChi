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

    // Lesen aller Trainings
    public List findAll(String param) {
        return em.createQuery("select returnObject from " + param + " as returnObject").getResultList();
    }

    // Löschen eines Trainings
    @Transactional
    public void delete(long id) {
        em.remove(this.find(id));
    }

    // Einfügen eines Trainings
    @Transactional
    public void create(Object newObject) {
        em.persist(newObject);
    }

    // Lesen eines Trainings mit id
    public Object find(long id) {
        return em.find(Accessoire.class, id);
    }

    // Ändern eines Trainings mit id
    @Transactional
    public void update(Object updateObject) {
        em.merge(updateObject);
    }
}
