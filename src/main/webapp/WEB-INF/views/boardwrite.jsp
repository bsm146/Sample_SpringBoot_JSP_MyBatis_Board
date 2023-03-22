<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>boardwrite</title>
</head>
<body>

    <h3>boardwrite</h3>

<%--    <p>${list[0].id}</p>--%>
<%--    <p>${list[0].title}</p>--%>
<%--    <p>${list[0].content}</p>--%>

    <c:forEach var="list" items="${list}">
        <p>${list.id}</p>
        <p>${list.title}</p>
        <p>${list.content}</p>
    </c:forEach>



</body>
</html>