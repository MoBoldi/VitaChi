package repository;

import entity.Accessoire;
import entity.Arbeit;
import entity.Aufgaben;
import entity.Eingabe;

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

        if(entity == "Accessoire") {
            return em.createQuery("select returnObject from Accessoire as returnObject").getResultList();
        } else if (entity == "Arbeit") {
            return em.createQuery("select returnObject from Arbeit as returnObject").getResultList();
        } else if (entity == "Aufgaben") {
            return em.createQuery("select returnObject from Aufgaben as returnObject").getResultList();
        } else if (entity == "Eingabe") {
            return em.createQuery("select returnObject from Eingabe as returnObject").getResultList();
        } else {
            return em.createQuery("select returnObjectAc, returnObjectAr, returnObjectAu, returnObjectEi " +
                    "from Accessoire as returnObjectAc, Arbeit as returnObjectAr, Aufgaben as returnObjectAu, Eingabe as returnObjectEi").getResultList();
        }
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
    public void create(Object newObject) {
        em.persist(newObject);
    }

    // Lesen eines Trainings mit id
    public Object find(String entity, long id) {
        if(entity == "Accessoire") {
            return em.find(Accessoire.class, id);
        } else if (entity == "Arbeit") {
            return em.find(Arbeit.class, id);
        } else if (entity == "Aufgaben") {
            return em.find(Aufgaben.class, id);
        } else if (entity == "Eingabe") {
            return em.find(Eingabe.class, id);
        }
        return null;
    }

    // Ändern eines Trainings mit id
    @Transactional
    public void update(Object updateObject) {
        em.merge(updateObject);
    }
}
