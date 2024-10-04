package ma.yc.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.yc.entity.Employee;
import ma.yc.service.EmployeeService;
import ma.yc.service.EmployeeServiceImpl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

public class EmployeeServlet extends HttpServlet {

    private static final String ACTION_HOME = "/";
    private static final String ACTION_STORE = "/store";
    private static final String ACTION_CREATE = "/create";
    private static final String ACTION_EDIT = "/edit";
    private static final String ACTION_UPDATE = "/update";
    private static final String ACTION_DELETE = "/delete";
    private static final String ACTION_SEARCH = "/search";
    private static final String ACTION_FILTERBYDEPARTEMENT = "/filterByDepartment";

    private EmployeeService service;
    private ObjectMapper objectMapper;

    @Override
    public void init () {
        this.service = new EmployeeServiceImpl();
        this.objectMapper = new ObjectMapper();
    }

    @Override
    protected void doGet ( HttpServletRequest req, HttpServletResponse res ) throws ServletException, IOException {
        final String action = req.getServletPath();

        switch (action) {
            case ACTION_HOME:
                employeeList(req, res);
                break;
            case ACTION_CREATE:
                req.getRequestDispatcher("/employee/create.jsp").forward(req, res);
                break;
            case ACTION_EDIT:
                editEmployee(req, res);
                break;
            default:
                res.setStatus(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    @Override
    protected void doPost ( HttpServletRequest req, HttpServletResponse res ) throws IOException, ServletException {
        res.setContentType("application/json");
        final String action = req.getServletPath();

        switch (action) {
            case ACTION_STORE:
                storeEmployee(req, res);
                break;
            case ACTION_UPDATE:
                updateEmployee(req, res);
            case ACTION_DELETE:
                doDelete(req, res);
                break;
            case ACTION_SEARCH:
                searchEmployee(req, res);
                break;
            case ACTION_FILTERBYDEPARTEMENT:
                filterByDepartment(req, res);
                break;
            default:
                writeResponse(res, HttpServletResponse.SC_BAD_REQUEST, "Invalid action: " + action);
                break;
        }
    }
    private void filterByDepartment(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        res.setContentType("application/json");

        StringBuilder sb = new StringBuilder();
        String line;
        try (BufferedReader reader = req.getReader()) {
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }

        String jsonString = sb.toString();
        String[] selectedDepartments = objectMapper.readValue(jsonString, String[].class);

        List<Employee> filteredEmployees;

        if (selectedDepartments != null && selectedDepartments.length > 0) {
            filteredEmployees = service.filterByDepartment(selectedDepartments);
        } else {
            filteredEmployees = service.findAll();
        }

        String jsonResponse = objectMapper.writeValueAsString(filteredEmployees);

        res.getWriter().write(jsonResponse);
        res.setStatus(HttpServletResponse.SC_OK);
    }



    private void searchEmployee(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.setContentType("application/json");
        StringBuilder sb = new StringBuilder();
        String line;
        try (BufferedReader reader = req.getReader()) {
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }
        String jsonString = sb.toString();
        Map<String, String> jsonMap = objectMapper.readValue(jsonString, Map.class);
        String search = jsonMap.get("searchTerm");

        if (search == null || search.isEmpty()) {
            writeResponse(res, HttpServletResponse.SC_BAD_REQUEST, "Search query is missing");
        } else {
            List<Employee> employees = service.search(search);
            if (employees.isEmpty()) {
                writeResponse(res, HttpServletResponse.SC_NOT_FOUND, "No employees found for search query: " + search);
            } else {
                String jsonResponse = objectMapper.writeValueAsString(employees);
                res.getWriter().write(jsonResponse);
                res.setStatus(HttpServletResponse.SC_OK);
            }
        }
    }


    @Override
    protected void doDelete ( HttpServletRequest req, HttpServletResponse resp ) throws IOException {

            final int id = Integer.parseInt(req.getParameter("id"));

            boolean deleted = service.delete(id);

            if (deleted) {
                resp.sendRedirect("/");
            } else {
                writeResponse(resp, HttpServletResponse.SC_NOT_FOUND, "Employee not found");
            }
    }

    private void updateEmployee ( HttpServletRequest req, HttpServletResponse res ) {
        try {
            Employee employee = new Employee();
            employee.setName(req.getParameter("name"));
            employee.setEmail(req.getParameter("email"));
            employee.setPhone(req.getParameter("phone"));
            employee.setDepartment(req.getParameter("department"));
            employee.setPosition(req.getParameter("position"));
            service.update(employee);
            writeResponse(res, HttpServletResponse.SC_OK, "Employee updated successfully");
        } catch (Exception e) {
            writeResponse(res, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
            e.printStackTrace();
        }
    }

    private void employeeList ( HttpServletRequest req, HttpServletResponse res ) throws ServletException, IOException {
        List<Employee> employees = service.findAll();
        req.setAttribute("employeeList", employees);
        req.getRequestDispatcher("/index.jsp").forward(req, res);
    }

    private void editEmployee ( HttpServletRequest req, HttpServletResponse res ) throws ServletException, IOException {
        final int id = Integer.parseInt(req.getParameter("id"));
        req.setAttribute("employee", service.findById(id));
        req.getRequestDispatcher("/employee/edit.jsp").forward(req, res);
    }

    private void storeEmployee ( HttpServletRequest req, HttpServletResponse resp ) {
        try {
            Employee employee = new Employee();
            employee.setName(req.getParameter("name"));
            employee.setEmail(req.getParameter("email"));
            employee.setPhone(req.getParameter("phone"));
            employee.setDepartment(req.getParameter("department"));
            employee.setPosition(req.getParameter("position"));

            service.create(employee);
            writeResponse(resp, HttpServletResponse.SC_CREATED, "Employee " + employee.getName() + " created successfully");

        } catch (Exception e) {
            writeResponse(resp, HttpServletResponse.SC_BAD_REQUEST, "Error creating the employee: " + e.getMessage());
        }
    }

    private void writeResponse ( HttpServletResponse resp, int statusCode, String message ) {
        try (PrintWriter out = resp.getWriter()) {
            resp.setStatus(statusCode);
            out.write(objectMapper.writeValueAsString(new ResponseMessage(message)));
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static class ResponseMessage {
        public String message;

        public ResponseMessage ( String message ) {
            this.message = message;
        }
    }
}
