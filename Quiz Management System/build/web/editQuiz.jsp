<%-- 
    Document   : editQuiz
    Created on : 28-May-2021, 1:19:01 PM
    Author     : chetan
--%>

<%@page import="com.detail.QuestionDetail"%>
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
            int id = Integer.parseInt(request.getParameter("id"));
            QuizDAO dao = new QuizDAO();
            QuizDetail qd = dao.getEditQuiz(ud.getId(), id);
            if(qd == null){
                response.sendRedirect("./index.jsp");
            } else {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./component/head.jsp" %>      
        <title>Edit Quiz | Quiz Maker</title>
    </head>
    <body>
        <%@include file="./component/navbar.jsp" %>

        <form id="editQuiz">
        <div class="container-md mb-5">
            <div class="row">
                <div class="col-12">
                    <div class="mt-3">
                        <input name="quizId" value="<%= id %>" hidden/>
                        <div style="float: left">
                            <h3>Edit quiz</h3>
                        </div>
                        <div style="float: right;display: flex;">
                            <%
                                if(qd.isPublish()){
                            %>
                                    <select name="publish" class="mr-3" >
                                        <option selected value="true">Public</option>
                                        <option value="false">Private</option>
                                    </select>
                            <%        
                                } else {
                            %>
                            <select name="publish" class="mr-3" >
                                <option value="true">Public</option>
                                <option selected value="false">Private</option>
                            </select>
                            <%
                                }
                            %>
                            <button type="submit" class="btn btn-success">Update</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <input id="total" name="total" hidden value="1">
                    <h6 class="mt-3">Title of quiz <span style="color:red;">*</span></h6>
                    <input type="text" value="<%= qd.getTitle() %>" maxlength="100" class="form-control" name="title" id="title" placeholder="For eg: Database Management System Quiz (Max-length: 100)" required="required"/>
                    <h6 class="mt-3">Description</h6>
                    <textarea rows="4" name="description" maxlength="500" class="form-control" placeholder="Description (Max-length: 500)"><%= qd.getDescription() %></textarea>
                    <h6 class="mt-3">Student Details <span style="color:red;">*</span> <span style="font-weight: 400; color: #666666">(Please check at least one)</span></h6>
                    <div class="border border-primary rounded p-3">
                        <table cellpadding="4">
                            <tr>
                                <td>
                                    <%
                                        if(qd.isS1()) {
                                    %>
                                        <input checked type="checkbox" id="s1" name="s1" value="yes" /> <label for="s1">Name</label>
                                    <%
                                        } else {
                                    %>
                                        <input type="checkbox" id="s1" name="s1" value="yes" /> <label for="s1">Name</label>
                                    <%
                                        }
                                    %>
                                </td>
                                <td>
                                    <%
                                        if(qd.isS2()) {
                                    %>
                                        <input checked type="checkbox" id="s2" name="s2" value="yes" /> <label for="s2">Roll No.</label>
                                    <%
                                        } else {
                                    %>
                                        <input type="checkbox" id="s2" name="s2" value="yes" /> <label for="s2">Roll No.</label>
                                    <%
                                        }
                                    %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%
                                        if(qd.isS3()) {
                                    %>
                                        <input checked type="checkbox" id="s3" name="s3" value="yes" /> <label for="s3">Email Address</label>
                                    <%
                                        } else {
                                    %>
                                        <input type="checkbox" id="s3" name="s3" value="yes" /> <label for="s3">Email Address</label>
                                    <%
                                        }
                                    %>
                                </td>
                                <td>
                                    <%
                                        if(qd.isS4()) {
                                    %>
                                        <input checked type="checkbox" id="s4" name="s4" value="yes" /> <label for="s4">Phone No.</label>
                                    <%
                                        } else {
                                    %>
                                        <input type="checkbox" id="s4" name="s4" value="yes" /> <label for="s4">Phone No.</label>
                                    <%
                                        }
                                    %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%
                                        if(qd.isS5()) {
                                    %>
                                        <input checked type="checkbox" id="s5" name="s5" value="yes" /> <label for="s5">Course</label>
                                    <%
                                        } else {
                                    %>
                                        <input type="checkbox" id="s5" name="s5" value="yes" /> <label for="s5">Course</label>
                                    <%
                                        }
                                    %>
                                </td>
                                <td>
                                    <%
                                        if(qd.isS6()) {
                                    %>
                                        <input checked type="checkbox" id="s6" name="s6" value="yes" /> <label for="s6">College Name</label>
                                    <%
                                        } else {
                                    %>
                                        <input type="checkbox" id="s6" name="s6" value="yes" /> <label for="s6">College Name</label>
                                    <%
                                        }
                                    %>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <h6 class="mt-3">Questions: </h6>
                    <div id="questionset">
                        <%
                            int no = 0;
                            for(QuestionDetail ques: qd.getQds()) {
                                no += 1;
                        %>
                            <div class="mt-3">
                                <div style="display: flex" class="mb-0">
                                    <h6>Q<%= no %>.</h6>&nbsp;&nbsp;&nbsp;
                                    <p class="mb-1"><%= ques.getQuestion() %></p>
                                </div>
                                <p class="ml-4 mb-1"><span class="font-weight-bold">A:</span> <%= ques.getQa() %></p>
                                <p class="ml-4 mb-1"><span class="font-weight-bold">B:</span> <%= ques.getQb() %></p>
                                <p class="ml-4 mb-1"><span class="font-weight-bold">C:</span> <%= ques.getQc() %></p>
                                <p class="ml-4 mb-1"><span class="font-weight-bold">D:</span> <%= ques.getQd() %></p>

                                <div style="display: flex">
                                    <h6 class="align-self-center">Correct Answer: </h6>&nbsp;&nbsp;&nbsp;
                                    <%
                                        if(ques.getCorrect().equals("1")) {
                                    %>
                                        <label>A</label>
                                    <%
                                        }
                                        else if(ques.getCorrect().equals("2")) {
                                    %>
                                        <label>B</label>
                                    <%
                                        }
                                        else if(ques.getCorrect().equals("3")) {
                                    %>
                                        <label>C</label>
                                    <%
                                        }
                                        else if(ques.getCorrect().equals("4")) {
                                    %>
                                        <label>D</label>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        </form>     
        <script src="js/editQuiz.js" type="text/javascript"></script>
    </body>
</html>
<%
            }
        } else {
            response.sendRedirect("./index.jsp");
        }
    }
%>