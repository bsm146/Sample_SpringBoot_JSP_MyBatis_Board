<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판</title>

    <style>

        #viewDetailBefore {
            color: black;
        }

    </style>

</head>
<body>

<c:set var="pageNum" value="${param.pageNum == null ? 1 : param.pageNum}"/>
<c:set var="startNum" value="${pageNum - ((pageNum - 1) % 10)}"/>
<c:set var="endNum" value="${startNum + 9}"/>
<fmt:parseNumber var="pageNumEnd" value="${boardCount}" integerOnly="true"/>

<div class="container">
    <br>
    <table style="margin: 10px;" class="table table-hover">
        <tr style="text-align: center; height: 50px;" class="table-secondary">
            <th scope="row">번호</th>
            <th scope="row">제목</th>
            <th scope="row">작성자</th>
            <th scope="row">조회수</th>
            <th scope="row">작성일</th>
        </tr>
        <c:forEach var="boardList" items="${boardList}" end="9">
            <tr style="text-align: center; height: 50px;">
                <td width="10%" scope="row">${boardList.id}</td>
                <td width="50%" scope="row"><a id="viewDetailBefore" href="/viewDetailBefore?id=${boardList.id}">${boardList.title}</a>
                <td width="15%" scope="row">${boardList.writer}</td>
                <td width="10%" scope="row">${boardList.views}</td>
                <td width="15%" scope="row">${boardList.writingDate}</td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <div style="text-align: center">
        <button ${pageNum < 11 ? "disabled='disabled'" : ""} onclick="location.href='/board?pageNum=1'" type="button" class="btn btn-secondary">◀◀</button>
        <button ${pageNum < 11 ? "disabled='disabled'" : ""} onclick="location.href='/board?pageNum=${endNum - 19}'" type="button" class="btn btn-secondary" style="margin-right: 20px">◀</button>
        <c:forEach var="boardList" begin="${startNum}" end="${endNum}">
            <c:if test="${boardList <= boardCount}">
                <button ${boardList != pageNum ? "style='background: #d2d2d2; border: none'" : ""} onclick="location.href='/board?pageNum=${boardList}'" type="button" class="btn btn-secondary">${boardList}</button>
            </c:if>
        </c:forEach>
        <button ${endNum > boardCount ? "disabled='disabled'" : ""} onclick="location.href='/board?pageNum=${endNum + 1}'" type="button" class="btn btn-secondary" style="margin-left: 20px">▶</button>
        <button ${endNum > boardCount ? "disabled='disabled'" : ""} onclick="location.href='/board?pageNum=${pageNumEnd - (pageNumEnd - 1) % 10}'" type="button" class="btn btn-secondary">▶▶</button>
        <c:if test="${!empty userID}">
            <button style="float: right" onclick="location.href='/boardWrite' " type="button" class="btn btn-secondary">글쓰기</button>
        </c:if>
    </div>
</div>


<%-------------- 자바스크립트 --------------%>

<script>

</script>

</body>
</html>