<%-- 
    Document   : profile
    Created on : 30-May-2021, 4:37:08 PM
    Author     : chetan
--%>
<%@page import="com.dao.UserDAO"%>
<%@page import="com.detail.UserDetail"%>
<%
    if(session.getAttribute("userLogin")==null){
        response.sendRedirect("./login.jsp");
    } else{
        UserDetail ud = (UserDetail) session.getAttribute("userLogin");
        if(ud.isActivate()){
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./component/head.jsp" %>
        <title><%= ud.getName() %> | Quiz Maker</title>
    </head>
    <body>
        <%@include file="./component/navbar.jsp" %>

        <div class="container-md mt-4 mb-5">
            <div class="row">
                <div class="col-12 text-center">
                    <h2>Change Password</h2>
                    <small style="display: none;" id="status"></small>
                </div>
            </div>
            <form id="changePassword">
                <div class="row">
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                        <input class="mt-2 form-control" type="password" minlength="6" placeholder="Old Password" id="oPassword" name="oPassword" required="required"/>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                        <input class="mt-2 form-control" type="password" minlength="6" placeholder="New Password" id="nPassword" name="nPassword" required="required" />
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                        <input class="mt-2 form-control" type="password" minlength="6" placeholder="Confirm Password" id="cPassword" name="cPassword" required="required" />
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12 text-center">
                        <button type="submit" class="btn btn-primary" >Update Password</button>
                    </div>
                </div>
            </form>            
            <div class="row mt-5">
                <div style="background-color: #ffcccc" class="col-12 p-5 border border-danger rounded text-center">
                    <h3>Danger Zone</h3>
                    <button class="btn btn-outline-danger mt-2 mb-2" id="deleteButton">Delete Account</button>
                </div>
            </div>
            
        </div>
        <script src="js/profile.js" type="text/javascript"></script>
    </body>
</html>
<%
        } else {
            response.sendRedirect("./index.jsp");
        }
    }
%>