<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header text-center">
                        <h4>글 수정</h4>
                    </div>
                    <div class="card-body">
                        <form action="/boardUpdateProcess?id=${board.id}" method="post">
                            <div class="form-group">
                                <label for="writer">글번호</label>
                                <input type="text" class="form-control" name="id" value="${board.id}" id="id" disabled>
                            </div>
                            <div class="form-group">
                                <label for="writer">작성자</label>
                                <input type="text" class="form-control" name="writer" value="${board.writer}" id="writer" disabled>
                            </div>
                            <div class="form-group">
                                <label for="title">제목</label>
                                <input type="text" class="form-control" name="title" value="${board.title}" id="title">
                            </div>
                            <div class="form-group">
                                <label for="content">내용</label>
                                <input type="text" class="form-control" name="content" value="${board.content}" id="content">
                            </div>
                            <div class="form-group">
                                <label for="views">조회수</label>
                                <input type="text" class="form-control" name="views" value="${board.views}" id="views" disabled>
                            </div>
                            <div class="form-group">
                                <label for="writingDate">작성날짜</label>
                                <input type="text" class="form-control" name="writingDate" value="${board.writingDate}" id="writingDate" disabled>
                            </div>
                            <div>
<%--                                <button onclick="location.href='/boardUpdateProcess' "type="button" class="btn btn-secondary">수정</button>--%>
                                <button type="submit" class="btn btn-secondary">수정</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>