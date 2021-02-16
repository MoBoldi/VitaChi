package repository;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import java.util.List;

@ApplicationScoped
public class DBRepositoryAufgaben {

    @Inject
    private EntityManager em;


}
