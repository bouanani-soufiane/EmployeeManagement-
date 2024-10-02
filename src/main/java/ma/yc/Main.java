package ma.yc;

import ma.yc.entity.Employee;
import ma.yc.repository.EmployeeRepository;
import ma.yc.repository.EmployeeRepositoryImpl;

import java.util.List;

public class Main {
    public static void main ( String[] args ) {
        EmployeeRepository employeeRepository = new EmployeeRepositoryImpl();


        System.out.println("one : ");

        List<Employee> em1 = employeeRepository.findAll();

        System.out.println("two : ");
        System.out.println("here : " + em1);

    }
}
