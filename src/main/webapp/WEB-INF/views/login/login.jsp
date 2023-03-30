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

        .addMsg {
            font-size: 12px;
            margin-top: 10px;
        }

    </style>

</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <%--                <div class="card-header text-center">--%>
                <%--                    <h4>로그인</h4>--%>
                <%--                </div>--%>
                <div class="card-body">
                    <form action="/loginCheck" method="post" name="login">
                        <div class="form-group">
                            <label for="id">아이디</label>
                            <input type="text" class="enter form-control" name="id" id="id" placeholder="" autofocus>
                            <p class="addMsg" id="idCheck"></p>
                        </div>
                        <br/>
                        <div class="form-group">
                            <label for="pw">비밀번호</label>
                            <input type="password" class="enter form-control" name="pw" id="pw" placeholder="">
                            <p class="addMsg" id="pwCheck"></p>
                        </div>
                        <div class="form-group text-center">
                            <button type="button" class="btn btn-secondary" id="login">로그인</button>
                            <button type="button" onclick="location.href='/memberJoinPage'" class="btn btn-secondary">회원가입</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    var idCheckResult = false;
    var pwCheckResult = false;

    $('#id').on('keydown', function () {

        setTimeout(function () {

            var data = {
                id: $('#id').val()
            };

            $.ajax({
                url: "/idCheck",
                type: "POST",
                data: data,

                success: function (data) {

                    idCheckResult = false;
                    let msg = '';
                    let color = 'red';

                    if (data === 'NULL') {
                        msg = '아이디를 입력해주세요';

                    } else if (data === "Y") {
                        msg = '아이디가 없습니다';

                    } else if (data === "N") {
                        msg = '비밀번호를 입력해주세요';
                        color = 'green';
                        idCheckResult = true;
                    }

                    $('#idCheck')
                        .html(msg)
                        .css('color', color);
                }
            });
        }, 1);
    })

    $('#pw').on('keydown', function () {

        setTimeout(function () {

            var data = {
                id: $('#id').val(),
                pw: $('#pw').val()
            };

            $.ajax({
                url: "/pwCheck",
                type: "POST",
                data: data,

                success: function (data) {

                    let msg = '';
                    let color = 'red';
                    pwCheckResult = false;

                    if (data === 'NULL') {
                        msg = '비밀번호를 입력해주세요';

                    } else if (data === 'N') {
                        msg = '비밀번호가 틀렸습니다';

                    } else if (data === "Y") {
                        msg = '로그인 버튼을 눌러주세요';
                        color = 'green';
                        pwCheckResult = true;
                    }

                    $('#pwCheck')
                        .html(msg)
                        .css('color', color);
                }
            });
        }, 1);
    })

    $('.enter').on('keydown', function () {
        if (event.keyCode === 13) {
            login();
        }
    });

    $('#login').on('click', function () {
        login();
    });

    function login() {

        if ($('#id').val() === '') {
            alert('아이디를 입력해주세요');
            $('#id').focus();
            return;
        } else if ($('#pw').val() === '') {
            alert('비밀번호를 입력해주세요');
            $('#pw').focus();
            return;
        } else if (!idCheckResult) {
            alert('아이디를 확인해주세요');
            $('#id').focus();
            return;
        } else if (!pwCheckResult) {
            alert('비밀번호를 확인해주세요');
            $('#pw').focus();
            return;
        }

        if (idCheckResult && pwCheckResult) {
            alert($('#id').val() + '님 환영합니다');
            document.login.submit();
        } else {
            alert("로그인 실패");
            return;
        }
    }

</script>

</body>
</html>