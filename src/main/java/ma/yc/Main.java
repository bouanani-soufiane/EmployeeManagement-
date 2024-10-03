package ma.yc;

import ma.yc.entity.Employee;
import ma.yc.service.EmployeeService;
import ma.yc.service.EmployeeServiceImpl;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        EmployeeService employeeService = new EmployeeServiceImpl();

        List<Employee> employees = employeeService.search("ss");

        for (Employee employee : employees) {
            System.out.println(employee);
        }
    }
}
