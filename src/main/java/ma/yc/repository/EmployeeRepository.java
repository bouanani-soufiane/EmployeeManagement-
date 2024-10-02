package ma.yc.repository;

import ma.yc.entity.Employee;

import java.util.List;

public interface EmployeeRepository {

    boolean create ( Employee employee );

    Employee findById ( int id );

    boolean update ( Employee employee );

    boolean delete ( int id );

    List<Employee> findAll ();

}
