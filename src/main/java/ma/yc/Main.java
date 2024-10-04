package ma.yc;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import ma.yc.entity.Employee;
import ma.yc.service.EmployeeService;
import ma.yc.service.EmployeeServiceImpl;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        EmployeeService employeeService = new EmployeeServiceImpl();

        List<Employee> employees = employeeService.filterByDepartment(new String[]{"HR"});

        for (Employee employee : employees) {
            System.out.println(employee);
        }

        Employee newEmployee = new Employee();
        newEmployee.setDepartment("HR");

        ObjectMapper objectMapper = new ObjectMapper();

        try {
            String jsonText = objectMapper.writeValueAsString(newEmployee);
            System.out.println("Serialized JSON: " + jsonText);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        try {
            Employee employee = new Employee("John Doe", "123" ,"dd","ee","ss");
            String json = serializeToJson(employee);
            System.out.println("Serialized JSON: " + json);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
    }

    public static String serializeToJson(Employee employee) throws JsonProcessingException {
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.writeValueAsString(employee);
    }
}
