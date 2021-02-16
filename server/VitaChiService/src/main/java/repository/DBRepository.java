package repository;

import entity.Accessoire;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.transaction.Transactional;
import java.util.List;

@ApplicationScoped
public class DBRepository {

    @Inject
    private EntityManager em;

    // Lesen aller Trainings
    public List findAll(String entity) {
        return em.createQuery("select returnObject from " + entity + " as returnObject").getResultList();
    }

    // Löschen eines Trainings
    @Transactional
    public void delete(String entity, long id) {
        em.remove(this.find(id));
    }

    // Einfügen eines Trainings
    @Transactional
    public void create(Object newObject) {
        em.persist(newObject);
    }

    // Lesen eines Trainings mit id
    public Object find(String entity, long id) {
        return em.find(Accessoire.class, id);
    }

    // Ändern eines Trainings mit id
    @Transactional
    public void update(Object updateObject) {
        em.merge(updateObject);
    }
}
