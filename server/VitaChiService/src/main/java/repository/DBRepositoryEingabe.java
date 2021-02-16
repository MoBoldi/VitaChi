package repository;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import java.util.List;

@ApplicationScoped
public class DBRepositoryEingabe {

    @Inject
    private EntityManager em;

    // Lesen aller Trainings
    public List findAll(String param) {
        return em.createQuery("select returnObject from " + param + " as returnObject").getResultList();
    }

}
