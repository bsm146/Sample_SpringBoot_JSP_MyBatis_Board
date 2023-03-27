<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>a.jsp</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

    <h3>a.jsp</h3>
    <br><br><br>
    <div style="margin-left: 50px">
        <input type="text" name="id" id="id" placeholder="ID" autofocus>
        <button id="idCheck" onclick="idCheck()" onkeydown="idCheck2()" class="btn btn-secondary">ID 중복 체크</button>
        <p id="result">ID를 입력해주세요</p>

        <input type="text" id="input-field">
        <p id="result2">ID를 입력해주세요</p>
    </div>


    <%----------------------------- JavaScript -----------------------------%>

    <script>

        $('#input-field').on('keydown', function() {

            setTimeout(function() {

                var data = {
                    id: $('#input-field').val()
                };
                var id = $('#input-field').val();

                $.ajax({

                    url: "/idCheck",
                    type: "POST",
                    data: data,

                    success: function(data){

                        if (data === "Y") {
                            $('#result2').html('사용가능한 ID입니다');
                            $('#result2').css("color", "green");
                        } else if (data === "N") {
                            $('#result2').html('사용중인 ID입니다');
                            $('#result2').css("color", "red");
                        } else if (data === "NULL") {
                            $('#result2').html('ID를 입력해주세요');
                            $('#result2').css("color", "black");
                        }
                    }
                });
            }, 1);
        });

        function idCheck() {

            console.log('test2()');

            var data = {
                id: $('#id').val(),
                age: 31
            };

            $.ajax({

                url: "/idCheck",
                type: "POST",
                data: data,

                success: function(data){

                    if (data === "Y") {
                        $('#result2').html('사용가능한 ID입니다');
                        $('#result2').css("color", "green");
                    } else if (data === "N") {
                        $('#result2').html('사용중인 ID입니다');
                        $('#result2').css("color", "red");
                    } else if (data === "NULL") {
                        $('#result2').html('ID를 입력해주세요');
                        $('#result2').css("color", "black");
                    }
                }
            });
        }

    </script>

</body>
</html>