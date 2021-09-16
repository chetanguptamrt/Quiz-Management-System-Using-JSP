<%-- 
    Document   : viewQuiz
    Created on : 28-May-2021, 10:38:05 AM
    Author     : chetan
--%>
<%@page import="java.util.List"%>
<%@page import="com.dao.QuizDAO"%>
<%@page import="com.detail.QuizDetail"%>
<%@page import="com.dao.UserDAO"%>
<%@page import="com.detail.UserDetail"%>
<%
    if(session.getAttribute("userLogin")==null){
        response.sendRedirect("./login.jsp");
    } else{
        UserDetail ud = (UserDetail) session.getAttribute("userLogin");
        if(ud.isActivate()){
            QuizDAO dao = new QuizDAO();
            List<QuizDetail> list = dao.getQuiz(ud.getId());            
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
    <head>
        <%@include file="./component/head.jsp" %>
        <title>View Quiz | Quiz Maker</title>
    </head>
    <body>
        <%@include file="./component/navbar.jsp" %>
        <div class="modal" id="shareModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Share quiz</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                    <div class="modal-body">
                        <h6 id="shareTitle"></h6>
                        <code id="shareCopy" ></code>
                        <div class="mt-2 text-center">
                            <button class="btn btn-sm btn-primary" onclick="copy()">
                                <i class="fa fa-clipboard" aria-hidden="true"></i> Copy to clipboard
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container-md mt-2 mb-5">
            <%
                if(list.isEmpty()){
            %>
                    <div class="row border border-dark rounded mt-4 mr-1 ml-1">
                        <div class="col-12 p-3 text-center">
                            <h4 style="color: red" class="mt-3">No quiz found</h4>
                            <button class="btn btn-primary mb-3">
                                <i class="fa fa-file-text-o" aria-hidden="true"></i> Create Quiz
                            </button>
                        </div>
                    </div>
            <%
                }
                int no = 0;
                for(QuizDetail qd:list){
                    no+=1;
            %>
                <div class="row border border-dark rounded mt-4 mr-1 ml-1">
                    <div class="col-12 p-3">
                        <b>No <%=no%>.</b> <%= qd.getTitle() %><br/>
                        <b>Description: </b>
                        <pre class="text-justify"><%= qd.getDescription() %></pre>
                        <%
                            if(qd.isPublish()){
                        %>
                                <b>Publish: </b> <label>Public</label> <br/>
                        <%
                            } else{
                        %>
                                <b>Publish: </b> <label>Private</label> <br/>
                        <%
                            }
                        %>
                        <a href="./editQuiz.jsp?id=<%= qd.getId() %>" class="btn btn-primary mr-3 mt-1">
                            <i class="fa fa-pencil" aria-hidden="true"></i> Edit
                        </a>
                        <button data-toggle="modal" data-target="#shareModal" class="btn btn-success mr-3 mt-1" onclick="changeShare(<%= qd.getId() %>,'<%= qd.getTitle() %>')">
                            <i class="fa fa-share-square-o" aria-hidden="true"></i> Share
                        </button>
                        <a class="btn btn-danger mt-1" href="./DeleteQuizServlet?id=<%= qd.getId() %>">
                            <i class="fa fa-trash-o" aria-hidden="true"></i> Delete
                        </a>
                    </div>
                </div>
            <%
                }
            %>
        </div>
        
        <script>
            var shareID;
            function changeShare(id,title){
                $("#shareCopy").html("http://localhost:8080/Quiz_Management_System/doQuiz.jsp?quizId="+id);
                $("#shareTitle").html(title);
                shareId = id;
            }
            function copy(){
                console.log("copy to clipboard");
                var $temp = $("<input>");
                $(".modal-body").append($temp);
                $temp.val($("#shareCopy").text()).select();
                document.execCommand("copy");
                $temp.remove();
            }
        </script>
    </body>
</html>
<%
        } else {
            response.sendRedirect("./index.jsp");
        }
    }
%>