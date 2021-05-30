<%-- 
    Document   : getStarted
    Created on : 25-May-2021, 1:11:49 PM
    Author     : chetan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Get Started | Quiz Maker</title>
        <link rel="icon" href="./img/icon.png" />
        <style>
            .cover-img{
                background-image: url('./img/cover.jpeg');
                background-size: cover; 
                background-position: center;
                height: 90vh;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-light bg-primary">
            <a href="./index.jsp" class="navbar-brand text-light">
                <i class="fa fa-question" aria-hidden="true"></i> Quiz Maker
            </a>
            <div>
                <a href="./register.jsp" class="btn btn-outline-light mr-3">
                    <i class="fa fa-user-plus" aria-hidden="true"></i> Register
                </a>
                <a href="./login.jsp" class="btn btn-outline-light">
                    <i class="fa fa-sign-in" aria-hidden="true"></i> Sign In
                </a>
            </div>
        </nav>
        <div class="container-fluid cover-img">
            <div class="container">
                <div class="row pt-5">
                    <div class="col-12 text-center">
                        <h3 class="display-4">Quiz Maker</h3>
                        <label>Create Your Quiz.</label><br/>
                        <label>View Score.</label><br/>
                        <br/>
                        <a href="./createQuiz.jsp" class="btn btn-dark">
                            <i class="fa fa-file-text-o" aria-hidden="true"></i> Create Quiz
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <footer class="bg-primary text-light text-center pt-1 pb-1">
            Copyright &copy; 2020, Chetanguptamrt. All Rights Reserved.
        </footer>
    </body>
</html>
