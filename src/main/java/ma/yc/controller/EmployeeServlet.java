package ma.yc.controller;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EmployeeServlet extends HttpServlet {

    public void doGet ( HttpServletRequest req, HttpServletResponse resp ) {
        String action = req.getParameter("add");

    }
}
