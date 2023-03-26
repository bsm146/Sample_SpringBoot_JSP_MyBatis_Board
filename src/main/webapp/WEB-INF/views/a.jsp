<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>a.jsp</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

    <h3>a.jsp</h3>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <button onclick="test2()">ID 중복 체크</button>
    <button onclick="test()">버튼</button>
    <div id="result"></div>

    <br><br><br><br><br><br>

    <script>

        function test2() {

            console.log('자바스크립트 test2()');
            var data = {
                name: "a",
                age: 28
            };


            $.ajax({

                url: "/idCheck",
                type: "GET",
                data: data,

                success: function(data){

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