<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="component/error.jsp"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet
<%--    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); --%>
<%--    response.setHeader("Pragma", "no-cache"); --%>
<%--    response.setDateHeader("Expires", 0); --%>
    <ul>
        <c:set var="greetings" value="${['Hello', 'Hi', 'Welcome', 'Greetings']}" />
        <c:forEach var="greeting" items="${greetings}">
            <li>${greeting}!</li>
        </c:forEach>
    </ul>
</a>
</body>
</html>