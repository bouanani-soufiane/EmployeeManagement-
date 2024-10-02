package ma.yc;

import ma.yc.entity.Employee;
import ma.yc.service.EmployeeService;
import ma.yc.service.EmployeeServiceImpl;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        EmployeeService employeeService = new EmployeeServiceImpl();

        // Create a new employee
        Employee newEmployee = new Employee();
        newEmployee.setName("John Doe");
        newEmployee.setEmail("john.doe@example.com");
        newEmployee.setPhone("1234567890");
        newEmployee.setDepartment("Sales");
        newEmployee.setPosition("Sales Associate");

        // Call the create method
        employeeService.create(newEmployee);

        // Fetch all employees
        List<Employee> employees = employeeService.findAll();
        System.out.println("Employees: " + employees);
    }
}
