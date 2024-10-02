package ma.yc.repository;

import ma.yc.entity.Employee;
import ma.yc.util.SessionFactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class EmployeeRepositoryImpl implements EmployeeRepository {

    @Override
    public boolean create(Employee employee) {
        Transaction transaction = null;
        try (Session session = SessionFactoryProvider.createSession()) {
            transaction = session.beginTransaction();
            session.save(employee);
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
        try (Session session = SessionFactoryProvider.createSession()) {
            return session.get(Employee.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean update(Employee employee) {
        Transaction transaction = null;
        try (Session session = SessionFactoryProvider.createSession()) {
            transaction = session.beginTransaction();
            session.update(employee);
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
        try (Session session = SessionFactoryProvider.createSession()) {
            transaction = session.beginTransaction();
            Employee employee = session.get(Employee.class, id);
            if (employee != null) {
                session.delete(employee);
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
        try (Session session = SessionFactoryProvider.createSession()) {
            return session.createQuery("from Employee", Employee.class).list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
