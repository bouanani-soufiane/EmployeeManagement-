package ma.yc.repository;

import ma.yc.entity.Employee;

import java.util.List;

public interface EmployeeRepository {

    boolean create ( Employee employee );

    Employee findById ( int id );

    boolean update ( Employee employee );

    boolean delete ( int id );

    List<Employee> findAll ();

    List<Employee> search ( String value );

    List<Employee> filterByDepartment ( String[] department );

    List<Employee> filterByPosition ( String position );

}
