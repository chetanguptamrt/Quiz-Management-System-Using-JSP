<%-- 
    Document   : viewScore
    Created on : 29-May-2021, 6:05:55 PM
    Author     : chetan
--%>
<%@page import="com.detail.QuizDetail"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.QuizDAO"%>
<%@page import="com.dao.UserDAO"%>
<%@page import="com.detail.UserDetail"%>
<%
    if(session.getAttribute("userLogin")==null){
        response.sendRedirect("./login.jsp");
    } else{
        UserDetail ud = (UserDetail) session.getAttribute("userLogin");
        if(ud.isActivate()){
            QuizDAO dao = new QuizDAO();
            List<QuizDetail> qds= dao.getQuizScore(ud.getId());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./component/head.jsp" %>
        <title>View Score | Quiz Maker</title>
    </head>
    <body>
        <%@include file="./component/navbar.jsp" %>
        <div class="container-md mt-3 mb-5">
            <div class="row">
                <div class="col-12">
                    <h1 class="text-center">View Score</h1>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12 table-responsive">
                    <table class="table table-hover text-center" style="width:100%">
                        <thead class="bg-dark text-light">
                            <tr>
                                <td>
                                    No.
                                </td>
                                <td>
                                    Title
                                </td>
                                <td>
                                    Publish
                                </td>
                                <td>
                                    View
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int no=1;
                                for(QuizDetail qd : qds) {
                            %>
                                <tr class="align-self-center">
                                    <td>
                                        <%= no %>
                                    </td>
                                    <td>
                                        <%= qd.getTitle() %>

                                    </td>
                                    <td>
                                        <%
                                            if(qd.isPublish()) {
                                        %>
                                                Public
                                        <%
                                            } else {
                                        %>
                                                Private
                                        <%
                                            }
                                        %>
                                    </td>
                                    <td>
                                        <a class="btn btn-primary btn-sm" href="./viewQuizScore.jsp?quizId=<%= qd.getId()%>" >View</a>
                                    </td>
                                </tr>
                            <%
                                    no+=1;
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
    </body>
</html>
<%
        } else {
            response.sendRedirect("./index.jsp");
        }
    }
%>