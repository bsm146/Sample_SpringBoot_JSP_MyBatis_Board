<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>

    <style>
        body {
            background-color: #fff;
        }

        .card {
            border-radius: 10px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #d2d2d2;
            color: #fff;
            border-radius: 10px 10px 0 0;
        }

        .form-control:focus {
            border-color: #d19ad0;
            box-shadow: none;
        }
    </style>

</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header text-center">
                    <h4>로그인</h4>
                </div>
                <div class="card-body">
                    <form action="/loginCheck" method="post">
                        <div class="form-group">
                            <label for="id">ID</label>
                            <input type="text" class="form-control" name="id" id="id" placeholder="Enter id" autofocus>
                        </div>
                        <div class="form-group">
                            <label for="pw">PASSWORD</label>
                            <input type="password" class="form-control" name="pw" id="pw" placeholder="Enter password">
                        </div>
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-secondary">로그인</button>
                            <button type="button" onclick="location.href='/memberJoin'" class="btn btn-secondary">회원가입
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>