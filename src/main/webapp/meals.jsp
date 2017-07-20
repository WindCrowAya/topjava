<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Meals</title>
</head>

<body>
<h1>Meals list</h1>
<table>
    <c:forEach items="${meals}" var="meal">
        <tr style="color: <c:out value="${meal.exceed ? 'red' : 'green'}"/>">
            <td>${meal.date}</td>
            <td>${meal.time}</td>
            <td>${meal.description}</td>
            <td>${meal.calories}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
