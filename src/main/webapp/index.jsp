<jsp:include page="component/header.jsp" />

<%@ page import="java.util.List" %>
<%@ page import="ma.yc.entity.Employee" %>


<div class="container">
    <h2>Welcome To Employees List</h2>

    <a href="${pageContext.request.contextPath}/create" class="addem" >Add New</a>
    <table >
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Department</th>
            <th>Position</th>
            <th>edit</th>
            <th>delete</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Employee> employeeList = (List<Employee>) request.getAttribute("employeeList");
            if (employeeList != null && !employeeList.isEmpty()) {
                for (Employee emp : employeeList) {
        %>
        <tr>
            <td><%= emp.getId() %></td>
            <td><%= emp.getName() %></td>
            <td><%= emp.getEmail() %></td>
            <td><%= emp.getPhone() %></td>
            <td><%= emp.getDepartment() %></td>
            <td><%= emp.getPosition() %></td>
            <td>
                <a href="${pageContext.request.contextPath}/edit?id=<%= emp.getId() %>" style="color: blue; text-decoration: none;">Edit</a>
            </td>

            <td>
                <a href="employee/delete?id=<%= emp.getId() %>" style="color: red; text-decoration: none;" onclick="return confirm('Are you sure you want to delete this employee?');">Delete</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6">No employees found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>

</div>


<jsp:include page="component/footer.jsp"/>
</body>
</html>