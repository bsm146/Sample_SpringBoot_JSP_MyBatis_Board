<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>a.jsp</title>
</head>
<body>

    <p>b.jsp 데이터</p>

<%
    String name = request.getParameter("name");
    int age = Integer.parseInt(request.getParameter("age"));
//    out.print("이름: " + name + ", 나이: " + age);
%>

<%--    <p>이름 : ${param.name}</p>--%>
<%--    <p>나이 : ${param.age}</p>--%>
{
    name: ${param.name},
    age: ${param.age}
}

</body>
</html>