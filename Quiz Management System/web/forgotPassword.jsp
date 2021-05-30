<%-- 
    Document   : forgotPassword
    Created on : 29-May-2021, 10:07:50 PM
    Author     : chetan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
        <title>Forgot Password | Quiz Maker</title>
        <link rel="icon" href="./img/icon.png" />
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="row mt-3 mb-2">
                <div class="col-6">
                    <h1><a class="top-link" href="./index.jsp">Quiz Maker</a></h1>
                </div>
                <div class="col-6 text-right align-self-center">
                    <label>Already User? <a href="./login.jsp">Login</a></label>
                </div>
            </div>
            <hr/>
            <div class="row mt-5 mb-5">
                <div class="col-md-6 offset-md-3">
                    <div class="text-center">
                        <small style="display: none;" id="status"></small>
                    </div>
                    <form id="forgotForm">
                        <label for="email" >Email</label>
                        <input class="form-control" type="text" placeholder="john@example.com" id="email" name="email" required="required" />
                        <div class="text-center mt-2">
                            <button type="submit" class="btn btn-primary">Send OTP</button>
                        </div>
                    </form>
                    <form id="otpConfirm">
                        <input type="password" hidden id="oEmail" name="oEmail" />
                        <label style="margin-top:10px" for="otp">OTP</label>
                        <input class="form-control" type="text" placeholder="OTP" name="otp" maxlength="6" minlength="6" id="otp" required="required"/>
                        <label style="margin-top:10px" for="password">Password</label>
                        <input class="form-control" type="password" placeholder="password" name="password" id="password" required="required" minlength="6" />
                        <div class="text-center mt-3">
                            <input class="btn btn-primary" type="submit" value="Save"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        <script src="js/forgotPassword.js" type="text/javascript"></script>
    </body>
</html>
