package ma.yc.service;

import ma.yc.entity.Employee;
import ma.yc.repository.EmployeeRepository;
import ma.yc.repository.EmployeeRepositoryImpl;

import java.util.List;

public class EmployeeServiceImpl implements EmployeeService {

    private final EmployeeRepository employeeRepository;

    public EmployeeServiceImpl() {
        this.employeeRepository = new EmployeeRepositoryImpl();
    }

    @Override
    public boolean create(Employee employee) {
        return employeeRepository.create(employee);
    }

    @Override
    public Employee findById(int id) {
        return employeeRepository.findById(id);
    }

    @Override
    public boolean update(Employee employee) {
        return employeeRepository.update(employee);
    }

    @Override
    public boolean delete(int id) {
        return employeeRepository.delete(id);
    }

    @Override
    public List<Employee> findAll() {
        return employeeRepository.findAll();
    }

    public List<Employee> search(String value) {
        return employeeRepository.search(value);
    }

    @Override
    public List<Employee> filterByDepartment ( String[] department ) {
        return employeeRepository.filterByDepartment(department);
    }

    @Override
    public List<Employee> filterByPosition ( String position ) {
        return employeeRepository.filterByPosition(position);
    }
}
