package ma.yc;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import ma.yc.presistence.CustomPresistenceUnitInfo;
import org.hibernate.jpa.HibernatePersistenceProvider;

import java.util.HashMap;

public class Main {
    public static void main ( String[] args ) {

        EntityManagerFactory emf = new HibernatePersistenceProvider().createContainerEntityManagerFactory(new CustomPresistenceUnitInfo(), new HashMap<>());

        EntityManager em = emf.createEntityManager();
    }
}
