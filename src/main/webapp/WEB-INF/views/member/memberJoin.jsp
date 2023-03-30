<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>

    <style>
        body {
            background-color: #fff;
        }

        .card {
            border-radius: 10px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
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
                <%--                    <h4>회원가입</h4>--%>
                <%--                </div>--%>
                <div class="card-body">
                    <form action="/memberJoin" method="post" name="memberJoin">
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
                        <br/>
                        <div class="form-group">
                            <label for="pw">비밀번호 재확인</label>
                            <input type="password" class="enter form-control" name="pw2" id="pw2" placeholder="">
                            <p class="addMsg" id="pwCheck2"></p>
                        </div>
                        <br/>
                        <div class="form-group">
                            <label for="pw">이름</label>
                            <input type="text" class="enter form-control" name="name" id="name" placeholder="">
                            <p class="addMsg" id="nameCheck"></p>
                        </div>
                        <div class="form-group text-center">
                            <button type="button" id="join" class="btn btn-secondary">가입하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    let idCheckResult = false;
    let pwCheckResult = false;
    let nameCheckResult = false;
    let ESSENTIAL_INFORMATION = '필수 정보입니다';

    $('#id').on('keydown', function () {

        setTimeout(function () {

            let data = {
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
                        msg = ESSENTIAL_INFORMATION;

                    } else if (data === "Y") {
                        msg = '사용가능한 아이디입니다';
                        color = 'green';
                        idCheckResult = true;

                    } else if (data === "N") {
                        msg = '사용중인 아이디입니다';
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

            let msg = '';
            let color = '';
            pwCheckResult = false;

            if ($('#pw').val() !== '' &&
                $('#pw').val() === $('#pw2').val()) {

                msg = '비밀번호 일치';
                color = 'green';
                pwCheckResult = true;

            } else if ($('#pw').val() !== $('#pw2').val()) {

                msg = '비밀번호 불일치';
                color = 'red';
            }

            $('#pwCheck2')
                .html(msg)
                .css('color', color);

            if ($('#pw').val() === '') {
                msg = ESSENTIAL_INFORMATION;
                color = 'red';

            } else {
                msg = '';
                color = '';
            }

            $('#pwCheck')
                .html(msg)
                .css('color', color);


        }, 1);
    });

    $('#pw2').on('keydown', function () {

        setTimeout(function () {

            let msg = '';
            let color = 'red';
            pwCheckResult = false;

            if ($('#pw2').val() === '') {
                msg = ESSENTIAL_INFORMATION;

            } else if ($('#pw').val() === $('#pw2').val()) {
                msg = '비밀번호 일치';
                color = 'green';
                pwCheckResult = true;

            } else {
                msg = '비밀번호 불일치';

            }

            $('#pwCheck2')
                .html(msg)
                .css('color', color);
        }, 1);
    });

    $('#name').on('keydown', function () {

        setTimeout(function () {

            let msg = '';
            let color = 'red';
            nameCheckResult = false;

            if ($('#name').val() === '') {
                msg = ESSENTIAL_INFORMATION;

            } else {
                msg = '';
                nameCheckResult = true;
            }

            $('#nameCheck')
                .html(msg)
                .css('color', color);

        }, 1);
    })

    $('#join').on('click', function () {
        join();
    });

    $('.enter').on('keydown', function () {
        if (event.keyCode === 13) {
            join();
        }
    });

    function join() {

        if ($('#id').val() === '') {
            alert('아이디를 입력해주세요');
            $('#id').focus();
            return;
        } else if ($('#pw').val() === '') {
            alert('비밀번호를 입력해주세요');
            $('#pw').focus();
            return;
        } else if ($('#pw2').val() === '') {
            alert('비밀번호를 재확인해주세요');
            $('#pw2').focus();
            return;
        } else if (!idCheckResult) {
            alert('사용중인 아이디입니다');
            $('#id').focus();
            return;
        } else if (!pwCheckResult) {
            alert('비밀번호를 재확인해주세요');
            $('#pw2').focus();
            return;
        }

        if (idCheckResult && pwCheckResult && nameCheckResult) {
            alert("회원가입이 완료되었습니다");
            document.memberJoin.submit();
        } else {
            alert("회원가입 실패");
            return;
        }
    }


</script>

</body>
</html>