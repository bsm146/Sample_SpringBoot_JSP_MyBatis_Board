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
        <label for="id">ID</label>
        <input type="text" name="id" id="id" placeholder="Enter id" autofocus>
        <button onclick="test2()" class="btn btn-secondary">ID 중복 체크</button>
        <p id="result"></p>
    </div>

    <script>

        function test2() {

            console.log('자바스크립트 test2()');

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
                        $('#result').html('사용가능한 ID입니다');
                        $('#result').css("color", "green");
                    } else {
                        $('#result').html('사용중인 ID입니다');
                        $('#result').css("color", "red");
                    }

                    // $('#result').html(data);
                    // $('#result').css({
                    //     "backgroundColor" : "yellow"
                    // });
                    // $('#result').append('<p>성공</p>');
                    //
                    // console.log("성공");
                    // console.log(data[0].name);
                    // console.log(data[0].pw);
                    // console.log(data);
                }
            });
        }

        function test() {

            console.log('자바스크립트 test()');
            var data = {
                name: "a",
                age: 28
            };


            $.ajax({

                url: "/b",
                type: "GET",
                data: data,

                success: function(data){

                    $('#result').html(data);
                    $('#result').css({
                        "backgroundColor" : "yellow"
                    });
                    $('#result').append('<p>성공</p>');

                    console.log("성공");
                    console.log(data[0].name);
                    console.log(data[0].pw);
                    console.log(data);
                }
            });
        }


    </script>

</body>
</html>