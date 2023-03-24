<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    <style>

    </style>

</head>
<body>

    <c:import url="nav.jsp"/>

    <c:set var="pageNum"  value="${param.pageNum == null ? 1 : param.pageNum}"/> <%-- 현재 페이지번호 --%>
    <c:set var="startNum" value="${pageNum - ((pageNum - 1) % 10)}"/>            <%-- for문 시작 index --%>
    <c:set var="endNum"   value="${startNum + 9}"/>                              <%-- for문 종료 index --%>
    <fmt:parseNumber var="pageNumEnd" value="${boardCount}" integerOnly="true"/> <%-- 버튼 개수(boardCount)를 정수로 변환 후 pageNumEnd에 넘김(마지막 버튼(▶▶) 만들기 위해서) --%>

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
                    <td width="50%" scope="row"><a href="/viewDetail?id=${boardList.id}">${boardList.title}</a></td>
                    <td width="15%" scope="row">${boardList.writer}</td>
                    <td width="10%" scope="row">${boardList.views}</td>
                    <td width="15%" scope="row">${boardList.writingDate}</td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <div style="text-align: center">
            <%-- 1 ~ 10 페이지에서 처음(◀◀), 이전(◀) 버튼 비활성화 --%>
            <button ${pageNum < 11 ? "disabled='disabled'" : ""} onclick="location.href='/board?pageNum=1'" type="button" class="btn btn-secondary">◀◀</button>
            <button ${pageNum < 11 ? "disabled='disabled'" : ""} onclick="location.href='/board?pageNum=${endNum - 19}'" type="button" class="btn btn-secondary" style="margin-right: 20px">◀</button>
            <c:forEach var="boardList" begin="${startNum}" end="${endNum}">
                <%-- 시작 index <= 버튼 개수면 숫자 버튼 생성 --%>
                <c:if test="${boardList <= boardCount}">
                    <%-- for문 index == 현재 페이지 번호일때만 진하게, 나머지는 연하게 --%>
                    <button ${boardList != pageNum ? "style='background: #d2d2d2; border: none'" : ""} onclick="location.href='/board?pageNum=${boardList}'" type="button" class="btn btn-secondary">${boardList}</button>
                </c:if>
            </c:forEach>
            <%-- for문 종료 index > 버튼 개수면 다음(▶), 마지막(▶▶) 버튼 비활성화 --%>
            <button ${endNum > boardCount ? "disabled='disabled'" : ""} onclick="location.href='/board?pageNum=${endNum + 1}'"type="button" class="btn btn-secondary" style="margin-left: 20px">▶</button>
            <button ${endNum > boardCount ? "disabled='disabled'" : ""} onclick="location.href='/board?pageNum=${pageNumEnd - (pageNumEnd - 1) % 10}'"type="button" class="btn btn-secondary">▶▶</button>
            <c:if test="${!empty userID}">
                <button style="float: right" onclick="location.href='/boardWrite' "type="button" class="btn btn-secondary">글쓰기</button>
            </c:if>
        </div>
    </div>



    <%-------------- 자바스크립트 --------------%>

    <script>

    </script>

</body>
</html>