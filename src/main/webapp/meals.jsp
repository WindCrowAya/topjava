<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Meals</title>
    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>
</head>
<body>

<h3><a href="index.html">Home</a></h3>

<h2>Meals</h2>
<table class="tg">
    <tr>
        <th width="80">Date</th>
        <th width="80">Time</th>
        <th width="100">Description</th>
        <th width="40">Calories</th>
    </tr>
    <%--There is a warning: "Cannot resolve variable "meals"--%>
    <c:forEach var="meal" items="${meals}">
        <tr>
            <td>${meal.getDate}</td>
            <td>${meal.getTime}</td>
            <td>${meal.getDescription}</td>
            <td>${meal.getCalories}</td>
        </tr>
    </c:forEach>
</table>


</body>
</html>
