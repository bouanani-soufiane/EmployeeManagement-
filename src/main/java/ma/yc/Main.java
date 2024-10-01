package ma.yc;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import ma.yc.entity.Employee;

import java.util.UUID;

public class Main {
    public static void main ( String[] args ) {

//        EntityManagerFactory emf = new HibernatePersistenceProvider().createContainerEntityManagerFactory(new CustomPresistenceUnitInfo(), new HashMap<>());
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");

        EntityManager em = entityManagerFactory.createEntityManager();


        try {
            em.getTransaction().begin();
            Employee employee = new Employee();
            employee.setName("soufiane");
            employee.setPhone("0630067322");
            employee.setEmail("email@mail.com");
            employee.setPosition("modir");
            employee.setDepartment("agora");

            em.merge(employee);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}
