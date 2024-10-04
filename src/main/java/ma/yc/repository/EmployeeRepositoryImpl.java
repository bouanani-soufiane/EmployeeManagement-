package ma.yc.repository;

import ma.yc.entity.Employee;
import ma.yc.util.SessionFactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.Arrays;
import java.util.List;

public class EmployeeRepositoryImpl implements EmployeeRepository {
    Session session = SessionFactoryProvider.createSession();
    @Override
    public boolean create(Employee employee) {
        Transaction transaction = null;
        try  {
            transaction = session.beginTransaction();
            session.persist(employee);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            return false;
        }
    }

    @Override
    public Employee findById(int id) {
        try  {
            return session.get(Employee.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean update(Employee employee) {
        Transaction transaction = null;
        try  {
            transaction = session.beginTransaction();
            session.merge(employee);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            return false;
        }
    }

    @Override
    public boolean delete(int id) {
        Transaction transaction = null;
        try  {
            transaction = session.beginTransaction();
            Employee employee = session.get(Employee.class, id);
            if (employee != null) {
                session.remove(employee);
                transaction.commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            return false;
        }
    }

    @Override
    public List<Employee> findAll() {
        try  {
            return session.createQuery("from Employee", Employee.class).list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    public List<Employee> search(String value) {
        String hql = "FROM Employee e WHERE e.name LIKE :searchTerm OR e.email LIKE :searchTerm " +
                "OR e.department LIKE :searchTerm OR e.position LIKE :searchTerm";
        Query<Employee> query = session.createQuery(hql, Employee.class);
        query.setParameter("searchTerm", "%" + value + "%");

        return query.getResultList();
    }
    public List<Employee> filterByDepartment(String[] departments) {
        if (departments == null || departments.length == 0) {
            return findAll();
        }

        String hql = "FROM Employee e WHERE e.department IN (:departments)";
        Query<Employee> query = session.createQuery(hql, Employee.class);
        query.setParameterList("departments", Arrays.asList(departments));

        return query.getResultList();
    }


    public List<Employee> filterByPosition(String position) {
        if (position == null || position.isEmpty()) {
            return findAll();
        }

        String hql = "FROM Employee e WHERE e.position = :position";
        Query<Employee> query = session.createQuery(hql, Employee.class);
        query.setParameter("position", position);

        return query.getResultList();
    }
}
