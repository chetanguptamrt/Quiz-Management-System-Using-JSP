<%-- 
    Document   : viewQuizScore
    Created on : 29-May-2021, 9:05:55 PM
    Author     : chetan
--%>
<%@page import="com.detail.ParticipantDetail"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.QuizDAO"%>
<%@page import="com.dao.UserDAO"%>
<%@page import="com.detail.UserDetail"%>
<%
    int quizId = 0;
    try{
        quizId = Integer.parseInt(request.getParameter("quizId"));
    } catch(Exception e){
        response.sendRedirect("./viewScore.jsp");
    }
    if(session.getAttribute("userLogin")==null){
        response.sendRedirect("./login.jsp");
    } else{
        UserDetail ud = (UserDetail) session.getAttribute("userLogin");
        if(ud.isActivate()){
        QuizDAO dao = new QuizDAO();
        List<ParticipantDetail> list = dao.getQuizScore(ud.getId(), quizId);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./component/head.jsp" %>
        <title>Quiz Score | Quiz Maker</title>
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
                    <table class="table table-hover" style="width:100%">
                        <thead class="bg-dark text-light">
                            <tr>
                                <td>
                                    No.
                                </td>
                                <td>
                                    Name
                                </td>
                                <td>
                                    Roll No.
                                </td>
                                <td>
                                    Email Address
                                </td>
                                <td>
                                    Phone No.
                                </td>
                                <td>
                                    Course
                                </td>
                                <td>
                                    College
                                </td>
                                <td>
                                    Marks
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int no = 1;
                                for(ParticipantDetail pd : list) {
                            %>
                                <tr>
                                    <td>
                                        <%= no %>
                                    </td>
                                    <td>
                                        <%= pd.getName() %>
                                    </td>
                                    <td>
                                        <%= pd.getRoll() %>
                                    </td>
                                    <td>
                                        <%= pd.getEmail() %>
                                    </td>
                                    <td>
                                        <%= pd.getPhone() %>
                                    </td>
                                    <td>
                                        <%= pd.getCourse() %>
                                    </td>
                                    <td>
                                        <%= pd.getCollege() %>
                                    </td>
                                    <td>
                                        <%= pd.getMarks() %>
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