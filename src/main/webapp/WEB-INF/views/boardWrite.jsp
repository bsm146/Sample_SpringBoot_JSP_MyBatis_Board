<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header text-center">
                        <h4>Write</h4>
                    </div>
                    <div class="card-body">
                        <form action="/boardWriteProcess" method="post">
                            <input type="hidden" class="form-control" name="writer" id="writer" value="${userID}">
                            <div class="form-group">
                                <label for="title">Title</label>
                                <input type="text" class="form-control" name="title" id="title" placeholder="Enter title" autofocus>
                            </div>
                            <div class="form-group">
                                <label for="content">Content</label>
                                <input type="text" class="form-control" name="content" id="content" placeholder="Enter content">
                            </div>
                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-secondary">Write</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>