<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Employee Management</title>
    <link rel="stylesheet" href="style/style.css">
</head>

<body>


<%@ page import="java.util.List" %>
<%@ page import="ma.yc.entity.Employee" %>


<div class="container">
    <h2>Welcome To Employees List</h2>

    <a href="${pageContext.request.contextPath}/create" class="addem">Add New</a>
    <form>

        <input type="search">
        <button>search</button>
    </form>
    <table>
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
            <td><%= emp.getId() %>
            </td>
            <td><%= emp.getName() %>
            </td>
            <td><%= emp.getEmail() %>
            </td>
            <td><%= emp.getPhone() %>
            </td>
            <td><%= emp.getDepartment() %>
            </td>
            <td><%= emp.getPosition() %>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/edit?id=<%= emp.getId() %>"
                   style="color: blue; text-decoration: none;">Edit</a>
            </td>

            <td>
                <form action="/delete?id=<%=emp.getId()%>" method="post">
                    <button> Delete </button>
                </form>
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

<script>
    function confirmer(id) {
        Swal.fire({
            title: 'Are you sure?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.replace("/delete?id=" + id + "");
            }
        })
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
<jsp:include page="component/footer.jsp"/>
</body>
</html>