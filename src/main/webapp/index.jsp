<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Employee Management</title>
    <link rel="stylesheet" href="../style/style.css">
</head>
<jsp:include page="component/header.jsp" />
<%@ page import="java.util.List" %>
<%@ page import="ma.yc.entity.Employee" %>

<div class="container">
    <h2>Welcome To Employees List</h2>

    <form id="filterForm" method="post" action="${pageContext.request.contextPath}/filterByDepartment">
        <h4>Filter by Department:</h4>
        <div class="filter-checkboxes">
            <label><input type="checkbox" name="department[]" value="HR"> Human Resources</label>
            <label><input type="checkbox" name="department[]" value="IT"> Information Technology</label>
            <label><input type="checkbox" name="department[]" value="Finance"> Finance</label>
            <label><input type="checkbox" name="department[]" value="Sales"> Sales</label>
        </div>
        <button type="submit">Filter</button>
    </form>

    <input type="search" id="search-input" placeholder="Search...">

    <a href="${pageContext.request.contextPath}/create" class="addem">Add New</a>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Department</th>
            <th>Position</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody id="table-data">
        <c:choose>
            <c:when test="${not empty employeeList}">
                <c:forEach var="emp" items="${employeeList}">
                    <tr>
                        <td>${emp.id}</td>
                        <td>${emp.name}</td>
                        <td>${emp.email}</td>
                        <td>${emp.phone}</td>
                        <td>${emp.department}</td>
                        <td>${emp.position}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/edit?id=${emp.id}" class="edit-link">Edit</a>
                        </td>
                        <td>
                            <form action="${pageContext.request.contextPath}/delete?id=${emp.id}" method="post">
                                <button class="deletebtn">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="8">No employees found.</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>

    <div id="result"></div>

</div>

<script >
    const searchInput = document.querySelector("#search-input");
    const filterForm = document.querySelector("#filterForm");
    const tableBody = document.querySelector("#table-data")
    const tableBodyInnerHTML = tableBody.innerHTML

    searchInput.addEventListener('keyup', function () {
        const searchTerm = searchInput.value.trim();

        if (searchTerm.length > 0) {
            fetch('<%= request.getContextPath() %>/search', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({searchTerm: searchTerm})
            })
                .then(response => response.json())
                .then(data => {
                    if (data.length > 0) {
                        displayResults(data);
                    } else {
                        tableBody.innerHTML = '<tr><td colspan="6">No employees found.</td></tr>';
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    tableBody.innerHTML = '<tr><td colspan="6">Error occurred while searching.</td></tr>';
                });

        } else {

            tableBody.innerHTML = tableBodyInnerHTML;
        }
    });

    function displayResults(employees) {
        tableBody.innerHTML = '';
        employees.forEach(employee => {

            const row = `
                <tr>
                    <td>\${employee.id}</td>
                    <td>\${employee.name}</td>
                    <td>\${employee.email}</td>
                    <td>\${employee.phone}</td>
                    <td>\${employee.department}</td>
                    <td>\${employee.position}</td>
                    <td><a href="/edit?id=\${employee.id}" style="color: blue; text-decoration: none;">Edit</a></td>
                    <td>
                        <form action="/delete?id=\${employee.id}" method="post">
                            <button>Delete</button>
                        </form>
                    </td>
                </tr>
`;

            tableBody.insertAdjacentHTML('beforeend', row);
        });
    }

    filterForm.addEventListener('submit', function (event) {
        event.preventDefault();

        const selectedDepartments = [];
        const checkboxes = document.querySelectorAll('input[name="department[]"]:checked');
        checkboxes.forEach(checkbox => {
            selectedDepartments.push(checkbox.value);
        });

        const jsonString = JSON.stringify(selectedDepartments);

        fetch("/filter", {
            method: "POST",
            body: jsonString,
            headers: {
                "Content-Type": "application/json"
            }
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                if (data.length > 0) {
                    console.log(data)
                    displayResults(data);
                } else {
                    tableBody.innerHTML = '<tr><td colspan="8">No employees found.</td></tr>';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                tableBody.innerHTML = '<tr><td colspan="8">Error occurred while filtering.</td></tr>';
            });
    });

</script>
<jsp:include page="component/footer.jsp"/>
</body>
</html>