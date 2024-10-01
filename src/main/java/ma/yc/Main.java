package ma.yc;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import ma.yc.entity.Employee;

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
            employee.setName("ss");
            em.persist(employee);
            System.out.println(employee);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}
