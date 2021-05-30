<%-- 
    Document   : index
    Created on : 24-May-2021, 12:11:51 PM
    Author     : chetan
--%>
<%@page import="com.dao.UserDAO"%>
<%@page import="com.detail.UserDetail"%>
<%
    if(session.getAttribute("userLogin")==null){
        response.sendRedirect("./getStarted.jsp");
    } else{
        UserDetail ud = (UserDetail) session.getAttribute("userLogin");
        if(!ud.isActivate()){
            UserDAO dao = new UserDAO();
            session.setAttribute("userLogin", dao.userDetail(ud.getEmail()));
        }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./component/head.jsp" %>
        <title>Quiz Maker</title>
        <style>
            .inactivate{
                background-color: rgba(200,0,0,0.1);
                font-weight: 600;
            }
        </style>
    </head>
    <body>
        <%@include file="./component/navbar.jsp" %>
        <div class="container-fluid cover-img">
            <div class="container">
                <%
                    UserDetail ud1 = (UserDetail) session.getAttribute("userLogin");
                    if(!ud1.isActivate()){
                %>
                    <div class="row pt-5">
                        <div class="col-12 text-center ">
                            <label class="border border-danger pt-4 pb-4 pl-5 pr-5 rounded inactivate">
                                Your account is not Activate<br/>
                                Check your email(<%= ud1.getEmail() %>)
                            </label>
                        </div>
                    </div>
                <%
                    }
                %>
                <div class="row pt-5">
                    <div class="col-12 text-center">
                        <h3 class="display-4">Quiz Maker</h3>
                        <label>Create Your Quiz.</label><br/>
                        <label>Share Quiz.</label><br/>
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
<% 
    }
%>