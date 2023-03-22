<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    <style>

        .navbar-nav {
            margin-left: auto;
        }

        .nav-link {
            font-size: 1.2rem;
            margin-right: 1rem;
        }


    </style>

</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
<%--            <a class="navbar-brand" href="#">Navbar</a>--%>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarColor02">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="/board">Home(Board)
<%--                            <span class="visually-hidden">(current)</span>--%>
                        </a>
                    </li>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="#">Features</a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="#">Pricing</a>--%>
<%--                    </li>--%>
                    <li class="nav-item">
<%--                        <a class="nav-link" href="/login">${empty userID ? "Login" : "Logout"}</a>--%>
                        <a class="nav-link active" href=${empty userID ? "/login" : "/logout"}>${empty userID ? "Login" : "Logout"}</a>
                    </li>
<%--                    <li class="nav-item dropdown">--%>
<%--                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>--%>
<%--                        <div class="dropdown-menu">--%>
<%--                            <a class="dropdown-item" href="#">Action</a>--%>
<%--                            <a class="dropdown-item" href="#">Another action</a>--%>
<%--                            <a class="dropdown-item" href="#">Something else here</a>--%>
<%--                            <div class="dropdown-divider"></div>--%>
<%--                            <a class="dropdown-item" href="#">Separated link</a>--%>
<%--                        </div>--%>
<%--                    </li>--%>
                </ul>
<%--                <form class="d-flex">--%>
<%--                    <input class="form-control me-sm-2" type="search" placeholder="Search">--%>
<%--                    <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>--%>
<%--                </form>--%>
            </div>
        </div>
    </nav>

</body>
</html>